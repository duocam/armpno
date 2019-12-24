#include <stdlib.h>
#include <stdio.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <sys/mman.h>
#include <sys/syscall.h>
#include <unistd.h>
#include <linux/fb.h>
#include <math.h>
#include <linux/perf_event.h>
#include <string.h>

#define CYCLES 0
#define INSTRUCTIONS 1
#define CACHEREFS 2
#define CACHEMISSES 3

#define NUM_OF_FD 4
#define CLOCK_RATE  1989.0e6

#if defined USEFP
#define FRACBITS 8	 // position of the radix point (m)
#define FRAC_SIG 256 // 2^FRACBITS
#endif

long perf_event_open(struct perf_event_attr *hw_event,
		pid_t pid,
		int cpu,
		int group_fd,
		unsigned long flags) {
	int ret;
	ret = syscall(__NR_perf_event_open, hw_event, pid, cpu, group_fd, flags);

	return ret;
}

static inline unsigned long long perf_count(unsigned long long *values) {
	return (unsigned long long)((float)values[0] * (float)values[1]/(float)values[2]);
}

void cnts_close(int *fd) {
	int i;
	for(i=0; i<NUM_OF_FD; i++) close(fd[i]);
}

int cnts_open(int *fd) {
	struct perf_event_attr attr;
	//printf("size of attr:%d\n", sizeof(attr));
	memset(&attr, 0, sizeof(attr));

	attr.type = PERF_TYPE_HARDWARE;
	attr.size = sizeof(struct perf_event_attr);
	attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED|
		PERF_FORMAT_TOTAL_TIME_RUNNING;

	attr.config = PERF_COUNT_HW_CPU_CYCLES;
	fd[CYCLES] = perf_event_open(&attr, 0, -1, -1, 0);
	if (fd[CYCLES] == -1) {
		perror("cannot open perf_counter for cycles");
		exit(0);
	}

	attr.config = PERF_COUNT_HW_INSTRUCTIONS;
	fd[INSTRUCTIONS] = perf_event_open(&attr, 0, -1, -1, 0);
	if (fd[INSTRUCTIONS] == -1) {
		perror("cannot open perf_counter for instructions");
		exit(0);
	}

	attr.config = PERF_COUNT_HW_CACHE_REFERENCES;
	fd[CACHEREFS] = perf_event_open(&attr, 0, -1, -1, 0);
	if (fd[CACHEREFS] == -1) {
		perror("cannot open perf_counter for cacherefs");
		exit(0);
	}

	attr.config = PERF_COUNT_HW_CACHE_MISSES;
	fd[CACHEMISSES] = perf_event_open(&attr, 0, -1, -1, 0);
	if (fd[CACHEMISSES] == -1) {
		perror("cannot open perf_counter for cachemisses");
		exit(0);
	}
	return 0;
}

void cnts_tick(int *fd) {
	int i, ret; 

	cnts_open(fd);

	for (i=0; i<NUM_OF_FD; i++) {
		ret = ioctl(fd[i], PERF_EVENT_IOC_RESET);
		if (ret == -1)
			err(-1, "ioctl() in cnts_tick() failed");
	}
}

void cnts_tock(int *fd, unsigned long long cnts[][3]) {
	int i, ret;
	for(i=0; i<NUM_OF_FD; i++) {
		ret = read(fd[i], cnts[i], sizeof(cnts[i]));
		if (ret != 24) 
			err(-1, "ioctl() in cnts_tock() failed");
	}

	cnts_close(fd);
}

