# coding: utf-8
import os
def list_files(rootDir):
    fileList = list()
    for root,dirs,files in os.walk(rootDir):
        for filespath in files:
            if os.path.join(root,filespath)[-3:] == '.md':
                fileList.append(os.path.join(root,filespath))
    return fileList
def adjust_quote(filename):
    fileH = open(filename, 'r')
    content = fileH.read().replace('“', '『').replace('”','』')
    fileH.close()
    # print content
    fileH = open(filename, 'w')
    fileH.write(content)
    fileH.close()
    return None
def adjust_highlight(filename):
    fileH = open(filename, 'r')
    content = fileH.read().replace('{% highlight latex %}', '{% code demo lang:latex %}').replace('{% endhighlight %}','{% endcode %}')
    fileH.close()
    # print content
    fileH = open(filename, 'w')
    fileH.write(content)
    fileH.close()
    return None
def adjust_highlight_(filename):
    fileH = open(filename, 'r')
    content = fileH.read().replace('lang:latex %}', 'lang:tex %}')
    fileH.close()
    # print content
    fileH = open(filename, 'w')
    fileH.write(content)
    fileH.close()
    return None
def adjust_att_img(filename):
    fileH = open(filename, 'r')
    content = fileH.read().replace('{{site.att}}', '{{site.root}}/attachment').replace('{{site.images}}','{{site.root}}/attachment/images')
    fileH.close()
    # print content
    fileH = open(filename, 'w')
    fileH.write(content)
    fileH.close()
    return None
def adjust_att_img_(filename):
    fileH = open(filename, 'r')
    content = fileH.read().replace('{{site.root}}/attachment', '{{site.root}}/.hexo/attachment')
    fileH.close()
    # print content
    fileH = open(filename, 'w')
    fileH.write(content)
    fileH.close()
    return None
def adjust_att_img__(filename):
    fileH = open(filename, 'r')
    content = fileH.read().replace('{{site.root}}/.hexo/attachment', '{{site.root}}/attachment')
    fileH.close()
    # print content
    fileH = open(filename, 'w')
    fileH.write(content)
    fileH.close()
    return None
def dict_files(rootDir):
    fileDict = dict()
    for root,dirs,files in os.walk(rootDir):
        for filespath in files:
            if os.path.join(root,filespath)[-3:] == '.md':
                fileDict[os.path.join(root,filespath)] = filespath
    return fileDict
def adjust_date(filename, filepath):
    fileH = open(filename, 'r')
    lines = fileH.readlines()
    fileH.close()
    lines.insert(2, 'date: ' + filepath[:10].replace('-', '/') + '\n')
    fileH = open(filename, 'w')
    fileH.writelines(lines)
    fileH.close()
    return None
def adjust_case(filename):
    fileH = open(filename, 'r')
    content = fileH.read().replace('category: latex', 'category: LaTeX')
    fileH.close()
    # print content
    fileH = open(filename, 'w')
    fileH.write(content)
    fileH.close()
if __name__ == '__main__':
    for filename in list_files('.'):
        # adjust_quote(filename)
        # adjust_highlight(filename)
        # adjust_highlight_(filename)
        # adjust_att_img(filename)
        # adjust_att_img_(filename)
        # adjust_att_img__(filename)
        adjust_case(filename)
    for k, v in dict_files('.').items():
        adjust_date(k, v)
