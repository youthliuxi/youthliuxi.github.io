---
title: python学习笔记02
date: 2018-04-01 22:20:32
tags: python,笔记
categories:
  - 学习笔记
---

## 大纲
* 变量和类型
* 常见字符串处理
* 条件判断
* 循环控制
* 函数
<!--more-->

#### 变量和类型
* 基本变量类型
	* 整数
	* 浮点数
	* 字符串
	* 布尔型
	* 空值
	* 函数
	* 模块
	* 类型
	* 自定义类型
```python
print(type(1234)) #in
print(type(1234.56)) #float
print(type('abc')) #str
print(type([1, 2, 3, 'a', 'b'])) #list
print(type((1,'abc'))) #tuple
print(type(set(['a', 'b', 3]))) #set
print(type({'a': 1, 'b': 2})) #dict
def func(a,b,c):
	print(a,b,c)
print(type(func)) #function
import string
	print(type(string)) #module
class MyClass(object):
	pass
print(type(MyClass)) #type
my_class = MyClass()
print(type(my_class)) #__main__.MyClass
```
#### 常见字符串处理
* 去除空格及特殊字符：strip，istrip，rstrip
* 复制字符串：str1 = str2
* 连接字符串
	* str2 += str1
	* new_str = str2 + str1
* 查找字符串：pos = str1.index(str2)
* 比较字符串： cmp(str1,str2)
* 字符串长度：len(str)
* 大小写转换
	* u_str = str.upper()
	* l_str = str.lower()
* 首字母大写：str.capitalize();string.capword(str)
* 分割与合并字符串：split，splitlines，join
* 类型转换：int，float转换
* 格式化字符串
#### 条件判断
#### 循环控制
#### 函数
