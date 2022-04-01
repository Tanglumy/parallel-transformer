# Parallel Transformer

## Overview

Transformer由论文“Attention is All You Need”提出，改进了 RNN最被人诟病的训练慢
的缺点，利用 self-attention 机制实现快速并行, 现在是谷歌云 TPU 推荐的参考模型。

![transformer](https://tanglu-1302625801.cos.ap-nanjing.myqcloud.com/md/transformer.png)

该模型可以被视为一个黑箱，在机器翻译中，将输入的语言翻译后输出另一种语言。打开黑箱如上图所示，Transformer模型由编码组件encoders、解码组件decoders和编解码组件间连接组成；继续划分，encoders由多个结构相同而无共享参数的encoder组成（论文中使用了6个），decoders由多个decoder组成（与encoder的数量保持一致）。由于本项目主要针对encoder进行优化。

## 优化目标

使用SIMD，OpenMP和MPI对Transformer的attention矩阵乘法进行优化，主要考虑四位循环展开，SSE优化，OpenMP平凡算法，分别使用不同的线程比较效果。

## 实验结果

实验结果主要使用加速比进行比较

![算法加速比比较1](https://tanglu-1302625801.cos.ap-nanjing.myqcloud.com/md/%E7%AE%97%E6%B3%95%E5%8A%A0%E9%80%9F%E6%AF%94%E6%AF%94%E8%BE%831.png)

![算法加速比比较3](https://tanglu-1302625801.cos.ap-nanjing.myqcloud.com/md/%E7%AE%97%E6%B3%95%E5%8A%A0%E9%80%9F%E6%AF%94%E6%AF%94%E8%BE%833.png)

![算法时间比较1](https://tanglu-1302625801.cos.ap-nanjing.myqcloud.com/md/%E7%AE%97%E6%B3%95%E6%97%B6%E9%97%B4%E6%AF%94%E8%BE%831.png)

![算法时间比较3](https://tanglu-1302625801.cos.ap-nanjing.myqcloud.com/md/%E7%AE%97%E6%B3%95%E6%97%B6%E9%97%B4%E6%AF%94%E8%BE%833.png)
