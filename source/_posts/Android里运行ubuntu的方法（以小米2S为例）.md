---
title: Android里运行ubuntu的方法（以小米2S为例）
date: 2018-01-26 20:55:08
tags:
  - android，ubuntu
categories:
  - 学习笔记
---

## 1，事先准备：
#### (1)一部已经root过的安卓手机（实例：小米2S，开发板系统）
#### (2)一个叫“终端模拟器”的APP
#### (3)一个ubuntu系统（包括两个文件：后缀是img的、后缀是img.md5的）
#### (4)两个sh格式的文件（ubuntu.sh用于安装，bootscript.sh用于启动）
<!--more-->

## 2，过程：
#### (1)给已经root过的手机安装终端模拟器
#### (2)给予终端模拟器以root权限
#### (3)在手机内存卡根目录下新建一个文件夹取名“ubuntu”
#### (4)将“ubuntu.img”、“ubuntu.img.md5”、“ubuntu.sh”、“bootscript.sh”四个文件均放在ubuntu文件夹内
#### (5)打开终端模拟器，以此输入以下指令，每步均单击回车（//为解释该指令的用途）

> su
> //切换为root用户，获取最高权限
> cd /sdcard/ubuntu
> //进入ubuntu文件夹，sdcard里的东西，就是插上数据线在电脑里能看到的部分(不同手机请具体分析)
> sh ubuntu.sh
> //启动ubuntu的安装过程
> //这个过程中通常只需要选择y(yes)，或者直接点击回车，只有一个步骤需要注意
> //提示中出现800x400的时候，一定要输入你这款手机的屏幕分辨率
> //x是xyz的x，不是乘号,例如小米2S是1280x720
> 1280x720

#### (6)运行完你会看到“root@localhost:/#”就意味着已经进入了ubuntu系统

## 3，手机内模拟远程连接显示桌面
#### (1)安装“android VNC”软件
#### (2)打开软件，配置相关信息
> nickname: ubuntu
> password: ubuntu
> address: localhost
> port: 5900
> username: ubuntu
> color format: 24-bit color(4bpp)
> //点击上面的connect

## 4，android做php的小型局域网服务器
#### 安装“手机服务站”app
#### 该app启动后，会自动做以下操作
> 1、在sdcard根目录下新建文件夹“htdocs”，用作网站脚本存放的根目录
> 2、开通个人热点“zerogameAP”，密码“12345678”，用于其它设备连接此wifi进行访问（也可进行关闭，只在本机进行管理）
> 3、默认开通192.168.43.1:8080作为Lamp的访问接口，也就是网站的访问地址
> 4、默认开通2212端口作为Sshd服务的访问接口，也就是ssh远程文件管理地址
> 5、默认账号android，密码password，默认数据库端口：10000
> 6、拥有phpMyAdmin、ownCloud、Drupal7、Sshd、Transmission等功能（在关于里有介绍）