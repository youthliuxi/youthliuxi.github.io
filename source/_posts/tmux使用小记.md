---
title: tmux使用小记
date: 2018-04-10 23:56:24
tags: 
	- linux
	- tmux
	- ubuntu
categories:
  - 服务器不得不说的二三事儿
---

## 安装

```bash
sudo apt install tmux
```
<!--more-->
注：ctrl+b是唤醒控制操作响应，和vim里的esc推出编辑是一个感觉

## 常用部分

> ctrl+b ? 显示快捷键帮助
> ctrl+b “ 横向分割屏幕
> ctrl+b % 纵向分割屏幕
> ctrl+b 方向键 切换屏幕
> ctrl+b ctrl+方向键 调整分割窗口大小
> ctrl+b o 跳到下一个分个窗口
> ctrl+b w 以菜单方式显示及选择窗口
> ctrl+b 0~9 选择几号窗口
> ctrl+b q 显示分割窗口编号
> ctrl+b c 新建窗口
> ctrl+b p 选择前一个窗口
> ctrl+b n 选择下一个窗口
> ctrl+b x 关闭面板
> ctrl+b & 关闭窗口

## 不常用部分

> ctrl+b ctrl+o 调换窗口位置，类似vim中的ctrl+w
> ctrl+b 空格键 采用下一个内置布局
> ctrl+b ! 把当前窗口变为新窗口
> ctrl+b l 切换到最后使用的窗口
> ctrl+b t 显示时钟
> ctrl+b ; 切换到最后使用的面板
> ctrl+b s 以菜单方式显示和选择会话
> ctrl+b d 退出tmux，并保持当前会话，tmux仍在运行，此时可以通过tmux attach进入到指定会话