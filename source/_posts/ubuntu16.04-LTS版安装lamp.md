---
title: ubuntu16.04  LTS版安装lamp
id: 435
categories:
  - 服务器不得不说的二三事儿
date: 2016-06-02 00:23:41
tags:
---

**安装Apache2**

安装代码

> sudo apt-get install apache2

更改默认目录

<!--more-->
> sudo vim etc/apache2/apache2.conf
> //将 &lt;Directory /var/www/&gt;
> // 改成 &lt;Directory "你的目录"&gt;
> // 可以将/var/www 中的默认网页复制到**你的目录**中
> sudo vim /etc/apache2/sites-available/000-default.conf
> // 将 DocumentRoot /var/www/html
> // 改成 DocumentRoot "你的目录"
> sudo /etc/init.d/apache2 restart
> // 重启测试 在浏览器中输入：*http://localhost或http：//127.0.0.1，可以看到下图：*

 ![](http://youthliuxi.cn/wp-content/uploads/2016/06/6d6b4cc07fab40597cfc3db3898f4889_da9236e5c70d06145502834fa7ad16ed-1.png)

 **安装PHP**安装代码

> sudo apt-get install php7.0
> // ubuntu16.04中没有php5了，直接装7吧
> sudo apt-get install libapache2-mod-php7.0
> // 配置APACHE+PHP7的
> sudo apt-get install libapache2-mod-php
> // 这个应该是配置APACHE+PHP5的，一块装吧
> sudo /etc/init.d/apache2 restart
> // 重启测试php文件 在 “你的目录”下建一个testphp.php

> hello php
> &lt;?php
> phpinfo();
> ?&gt;测试效果 在浏览器中输入http://127.0.0.1/testphp.php，可以看到：

![](http://youthliuxi.cn/wp-content/uploads/2016/06/6d6b4cc07fab40597cfc3db3898f4889_028e396f8d516852669fa14f228cf834-1.png)

**安装MySql**在终端：

> sudo apt-get install mysql-server mysql-client
> // 安装时会要求输入mysql管理员密码，输入即可

注意： 

mysql-server：用来创建和管理数据库实例，提供相关接口供不同客户端调用; 
mysql-client：操作数据库实例的的一个命令行工具，像图形化界面工具有phpmyadmin等; 
mysqld：即MySQL server 
mysql：即mysql-client客户端命令行工具 - 附mysql服务管理命令

> /etc/init.d/mysql stop/restart/start
> service mysql stop/restart/start
> // 两条令相同推荐自启管理工具

> sudo apt-get install sysv-rc-conf


[来自为知笔记(Wiz)](http://www.wiz.cn/i/d15372b9 "来自为知笔记(Wiz)")