---
title: "XAMPP和VMWare的端口443冲突的解决"
id: 388
categories:
  - 程序猿
date: 2016-06-01 07:09:14
tags:
---

XAMPP 和 VMWare 的端口443冲突的解决

在电脑里装了VMware后，再要装xampp，十有八九就会出现这个问题：

> 10:21:18  [Apache]  Problem detected!
> 10:21:18  [Apache]  Port 443 <span class="kwd">in use by ""d:\Program Files (x86)\VM\vmware-hostd.exe" -u "C:\ProgramData\VMware\hostd\config.xml"" with PID 2764!
> 10:21:18  [Apache]  Apache WILL NOT start without the configured ports free!
> 10:21:18  [Apache]  You need to uninstall/disable/reconfigure the blocking application
> 10:21:18  [Apache]  or reconfigure Apache and the Control Panel to listen on a different port

<!--more-->

这个问题是处在VMware上，VMware将443端口占用了，而apache也需要443端口。所以，想要开启apache的服务，必须要将VMware端口改变。**操作如下：**

1. 打开菜单 编辑→首选项（Edit–&gt; Preferences）XAMPP和VMWare的端口443冲突的解决
2. 选择 共享虚拟机（Shared VMs）XAMPP和VMWare的端口443冲突的解决看，这里的HTTPS端口是443，正是apache需要的。更改它。
3. 点击 改变位置（Change Setting）XAMPP和VMWare的端口443冲突的解决
4. 点击 禁用共享（Disable Sharing）XAMPP和VMWare的端口443冲突的解决
5. 将数字改变，如449XAMPP和VMWare的端口443冲突的解决接下来启用共享，在开启apache，是不是问题就解决了呢？
对了，还要注意的是，apache的80端口和Windows的IIS也冲突了。解决方法就是更改目录\xampp\apache\conf下的httpd.conf文件，用记事本打开，替换里面所有的80为8080.好了，这下xampp的apache就可以正常开启了！

[来自为知笔记(Wiz)](http://www.wiz.cn/i/d15372b9 "来自为知笔记(Wiz)")