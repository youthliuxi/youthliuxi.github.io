---
title: wordpress修改记录（quench主题小优化）
id: 243
categories:
  - 程序猿
date: 2016-01-04 14:06:58
tags:
---

&emsp;&emsp;今天，实在是忍不了wordpress的那个quench的主题的那个背景蒙版了，好好一张图，还非得加上一个点阵，果断审查元素找到了一个叫&lt;div id="bg-over"&gt;&lt;/div&gt;，登录服务器搜索，发现在header.php里面，果断注释掉，搞定，现在清晰多了，爽\~\~\~

&emsp;&emsp;想在关于我页面里面加微博和qq的关注链接，杀千刀的，这个博客写了个jquery让所有图片都可以点击一下给个特写，果断注释掉，但是，没了以后，点击图片会直接跳转到图片页面，用户体验太差了，于是又改回来了\~\~\~（你要问我为啥想放弃，没办法，谁让qq的点我关注是用的&lt;img /&gt;标签呢）算了，放弃qq吧，反正也没人加，图片还死难看~

<!--more-->

&emsp;&emsp;添加微博的关注按钮也出现了问题（tmd，敢不敢兼容一点），微博关注按钮需要先添加两个标签，然后再添加&lt;wb&gt;标签

> &lt;html xmlns:wb="http://open.weibo.com/wb"&gt;`
> &lt;script src="http://tjs.sjs.sinajs.cn/open/api/js/wb.js" type="text/javascript" charset="utf-8"&gt;&lt;/script&gt;`
> &lt;wb:follow-button uid="1682787817" type="red_3" width="100%" height="24" &gt;&lt;/wb:follow-button&gt;

&emsp;&emsp;可是我用的是百度的富文本编辑器，死活不让我添加，前两个代码，机智的我，直接将这两句代码放到了header.php文件里面了，这样，这个主题里的任何地方都可以放&lt;wb&gt;标签的微博关注了，不过，添加微博关注按钮，还是要切换到富文本编辑器的html模式，改好之后再切回来，然后再点击提交，切回来的时候，编辑器上还不显示按钮（md，你这是要逼死有强迫症的白羊座啊\~\~\~）

&emsp;&emsp;这样的折磨也不是一天两天了，前端那点事儿，就这样吧~~~

[来自为知笔记(Wiz)](http://www.wiz.cn/i/d15372b9 "来自为知笔记(Wiz)")