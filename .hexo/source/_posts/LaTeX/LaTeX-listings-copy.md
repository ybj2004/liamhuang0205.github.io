---
layout: post
date: 2013/11/04
title: 【LaTeX Tips】复制代码时避免复制行号的正确方法
description: 在使用 listings 宏包输出代码时，如果输出行号，则在复制代码时会连同行号一起复制，本文提供了解决方法。
category: LaTeX
tags: [LaTeX, Listings, Line number, Copy]
image:
  feature: so-simple-sample-image-1.jpg
  credit: Michael Rose
  creditlink: http://mademistakes.com
share: true
comments: true
modified: 2013-11-04
---

## 问题的描述

用 listings 包排版源代码时通常为了便于说明，会显示代码的行号，但是，我们在文档复制的时候却发现，复制代码的时候，同时会把行号也复制出来了，如下：

<!--more-->

![]({{site.root}}/attachment/images/listingsCopy/wrong.png)

我们想实现如下的复制，更便于读者提取文档中的源代码进行相关测试。

![]({{site.root}}/attachment/images/listingsCopy/right.png)

## 一次尝试

[LaTeX studio](http://www.latexstudio.net/) 提供了一个[解决方案](http://www.latexstudio.net/latex-tip-743-how-to-make-text-copy-in-pdf-previewers-ignore-lineno-line-numbers/)。但是该方案是有问题的，因为 \thelstnumber 在很多地方都要用到，所以直接重定义这个宏是很危险的——比如，无法和 hyperref 宏包一起使用。下面的测试代码说明了这个问题：

{% code demo lang:tex %}
\documentclass{minimal}
\usepackage{hyperref}
\usepackage{listings}
\usepackage{accsupp}
\renewcommand{\thelstnumber}{
\protect\BeginAccSupp{ActualText={}}\arabic{lstnumber}\protect\EndAccSupp{}%
}
\lstset{numbers = left}
\begin{document}
\begin{lstlisting}
\foo
\end{lstlisting}
\end{document}
{% endcode %}

## 最终的解决

更健壮的办法，可以定义一个新的命令，然后用 listings 宏包的 numberstyle 选项来加载这一命令，如下

{% code demo lang:tex %}
\documentclass{minimal}
\usepackage{hyperref}
\usepackage{listings}
\usepackage{accsupp}
\newcommand\emptyaccsupp[1]{\BeginAccSupp{ActualText={}}#1\EndAccSupp{}}
\lstset{numbers = left, numberstyle=\emptyaccsupp}
\begin{document}
\begin{lstlisting}
\foo
\end{lstlisting}
\end{document}
{% endcode %}
