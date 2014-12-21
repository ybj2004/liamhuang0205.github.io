title: 在 Windows 下批量将位图转为 EPS 格式的图档
date: 2014-08-21 10:38:38
categories: LaTeX
tags: [Bitmap, EPS, Windows Batch]
---

虽然「LaTeX 只能识别 EPS 格式的图档」是多年的误传，但是仍有许多杂志和期刊只接受 EPS 格式的图档。所以，尽管在日常使用中，我们很少会用到 EPS 格式，但是有时候不得不用。

今天帮朋友排版论文的时候，就又遇到了这样无节操的期刊。没办法，转呗。结果一看傻眼了，一共五六十个图片，手工得弄到猴年马月……于是动了动脑，写了个批处理搞定。

<!--more-->

在现在的 TeX 发行版中，一般都带有一个 `bmeps` 的小程序，它能将 `png`, `jpg` 和 `bmp` 等格式的位图转换成 EPS 格式的图档。我们用它来处理图片是最好不过了，以 `png` 格式为例，批处理命令如下

    for /f %%i in ('dir /b *.png') do (
        @echo %%i
        bmeps -c %%i %%~ni.eps
        @echo Finished
        )

这里用到了 `for` 循环，在当前目录下遍历所有后缀为 `png` 的文件，然后对当前文件依次执行 `bmeps` 命令。

我写了一个完整的批处理文件，可以在[这里][bat-file]下载，置于位图所在的目录，双击运行即可。

[bat-file]: /attachment/LaTeX-useful-tools/epscolor.bat
