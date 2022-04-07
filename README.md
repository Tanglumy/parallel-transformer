# Parallel Transformer
a fast and elegant to learn how to optimize transformer block.
## Overview
transformer is a very hot NLP model in recent years, the model uses the architecture of seq2seq, the original intention of the paper aims to solve the machine translation task, in the subsequent BERT and other models, has been expanded to solve almost all NLP tasks.
![transformer](https://tanglu-1302625801.cos.ap-nanjing.myqcloud.com/md/transformer.png)


## optimize target
using SIMD,OpenMP,MPI to optimize Transformer attention block. This repo considers unroll, SSE, OpenMP, tile and cuda to compare all the parallel functions.

## experiments results

using speedup to compare all the results.

![算法加速比比较1](https://tanglu-1302625801.cos.ap-nanjing.myqcloud.com/md/%E7%AE%97%E6%B3%95%E5%8A%A0%E9%80%9F%E6%AF%94%E6%AF%94%E8%BE%831.png)

![算法加速比比较3](https://tanglu-1302625801.cos.ap-nanjing.myqcloud.com/md/%E7%AE%97%E6%B3%95%E5%8A%A0%E9%80%9F%E6%AF%94%E6%AF%94%E8%BE%833.png)

![算法时间比较1](https://tanglu-1302625801.cos.ap-nanjing.myqcloud.com/md/%E7%AE%97%E6%B3%95%E6%97%B6%E9%97%B4%E6%AF%94%E8%BE%831.png)

![算法时间比较3](https://tanglu-1302625801.cos.ap-nanjing.myqcloud.com/md/%E7%AE%97%E6%B3%95%E6%97%B6%E9%97%B4%E6%AF%94%E8%BE%833.png)
