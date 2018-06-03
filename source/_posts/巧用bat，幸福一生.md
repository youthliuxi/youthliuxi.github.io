---
title: 巧用bat，幸福一生
date: 2018-06-03 23:58:33
tags:
  - bat
  - 脚本
categories:
  - 学习笔记
---
### 一
&emsp;&emsp;windows里每次打开bash都是在C盘user目录下的个人目录，而python的脚本在H盘，于是乎每次都要转盘，再开文件，十分的麻烦，直到使用了bat脚本，类似于linux的sh脚本。
<!--more-->
```bash
@echo off
H:
cd \python\tensorflow\
```
&emsp;&emsp;保存成open_tf.bat，这样以后每次只需要在终端运行bat文件就可以了，方便、提升幸福感。
&emsp;&emsp;【@echo off】表示关闭所有命令的回显。
```bash
> open_tf.bat
```
### 二
&emsp;&emsp;每次更新hexo时都要打一套命令，bat脚本，一次搞定，还可以自定义注释，完美。
```bash
set /p m=
hexo g && hexo d && git add * && git commit -m "%m%" && git push origin hexo
```