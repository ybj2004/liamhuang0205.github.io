title: 使用 Koreader 阅读 PDF 让 Kindle Paperwhite 如虎添翼
date: 2014-05-20 11:53:38
categories: IT
tags: [Kindle, PDF, Koreader]
---

和媳妇谈恋爱快一年了，远在大洋彼岸的媳妇托人带了份礼物给我，说是「知道我常看电子书，用电脑或者 iPad 看书对眼睛不好，所以送了一只『Kindle』给我」。这真是

> 有妻如此，夫复何求。

不过，也有「甜蜜的烦恼」。6 英寸的屏幕对付 A4 纸张大小的 PDF 文件，特别是扫描版的 PDF 文件总是让人不快；尤其 Kindle 原生的阅读器还要在 PDF 文件周边加上白边。好在经过一番搜索和折腾，终于找到了合适的解决方案——神器 Koreader.

<!--more-->

## Koreader 简介

[Koreader][koreader-github] 是用 [Lua][Lua] 这个脚本语言开发的 Kindle 插件，它基于 GPLv3 协议发布，可以运行在 Kindle 原生系统上，并支持 PDF, DJVU, EPUB 等格式。

Koreader 通过 [KPVBooklet][kvp-github] 与原生系统集成。成功安装后，将会默认使用 Koreader 打开 PDF, EPUB, DJVU, FB2, CHM 和 DOC 文档，MOBI, AZW, TXT 等格式则会默认使用原生阅读器打开。如果希望通过原生阅读器打开 PDF 等（默认使用 Koreader 的）格式，可以长按文档图标/标题，在弹出的窗口中选择「GOTO.../前往...」。二者的切换十分方便。

Koreader 的重排（Text Reflow）功能实际上是对另一个开源项目 [K2pdfopt][K2pdfopt] 的移植以及再开发。K2pdfopt 使用完全基于图像处理的方法对文字重新排版：把原始 PDF/DJVU 页面放大，而后再分割成以词为单位的像素区域，把这些像素区域重新排列到目标宽度的页面中（原理如下图）。所以理论上只要能够读取文档的页面像素就可以对其中的文字进行重新排版。

<img src="http://vislab.bjmu.edu.cn/blog/hwangxin/wp-content/uploads/2012/10/k2pdfopt.png" alt="K2pdfopt 文字重排原理">

对 K2pdfopt 的移植和再开发，使得在 Kindle 上实时重排、交互式地微调效果成为可能，而这几乎就完美地解决了 Kindle 用户对 PDF 阅读的全部需求。

Koreader 文字重排效果可以参见 [Huang Xin 博客上的一篇文章][hx-blog]。

## 在 Kindle Paperwrite 上的安装

要在 Kindle 上安装插件必须对设备进行越狱（Jailbreak）；而后需要安装 Koreader 依赖的 KPVBooklet；最后安装 Koreader。

### 越狱

不同于 iOS 系统越狱的极度困难，Kindle 的越狱相对简单许多。

* 到 [MobileRead 论坛][mblread]上的[这个帖子][jailbreak]中下载 [kindle-jailbreak-x.x.N.zip](http://www.mobileread.com/forums/attachment.php?attachmentid=121550&d=1397223190)（x.x.N 是版本号）。当前版本为 1.10.N, 能够胜任 Kindle 固件版本 5.0.x - 5.4.4.2 的越狱工作。
* 使用 USB 数据线将 Kindle 与计算机连接。
* ZIP 归档中有名为 `kindle-5.4-jailbreak.zip` 的文件，解压其中的三个文件到 Kindle 根目录。
  * `bridge.sh`
  * `jb.sh`
  * `Update_jb_$(cd mnt && cd us && sh jb.sh).bin`
* 断开 Kindle 与计算机的 USB 连接。
* 依次进行如下操作
  * 主页按钮（[Home]）
  * 菜单按钮（[Menu]）
  * 设置选项（Settings）
  * 菜单按钮（[Menu]）
  * 更新您的 Kindle（Update Your Kindle）
* 几秒钟后屏幕下方出现「***** JAILBREAK *****」字样表示越狱成功。

### 安装 KPVBooklet

* 到[这里][kvp-dl]下载 KPVBooklet 的安装包。
* 使用 USB 数据线将 Kindle 与计算机连接。
* ZIP 归档中有名为 `update_kpvbooklet_x.x.x_install.bin` 的文件，将其解压到 Kindle 根目录。
* 断开 Kindle 与计算机的 USB 连接。
* 依次进行如下操作
  * 主页按钮（[Home]）
  * 菜单按钮（[Menu]）
  * 设置选项（Settings）
  * 菜单按钮（[Menu]）
  * 更新您的 Kindle（Update Your Kindle）

### 安装 Koreader

* 到[这里][koreader-dl]下载 Koreader 的安装包，其中最新的版本在最上方，依次向下可以回溯各个版本。
  * 对于使用 Kindle 原生系统的用户，应当下载名为 `koreader-kindle-arm-linux-gnueabi-*.zip` 的文件。
* 使用 USB 数据线将 Kindle 与计算机连接。
* ZIP 归档中有三个目录，将它们全都解压到 Kindle 根目录。
  * `extensions`
  * `koreader`
  * `launchpad`
* 断开 Kindle 与计算机的 USB 连接。

至此，安装完毕，在 Kindle 主界面即可直接用 Koreader 打开 PDF 和 EPUB 文档。

### 关于原生系统固件升级

开启 WIFI 的情况下原生系统可能会在后台自动升级固件。不管手动固件升级还是自动固件升级都会擦除 KPVBooklet 启动器造成 Koreader 无法启动，解决这个问题只需要升级完成后重新安装 KPVBooklet 即可，Koreader 无需重新安装。













[Lua]: http://www.lua.org/about.html
[koreader-github]: https://github.com/koreader/koreader
[kvp-github]: https://github.com/koreader/kpvbooklet/
[K2pdfopt]: http://www.willus.com/k2pdfopt/
[hx-blog]: http://vislab.bjmu.edu.cn/blog/hwangxin/2012/10/read-scanned-pdfs-with-kindlepdfviewer/#i-2
[mblread]: http://www.mobileread.com/
[jailbreak]: http://www.mobileread.com/forums/showthread.php?t=186645
[kvp-dl]: https://github.com/koreader/kpvbooklet/releases
[koreader-dl]: https://github.com/koreader/koreader/releases