void cnts_dump(unsigned long long cnts[][3]) {
	float time, membw;
	time = ((float)perf_count(cnts[CYCLES]))/CLOCK_RATE;
	/*
	membw = (float)N/time/(1024.0f*1024.0f);
	printf("[perf_evcent]%0.2f MB/s\n", membw);
	*/
	printf("[perf_event] cycles = %llu (%0.0f us)\n",
			perf_count(cnts[CYCLES]),
			(float)(perf_count(cnts[CYCLES]))/(float)(perf_count(cnts[CYCLES])/CLOCK_RATE*1.0E6));

	printf("[perf_event] instructions = %llu(CPI=%0.2f)\n",
			perf_count(cnts[INSTRUCTIONS]),
			(float)(perf_count(cnts[CYCLES]))/
			(float)(perf_count(cnts[INSTRUCTIONS])));

	printf("[perf_event] misses = %llu, references = %llu\
			(miss rate=%0.4f)\n",
			perf_count(cnts[CACHEMISSES]),
			perf_count(cnts[CACHEREFS]),
			(float)(perf_count(cnts[CACHEMISSES]))/
			(float)(perf_count(cnts[CACHEREFS])));
}

void calc_coeffs(float c_row[2],
		float c_col[2],
		float scale,
		float rot_x,
		float rot_y,
		float rot_z) {
	int i,j ,k;
	float rotm_x[3][3] = {{1.0, 0, 0},
						{0, 1.0/cosf(rot_x), tanf(rot_x)},
						{0, tanf(rot_x), -1.0/cosf(rot_x)}},
		rotm_y[3][3] = {{1.0/cosf(rot_y), 0, -tanf(rot_y)},
					{0, 1.0, 0},
					{tan(rot_y), 0, 1.0/cosf(rot_y)}},
		rotm_z[3][3] = {{cosf(rot_z), -sin(rot_z), 0},
			{sinf(rot_z), cosf(rot_z), 0},
			{0, 0, 1.0}},
		tempm0[3][3], tempm1[3][3], tempm2[3][3], sum;

	for (i = 0; i < 3; ++i) {	// temp = Ax * Ay
		for (j = 0; j < 3; ++j) {
			sum = 0.0;
			for (k = 0; k < 3; ++k) sum += rotm_x[i][k] * rotm_y[k][j];
			tempm0[i][j] = sum;
		}
	}

	for (i = 0; i < 3; ++i) {	// temp = temp * Az
		for (j = 0; j < 3; ++j) {
			sum = 0.0;
			for (k = 0; k < 3; ++k) sum += tempm0[i][k] * rotm_z[k][j];
			tempm1[i][j] = sum;
		}
	}

	c_row[0] = tempm1[0][0];
	c_row[1] = tempm1[0][1];
	c_col[0] = tempm1[1][0];
	c_col[1] = tempm1[1][1];
}

