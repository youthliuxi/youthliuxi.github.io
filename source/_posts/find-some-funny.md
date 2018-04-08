---
title: find some funny
tags:
  - apicloud
  - node.js
  - nw.js
  - 三姑六婆计算器
id: 124
categories:
  - 随笔
date: 2015-12-18 21:47:39
---

&emsp;&emsp;今天是四六级考试前一天，奥，对了，对我来说只是四级考试。但是，作为一个有编程情怀的web开发“攻城狮”，我还在对着电脑，找一些有趣的网页开发的东西。

### 一：三姑六婆计算器

<!--more-->

&emsp;&emsp;刚刚得知有这么一个app的时候我很兴奋，但是原谅我的思维定式，我的第一反应是这个东西，有没有网页版，我可不可以用js来实现。于是，当我有机会拿到电脑，我当然第一时间搜索者这些东西\~\~\~好不容易找到一个，结果，他居然连“父亲的妻子的丈夫”这样的关系都算不出来，我很伤心\~\~\~吃饭的路上和两位程序员聊了一下，觉得理论上这个程序并不复杂，有个数组或者结构体来存放家庭成员的关系，以二叉树的形式进行存放，然后只需要对这颗二叉树进行检索就可以了\~\~\~不同的称呼对应不用的检索方法\~\~\~恩，先记一下，会有把js学习一下，就可以写一个小程序了\~\~\~

### 二：[apicloud](http://www.apicloud.com/)

&emsp;&emsp;刚刚看了这个东西的文档，这是一款可以快速开发移动应用的平台，云端api，这是一个能够使用其对和html5的网页进行封装的一个平台，能够让我们这些web开发人员快速开发移动端应用，下面引用一下文章文档的原话：

&emsp;&emsp;“APICloud应用采用标准的HTML技术，同时对标准的浏览器引擎做了大量的扩展；开发过程也类似Web开发，Web应用开发需使用HTML编辑器＋浏览器，APICloud应用开发则只需要使用HTML编辑＋应用装载器（AppLoader）。所以，任何一款HTML编辑器配合APICloud AppLoader都可以进行APICloud应用开发。”

### 三：react native

&emsp;&emsp;react native也是一款快速开发app的平台，不过当前仅支持OS X，还要求安装node.js，恩，当我看到他仅支持os x的时候，倜然觉得这东西应该距离我不算近，我还是先了解一下其他的吧\~\~\~

&emsp;&emsp;网友还整理一份学习指南（[http://www.tuicool.com/articles/zaInUbA](http://www.tuicool.com/articles/zaInUbA)）

&emsp;&emsp;还有一份官方文档（[http://wiki.jikexueyuan.com/project/react-native/](http://wiki.jikexueyuan.com/project/react-native/)）

### 四：[nw.js](http://nwjs.io) node-webkit

&emsp;&emsp;这是一款可以把node.js写好的js页面，利用程序现有的库将其转化成一个桌面应用程序，小书匠等等都是出自这种产品的手，除了运行速度较慢外，我们还打算使用这个平台搭建一个签到系统，重新改写签到系统、恩，就是这样。

### 五：web趣事，浅谈

&emsp;&emsp;1、chrome浏览器有个postman插件，可以实现模拟提交数据的状态，从而验证拆分出来的数据是不是正确的~

&emsp;&emsp;2、wget命令，wget是个可以从网络上自行扎在文件的自由工具，他支持http、https、ftp等协议，wget在退出系统后也可以正常运行。

&emsp;&emsp;3、python图像处理，可以将较为简单地验证码进行处理，得出一个白底黑字，清晰分明的验证码，再进行文字识别工作，用于模拟登录时自动输入验证码\~\~\~（学习刚查到的那个平均脸的视觉识别库，貌似就支持python，看起来还蛮好玩的）

### 写在最后：

&emsp;&emsp;恩，我就是记录一下，下次再进来，我打算学习一下js和node.js