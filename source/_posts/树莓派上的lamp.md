---
title: 树莓派上的lamp
date: 2018-04-17 17:03:21
tags:
  - raspberrypi
  - lamp
  - 树莓派
categories:
  - 服务器不得不说的二三事儿
---

## 你不知道我经历了什么系列

&emsp;&emsp;年轻就是要作死，正所谓不疯魔，不成佛，但是，我这一作，给自己凭白增加了一天的工作量，以下经验写在前面：

> 在陌生的linux系统中，慎重使用lnmp一键安装包

<!--more-->
&emsp;&emsp;情况简介，最初，我给树莓派的系统安装了vim、tmux、python、nodejs，在上面调试了一个wechat_jump_game没有成功之后，我就放弃了对他的操作。就在昨天，突发奇想之下，我打算给树莓派安装一个lamp或者lnmp环境，毕竟python和nodejs都有了，怎么能少了当初引我入门的php呢！说干就干。
&emsp;&emsp;于是我找到了lnmp的一键安装包[https://lnmp.org](https://lnmp.org)，执行了如下的命令：

```bash
sudo apt install screen //系统没有screen，于是先安装screen在进行
screen -S lnmp
wget -c http://soft.vpser.net/lnmp/lnmp1.4.tar.gz && tar zxf lnmp1.4.tar.gz && cd lnmp1.4 && ./install.sh lnmp
```

&emsp;&emsp;系统这个脚本，神奇的运行了超过6个小时，我安装了两次，一次是跨夜的操作，一次是从上午起床后开始操作，两次的反馈都告诉了我同一个结果：php安装失败。
&emsp;&emsp;Are you kidding me？安装了6个多小时，你告诉我安装失败？
&emsp;&emsp;于是，在现有基础上，我又开始进行lnmp的分步骤安装，比如：先安装nginx，在安装mysql、php、php-mysql、phpmyadmin。甚至在此之前有个教程告诉我，可以直接使用apt install phpmyadmin，它会把其他的选项都安装好，而我无一例外的都失败了，到头来几乎都只能确定nginx安装好了。
&emsp;&emsp;换个思路，我开始安装lamp,不长脑子的我同样选择了[https://lamp.sh](https://lamp.sh)，

```bash
git clone https://github.com/teddysun/lamp.git
cd lamp
chmod +x *.sh
screen -S lamp
./lamp.sh
```

&emsp;&emsp;结果，这货居然直接不识别树莓派的系统，说请换用centos、debain或ubuntu系统，得了，又歇菜了
&emsp;&emsp;终于，学聪明的我决心正是开始尝试使用分部安装的方式，检索了系统的卸载方式使用，再此先汇总一下树莓派系统的软件卸载方式，其实应该也是ubuntu系统软件的卸载方式

### 常用apt命令列表

```bash
apt-cache search # ------(package 搜索包)
apt-cache show #------(package 获取包的相关信息，如说明、大小、版本等)
sudo apt-get install # ------(package 安装包)
sudo apt-get install # -----(package - - reinstall 重新安装包)
sudo apt-get -f install # -----(强制安装?#"-f = --fix-missing"当是修复安装吧...)
sudo apt-get remove #-----(package 删除包)
sudo apt-get remove - - purge # ------(package 删除包，包括删除配置文件等)
sudo apt-get autoremove --purge # ----(package 删除包及其依赖的软件包+配置文件等（只对6.10有效，强烈推荐）)
sudo apt-get update #------更新源
sudo apt-get upgrade #------更新已安装的包
sudo apt-get dist-upgrade # ---------升级系统
sudo apt-get dselect-upgrade #------使用 dselect 升级
apt-cache depends #-------(package 了解使用依赖)
apt-cache rdepends # ------(package 了解某个具体的依赖?#当是查看该包被哪些包依赖吧...)
sudo apt-get build-dep # ------(package 安装相关的编译环境)
apt-get source #------(package 下载该包的源代码)
sudo apt-get clean && sudo apt-get autoclean # --------清理下载文件的存档 && 只清理过时的包
sudo apt-get check #-------检查是否有损坏的依赖
```

### 常用dpkg命令列表

```bash
dpkg -i xxx.deb // 安装deb软件包
dpkg -r xxx.deb // 删除软件包
dpkg -r –purge xxx.deb // 连同配置文件一起删除
dpkg -info xxx.deb // 查看软件包信息
dpkg -L xxx.deb // 查看文件拷贝详情
dpkg -l // 查看系统中已安装软件包信息
dpkg-reconfigure xxx // 重新配置软件包
dpkg -l |grep ^rc|awk '{print $2}' |sudo xargs dpkg -P // 清除所有已删除包的残馀配置文件
// 如果报如下错误，证明你的系统中没有残留配置文件了，无须担心。
// dpkg: –purge needs at least one package name argument
```

### dpkg安装的可以用apt卸载，反之亦可

## 最终，带有一些强迫情节的我，终于——重装了系统

&emsp;&emsp;插一个小情节，我在重装系统之前，对原系统做了一个处理，在根目录下运行了

```bash
sudo chmod 777 -R *
```

&emsp;&emsp;结果，phpmyadmin直接报错：系统权限分配错误，有些文件不应该给予如此高的权限。

&emsp;&emsp;配置"wpa_supplicant.conf"和"ssh"，安装vim和tmux，修改/etc/apt/sources.list和/etc/apt/sources.list.d/raspi.list的软件源，这些已经无需多言了
&emsp;&emsp;接下来就是lamp的搭建，闲话不多说，直接上代码

```bash
sudo apt-get install apache2 mysql-server mysql-client php php-gd php-mysql
sudo chmod 777 /var/www/
sudo apt-get install phpmyadmin
sudo a2enmod rewrite
sudo ln -s /usr/share/phpmyadmin /var/www
sudo ln -s /var/www  ~/
# apache2原配置中，将www/html作为主文件夹，需要进sites-available，将里面的两个conf文件中主文件夹路径修改为www
# 期间还可以写个phpinfo.php文件测试一下php是否可用
sudo /etc/init.d/apache2 restart
```

## 安装期间遇到的问题

### mysql的root初始密码未知

* mysql安装过程中未提示输入初始密码，所以，需要进行修改，然而，网上众多方法中大多数都是需要知道旧密码，或直接修改、或登录到控制台操作，唯一的不需要进入控制台的【mysqld --skip-grant-tables】，跳过mysql服务的权限表认证操作，我还是无效的（也可能我的操作方法有问题）
* 直到我使用了网上所谓军哥的一键修改lnmp环境下mysql数据库密码脚本

```bash
wget http://soft.vpser.net/lnmp/ext/reset_mysql_root_password.sh
sh reset_mysql_root_password.sh
// 脚本已留存，值得研究
```

### phpmyadmin报错

#### mysqli_real_connect(): (HY000/2002): No such file or directory

* 用【find -name】命令找到一个名为config.inc.php的文件，在phpmyadmin文件夹下，将文件中的"localhost"修改为"127.0.0.1"

#### ERROR 1698 (28000): Access denied for user 'root'@'localhost'

* 这个错误同样发生在phpmyadmin登录页面，但是，当使用【mysql -uroot -p】的时候，也同样出现，而使用【sudo mysql -uroot -p】则并未出现，因此怀疑是phpmyadmin的某个设置对权限的限制导致的，遂沿着这个方向检索，未果
* 期间试图将/etc/mysql的权限改为777，后因权限过高，出现了一个新的报错，于是又改为644，报错依旧
> mysql: [Warning] World-writable config file '/etc/mysql/my.cnf' is ignored.
* 一个偶然找到了操作方法（进入mysql操作台，思路是对mysql相关数据库的数据属性进行修改）:

```bash
$ mysql -uroot -p
> show databases;
> use mysql;
> select user, plugin from mysql.user;
# 显示的root的plugin是"unix_socket"
# 将其修改为"mysql_native_password"
> update mysql.user set authentication_string=PASSWORD('newpassword'), plugin='mysql_native_password' where user='root';
> flush pricileges;
```

* 【service mysql restart】或者【sudo shutdown -r now】，重启mysql服务或者，重启系统

#### 至此，所有问题均已被解开，lamp运转正常，已安装wordpress，继续进行下一步测试以及项目demo搭建问题

#### 未完待续......