int main() {
	int fd;
	
#ifdef ARM	
	fd = open("/dev/graphics/fb0", O_RDWR);
#else
	fd = open("/dev/fb0", O_RDWR);
#endif

	if (fd == -1) {
		perror("Error: cannot open framebuffer device");
		exit(0);
	}

	struct fb_var_screeninfo vinfo;
	if (ioctl(fd, FBIOGET_VSCREENINFO, &vinfo) == -1) {
		perror("Error reading variable information");
		exit(-1);
	}

	/*
	* cd_engine_group@amax-04:/home/jason/code/camp/arm_programming_optimization$ sudo fbset

	mode "640x480-73"
		# D: 30.720 MHz, H: 36.923 kHz, V: 73.260 Hz
		geometry 640 480 640 480 32
		timings 32552 80 32 16 4 80 4
		rgba 8/16,8/8,8/0,8/24
	endmode

	*/
	printf("xres:%d yres:%d bpp:%d\n", vinfo.xres, vinfo.yres, vinfo.bits_per_pixel);

	int screensize = vinfo.xres * vinfo.yres * vinfo.bits_per_pixel / 8;

	// FIX: vinfo.xres -> vinfo.yres
	int row_size = vinfo.yres * vinfo.bits_per_pixel / 8;
	char* fbp;
	fbp = (char*)mmap(0, screensize, PROT_READ | PROT_WRITE,
			MAP_SHARED, fd, 0);
	if ((int)fbp == -1) err("Error: faild to map frame buffer \
			device to memory");

	FILE* my_file;
	int rows = 0, cols = 0, maxcolorvalue = 0;
	int i, j;
	static unsigned char* src_image;

	my_file = fopen("./lena512color.ppm", "r+");
	if (!my_file) {
		perror("image file");
		exit(0);
	}

	fscanf(my_file, "%d", &cols);
	while (cols < 160) {   // skip magic number to fetch the col value
		fseek(my_file, 1, SEEK_CUR);
		fscanf(my_file, "%d", &cols);
	}

	fscanf(my_file, "%d", &rows);
	while (rows < 120) {
		fseek(my_file, 1, SEEK_CUR);
		fscanf(my_file, "%d", &rows);
	}

	fscanf(my_file, "%d", &maxcolorvalue);
	while (!maxcolorvalue) {
		fseek(my_file, 1, SEEK_CUR);
		fscanf(my_file, "%d", &maxcolorvalue);
	}

	printf("cols:%d rows:%d depth:%d\n", cols, rows, maxcolorvalue);

	src_image = (unsigned char*)malloc(rows * cols * 3);

	if (!src_image) {
		perror("allocating memory for source image");
		exit(0);
	}

	fseek(my_file, 1, SEEK_CUR);	// advance file pointer by one byte to move beyond the newline character
	fread(src_image, 1, rows * cols * 3, my_file);

	float c_row[2], c_col[2];
#if defined  USEFP
	int c_row_fp[2], c_col_fp[2];
#endif
	float rot_x = 0.0, rot_y = 0.0, rot_z = 0.0;
	float scale = 1.0;

	while(1) {
		rot_x += 0.0175;
		rot_y += 0.0087;
		rot_z += 0.0044;

		calc_coeffs(c_row, c_col, scale, rot_x, rot_y, rot_z);

#if defined  USEFP
		int src_pixel[2];
		int frac[2];
		int weights[4];  // bilinear weights

		c_row_fp[0] = (int)(c_row[0] * (float)FRAC_SIG);
		c_row_fp[1] = (int)(c_row[1] * (float)FRAC_SIG);
		c_col_fp[0] = (int)(c_col[0] * (float)FRAC_SIG);
		c_col_fp[1] = (int)(c_col[1] * (float)FRAC_SIG);
#else
		float src_pixel[2];
		float frac[2];
		float weights[4];  // bilinear weights
#endif
		int src_pixel_int[2];
		int r[4];
		int g[4];
		int b[4];
		int red, green, blue;

		int fd[NUM_OF_FD];
		unsigned long long cnts[NUM_OF_FD][3];
		unsigned int us;
		struct timeval time1, time2;

		cnts_tick(fd);

		gettimeofday(&time1, 0);

		for (i = 0;
				i < rows/2 /*FIXME: since the fb is 640x480 while the image is 512x512*/;
				++i) {
			for (j = 0; j< cols; ++j) {
#if defined  USEFP
				src_pixel[0] = c_row_fp[0] * (i - rows/2) +
					c_row_fp[1] * (j - cols/2); // (32, FRACBITS)
				src_pixel[1] = c_col_fp[0] * (i - rows/2) +
					c_col_fp[1] * (j - cols/2); // (32, FRACBITS)

				src_pixel_int[0] = (src_pixel[0]>>FRACBITS) + (rows/2); //(32, 0)
				src_pixel_int[1] = (src_pixel[1]>>FRACBITS) + (cols/2); //(32, 0)
#else
				src_pixel[0] = c_row[0] * (float)(i - rows/2) +
					c_row[1] * (float)(j - cols/2);
				src_pixel[1] = c_col[0] * (float)(i - rows/2) +
					c_col[1] * (float)(j - cols/2);

				src_pixel_int[0] = (int)floorf(src_pixel[0]) + rows/2;
				src_pixel_int[1] = (int)floorf(src_pixel[1]) + cols/2;
#endif

				if ((src_pixel_int[0] >= 0) &&
						(src_pixel_int[0] < (rows-1)) &&
						(src_pixel_int[1] >= 0) &&
						(src_pixel_int[1] < (cols-1))) {
#if defined USEFP
					frac[0] = src_pixel[0] & (FRAC_SIG-1);	//(32, FRACBITS)
					frac[1] = src_pixel[1] & (FRAC_SIG-1);

					weights[0] = (FRAC_SIG - frac[0]) * (FRAC_SIG - frac[1]); //(32, 2*FRACBITS)
					weights[1] = (FRAC_SIG - frac[0]) * frac[1];
					weights[2] = frac[0] * (FRAC_SIG - frac[1]);
					weights[3] = frac[0] * frac[1];
#else
					frac[0] = src_pixel[0] - floorf(src_pixel[0]);
					frac[1] = src_pixel[1] - floorf(src_pixel[1]);
		
					weights[0] = (1.0 - frac[0]) * (1.0 - frac[1]);
					weights[1] = (1.0 - frac[0]) * frac[1];
					weights[2] = frac[0] * (1.0 - frac[1]);
					weights[3] = frac[0] * frac[1];
#endif
		
					r[0] = src_image[(src_pixel_int[0] * cols + src_pixel_int[1])*3];
					g[0] = src_image[(src_pixel_int[0] * cols + src_pixel_int[1])*3+1];
					b[0] = src_image[(src_pixel_int[0] * cols + src_pixel_int[1])*3+2];
			
					r[1] = src_image[(src_pixel_int[0] * cols + src_pixel_int[1] + 1)*3];
					g[1] = src_image[(src_pixel_int[0] * cols + src_pixel_int[1] + 1)*3+1];
					b[1] = src_image[(src_pixel_int[0] * cols + src_pixel_int[1] + 1)*3+2];
			
					r[2] = src_image[((src_pixel_int[0] + 1) * cols + src_pixel_int[1])*3];
					g[2] = src_image[((src_pixel_int[0] + 1) * cols + src_pixel_int[1])*3+1];
					b[2] = src_image[((src_pixel_int[0] + 1) * cols + src_pixel_int[1])*3+2];
			
					r[3] = src_image[((src_pixel_int[0] + 1) * cols + src_pixel_int[1] + 1)*3];
					g[3] = src_image[((src_pixel_int[0] + 1) * cols + src_pixel_int[1]+ 1)*3+1];
					b[3] = src_image[((src_pixel_int[0] + 1) * cols + src_pixel_int[1]+ 1)*3+2];
			
#if defined USEFP
					// (32,2m) -> (32, 0)
					red = ((r[0]) * (weights[0]) +
							(r[1]) * (weights[1]) +
							 (r[2]) * (weights[2]) +
							  (r[3]) * (weights[3])) >> FRACBITS*2;

					green = ((g[0]) * (weights[0]) +
							(g[1]) * (weights[1]) +
							 (g[2]) * (weights[2]) +
							  (g[3]) * (weights[3])) >> FRACBITS*2;

					blue = ((b[0]) * (weights[0]) +
							(b[1]) * (weights[1]) +
							 (b[2]) * (weights[2]) +
							  (b[3]) * (weights[3])) >> FRACBITS*2;
#else
					red = (int)((float)(r[0]) * weights[0]) +
						(float)(r[1]) * weights[1] +
						(float)(r[2]) * weights[2] +
						(float)(r[3]) * weights[3];
			
					green = (int)((float)(g[0]) * weights[0]) +
						(float)(g[1]) * weights[1] +
						(float)(g[2]) * weights[2] +
						(float)(g[3]) * weights[3];
			
					blue = (int)((float)(b[0]) * weights[0]) +
						(float)(b[1]) * weights[1] +
						(float)(b[2]) * weights[2] +
						(float)(b[3]) * weights[3];
#endif
			
					//printf("%d %d\n", i, j);

					*((int*)(fbp + i * row_size + j * vinfo.bits_per_pixel / 8 )) = 
						(red << 16) | (green << 8) | blue | (0xFF << 24);
					} else {
						*((int*)(fbp + i * row_size + j * vinfo.bits_per_pixel / 8 )) =  0;
					}
				}
			}

			gettimeofday(&time2, 0);

			cnts_tock(fd, cnts);

			us = time2.tv_sec*1000000 + time2.tv_usec -
				time1.tv_sec*1000000 - time1.tv_usec;
			printf("[system clock] time = %d us\n", us);

			cnts_dump(cnts);
		}

	munmap(fbp, screensize);
	close(fd);
	return 0;
}
