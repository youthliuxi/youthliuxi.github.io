---
title: hexo备份相关
date: 2018-04-09 00:04:51
tags: 
  - hexo
  - github
  - 分支
  - master
categories:
  - 学习笔记
  - 程序猿
---


自从上次使用重装系统又重新配置hexo之后，就一直对hexo备份的问题念念不忘，曾经查到相关信息，可以从hexo托管的那个项目里新建一个分支，将markdown源码和themes主题文件放到这个分支里，就可以实现源码备份了。
<!--more-->
## 你不知道我经历了什么
* 起初，我只记得是要建立一个分支，于是，就直接在github官网上建立了一个分支
* 结果没想到，分支内容完全复刻主分支内容，导致我直接没办法push上去
* 一怒之下，删掉github上这个项目，重新建立
* 然后，我就GG了，hexo d根本没办法把更新提交到github上，于是乎，我的博客境外部分，心脏停止了跳动
* 没关系啦，大不了推到了重新来过
* 新建文件夹“youthliuxi.github.io”，按照操作步骤一步一步思考，重新配置，终于，博客活了过来
* 以下简述操作步骤

## 步骤
1. 新建github项目“youthliuxi.github.io”，选择不生成readme
2. 新建文件夹“youthliuxi.github.io”，取一样的名字纯粹是为了好看
3. 在文件夹中运行：
```bash
	hexo init
	// 没有的话，就先运行npm install -g hexo
	git init
	git checkout hexo
	// 创建hexo分支，名字都行，好记就行
	git add * 
	// 很有可能会提示如果你想添加所有项目，请使用【-f】参数，不管应该没事儿
	git commit -m “备注”
	git remote add origin git@github.com:youthliuxi/youthliuxi.github.io.git
	git push origin hexo
	// 这样就成功的把源码上传到hexo分支上了
```
	> 创建分支命令 git branch (branchname) 列出分支 git branch
	> 切换分支命令 git checkout (branchname)
	> 合并分支 git merge (branchname)
	> 创建新分支并立即切换到该分支下 git checkout -b (branchname)
	> 删除分支命令 git branch -d (branchname)
	> 只需要用前两个命令，再创建一个master分支，即可

4. 配置hexo的_config.yml文件，以及写md格式的博客文章
	* 注意：deploy配置中，注明master分支
5. hexo g && hexo d，运行，前者生成html文件，后者负责把静态页推送到github或者coding上
6. 如果hexo d显示找不到git的话，先安装【npm install -g hexo-deployer-git】
7. ok，try again，it work

## 注意
如果你把

```bash
$ git remote add origin git@github.com:youthliuxi/youthliuxi.github.io
```

错误的输入成了

```bash
$ git remote add origin https://github.com/youthliuxi/youthliuxi.github.io
```

不要悲伤，不要心急，以下办法可以帮到你

```bash
$ git remote rm origin
$ git remote add origin git@github.com:youthliuxi/youthliuxi.github.io
```

不要问我为啥知道这个，还不是因为脑子有问题，选了个https连接方式

## 从ubuntu恢复备份内容
接下来才是本次实验的重头戏，昨天没做完，今天继续，搞定了，接着写总结
切换到ubuntu系统，由于我的ubuntu从来没有配置过git，所以我应该先从配置git做起，废话不多说，直接上代码

### 配置git
```bash
$ git config --global user.email "lx_einstein@sina.com"
$ git config --global user.name "youthliuxi"
$ ssh-keygen -t rsa -C "lx_einstein@sina.com"
//这期间会让你输入保存公钥的地址（直接回车就会保存在下面那个默认地址里）、github登录密码、再次输入密码
$ vim ~/.ssh/id_rsa.pub 
//把这段代码整个复制下来，找到github和coding设置中相应的ssh配置位置，添加进去即可
```

### 从github恢复hexo源码
```bash
$ git clone git@github.com:youthliuxi/youthliuxi.github.io
//这里建议使用git@github.com，只有这样，公钥才是有用的，否则就需要每次都输入密码
//倘若clone错了，没关系，请网上看【注意】那部分
$ cd youthliuxi.github.io
$ npm install --save hexo
$ npm instlal --save hexo-deployer-git
$ hexo g && hexo d //测试一下，好不好使
```

### 今后两个平台的操作注意事项
```bash
$ git pull origin hexo
//写博客或者修改博客
$ git add *
$ git commit -m "XXX from windwos or ubuntu"
$ git push origin hexo
$ hexo g && hexo d
```