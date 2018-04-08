---
title: lnmp安装，以centos为例
id: 386
categories:
  - 服务器不得不说的二三事儿
date: 2016-06-01 23:35:17
tags:
---

**安装步骤:**

1、使用putty或类似的SSH工具登陆VPS或服务器：

> yum install screen
> screen -S lnmp

2、下载并安装LNMP一键安装包：

<!--more-->
> wget -c http://soft.vpser.net/lnmp/lnmp1.3-full.tar.gz
> tar zxf lnmp1.3-full.tar.gz
> cd lnmp1.3-full
> ./install.sh lnmp
> //以上安装源太慢了，换一个
> /*
> wget -c --no-check-certificate https://api.sinas3.com/v1/SAE_lnmp/soft/lnmp1.3-full.tar.gz
> */

按上述命令执行后，会出现如下提示：

![](http://youthliuxi.cn/wp-content/uploads/2016/06/ad70d9911bf864dfada5de73ce10f375_lnmp-1.3-install-1.png)

【需要设置MySQL的root密码（不输入直接回车将会设置为root）如果输入有错误需要删除时，可以按住Ctrl再按Backspace键进行删除。输入后回车进入下一步】

![](http://youthliuxi.cn/wp-content/uploads/2016/06/ad70d9911bf864dfada5de73ce10f375_lnmp-1.3-install-2.png)

【询问是否需要启用MySQL InnoDB，InnoDB引擎默认为开启，一般建议开启，直接回车或输入 y ，如果确定确实不需要该引擎可以输入 n，输入完成，回车进入下一步】

![](http://youthliuxi.cn/wp-content/uploads/2016/06/ad70d9911bf864dfada5de73ce10f375_lnmp-1.3-install-3.png)

![](http://youthliuxi.cn/wp-content/uploads/2016/06/ad70d9911bf864dfada5de73ce10f375_lnmp-1.3-install-4.png)

![](http://youthliuxi.cn/wp-content/uploads/2016/06/ad70d9911bf864dfada5de73ce10f375_lnmp-1.3-install-5.png)

提示"Press any key to install...or Press Ctrl+c to cancel"后，按回车键确认开始安装。
LNMP脚本就会自动安装编译Nginx、MySQL、PHP、phpMyAdmin、Zend Optimizer这几个软件。

3、安装完成

如果显示Nginx: OK，MySQL: OK，PHP: OK

![](http://youthliuxi.cn/wp-content/uploads/2016/06/ad70d9911bf864dfada5de73ce10f375_lnmp-1.3-install-sucess.png)

[来自为知笔记(Wiz)](http://www.wiz.cn/i/d15372b9 "来自为知笔记(Wiz)")