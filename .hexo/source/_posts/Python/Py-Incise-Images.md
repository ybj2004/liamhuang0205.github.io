---
layout: post
date: Py/Incise/
date: 2014/01/27
title: 【Life on Python】批量切割图片
description: 批量切割图片。
category: Python
tags: [Python, Images]
image:
  feature: so-simple-sample-image-4.jpg
  credit: Michael Rose
  creditlink: http://mademistakes.com
share: true
comments: true
---

按照 `horizon` 和 `vertic` 两个变量切割当前目录下所有图片（包括子目录）。

代码很简单，就不封装了。

    import Image as img
    import os

    imgTypes = ['.png','.jpg','.bmp']

    horizon = 8
    vertic  = 1

    for root, dirs, files in os.walk('.'):
        for currentFile in files:
            crtFile = root + '\\' + currentFile
            if crtFile[crtFile.rindex('.'):].lower() in imgTypes:
                crtIm = img.open(crtFile)
                crtW, crtH = crtIm.size
                hStep = crtW // horizon
                vStep = crtH // vertic
                for i in range(vertic):
                    for j in range(horizon):
                        crtOutFileName = crtFile[:crtFile.rindex('.')] + \
                            '_' + str(i) + '_' + str(j)\
                            + crtFile[crtFile.rindex('.'):].lower()
                        box = (j * hStep, i * vStep, (j + 1) * hStep, (i + 1) * vStep)
                        cropped = crtIm.crop(box)
                        cropped.save(crtOutFileName)
