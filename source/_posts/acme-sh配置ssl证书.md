---
title: acme.sh配置ssl证书
date: 2018-05-10 11:10:42
tags:
---
## 你不知道我经历了什么系列
&emsp;&emsp;去年5月，不知道我是出于什么样的思考，在阿里云申请了一年期的免费ssl证书，结果，直到证书过期，我都用https做一点有用的东西，还让博客顶了一年的不安全https，实在是惭愧。
&emsp;&emsp;就在我马上要堕落到使用宝塔面板的实名认证来申请一年期免费证书的时候，acme.sh悄然走进我的世界。
<!--more-->
## 天堂之门，开启
&emsp;&emsp;以下为简述关节，想要了解更多详情，请关注官方[wiki](https://github.com/Neilpang/acme.sh/wiki/说明)
### 主要操作步骤
1. 安装acme.sh
2. 生成证书
3. copy证书到apache服务
4. 更新证书
5. 更新acme.sh
6. 特殊情况备注

### 1. 安装acme.sh
可以使用以下三种安装方式的任意一种：
```bash
# 1
curl https://get.acme.sh | sh
# 2
wget -O - https://get.acme.sh | sh
# 3
git clone https://github.com/Neilpang/acme.sh.git
cd ./acme.sh
./acme.sh --install
```

### 2. 生成证书
&emsp;&emsp;生成证书大概分为两种，HTTP方式和DNS方式。
&emsp;&emsp;1. HTTP方式的操作是在网站根目录下放置一个文件来验证域名所有权，完成验证，生成证书，操作仅在服务器端进行，无须其他复杂操作。
&emsp;&emsp;2. DNS方式的好处是，不需要你有任何的服务器也不需要任何公网ip，只要dns解析正确就可以完成验证。换句话说，你只花十几块钱买了个域名，也一样可以拥有“小绿锁”。但是没有服务器的依托就不能自动更新证书，每次证书过期的时候，只能采取手动方式更新txt解析记录。
&emsp;&emsp;鉴于笔者域名+服务器配套设施完善，所以采用了方案一，方案二打算应用到github+hexo的博客上，具体操作步骤有待今后的探索。

#### 方案一
```bash
# 预先说明一点，以下所有acme.sh脚本的操作均是在~/.acme.sh文件夹中进行的
acme.sh  --issue  -d 域名  --webroot  /网站根目录绝对地址
# 官方说明中还有一种姿势是可以自动适配到apache或nginx的配置文件并自行完成验证，但是可能是姿势不对，此操作在本人服务器中无效，此处稍作提示
```

#### 方案二
&emsp;&emsp;小白鼠暂未上线，敬请期待。。。

### copy证书到apache服务
```bash
acme.sh --installcert -d 域名 \
        --key-file /保存路径/与域名同名.key \
        --fullchain-file /保存路径/fullchain.cer \
        --reloadcmd "service httpd force-reload"
# PS:
# 1.保存路径是随便定义的，但，如果你曾经配置过ssl证书，那么直接把证书解析到曾经那个文件夹下即可，方便查找。
# 2.名字也可以随便修改，但倘若你并没有这方面的习惯，建议采用以上命名方式，方便，好习惯早养成嘛~
# 3. httpd的位置填写你的web服务器软件，nginx、apache或者httpd，平时你重启服务时使用啥，这里就用啥，你懂得~
```
#### 关于ssl证书的配置问题
&emsp;&emsp;鉴于本人采用的是宝塔面板配置的ssl，但是有些文件配置还是应该记住，所以，就在下面保存一下相关的配置信息吧。
&emsp;&emsp;conf配置中的443端口只比80端口多出了以下的部分，其他都一样。
```bash
    #SSL
    SSLEngine On
    SSLCertificateFile /etc/letsencrypt/live/youthliuxi.cn/fullchain.cer
    SSLCertificateKeyFile /etc/letsencrypt/live/youthliuxi.cn/youthliuxi.key
    SSLCipherSuite EECDH+AESGCM:EDH+AESGCM:AES256+EECDH:AES256+EDH
    SSLProtocol All -SSLv2 -SSLv3
    SSLHonorCipherOrder On
```

### 更新证书
&emsp;&emsp;目前证书会在60天之后自动更新，不用担心

### 更新acme.sh
```bash
# 手动更新
./acme.sh --upgrade
# 自动更新
./acme.sh --upgrade --auto-upgrade
# 关闭自动更新
./acme.sh --upgrade --auto-upgrade 0
```

### 特殊情况备注
&emsp;&emsp;由于基础环境的不同会出现这样那样的特殊情况，本人以笔记和博客为依托，记录各种自己遇到过的特殊情况，只为倘若你遇到类似情况，能节约一点时间。

#### 1. acme.sh查看报错
```bash
./acme.sh  --issue  .....  --debug
```

#### 2. 页面未出现绿锁，同时提示有不安全信息
&emsp;&emsp;我出现这种情况是因为页面上某些关键连接保持了http协议，所以存在了http与https混合的现象，这个时候，就需要通过F12启动控制台，控制台会提示存在某些混排问题，把其中的http协议均替换为https协议即可。
&emsp;&emsp;wordpress的话，还需要在设置中将站点地址都改为https协议
&emsp;&emsp;我遇到的最神奇的情况是因为wordpress的头像，在之前的设置中保存的依然是http的连接，需要在编辑个人信息中，重新更新一下头像文件，再保存，就好了。

### 让我们一起迎接绿锁时代的到来吧。