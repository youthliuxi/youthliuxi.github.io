---
title: lamp环境的搭建
tags:
  - apache
  - lamp
  - mysql
  - php
  - phpmyadmin
  - ubuntu
id: 193
categories:
  - 学习笔记
date: 2015-12-31 16:54:16
---

2015年12月31日（也就是2016年的第0日）我买了一个云服务器然后，啥也没有，我只能从搭建lamp环境开始

<!--more-->
#### 第一步：安装apache

> sudo apt-get update &emsp;&emsp;//更新软件源列表
> sudo apt-get install apache2 &emsp;&emsp;//安装apache
> apache2 -v &emsp;&emsp;//验证Apache是否安装用浏览器登录IP地址，会看到“It's works”的字样

#### 第二步：安装php

> sudo apt-get install php5
> php5 -v
> cat /etc/apache2/mods-enabled/php5.load &emsp;&emsp;//验证Apache是否加载了php的模块

#### 第三步：安装mysql

> sudo apt-get install mysql-server
> 安装过程中要设置mysql的密码

> sudo apt-get install php5-mysql
> //php默认不安装mysql的模块，所以，这里直接安装一下检查php的mysql模块是否被加载

> cat /etc/php5/mods-available/mysql.ini

&emsp;&emsp;（ps：有些教程里会教你使用"cat /etc/php5/conf.d/mysql.ini"，但是我压根找不到conf.d的文件夹，所以，用上面那条命令就好了。）

> sudo service mysql restart
> sudo service apache2 restart
> //两个重启（pps：可以使用一个长命令直接安装）

> sudo apt-get install apache2 php5 mysql-sever php5-mysql &emsp;&emsp;//或者使用下面的命令
> sudo tasksel install lamp-server
> //使用tasksel工具安装，这个工具只支持一些常用的软件套装

#### 第四步：安装phpmyadmin直接从后台登录mysql是用的

> mysql -u &lt;username&gt; -p &lt;password&gt;实在是不习惯，于是，果断安装phpmyadmin

> sudo apt-get install phpmyadmin

#### 第五步：添加软连接恩，这个是重点，我实在是不想打开“var/www/html”再修改我的文件了于是，我做了以下操作：

> sudo ln -s /var/www/html ~/html
> cd ~/html 
> sudo ln -s /usr/share/phpmyadmin phpmyadmin这样我就可以直接在用户目录下直接操作我的代码了，好爽啊~

* * *
华丽丽的分割线之后，就可以新建工程文件了，老规矩，先建立一个info.php的文件

> &lt;?php
> phpinfo();&emsp;&emsp;//php所有的模块加载情况
> ?&gt;再在这个文件里判断php是否能够连接mysql

> &lt;?php
> header("Content-type: text/html; charset=utf-8");

> echo mysql_connect('localhost','root','密码')?"数据库连接成功":"数据库连接失败";
> ?&gt;前端输出“数据库连接成功”，搞定！

[来自为知笔记(Wiz)](http://www.wiz.cn/i/d15372b9 "来自为知笔记(Wiz)")