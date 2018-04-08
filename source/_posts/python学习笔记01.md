---
title: python学习笔记01
date: 2018-04-01 22:06:28
tags: python,笔记
categories:
  - 学习笔记
---

## 基本部分

#### 基本语法
1.数组
2.字符串
3.系统标准库自带的类型
4.如何实现常用数据结构：链表、堆栈、二叉树...
<!--more-->
#### 输入输出
* 标准输入输出：print，echo，input...
* 文本读写：文本/二进制
	* 文本：行读写
	* 二进制：偏移量 + 大小
* 格式化字符串：print("%s;%d" %("aaa",100))

## 提高部分

#### 异常
* 抛出和捕获异常：try/catch，try/except
* 异常和错误的区别以及应用场合

#### 常用算法
* 分治
* 贪心
* 动态规划

#### 数据库访问
* 建立连接
* 执行SQL查询
* 读取查询记录

#### 面向对象
* 继承
* 多态
* 静态变量和方法

#### 其他
* 多线程/进程（《windows高级编程》）
* 匿名函数
* 语言相关特定知识
	* Java的反射
	* C++的模板
	* Python的协程

PS：[lintcode.com](http://www.lintcode.com)；[yingl](https://github.com/yingl)

## python基础入门

### 常用关键字

#### 常量
* True
* False
* None(NULL/null)

#### 对象和容器
* class
* import
* form
* del

#### 判断
* if
* elif
* else
* is
* in
* assert

#### 循环
* for
* while
* continue
* break
* pass

#### 异常
* raise
* try
* except
* finally
* as

### 常用运算符

#### 算术运算符
* +-*/
* %
* \**
* \//

#### 比较运算符
* \>,>=
* <,<=
* ==（同或）
* !=

#### 逻辑运算
* and
* or
* not
(Ps：没有异或)

#### 位运算
* \>>（16 >> 2是4）
* <<（16 << 2是64）
* &
* |
* ^（按位异或）
```python
def is_pow2(n):
	return (n & (n - 1)) ==0
# 判断是否为2的倍数，按位与
```

### 基本语法
* 缩进
* 注释
> \# 单行注释
> '''
> 多行注释
> '''
* 多行代码表示
> """
> \# 这里面写多行代码，print出来就是换行的效果
> """
* 中文支持（默认支持utf-8）
```python
# -*- coding:utf-8 -*-
# conding:utf-8
```
* 引号问题
```python
print("abc'123'xyz")
print('abc"123"xyz')
print('abc\'123\'xyz')
print("abc\"123\"xyz")
```
## 2.x与3.x的区别
* print函数：3.x必须加上()。
* Unicode：3.x默认使用Unicode编码
* 除法运算：3.x整数相除也能得出浮点数结果
* 异常：3.x只能抛出继承自BaseException的异常
* xrange：3.x取消了xrange，range与xrange一样使用惰性计算实现
（PS：原本xrange使用惰性计算，效率高，range效率低下，3.x版本将两者同一，使用range一点问题都没有）
* 二/八进制：3.x必须写成0b1011和0o723614
* 不等式：3.x取消了‘<>’，只有‘!=’
* "表达式：3.x必须使用repr函数
* 多个模块改名：Queue->queue，repr->reprlib ...
* 数据类型
	* 3.x取消了long，统一为int
	* 新增bytes类型，并可与string相互转换
	* dict的keys/items/values方法返回迭代器，iterkeys函数被废弃，has_key被in取代
* bytes格式的灵异现象
```python
print((1024).to_bytes(2, byteorder ='big'))
print((1024).to_bytes(4, byteorder ='little'))
print((-1024).to_bytes(2, byteorder ='big', signed = True))
print((-1024).to_bytes(4, byteorder ='little'', signed = True))
# 以下是两个不同的方法，显示的十六进制结果不同
# 因为4的ASCII码是34
print((3124).to_bytes(2, byteorder ='big'))
print("%x" % 3124)
```