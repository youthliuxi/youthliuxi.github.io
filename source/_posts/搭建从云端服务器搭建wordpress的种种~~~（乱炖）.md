---
title: 搭建从云端服务器搭建wordpress的种种~~~（乱炖）
tags:
  - ag
  - apache
  - apache配置
  - pscp
  - tmux
  - wordpress
id: 199
categories:
  - 服务器不得不说的二三事儿
date: 2016-01-02 23:33:44
---

&emsp;&emsp;之前在虚拟主机里搭建过，所以很多话都不多说了，前面先说一下存哥今天帮我安装的两个小东西

一：tmux

&emsp;&emsp;这个东西成功的解决了“需要开多个终端管理服务器”这个问题，安装嘛，简单，就是最普通的安装语句

<!--more-->
> sudo apt-get install tmux

&emsp;&emsp;具体怎么玩儿，我回头好好研究研究

二：ag搜索工具

&emsp;&emsp;安装

> sudo apt-get install silversearcher-ag

&emsp;&emsp;使用就是

> ag &quot;&lt;想要搜索的关键字&gt;&quot;

&emsp;&emsp;然后，聪明的他就会把这个目录下面所有“带这个关键字的文件”以及“该关键字所在的行信息”都列出来，速度超快，很是强大

* * *

华丽丽的分割线，现在进入正题，之前配置好了lamp，下面进行虚拟主机项目的移至工作

第一步：把htdocs文件夹整个下载下来

&emsp;&emsp;我懒，不想一个个项目分来下载，直接一步搞定，然后把这个文件夹打个包，把名字改成youthliux.cn，省的我再去服务器端改名了\~\~\~

第二步：pscp上传

&emsp;&emsp;putty组件中有个pscp.exe负责上传文件首先把要上传的zip放到和pscp同一个文件夹里，然后用cmd进入到这个文件所在的文件夹。

> pscp -P 22 &lt;文件名&gt; &lt;用户名&gt;@&lt;ip地址&gt;:/var/www/html
> //上传pscp -P 22 &lt;用户名&gt;@&lt;ip地址&gt;:/var/www/html/html/&lt;文件名&gt; &lt;要保存的绝对路径，例如：“F:”&gt;
> //下载

第三步：整理文件

&emsp;&emsp;进入服务器，然后只需要把上传的压缩包解压并把文件放到指定的文件夹里就行了，必须的命令有

> sudo apt-get install zip
> //友情提示，提前安装zip，一定有用
> unzip XX.zip -d &lt;指定路径&gt;
> mv &lt;文件路径，一般需要*&gt; &lt;移动后的文件路径&gt;    
> //该文件夹名字也可以这么干

&emsp;&emsp;我的习惯是在www文件夹下面新建以各个子站点命名的文件夹，然后每个文件夹里面放置相应的站点文件，同时，在数据库方面，链接的数据库的名字也命名为站点名，这样再找的时候就方便多了\~\~\~

&emsp;&emsp;既然是移植，那就别忘了把每个博客系统里的关于mysql数据库的信息改了，而既然是服务器，那么数据库就是localhost喽\~\~\~（数据库到处最复杂，从万网的虚拟主机转到万网的云服务器还得先把表结构导入，然后再把表一个一个的插入。）

&emsp;&emsp;（ps：wordpress的数据库文件是wp-config.php）

第四步，更改Apache的配置和万网域名的解析

&emsp;&emsp;这个我可以说，我很熟悉了么，尼玛，整整1月2号一天时间，一直在修改apache的配置文件和重启apache，操作vim都快养成习惯了，今天写一个学生会的年终终结，有一行不想要了，我都直接在这一行按了dd，当时就醉的不行不行的了\~\~\~

&emsp;&emsp;好了，重点来了，修改的配置文件在“/etc/apache2/sites-available/”牵扯到的命令有：

> cp 000-default.conf &lt;随便起个你喜欢名字吧&gt;.conf
> //其实也可以直接新建touch &lt;随便起个你喜欢的文件名字&gt;.conf
> //这就是新建文件的命令vim &lt;这个文件&gt;.conf
> 下面的代码是插入到之前用vim打开的那个conf文件最下面的。
> > &lt;VirtualHost *:80&gt;
> > ServerName www.youthliuxi.cn
> > ServerAlias youthliuxi.cn
> > #非必须，如有别名，可添加
> > DocumentRoot /var/www/youthliuxi.cn
> > ErrorLog /var/www/youthliuxi.cn/logs/error.log
> > CustomLog /var/www/youthliuxi.cn/logs/access.log combined
> > &lt;/VirtualHost&gt;

&emsp;&emsp;接下来再使用命令在“sites-enabled”文件夹里添加一个软连接：

> sudo a2ensite &lt;之前打开的那个文件&gt;.conf
> sudo /etc/init.d/apache2 reload
> //apache重新载入配置，效果和重启类似，这个用法失效的话，直接重启。

（ps：这里有必要说明一下，首先要在站点文件夹下面新建logs文件夹，不然的话error.log文件和access.log无法建立成功；其次，我还给logs文件夹一个777的权限，我也不知道有啥用，先加再说）

&emsp;&emsp;其他几个站点类似设置，然后wq写入并退出，然后使用命令重启服务器：

> service apache2 restart

&emsp;&emsp;再然后，登录万网管理平台，把主域名和子域名使用A类型，解析到服务器的ip即可。（也可以先解析，因为解析反应需要一定的时间，但是服务器配置，只要配置好了就会有反应。）

接下来就是处理几个小问题了，比方：访问ip居然能看到html文件夹里的所有文件、带有汉字的文件上传到ubuntu汉字就乱码了\~\~\~我另起一篇进行记录，哎呀妈啦，累死我了，可算写完了。

[来自为知笔记(Wiz)](http://www.wiz.cn/i/d15372b9 "来自为知笔记(Wiz)")