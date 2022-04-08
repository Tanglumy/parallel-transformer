__global__ void gemm(const float*A, const float* B,int m,int n,int k){
    x = blockIdx.x*blockDim.x+threadIdx.x;
    y = blockIdx.y*blockDim.y+threadIdx.y;
    if(x<m&&y<n){
        __shared__ float c=0.0;
        for(int i=0;i<k;i++){
            c+= A[x*k+i]*B[i*n+y];// A[x][i], B[i][y]
        }
        C[x*n+y]=c;// C[x][y]
        //优化方法：1。threadPerblock设置为32的整数倍，
}
}
__global__ void gemm_mem(const float*A, const float* B,int m,int n,int k){
    x = blockIdx.x*blockDim.x+threadIdx.x;
    y = blockIdx.y*blockDim.y+threadIdx.y;
    __shared__ nA[m][k];
    
    __shared__ nB[n][k];
    if(x<m&&y<n){
        float c=0.0;
        for(int i=0;i<k;i++){
            c+=
        }
    }
}