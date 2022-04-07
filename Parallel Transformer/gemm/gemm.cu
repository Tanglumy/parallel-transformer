__global__ void gemm(const float*A, const float* B,int m,int n,int k){
    __shared__ float** result;
    x = blockIdx.x*blockDim.x+threadIdx.x;
    y = blockIdx.y*blockDim.y+threadIdx.y;
    if(x<m&&y<n){
        __shared__ float c=0
        for(int i=0;i<k;i++){
            c+= A[x*k+i]*B[i*n+y];
        }
        C[x*n+y]=c;// C[x][y]
        //优化方法：1。threadPerblock设置为32的整数倍，
}