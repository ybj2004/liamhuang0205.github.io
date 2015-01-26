title: 为 MacTeX 配置中文支持
date: 2014-11-02 18:07:28
categories: [LaTeX]
tags: [CJK, MacTeX, OS X]
---

最近有人问到如何在 MacTeX 里配置中文支持，这里一并回答。

目前来说，结合 `xeCJK` 宏包使用 XeLaTeX 编译，应该是最方便的方式了。

XeLaTeX 要求 `.tex` 文档保存为 UTF-8 编码。所以要做的事情只有两件：

* 配置一个 UTF-8 的编辑环境；
* 用 `xeCJK` 的语法选择合适的字体。

<!--more-->

## 配置 UTF-8 的编辑环境

MacTeX 自带了名为 TeXshop 的编辑器，这里以它为例配置 UTF-8 的编辑环境。其他编辑器也有类似配置。

打开 TeXshop，按下 `cmd + ,` 打开偏好设置。在「源代码」标签下找到编码设置，调整为 UTF-8。然后单击「好」保存即可。

![调整 TeXshop 的编码]({{site.url}}/attachment/images/MacTeX_xeCJK/01.png)

## 查找字体信息

XeTeX 在 Mac OS X 下的行为和 Windows/Linux 下不大一样。Mac 底下，XeTeX 并不使用 `fontconfig` 库来搜索字体，所以我们没法在终端里通过 `fc-list` 命令来查看可用的字体列表。不过 Mac 里提供了名为「字体册」的程序，来列出系统中所有可用的字体信息。

其实这样的设计挺讨厌的，TeX Live 自带了许多开源字体，因此没有办法很好地使用。必须用字体名而不是字族名来调用这些字体，实在是不太方便。当然，如果有需要，我们可以把 TeX 里自带的这些开源字体用硬链接的方式，添加到 Mac 的字体目录下。

打开字体册程序，找到需要的字体信息：

![在字体册中查找字体信息]({{site.url}}/attachment/images/MacTeX_xeCJK/02.png)

这里的 PostScript 名称就是我们需要的信息，我们记下华文宋体的名字：「STSong」。你还可以按需找到其他字体的名字，比如华文中宋、华文楷体、华文黑体等字体的名字。

## 用 xeCJK 的语法配置字体

使用下列代码，配置中文字体。

{% code demo lang:tex %}
\usepackage{xeCJK}
\setCJKmainfont[BoldFont=STZhongsong, ItalicFont=STKaiti]{STSong}
\setCJKsansfont[BoldFont=STHeiti]{STXihei}
\setCJKmonofont{STFangsong}
{% endcode %}

这里，
* 文档中文主字体是华文宋体，对应的 bfseries 字体是华文中宋，对应的 itshape 字体是华文楷体；
* 文档的「无衬线」中文字体是华文新黑，对应的 bfseries 是华文黑体；
* 文档的「等宽」中文字体是华文仿宋。

完整代码的编译效果截图如下：

![编译效果]({{site.url}}/attachment/images/MacTeX_xeCJK/03.png)

## 额外的工作

尽管这一节的操作有些复杂，而且对于中文支持来说是可选的，但是依旧推荐按步骤操作。

`xeCJK` 之解决了中文支持问题，以及一些关于标点的处理，并没有提供和中文版式相关的解决方案。`ctex` 宏包和文档类封装了 xeCJK，同时提供了中文版式的相关支持。不过 `ctex` 的默认配置是为 Windows 平台配置的，Mac 用户需要对默认配置做一些修改。具体如下。

打开终端，键入命令：

{% code demo lang:shell %}
cd /usr/local/texlive/texmf-local/tex/latex/
sudo mkdir ./ctex/
sudo mkdir ./ctex/cfg/
cd ./ctex/cfg/
sudo vim ctexopts.cfg
{% endcode %}

复制以下内容：

{% code demo lang:tex %}
\ExecuteOptions{UTF8}
\ExecuteOptions{nofonts}

\endinput
{% endcode %}

切换回到终端窗口，按 `i` 进入编辑模式，按 `cmd + v` 粘贴，按 `esc` 退出编辑模式，输入 `:x` 保存退出（半角冒号紧接着 x）。
在终端窗口继续操作，键入命令：

{% code demo lang:shell %}
sudo vim ctex.cfg
{% endcode %}

复制以下内容：

{% code demo lang:tex %}
\RequirePackage{ifxetex}
\ifxetex
  \setCJKmainfont[BoldFont=STZhongsong, ItalicFont=STKaiti]{STSong}
  \setCJKsansfont[BoldFont=STHeiti]{STXihei}
  \setCJKmonofont{STFangsong}

  \newCJKfontfamily[stsong]\songti[BoldFont=STZhongsong, ItalicFont=STKaiti]{STSong}
  \newCJKfontfamily[sthei]\heiti[BoldFont=STHeiti]{STXihei}
  \newCJKfontfamily[stkai]\kaishu{STKaiti}
  \newCJKfontfamily[stfang]\fangsong{STFangsong}
  \newCJKfontfamily[stli]\lishu{STLiti}
\fi
\endinput
{% endcode %}

切换回到终端窗口，按 `i` 进入编辑模式，按 `cmd + v` 粘贴，按 `esc` 退出编辑模式，输入 `:x` 保存退出（半角冒号紧接着 x）。
在终端窗口继续操作，键入命令：

{% code demo lang:shell %}
sudo texhash
{% endcode %}

这里，

* `ctexopts.cfg` 会在 `ctex` 宏包/文档类的选项定义之后被载入，我们启用了 `nofonts` 和 `UTF8` 这两个选项；
* `ctex.cfg` 则会在 `ctex` 宏包/文档类的结尾被载入，我们配置了字体；
* `texhash` 会刷新 TeX 的文件名数据库。

至此，`ctex` 宏包/文档类在 Mac 里就可以正常工作了。测试截图如下：

![编译效果]({{site.url}}/attachment/images/MacTeX_xeCJK/04.png)
