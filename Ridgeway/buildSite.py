#!/usr/bin/env python

import os
import re

def buildPage(name, template):
    pass

def doImagePages(template):
    for (html, img, title) in imageLoop("pics.html"):
        out=template.replace("##TITLE",title)
        out=out.replace("##IMAGE",img)
        outfile=file("images/"+html,"w")
        outfile.write(out)
        outfile.close()

def imageLoop(filename):
    ims=r'<a href="images/(.*)"><img src="thumbnails/(.*)" title="(.*)"></a>'
    l=re.compile(ims)
    infoFile=file(filename)
    for im in infoFile:
        if im.startswith("#"):
            continue
        m=l.match(im)
        html=m.group(1)
        img=m.group(2)
        title=m.group(3)
        yield (html,img,title)
        
def convertPics():
    tpl='<a href="images/%s" rel="lightbox" title="%s" ><img  src="thumbnails/%s"  title="%s" ></a>'
    outf=file("pics2.txt","w")
    for (html, img, title) in imageLoop("pics.html"):
        outf.write(tpl % (img, title, img, title))
        outf.write("\n")
    outf.close()
    
def doSite():
    print "making site"
    template=file("template.html").read()
    cdir="contents"
    cfiles=os.listdir(cdir)
    for f in cfiles:
        if not f.endswith(".html"):
            print "skipping "+f
            continue
        fp=file(cdir+"/"+f)
        print "doing "+f
        section=fp.read()
        out=template.replace("##REPLACE",section)
        outf=file(f,"w")
        outf.write(out)

    itemp=file("images/imagetemplate.html").read()
    doImagePages(itemp)

if __name__ == "__main__":
    doSite()
    
