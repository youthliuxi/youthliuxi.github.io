---
title: tensorflow安装
date: 2018-05-21 22:09:03
tags:
  - tensorflow
  - deep-learning
categories:
  - 学习笔记
---

&emsp;&emsp;记在前面，看文档一定要仔细，版本号错了，也有可能安装不上，我一个下午的时间白白消耗，就是因为CUDA使用的是9.2版本，而官网要求的是9.0版本，按理说应该没有太大问题，可就在执行【import tensorflow as tf】时，会报错，显示缺少9.0的文件。
&emsp;&emsp;cuDNN其实只是CUDA的辅助文件，所以，在版本的选用上，我选择了最新的7.1.4，目前没发现问题。发现问题也可以再替换回来。
<!--more-->

## 你不知道我经历了什么系列
&emsp;&emsp;一大清早，我兴高采烈的打开电脑，决定正是配置tensorflow的环境，之前用正则抓取笔记成功给了我很强的动力。殊不知，在前方等待我的，是无尽的折磨。
&emsp;&emsp;本着“跟着官网有肉吃”的原则，我搭梯子，打开了tensorflow的官网，确定自己要安装GPU版本的tensorflow的时候我还有点小激动，毕竟通常情况下，在GPU上运行要比在CPU上运行的快，关键是，我终于可以接触到与GPU相关的东西了。
&emsp;&emsp;按照官网的指示，需要安装CUDA9.0和cuDNNv7.0，然后再使用pip安装tensorflow，我跌跌撞撞的走到了pip那一步，结果【pip3 install --upgrade tensorflow-gpu】结果，居然报错，安装不了。我又同时试了whl文件安装，一样不管用。
&emsp;&emsp;没办法，只能使用anaconda安装，本想只配置原生环境，现在是没办法，只得如此了。

## 前期准备
1. CUDA9.0
2. cuDNN7.0
3. anaconda
4. python3.6（我的是3.6，反正是python3就行）
4. 和python版本相匹配的tensorflow安装文件（没有也行）

### CUDA9.0
下载地址：
```html
https://developer.nvidia.com/cuda-90-download-archive
```
最后记得把bin和lib/x64这两个文件夹添加到PATH里

### cuDNN7.1.4
下载地址：
```html
https://developer.nvidia.com/rdp/cudnn-download
```
最后把三个文件夹下的文件，copy到CUDA对应的文件夹下

### anaconda
下载地址：
```html
https://www.anaconda.com/download/
```
一路默认即可，安装路径保证为英文路径。
安装完成后，打开【Anaconda prompt】运行以下的命令
```bash
# 查看已安装的常用包
conda list
# 添加清华的软件源
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
conda config --set show_channel_urls yes 
# 创建一个名为tensorflow的python3.6的环境
conda create --name tensorflow python=3.6 
# 启动该环境
activate tensorflow
# 安装tensorflow（选一个即可，我肯定选GPU）
python -m pip install --upgrade --ignore-installed tensorflow-gpu
python -m pip install --upgrade --ignore-installed tensorflow
# 关闭环境
deactivate
```
测试tensorflow的话，只需要在python里看一下【import tensorflow as tf】能否正常即可。
linux的江湖规矩，没有反应就是最好的反应。
