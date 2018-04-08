---
title: linux随手记之——宝塔和终端
date: 2018-01-26 22:33:49
tags:
  - apache
  - phpmyadmin
  - 宝塔面板
  - Retro Terminal
categories:
  - 服务器不得不说的二三事儿
---

## 宝塔面板

&emsp;&emsp;重装linux服务器之后，第一时间安装了宝塔linux面板
&emsp;&emsp;曾经自己配置apache + php + mysql + phpmyadmin，也安装过套装lamp和lnmp，但是最近时间紧，任务重，主要是希望对linux进行精简的整理，以操作简单为主要目的构想，所以，安装了宝塔linux面板，用来对网站进行管理<!--more-->
&emsp;&emsp;近期宝塔系统出现一定程度的不稳定，不定期的出现database无法登陆的现象，以至于无论是phpmyadmin还是网站脚本都无法访问数据，必须采取重置数据库密码的方式才能回复对数据库的访问，疑似存在sql注入一类的行为、或系统存在定期修改数据库密码的脚本
&emsp;&emsp;现做出部分处理：
> 删除博客的独立数据库
> 为宝塔面板单独绑定子域名，限制其他访问渠道

## Rrtro Terminal

&emsp;&emsp;这是一个可以吧linux的终端模拟成显像管显示器的程序，安装上这个软件，就可以体会一把，苹果第一代电脑的操作感受，除了好玩儿，也没啥。
&emsp;&emsp;github地址：

> [cool-retro-term](https://github.com/Swordfish90/cool-retro-term)

&emsp;&emsp;ubuntu下我的操作是：

> sudo add-apt-repository ppa:noobslab/apps
> sudo apt-get update
> sudo apt-get install cool-retro-term

&emsp;&emsp;但，在解析的最后报了一个错，我并没有分析查找原因，而是点击了提示中给予的下载链接

> http://101.96.10.24/ppa.launchpad.net/noobslab/apps/ubuntu/pool/main/c/cool-retro-term/cool-retro-term_1.0.2-xenial_amd64.deb

&emsp;&emsp;把deb安装包下载到了ubuntu中，并且，直接进行了安装，ok，搞定（毕竟安装这个东西的，肯定是Desktop版，直接用火狐下载就可以了）