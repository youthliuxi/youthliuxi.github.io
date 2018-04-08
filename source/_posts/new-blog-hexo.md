---
title: new blog hexo
categories:
  - 生活
date: 2017-01-19 21:59:20
tags:
---

&emsp;&emsp;今天我终于将我的wordpress博客文章全部转移到hexo中并且生成静态页托管到github上了。tmd累死老子了，这么多文章从wordpress导出再从hexo中导入，这不是最关键的，最关键的是，当初我到底是哪边脑袋进水了，喜欢上了富文本编辑器，哎呀我去，这下可好了，富文本编辑器生成的混乱的html代码混着markdown生成的html，那效果，简直是醉人啊，没办法，花了两天时间一篇文章一篇文章的排版，可能还有bug，不过，无伤大雅，下面我来梳理一下搭建hexo+github博客的全过程。
<!--more-->
&emsp;&emsp;首先明确一点，hexo是本地的静态页生成工具，github是静态页的托管地点。嗯，所以，基本不需要服务器，为什么还要声明这一点呢，因为，我傻傻的在我的ubuntu服务器上安装好了hexo，并且导入了博客文章，才知道，原来hexo是在本地运行的，不说了，心好累\~

## 一，安装nodejs

&emsp;&emsp;从nodejs官网下载最新版本的LTS版，下载，安装，没什么技术难度

## 二，安装hexo

&emsp;&emsp;在nodejs的安装文件夹下，执行以下命令

> mkdir blog
> cd blog
> npm install hexo-cli -g &nbsp;//-g表示全局，也可以不加
> hexo -v&nbsp;//检查版本号
> hexo init&nbsp;//hexo初始化
> npm install
> hexo init
> hexo generate &nbsp;//hexo生成静态页
> hexo server &nbsp;//hexo页面预览

&emsp;&emsp;还应该进行的操作是修改参数文件_config.yml，修改里面的一些信息，比如网站相关信息，使用主题信息，远程托管信息等等

## 三，修改主题

&emsp;&emsp;将下载好的hexo主题放置在theme文件夹下，然后从_config.yml文件夹中，将theme的信息修改成该主题文件夹同名即可，然后，【hexo g】。

## 四，博客托管

&emsp;&emsp;1. 在github中新建一个项目“liuxi12138.github.io”
&emsp;&emsp;1. 在blog文件夹下安装hexo的git托管工具
> npm install hexo-deployer-git \-\-save

&emsp;&emsp;1. 然后在_config.yml文件夹最后写入以下信息。

> deploy:
> type: git
> repo: 
> &nbsp;&nbsp;github: git@github.com:liuxi12138/liuxi12138.github.io.git,master

&emsp;&emsp;还要在github中将git在本机生成的ssh秘钥绑定好，就可以使用了。

&emsp;&emsp;运行【hexo deploy】直接将生成好的静态页托管到github上

## 小记

### 关于nodejs

&emsp;&emsp;nodejs有一个直接升级的扩展件叫“n”，可以直接用【npm install n -g】安装，但是一直都不成功，原因不明。

### 关于github

&emsp;&emsp;【hexo d】一开始运行报错，后来发现错误信息提示中有
> warning:LF will be replaced by CRLF in tags/nodejs/index.html.
> The file will have its original line endings in your working directory.

&emsp;&emsp;后来查到，git里有一个core.autocrlf的功能，用来自动应对换行问题，牵扯到联合开发，我也没深究，反正使用一行命令关掉，就可以托管了。
> git config --global core.autocrlf false

### 关于文章自身

&emsp;&emsp;markdown和wordpress一样，都支持
> <\!--more--\>

&emsp;&emsp;将文章多余部分省略去的方法

### 关于hexo

&emsp;&emsp;以下记录hexo的小技巧:
> npm update hexo-cli &emsp;&emsp;//hexo升级
> hexo g &emsp;&emsp;//generate，生成静态页
> hexo s &emsp;&emsp;//server，本地预览
> hexo d &emsp;&emsp;//deploy，部署
> hexo server -p 5000;&emsp;//更改预览端口为5000
> hexo server -i 192.168.1.1 &emsp;//更改预览ip
> hexo clean &emsp;&emsp;//清空本地缓存
> 
> hexo new "我的文章题目"&emsp;//新建文章
> hexo new page "我的页面名称"&emsp;//新建页面
> hexo publish [草稿]

***
&emsp;&emsp;未完待续。。。