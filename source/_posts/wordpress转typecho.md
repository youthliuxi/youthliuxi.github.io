---
title: wordpress转typecho
date: 2017-01-29 19:53:03
categories:
	- 学习笔记
tags:
	- wordpress
	- typecho
---

&emsp;&emsp;大年初二，无聊中，填一填曾经的坑。
&emsp;&emsp;2015年买了域名和服务器，从此爱上了博客，wordpress可以说是php做的最经典的一款博客软件，一开始使用它的时候特有成就感，终于拥有一个自己的网站了，重点是，我还可以换各种各样别人做的好看的主题、可以使用各种插件，而且，wordpress可以做企业网站或者个人博客，几乎是最快的搭建网站的工具，CMS的典范。
<!--more-->
&emsp;&emsp;但是现在，我用hexo+github pages做静态化博客以后，突然很喜欢简洁的东西，所谓大道至简，所有的东西以实用为主，买了域名[liuxi.site](http://liuxi.site)，指向新博客[liuxi12138.github.io](http://liuxi12138.github.io)。
&emsp;&emsp;今天无意间翻到曾经找到的一个无比轻量级的blog————typecho，也是php的cms，但是与wordpress相比省去了很多的功能，只保留了最基本的功能，而且最重要的是，我当初给它配的那个“time”的主题，我很喜欢，所以，今天决定，填一下当初的这个坑，往里面添加一些文章，然而，添加文章最简单的就是直接把wordpress里的内容转移到typecho，我相信，这个世界上并不只有我一个人有这样的想法，所以，我至于要踏着前人的脚步走下去就好啦，恩，现在我就来记录一下我的转移历程。

# 第一步，转移文件

&emsp;&emsp;将wordpress里面的曾经上传过得照片文件转移到typecho的上传文件夹里，这一步在linux服务器里进行就可以了，一步命令，搞定。

> cp -r XXX.cn/wp-content/uploads/* typecho.XXX.cn/usr/uploads/

# 第二步，转移数据库

&emsp;&emsp;使用wordpresstotypecho插件，他是一个typecho的插件，放在typecho.XXX.cn/usr/plugins/文件夹下，在typecho的后台启用一下，点击“设置”，将处以同一服务器的wordpress的数据库各项参数填好，保存，点击左上角“控制台”=>“从wordpress导入数据”即可。
&emsp;&emsp;由于文章数目有限，再加上是sql操作，所以，很快就转移完成了。
&emsp;&emsp;附上插件下载地址：
&emsp;&emsp;&emsp;&emsp;[WordpressToTypecho](http://7rfkk7.com1.z0.glb.clouddn.com/wordpresstotypecho.zip)

# 第三部，替换图片地址

&emsp;&emsp;为了保持两个项目的相互独立性，也是让第一步的操作不白费，我要将数据库中图片地址全部改为新的地址，使用命令：

> UPDATE typecho_contents SET text = AEPLACE(text,'http\://xx.cn/wp-content/uploads/','http\://xx.cn/usr/uploads/');

# 后记

&emsp;&emsp;至此，wordpress转typecho工作全部完成。
&emsp;&emsp;虽然我依然是在使用hexo+github pages写博客，但是又有谁能说的清楚我未来不会使用wordpress或者typecho来搭建我自己的其他的东西呢。
&emsp;&emsp;哎呀，突然很想继续续租自己的服务器和域名[youthliuxi.cn](http://youthliuxi.cn)，至于youthonur.com这个域名，算了，当初只是无聊的产物。