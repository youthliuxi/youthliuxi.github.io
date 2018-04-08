---
title: wordpress小问题集锦（解决wordpress更新权限问题）
id: 208
categories:
  - 学习笔记
date: 2016-01-03 20:55:33
tags:
---

问题一：文件夹权限问题

&emsp;&emsp;直接将wordpress解压到解析地址的时候，登录域名是无法完成安装的，首先，它会显示无法创建“wp-config.php”文件，这个时候，体现出我的机智了，直接进入服务器，给解析文件夹以最高权限


> chmod -R 777 &lt;文件夹地址&gt;

&emsp;&emsp;为什么，因为实在是懒得研究权限问题，这个mark一下，回头去百度google一下“linux系统的权限问题”

问题二：更新wordpress需要ftp账号密码

&emsp;&emsp;机智的我在看到这里的时候，第一反应就是安装配置ftp，当然，我也是这么做的

> sudo apt-get install vsftpd

<!--more-->

&emsp;&emsp;但是配置的时候，出了点问题，没找到配置文件，坑啊，于是，这一点果断放弃，后来又发现了一个方法。给这个解析文件夹赋予相应的权限和管理员


> sudo chmod -R 777 &lt;文件夹地址&gt;
> sudo chown -R &lt;管理员名称&gt; &lt;文件夹地址&gt;

&emsp;&emsp;如果嫌麻烦，管理员可以直接设置为root，再从wp-config.php文件的最后加上三行代码

> define("FS_METHOD", "direct");
> define("FS_CHMOD_DIR", 0777);
> define("FS_CHMOD_FILE", 0777);

&emsp;&emsp;再回到原页面，安装插件、下载主题，完美\~\~\~

问题三：could not get lock--常见错误

&emsp;&emsp;安装vsftpd的时候我强制关闭了一次会话，再回去，安装就弹出两个错误


> E: Could not get lock /var/lib/dpkg/lock - open (11: Resource temporarily unavailable)
> E: Unable to lock the administration directory (/var/lib/dpkg/), is another process using it

&emsp;&emsp;百度一下，问题解析很明白，这是因为另一个程序正在运行，导致资源被锁不可用，主要原因就是上次运行的安装或更新没有正常完成，解决方案就是————删掉


> sudo rm /var/cache/apt/archives/lock
> sudo rm /var/lib/dpkg/lock

&emsp;&emsp;完美\~\~\~


[来自为知笔记(Wiz)](http://www.wiz.cn/i/d15372b9 "来自为知笔记(Wiz)")