---
title: css权值，你知道多少？
tags:
  - 前端，css
id: 136
categories:
  - 学习笔记
date: 2015-12-29 10:33:34
---

今天闲得无聊，打开慕课，重新看一下html+css（写了两年多的前端了，重新看一遍也是够闲的\~\~\~）

but（重点来了昂\~\~\~是but，不是bug）

<!--more-->
1、我不知道有个标签自带引号&lt;q&gt;&lt;/q&gt;，短文本引用功能；&lt;blockquote&gt;&lt;/blockquote&gt;长文本引用功能。

2、css的选择器是有权值的，这叫特殊性，权值规则如下：

> 标签的权值为1，类选择符的权值为10，ID选择符的权值最高为100。（权值可以进行加和）
> 
> p{color:red;} /*权值为1*/
> 
> p span{color:green;} /*权值为1+1=2*/
> 
> .warning{color:white;} /*权值为10*/
> 
> p span.warning{color:purple;} /*权值为1+1+10=12*/
> 
> #footer .note p{color:yellow;} /*权值为100+10+1=111*/
> 
> **注意：还有一个权值比较特殊--继承也有权值但很低，有的文献提出它只有0.1，所以可以理解为继承的权值最低。**

3、颜色属性缩写，当你设置的颜色是16进制的色彩值时，如果每两位的值相同，可以缩写一半：也就是说“#369”表示的是“#336699”

4、多行元素水平居中（两个div，让里面那个水平居中）：【display:table-cell;/*IE8以上及Chrome、Firefox*/】【vertical-align:middle;/*IE8以上及Chrome、Firefox*/】