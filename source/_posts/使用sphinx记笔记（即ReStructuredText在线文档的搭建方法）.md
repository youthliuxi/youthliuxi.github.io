---
title: 使用sphinx记笔记（即ReStructuredText在线文档的搭建方法）
tags:
  - res
  - ReStructuredText
  - 在线文档
id: 140
categories:
  - 学习笔记
date: 2015-12-30 14:18:45
---

&emsp;&emsp;使用sphinx记笔记也就是使用ReStructuredText超轻量级标记语言自动生成在线文档的方法。

<!--more-->
&emsp;&emsp;说这门标记语言，是我们的在线文档初使用的一个文档生成工具，当初我安装这东西失败了，现在积累了一定的技术和对编程的认识，我决定重新再自己电脑里搭建一个平台并且记录下这一刻~

&emsp;&emsp;安装步骤如下：
&emsp;&emsp;一、下载ActivePython，我将它安装到F:\python文件夹下。
&emsp;&emsp;二、使用cmd进入F:\Python&gt;Scripts文件夹，在此文件夹下输入命令

> sphinx-quickstart

&emsp;&emsp;三、然后按照提示一步一步的执行，除下面几个必须设置的步骤外，其他都可以直接回车，而我则是全部选择“Y”虽然我也不知道选择yes的结果会有什么影响；这三段必须设置的代码分别是：
&emsp;&emsp;&emsp;&emsp;１、分离source和build目录，方便管理

> &gt; Separate source and build directories (y/N) [n]: y

&emsp;&emsp;&emsp;&emsp;２、指定工程名、作者名、版本号

> The project name will occur in several places in the built documentation.
> &gt; Project name: Note&emsp;&emsp;/*我指定的项目名称*/
> &gt; Author name(s): lx&emsp;&emsp;/*我指定的作者名字*/
> Sphinx has the notion of a "version" and a "release" for the
> software. Each version can have multiple releases. For example, for
> Python the version is something like 2.5 or 3.0, while the release is
> something like 2.5.1 or 3.0a1.  If you don't need this dual structure,
> just set both to the same value.
> &gt; Project version: 0.1&emsp;&emsp;/*同样输入0.1，也不知道什么意思*/
> &gt; Project release [0.1]:

&emsp;&emsp;&emsp;&emsp;３、文档文件的后缀名，默认是.rst，个人认为用.txt更方便些。

> The file name suffix for source files. Commonly, this is either ".txt"
> or ".rst".  Only files with this suffix are considered documents.
> &gt; Source file suffix [.rst]: .txt

&emsp;&emsp;四、完成以上设置的预期效果应该是：执行该命令的目录下会生成以下目录和文件：
&emsp;&emsp;&emsp;&emsp;* build目录 运行make命令后，生成的文件都在这个目录里面
&emsp;&emsp;&emsp;&emsp;* source目录 放置文档的源文件
&emsp;&emsp;&emsp;&emsp;* make.bat 批处理命令
&emsp;&emsp;&emsp;&emsp;* makefile

&emsp;&emsp;五、检验存在这几个文件夹和文件，即可在该目录下使用

> make html

&emsp;&emsp;(ps：操作步骤来源于：[http://jwch.sdut.edu.cn/book/tool/UseSphinx.html)](http://jwch.sdut.edu.cn/book/tool/UseSphinx.html)) 

&emsp;&emsp;(pps：文中原意肯能是在任何路径下均可以使用“sphinx-quickstart”命令，但是我的测试中，在任何其他文件夹下使用该命令，均显示这不是批处理文件或命令，也就是无法执行，猜想的解决方案有两种：1、重新执行一遍安装，将Python默认安装到C盘，2、找寻方法使得没有在C盘的文件命令也能在整个计算机中执行。)

&emsp;&emsp;(ppps：我将sphinx-quickstart.exe和sphinx-quickstart-script.py复制到windows文件夹下的system32文件夹中，并在E:盘新建了一个Note文件夹进行测试，发现这样“sphinx-quickstart”命令就可以执行了；但是再后来，我想让“make html”这句命令也能执行，于是就复制了sphinx-build.exe、sphinx-build-script.py、make.bat，但是失败了，记录在此，稍后研究~~~)

[来自为知笔记(Wiz)](http://www.wiz.cn/i/d15372b9 "来自为知笔记(Wiz)")