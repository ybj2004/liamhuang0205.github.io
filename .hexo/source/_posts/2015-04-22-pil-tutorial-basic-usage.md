title: PIL 简明教程 - 基本用法
date: 2015-04-22 17:46:31
categories: IT
tags: [Python, PIL, Image]
---

PIL (Python Image Library) 是 Python 平台处理图片的事实标准，兼具强大的功能和简洁的 API。这篇文章将从 PIL 的安装开始，介绍 PIL 的基本情况和基本用法。

<!--more-->

## 安装

在安装好了 Python 的基础上，安装 Python 十分简单。在 *nix 系统里，可以直接使用 Python 的包管理器来安装。例如使用 `easy_install` 安装：

{% code lang:bash %}
sudo easy_install PIL
{% endcode %}

在 Windows 系统里，可以直接安装 `.exe` 版本。你可以在 [PIL 的官网][PIL-website] 下载到它。

安装好之后，打开 Python 解释器，输入 `import Image` 来测试是否安装成功。

## 新建一个 `Image` 类的实例

PIL 的主要功能定义在 `Image` 类当中，而 `Image` 类定义在同名的 `Image` 模块当中。使用 PIL 的功能，一般都是从新建一个 `Image` 类的实例开始。新建 `Image` 类的实例有多种方法。你可以用 `Image` 模块的 `open()` 函数打开已有的图片档案，也可以处理其它的实例，或者从零开始构建一个实例。

{% code lang:python %}
import Image
sourceFileName = "source.png"
avatar         = Image.open(sourceFileName)
{% endcode %}

上述代码引入了 Image 模块，并以 `open()` 方法打开了 `source.png` 这个图像，构建了名为 `avatar` 的实例。如果打开失败，则会抛出 `IOError` 异常。

接下来你可以使用 `show()` 方法来查看实例。注意，PIL 会将实例暂存为一个临时文件，而后打开它。

{% code lang:python %}
avatar.show()
{% endcode %}

![使用 `show()` 方法查看实例的内容 ]({{site.url}}/attachment/images/Python/pil-tutorial/Image_show.png)

## 查看实例的属性

`Image` 类的实例有 5 个属性，分别是：

* `format`: 以 `string` 返回图片档案的格式（`JPG`, `PNG`, `BMP`, `None`, etc.）；如果不是从打开文件得到的实例，则返回 `None`。
* `mode`: 以 `string` 返回图片的模式（RGB, CMYK, etc.）；完整的列表参见 [官方说明·图片模式列表][mode-list]
* `size`: 以二元 tuple 返回图片档案的尺寸 (width, height)
* `palette`: 仅当 `mode` 为 `P` 时有效，返回 `ImagePalette` 示例
* `info`: 以字典形式返回示例的信息

我们接着上面的代码：

{% code lang:python %}
print avatar.format, avatar.size, avatar.mode
{% endcode %}

![查看示例的属性 ]({{site.url}}/attachment/images/Python/pil-tutorial/Image_attrib.png)

这里我们看到返回了图片的格式 `PNG`、图片的大小 `(400, 400)` 和图片的模式 `RGB`。

## 实例的方法

`Image` 类定义了许多方法，这里无法一一列出（也无必要）。如果有需要，可以参看 [官方说明·`Image` 模块][Image-module]。这里仅列出几个有趣的应用。

### 图片 IO - 转换图片格式

`Image` 模块提供了 `open()` 函数打开图片档案，`Image` 类则提供了 `save()` 方法将图片实例保存为图片档案。

`save()` 函数可以以特定的图片格式保存图片档案。比如 `save('target.jpg', 'JPG')` 将会以 `JPG` 格式将图片示例保存为 `target.jpg`。不过，大多数时候也可以省略图片格式。此时，`save()` 方法会根据文件扩展名来选择相应的图片格式。

我们以一个转换图片格式的脚本进行分析。

{% code lang:python %}
import os, sys
import Image

for infile in sys.argv[1:]:
    f, e = os.path.splitext(infile)
    outfile = f + ".jpg"
    if infile != outfile:
        try:
            Image.open(infile).save(outfile)
        except IOError:
            print "cannot convert", infile
{% endcode %}

这里，`f` 是除去扩展名之外的文件名。在 `try` 语句中，我们尝试打开图片档案，然后以 `.jpg` 为扩展名保存图片档案。`save()` 方法会根据扩展名，将图片以 `JPG` 格式保存为档案。如果图片档案无法打开，则在终端上打印无法转换的消息。

### 制作缩略图

`Image` 类的 `thumbnail()` 方法可以用来制作缩略图。它接受一个二元数组作为缩略图的尺寸，然后将示例缩小到指定尺寸。

{% code lang:python %}
import os, sys
import Image

for infile in sys.argv[1:]:
    outfile = os.path.splitext(infile)[0] + ".thumbnail"
    if infile != outfile:
        try:
            im   = Image.open(infile)
            x, y = im.size
            im.thumbnail((x//2, y//2))
            im.save(outfile, "JPEG")
        except IOError:
            print "cannot create thumbnail for", infile
{% endcode %}

这里我们用 `im.size` 获取原图档的尺寸，然后以 `thumbnail()` 制作缩略图，大小则是原先图档的四分之一。同样，如果图档无法打开，则在终端上打印无法执行的提示。

### 剪裁图档

以前也写过 [一篇博客][incise-img]，讲述如何用 PIL 批量剪裁图档，供参考。





[PIL-website]: http://pythonware.com/products/pil/
[mode-list]: http://effbot.org/imagingbook/concepts.htm#mode
[Image-module]: http://effbot.org/imagingbook/image.htm
[incise-img]: http://liam0205.me/2014/01/27/Py-Incise-Images/
