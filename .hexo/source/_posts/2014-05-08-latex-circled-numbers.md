title: 【LaTeX Tips】带圈数字与带圈数字列表
date: 2014-05-08 20:32:22
date: 2014/05/08
tags: [LaTeX, TikZ, Circled]
category: LaTeX
---

在许多文章中，特别是中文文章中，我们会见到带有圆圈的数字。它们有点是单独出现的，有点作为列表的计数出现。

LaTeX 提供了 `\textcircled` 命令，但[效果并不好](http://tex.stackexchange.com/questions/7032/good-way-to-make-textcircled-numbers)。[LaTeX studio](http://www.latexstudio.net/latex-tips-768-defined-for-the-enclosed-list-of-environment/) 曾经提供了一个方法，但缺乏通用性。

这里给出一个利用 Ti*k*Z 绘制的方法，能较好地解决这个问题，但仍需完善。

<!--more-->

基本的思路是定义一个新命令，接受一个数字参数，用 Ti*k*Z 在它周围画圈。同时要考虑基线和对齐的问题。一个尝试如下：

{% code  lang:tex %}
\usepackage{tikz}
\newcommand*{\circled}[1]{\lower.7ex\hbox{\tikz\draw (0pt, 0pt)%
    circle (.5em) node {\makebox[1em][c]{\small #1}};}}
{% endcode %}

这个新定义的命令可以按照 `\textcircled` 方法在正文中使用，如果需要用在列表中，则因为「脆弱命令」的问题，需要处理一下。这里我们选择使用 `etoolbox` 宏包提供的 `\robustify` 来处理一下，同时结合 `enumitem` 宏包，给出示例用法如下：

{% code demo lang:tex %}
\documentclass{article}
\usepackage{tikz}
\usepackage{etoolbox}
\usepackage{enumitem}
\newcommand*{\circled}[1]{\lower.7ex\hbox{\tikz\draw (0pt, 0pt)%
    circle (.5em) node {\makebox[1em][c]{\small #1}};}}
\robustify{\circled}
\begin{document}
\mbox{}\rlap{\rule{.7\linewidth}{.4pt}}%
This is the circled number \circled{20}.

\begin{enumerate}[label=\circled{\arabic*}]
\item I
\item am
\item happy
\item to
\item join
\item with
\item you
\item today
\item in
\item what
\item will
\item go
\item down
\item in
\item history
\item as
\item the
\item greatest
\item demonstration
\item for
\item freedom
\item in
\item the
\item history
\item of
\item our
\item nation.
\end{enumerate}
\end{document}
{% endcode %}

-----------

转载请注明作者，并保留原文链接。
