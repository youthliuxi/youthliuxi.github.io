---
title: Git学习笔记小结
tags:
  - git
  - github
id: 133
categories:
  - 学习笔记
date: 2015-12-28 19:53:51
---

从任何文件夹里右击打开“git bash”，然后，进行以下步骤：

第一步：新建仓库【git init】

第二步：添加文件到仓库【git add &lt;filename&gt;】

第三步：把代码提交到仓库【git commit -m "备注"】

本地提交完成！（可以提交本文件夹内的所有文件到“.git”文件夹）

修改文件后检查不同，【git status】【git diff &lt;filename&gt;】检查现有版本和现有文件的不同。

<!--more-->

github提交，步骤如下：

第一步：完成本地版本库的提交工作，即上面三步；

第二步：在github网站上添加一个项目

第三步：使用【git remote add origin git@github.com:&lt;github的用户名&gt;/&lt;新建的项目名&gt;.git】

第四步：【git push -u origin master】（-u参数仅在第一次推送master分支的所有内容时使用）

上传到github完成！！！