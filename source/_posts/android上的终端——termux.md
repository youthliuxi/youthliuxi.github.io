---
title: android上的终端——termux
date: 2018-05-16 01:09:03
tags:
  - android
  - termux
categories:
  - 学习笔记
---
## 前言
&emsp;&emsp;在安卓也可以体验终端命令的快感，甚至还可以操作安卓基础硬件。

## 基本命令
&emsp;&emsp;**termux**支持*apt*软件管理和*pkg*软件管理，首次安装时，系统会默认给出pkg的安装及更新命令，对此不做过多赘述，用过linux的可以直接上手。

## 更换国内源
### 一
```bash
export EDITOR=vim # 再此之前，应先安装vim，当然，不安装也可以用vi
apt edit-sources
```
&emsp;&emsp;然后【https://mirrors.tuna.tsinghua.edu.cn/termux】代替原文中的【https://termux.net】，保存退出，幸福美满。

### 二
```bash
vim  $PREFIX/etc/apt/sources.list
```

## 推荐预安装工具
```bash
pkg update
pkg install vim curl wget git unzip unrar tmux
```

## 管理员权限问题
&emsp;&emsp;无论是以下哪种管理员都有一个缺点，就是在使用蓝牙键鼠套装时，非管理员界面可以正常识别teb、ctrl、方向键。但管理员权限下，无法自动补全和使用方向键，这就意味着，一个命令输错了，只能删了重来。

### 一、虚拟管理员(未root)
```bash
pkg install proot
termux-chroot # 启动命令
```
&emsp;&emsp;模拟root环境的同时，还会模拟linux的文件路径。
&emsp;&emsp;普通文件路径是【/data/data/com.termux/file/home】
&emsp;&emsp;开启后的文件路径是【/home】

### 二、真实管理员(已root)
&emsp;&emsp;先通过root向termux授予权限才能执行
```bash
pkg install tsu
tsu # 启动命令
```
&emsp;&emsp;执行后文件路径不变，因此可以进入手机的任何一个目录

## python部署
```bash
pkg install python2
python2 -m pip install --upgrade pip
pkg install python
python -m pip install --upgrade pip
```

### ipython
```bash
pkg install clang
pip install ipython
pip3.6 install ipython
```
&emsp;&emsp;如此便可使用【ipython】和【ipython2】进入高效编程的python交互页面。

## nodejs部署
```bash
pkg install nodejs
node -v
npm -v
```

## MariaDB(Mysql)部署
### 安装mariadb
```bash
pkg install mariadb
```

### 安装基本数据
```bash
mysql_install_db
```

### 启动mariadb服务
```bash
mysqld
```
&emsp;&emsp;【友情提示】：启动mysql后，该回话便无法进行任何操作，需要左滑唤醒会话菜单，开启新的回话。而倘若不在一个会话里启动mysqld，而是直接运行mysql，则会爆2002错误。

### 修改mysql密码
&emsp;&emsp;以下操作均在mysqld启动后执行
```bash
mysql_secure_installation
# 输入旧密码，空则直接回车
Set root password? [Y/n] y
New password:
Re-enter new password:# 两次输入新密码

Remove anonymous users? [Y/n] Y #是否移除匿名用户
Disallow root login remotely? [Y/n] n #是否不允许root远程登录
Remove test database and access to it? [Y/n] n #是否移除test数据库
Reload privilege tables now? [Y/n] y #是否重新加载表的权限
```

### 登录mysql
```bash
mysql -uroot -p******
```

## php部署
```bash
pkg install php # 可采用phpinfo进行测试
php -S 127.0.0.1:8080 -t www/
```

## nginx部署
```bash
pkg install nginx
nginx # 默认端口是8080
```
&emsp;&emsp;nginx的启动要在【termux-chroot】命令作用后再运行，否则会报错。

### nginx操作
```bash
fuser -k 8080/tcp # 停止nginx服务
nginx -s reload # 重启nginx服务
```

### nginx解析php
#### 安装php-fpm
```bash
pkg install php-fpm
```

#### 配置php-fpm
&emsp;&emsp;在【proot】环境下
```bash
termux-chroot
vim /etc/php-fpm.d/www.conf
```
&emsp;&emsp;将【listen = /data/data/com.termux/files/usr/var/run/php-fpm.sock】改为【listen = 127.0.0.1:9000】

### 配置nginx
```bash
termux-chroot
vim /etc/nginx/nginx.conf
```
&emsp;&emsp;配置文件如下：
```bash
worker_processes 1;
events {
    worker_connections 1024;
}
http {
    include mime.types;
    default_type application/octet-stream;
    sendfile on;
    keepalive_timeout 65;
    server {
        listen 8080;
        server_name localhost;
        root /data/data/com.termux/files/home/www;
        index index.html index.htm;
        error_page 500 502 503 504 /50x.html;
        location = /50x.html {
            root /data/data/com.termux/files/home/www;
        } # location的右括号
        location ~ \.php$ {
            root html;
            fastcgi_pass 127.0.0.1:9000;
            fastcgi_index index.php;
            fastcgi_param SCRIPT_FILENAwentME /data/data/com.termux/files/home/www$fastcgi_script_name;
            include fastcgi_params;
        } # localhost的右括号
    } # server的右括号
} # http的右括号
```

## 安装wordpress
```bash
mysql -uroot -p*** -e"create database wordpress;show databases;"
# 以下在www文件夹下操作
wget https://cn.wordpress.org/wordpress-4.9.4-zh_CN.zip
unzip wordpress-4.9.4-zh_CN.zip
cd wordpress
php -S 127.0.0.1:8080
# 或者采用
termux-chroot # nginx必须在proot环境下运行
php-fpm
nginx # 在127.0.0.1:8080下直接访问
```
&emsp;&emsp;目前存在疑问，wordpress放在二级文件夹会出现404，不知是不是使用【php -S】直接安装的问题

## Termux-api
&emsp;&emsp;这是一个神奇的东西，有了API你就可以接管手机的部分功能，调取某些参数，终端启动电话和短信也是可以的。
### 前期准备
&emsp;&emsp;首先安装【termux:api】，但是，目前这个app只在google play中能够下载，所以就要引入另一个app【apkpure】用来下载【termux:api】
&emsp;&emsp;安装完成后，还要在终端中安装才能正常调用
```bash
pkg install termux-api
termux-battery-status # 获取电池信息
termux-camera-info # 获取相机信息
termux-clipboard-get # 获取剪切板数据
termux-clipboard-set PHP是最好的语言 # 设置新的剪切板数据
termux-contact-list # 获取通讯录列表
termux-sms-inbox # 获取短信内容列表
termux-sms-send # 发送短信
# 多号码群发
termux-sms-send -n number(s) recipient number(s) - separate multiple numbers by commas 
# 举例
termux-sms-send -n 10086 ceshi
termux-telephony-call # 拨打电话
# 举例
termux-telephony-call 10086
termux-wifi-connectioninfo # 获取当前wifi链接信息
termux-wifi-scaninfo # 获取最近一次wifi扫描信息
```
&emsp;&emsp;编程定时发送短信了解一下，还有更多功能等待开发呦~