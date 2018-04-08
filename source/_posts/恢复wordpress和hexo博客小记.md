---
title: 恢复wordpress和hexo博客小记
date: 2017-12-31 21:53:44
categories:
  - 学习笔记
tags:

---
## 恢复搭载wordpress的服务器

#### 1、lamp安装教程：
&emsp;&emsp;https://lnmp.org/install.html
&emsp;&emsp;https://lamp.sh/install.html
#### 2、恢复数据库
#### 3、pscp上传wordpress
#### 4、ln -s 源文件 现文件
&emsp;&emsp;https://www.cnblogs.com/kex1n/p/5193826.html
#### 5、apache配置
&emsp;&emsp;httpd.conf文件中包含
<!--more-->

> Include conf/extra/httpd-vhosts.conf

&emsp;&emsp;httpd-vhost.conf文件中包含

> Include /usr/local/apache/conf/vhost/*.conf

&emsp;&emsp;于是我就在vhost里新建了youthliuxi.conf文件，配置域名与文件夹的关系

> 注意事项：conf文件里配置文件地址，不能有软连接

#### 6、apache重启服务
&emsp;&emsp;http://blog.sina.com.cn/s/blog_70ac6bec01018mqs.html

## 恢复hexo博客

#### 1、重新安装
&emsp;&emsp;重新安装nodejs、hexo以及hexo的GitHub托管插件
#### 2、移植source文件夹
&emsp;&emsp;把source文件夹完全替换掉，恢复原有的_config配置文件，就可以使用了。

## 注意事项小记

#### 1、git安装后

> $ git config --global user.name "github用户名"
> $ git config --global user.email "github邮箱"
> $ ssh-keygen -t rsa -C "github邮箱" //生成秘钥
> $ cd ~/.ssh
> $ ls
> id_dsa id_dsa.pub //把pub拷贝到github
> //github -> Settings -> SSH and GPG keys

#### 2、git push

> git init
> git add README.md
> git commit -m "备注"
> git remote add origin git@github.com:用户名/项目名.git
> git push -u origin master

#### 3、warning: LF will be replaced by CRLF

> $ rm -rf .git  // 删除.git  
> $ git config --global core.autocrlf false  //禁用自动转换  