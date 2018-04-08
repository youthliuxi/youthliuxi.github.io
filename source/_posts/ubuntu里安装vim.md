---
title: ubuntu里安装vim
tags:
  - ubuntu
  - vim
  - 安装
id: 195
categories:
  - 服务器不得不说的二三事儿
date: 2016-01-01 09:37:52
---

&emsp;&emsp;其实安装vim应该没什么好说的

> sudo apt-get install vim-gtk

<!--more-->
&emsp;&emsp;然后，是一场漫长的等待，当然，其中也需要输入“y”（太漫长了，服务器那边的时间都比apache+php+mysql安装时间之和还要长\~\~\~）安装完成后可以随便用vim命令试一试，看看有没有**重点来了，配置：**

> sudo vim /etc/vim/vimrc

&emsp;&emsp;打开配置文件，并修改我所做的修改如下：

> syntax on
> //保证这句不被注释掉就可以了，这句是语法高亮
> //接下来在文件最后面，加上以下代码
> set nu&emsp;&emsp;// 在左侧行号
> set tabstop=4&emsp;&emsp;//tab 长度设置为 4
> set nobackup&emsp;&emsp;//覆盖文件时不备份
> set cursorline&emsp;&emsp;//突出显示当前行
> set ruler&emsp;&emsp;//在右下角显示光标位置的状态行
> set autoindent&emsp;&emsp;//自动缩进
> set incearch&emsp;&emsp;//方便搜索，直接输入“/bo”光标会直接跳转到第一个以bo开头的单词ok，配置差不多搞定了，这样也就差不多能用了

* * *
未完待续\~\~\~

[来自为知笔记(Wiz)](http://www.wiz.cn/i/d15372b9 "来自为知笔记(Wiz)")