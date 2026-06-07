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

docfiles =  {"CHANGES"}
installfiles={"pdfcomment.sty","pdfcomment-2018-11-01.sty"}
sourcefiles={"pdfcomment.dtx","pdfcomment-2018-11-01.sty","pdfcomment.ins"}
unpackfiles = {"pdfcomment.ins"}

typesetfiles     = 
  {"pdfcomment.tex",
   "example_math_markup.tex",
   "example.tex",
   "example-lualatex.tex"
  -- ,"example-lualatex-tagged.tex"
  -- ,"example_math_markup-tagged.tex"
   }
typesetexe       = "lualatex"

recordstatus=true

specialtypesetting = specialtypesetting or {}
specialtypesetting["example.tex"] = {cmd = "pdflatex -interaction=nonstopmode"}
specialtypesetting["example_math_markup.tex"] = {cmd = "pdflatex -interaction=nonstopmode"}
specialtypesetting["pdfcomment.tex"] = {cmd = "pdflatex -interaction=nonstopmode"}


function docinit_hook() 
cp("pdfcomment.sty", unpackdir, typesetdir)
return cp("pdfcomment-2018-11-01.sty", unpackdir, typesetdir) end
