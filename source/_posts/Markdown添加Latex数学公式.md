---
title: Markdown添加Latex数学公式
date: 2018-04-28 18:53:59
tags:
  - markdown
  - latex
  - hexo
  - 数学公式
categories:
  - 学习笔记
mathjax: true
---

## markdown
&emsp;&emsp;最近爱上了用markdown记笔记，无论是为知笔记还是hexo，简直是不要太方便，然而，前两天，我遇到了瓶颈。
&emsp;&emsp;在使用markdown记深度学习笔记的时候，突然需要输入一些数学公式，犹记得markdown是兼容数学公式的，于是搜索了一下，现在稍微整理如下，本文就作为一个markdown的latex数学符号速查表吧。 
<!--more-->

### 给hexo添加LaTeX
&emsp;&emsp;hexo添加latex功能大约有三步
1. 安装hexo-math
```bash
npm install hexo-math --save
hexo math install
```
2. 配置主题的_config.yml
```bash
mathjax: true
```
3. 在文章的信息栏添加参数
```bash
mathjax: true
```

### 添加方法
1. 行内公式
```markdown
$行内公式$
```
1. 行间公式
```markdown
$$行间公式$$
```

### 角标与开方
```markdown
$$c=\sqrt{a^{2}+b_{xy}^{2}+e^{x}}$$
```
$$c=\sqrt{a^{2}+b_{xy}^{2}+e^{x}}$$

### 分数表达
```markdown
$$\frac{x^{2}y^{2}}{x+y}$$
```
$$\frac{x^{2}y^{2}}{x+y}$$

### 求和与连乘
```markdown
$$\sum_{i=0}^{n}$$ $$\prod_\epsilon$$
```
$$\sum_{i=0}^{n}$$ $$\prod_\epsilon$$

### 微分与积分
```markdown
$$\int_{a}^{\pi} f(x) \,dx$$
```
$$\int_{a}^{\pi} f(x) \,dx$$

### 极限与偏导数
```markdown
$$\lim_{x \to +\infy}\frac{1}{x}$$
$$\frac{\partial^2 u}{\partial z^2}$$
```
$$\lim_{x \to +\infy}\frac{1}{x}$$
$$\frac{\partial^2 u}{\partial z^2}$$

### 三角函数和矩阵
```markdown
$$\cos2\theta = cos^2\theta -sin^2\theta \\ = 2\cos^2\theta -1$$

$$\begin{equation}
A=\left[
\begin{matrix}
1&2&3 \\ 
2&3&4 \\ 
3&4&5  
\end{matrix}
\right]
\end{equation}$$
```
$$\cos2\theta = cos^2\theta -sin^2\theta \\ = 2\cos^2\theta -1$$

$$\begin{equation}
A=\left[
\begin{matrix}
1&2&3 \\ 
2&3&4 \\ 
3&4&5  
\end{matrix}
\right]
\end{equation}$$