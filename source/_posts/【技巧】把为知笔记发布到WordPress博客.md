---
title: 【技巧】把为知笔记发布到WordPress博客
tags:
  - wordpress
  - 为知笔记
id: 146
categories:
  - 学习笔记
date: 2015-12-30 14:49:26
---

&emsp;&emsp;我经常在为知笔记上写东西、做记录。但是为知笔记要会员才能分享笔记链接给别人，而且底部有为知笔记的广告。突然想起能不能把为知笔记同步到WordPress上来的，于是百度一下，还真有。

<!--more-->
&emsp;&emsp;这样还有个好处，本地图片、截图全部丢进为知笔记，再用为知笔记发布博客就行了。之前在百度贴吧有人问能不能把在Word文档编辑好的博文复制黏贴到WordPress，我觉得用为知笔记就可以搞定了。


&emsp;&emsp;为知笔记支持绝大部分的博客离线撰写，可以方便地把笔记直接发布为博客。


### 使用

&emsp;&emsp;打开您已经在Wiz的撰写好的文章，然后点击“分享”按钮-发布到博客，如下图：

![](http://youthliuxi.cn/wp-content/uploads/2015/12/a5530c37485be220a53c851eafea7d2e_ef8190f2-e4ee-4960-8f4c-9a51c8f8083a-1.png "发布到博客1")
选择“发布到博客”，出现如下对话框：

![](http://youthliuxi.cn/wp-content/uploads/2015/12/a5530c37485be220a53c851eafea7d2e_59b4ab2a-8ff2-41e7-a227-5f7e55e18707-1.png "blog")

**API地址：**就是博客离线撰写发布的API地址，通常每一个博客的API地址都不相同，您可以从博客的帮助里面获得。下面是常用的一些博客API地址：

![](http://youthliuxi.cn/wp-content/uploads/2015/12/a5530c37485be220a53c851eafea7d2e_8771a5d6-e73b-4274-91e6-00ed90c93d03-1.gif) 常用博客 API地址

1. 新浪博客 [http://upload.move.blog.sina.com.cn/blog_rebuild/blog/xmlrpc.php](http://upload.move.blog.sina.com.cn/blog_rebuild/blog/xmlrpc.php)
1. 网易博客 [http://os.blog.163.com/api/xmlrpc/metaweblog/](http://os.blog.163.com/api/xmlrpc/metaweblog/)
1. 自建Wordpress站点 [http://您的博客地址/xmlrpc.php](http://xn--9kr22gnbw3zxphlx0b/xmlrpc.php)
1. 博客园cnblogs [http://www.cnblogs.com/](http://www.cnblogs.com/)&lt;您的用户名&gt;/services/metaweblog.aspx
1. 自建zBlog站点 [http://your.zblog.site/xml-rpc/index.asp](http://your.zblog.site/xml-rpc/index.asp)
1. CSDN博客官方已经禁用了API发布功能，此插件对CSDN博客已失效
**端口：**通常是80
**用户名/密码：**您的博客的用户名和密码
**博客API：**请选择MetaWeblog API。这是被绝大部分博客支持的API，包括新浪，网易，官方wordpress，自建的wordpress等等。

**操作：**通常选择自动就可以了。博客发布插件会自动判断您的文章是否已经发布过。如果没有发布过，则自动新建一个文章，否则就是编辑已经发布到网上的文章。

*   如果您的文章已经发布，您还是想强制新建一个博客文章，则选择新建博客。
*   如果您的文章已经发布，但是已经在服务器上面删除，则选择新建博客，否则因为插件认为博客已经发布，会使用编辑操作，但是因为服务器上面已经删除，导致无法编辑文章，结果出错，
*   对于wordpress类型的博客，您可以选择新建页面。wordpress支持页面，这对于建立网站非常方便。您可以选择新建一个页面。
*   编辑页面，同样仅限于wordpress类型的博客，用于修改一个页面。通常插件会自动判断您的博客是一个页面还是普通的博客，然后自动选择编辑博客或者页面。因此一般不需要选择这个选项。
**选项**

*   限制图片宽度：限制图片不能超过某一个宽度。
*   分类：可以输入博客的分类名称
*   自动添加&lt;!–more–&gt;。对于wordpress，您可以自动添加一个更多的标记，这样在显示博客列表的时候，只显示部分内容。
*   使用SEO字段作为blog名称。对于wordpress，允许自定义一个博客的url，这对于网站的SEO非常有帮助，您可以在Wiz文档的属性对话框里面，设置文档的SEO属性，然后使用这个属性，作为博客的名称。
*   使用文档创建时间作为Blog时间。默认情况下会使用当前时间作为博客的时间。但是如果文档时很久以前创建的，那么就可以在这里设置发布后文档的时间。
*   使用标签作为分类。可以直接给Wiz文档设置标签，然后会自动把Wiz标签设置为发布后的文章分类。
*   帮助推广Wiz。Wiz VIP用户可以取消这个选项。如果选中，会在每一篇文章的最后面，增加一个指向[http://www.wiz.cn/](http://www.wiz.cn/) 的链接。
**给Wiz文档设置SEO属性**

&emsp;&emsp;在文档列表中，选中一个文档，然后点击鼠标右键，选择“属性”，就可以出现下面的对话框。

![](http://youthliuxi.cn/wp-content/uploads/2015/12/a5530c37485be220a53c851eafea7d2e_cee3d789-a023-4c11-9091-80fcbc40e1d1-1.png)
&emsp;&emsp;请直接输入SEO名称，通常是英文字母，数字以及-（减号）的组合。
&emsp;&emsp;（PS：以上内容转载自[http://kouss.com/wei_zhi_to_wordpress.html](http://kouss.com/wei_zhi_to_wordpress.html)，我只是想保存以下这篇文章顺便测试一下“chrome的为知笔记插件”和“为知笔记同步wordpress博客的功能”）

来源： &lt;[http://kouss.com/wei_zhi_to_wordpress.html](http://kouss.com/wei_zhi_to_wordpress.html)&gt;

[来自为知笔记(Wiz)](http://www.wiz.cn/i/d15372b9 "来自为知笔记(Wiz)")