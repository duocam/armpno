int bubble_sort (int *data,int n) {
	int i,j,temp;
	for (i=0;i<n-1;i++){
		for (j=0;j<n-1;j++){
			if (data[j]>data[j+1]) {
				temp=data[j];
				data[j]=data[j+1];
				data[j+1]=temp;
			}
		}
	}
	return 1;
}
