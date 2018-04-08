---
title: linux操作，wordpress搭建时出现的小问题汇总
tags:
  - apache
  - phpmyadmin
  - zip
  - 乱码
  - 访问
  - 配置
id: 202
categories:
  - 服务器不得不说的二三事儿
date: 2016-01-03 12:29:01
---

问题一：访问域名时，泄露文件组成

&emsp;&emsp;问题分析：apache配置问题，在“/etc/apache2/sites-available”文件夹里面，之前的那个配置文件里，加入下面的代码即可避免

<!--more-->
> &lt;Directory /var/www/html&gt;
> &emsp;&emsp;Order Deny,Allow
> &emsp;&emsp;Deny from all
> &lt;/Direstory&gt;

&emsp;&emsp;禁止所有人通过网络访问html文件夹，而ip地址访问，就代表着这个文件夹，好了，这就完美了，谁也别想通过ip看到我的文件了。。。

问题二：以汉字命名的文件名乱码问题

&emsp;&emsp;问题分析，windows使用的是GBK编码，ubuntu使用的是utf-8的字符编码，以前都是传英文的文件或文件夹，没发现过什么问题，这次出现了，尴尬的我抓紧时间找到了解决方法

解决方案：
1.安装7-zip 和 convmv

> sudo apt-get install convmv p7zip-full

2.解压zip文件

> LANG=C 7z e &lt;filename&gt 

3.开始转换编码&nbsp;

> convmv -f gbk -t utf8 -r --notest * 
> &emsp;&emsp;//通配符搞定一切文件

&emsp;&emsp;新技能，get！！！

问题三：phpmyadmin的访问问题

&emsp;&emsp;需要哪个就在哪个下面放置phpmyadmin的软连接即可，不过，应该有更好的解决方式。

问题四：wordpress的伪静态处理（尚未解决）

&emsp;&emsp;wordpress针对不同人的喜欢做了很多的固定连接，除了默认的形式“朴素”以外，其他都采用的伪静态处理，但是，apache配置问题，导致，所有的伪静态处理现实的都是403页面，有待解决。

[来自为知笔记(Wiz)](http://www.wiz.cn/i/d15372b9 "来自为知笔记(Wiz)")