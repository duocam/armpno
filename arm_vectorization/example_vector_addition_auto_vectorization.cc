void vec_add(float *vec_A, float *vec_B, float *vec_C, int len_vec) {
          int i;
#pragma clang loop interleave_count(2)
          for (i=0; i<len_vec; i++) {
                  vec_C[i] = vec_A[i] + vec_B[i];
          }
}
