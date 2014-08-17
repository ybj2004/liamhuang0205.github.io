---
layout: post
date: 2013/10/15
title: 【LaTeX Tips】系统工程理论与实践模板编译的一些经验
description: 这篇文章介绍了使用系统工程理论与实践的 LaTeX 模板的一些经验。
category: LaTeX
tags: [LaTeX, SYSENGI, Template]
image:
  feature: so-simple-sample-image-3.jpg
  credit: Michael Rose
  creditlink: http://mademistakes.com
share: true
comments: true
modified: 2013-10-15
---

《[系统工程理论与实践](http://www.sysengi.com/)》主要刊登系统工程在工业、农业、军事、教育、科研、经济与金融、及信息管理等领域中的重要应用成果,具有重要意义的创造性的优秀理论成果。[它的 LaTeX 模板](http://www.sysengi.com/UserFiles/File/model2013.tex)使用过时的 CCT 方式支持中文，并且模板使用了 `headrule`, `vatola` 等 LaTeX 2.09 时代的老旧宏包，因此在新版的 [TeX Live 2013](http://www.tug.org/texlive/) 以及 [CTeX 2.9.2.164](http://www.ctex.org/CTeXDownload) 上可能无法编译得到正确结果。经过一番实践，得出结论如下：

<!--more-->

1. 使用 [CTeX 2.4.6](ftp://ftp.ctex.org/pub/tex/systems/ctex/obsolete/2.4/) 中自带的 WinEdt 中的 CCTLaTeX 可以正确编译得到 `.dvi` 和 `.ps` 文件，如果需要 `.pdf` 文件可以用 `ps2pdf` 工具转换。
1. 使用 TeX Live 2013, 替换 `cctart` 为 `ctexart` 可以得到几乎完全一致的结果，但需要额外下载前述两个 2.09 时代的老旧宏包，并且会因为 `cctart` 中的 `\pushziti` 等命令未经定义会报错（但忽略错误继续编译能够得到结果）。

总的来说 CCT 是一个过时的中文支持方式，非常希望系统工程理论与实践的编辑部能与时俱进改用新的方式支持中文，为所有作者提供方便。对于广大的 LaTeX 用户，除非特别需要（比如本文所述内容），不要使用老旧的 TeX 发行，以增强文档的兼容性。
