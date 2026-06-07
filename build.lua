-- Build script for pdfcomment
packageversion="2.4a"
packagedate="2018-11-01"

module   = "pdfcomment"
ctanpkg  = "pdfcomment"

checkengines = {"luatex","pdftex"}
stdengine = "luatex"
checkconfigs = {"build"}

checkruns = 3

docfiledir = "./doc"

docfiles =  {"*.tex"}
installfiles={"pdfcomment.sty","pdfcomment-2018-11-01.sty"}
sourcefiles={"pdfcomment.dtx","pdfcomment-2018-11-01.sty","pdfcomment.ins"}
unpackfiles = {"pdfcomment.ins"}

function docinit_hook() 
cp("pdfcomment.sty", unpackdir, typesetdir)
return cp("pdfcomment-2018-11-01.sty", unpackdir, typesetdir) end
