#include <iostream>
#include <pmmintrin.h>
#include <xmmintrin.h>
using namespace std;
void normal_gemm(float **A, float **B, float **C, const int m, const int n,
                 int k) {
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      float c = 0.0f;
      for (int o = 0; o < k; o++) {
        c += A[i][o] * B[o][j];
      }
      C[i][j] = c;
    }
  }
}
void SSE_gemm(float **A, float **B, int m, int n, int k) {
  __m128 t1, t2, sum;
  for (int i = 0; i < m; i++) {
    for (int j = 0; j < n; j++) {
      sum = _mm_setzero_ps();
      for (int o = 0; o < k; o++) {
        t1 = _mm_loadu_ps(A[i] + o);
        t2 = _mm_loadu_ps(B[j] + o);
        t1 = _mm_mul_ps(t1, t2);
        sum = _mm_add_ps(sum, t1);
      }
      sum = _mm_hadd_ps(sum, sum);
      C[i][j] = _mm_store_ps(c[i] + j, sum);
    }
  }
}
int main() {}
