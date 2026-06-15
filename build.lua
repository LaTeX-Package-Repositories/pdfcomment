-- Build script for pdfcomment
packageversion="3.0b"
packageversionlegacy="2.4b"
packagedate="2026-06-15"

module   = "pdfcomment"
ctanpkg  = "pdfcomment"

checkengines = {"luatex"}
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
   "pdfcomment-code.tex", 
   "example_math_markup.tex",
   "example.tex",
   "example-lualatex.tex"
   ,"example-lualatex-tagged.tex"
   ,"example_math_markup-tagged.tex"
   }
typesetexe       = "lualatex"

recordstatus=true

specialtypesetting = specialtypesetting or {}
specialtypesetting["example.tex"] = {cmd = "pdflatex -interaction=nonstopmode"}
specialtypesetting["example_math_markup.tex"] = {cmd = "pdflatex -interaction=nonstopmode"}
--specialtypesetting["pdfcomment.tex"] = {cmd = "pdflatex -interaction=nonstopmode"}


function docinit_hook() 
cp("pdfcomment.sty", unpackdir, typesetdir)
return cp("pdfcomment-2018-11-01.sty", unpackdir, typesetdir) end


tagfiles = {
            "pdfcomment.dtx",
            "pdfcomment-2018-11-01.sty",
            "pdfcomment.tex",
            "README.md"
           }


function update_tag (file,content,tagname,tagdate) 
 if string.match (file, "%.dtx$" ) then
  content = string.gsub (content,
                         "\\ProvidesExplPackage {(.-)} {.-} {.-}",
                         "\\ProvidesExplPackage {%1} {" .. packagedate.."} {"..packageversion .. "}")
  content = string.gsub (content,
                         "\\date{.-}",
                         "\\date{v"..packageversion..", released ".. packagedate.."}")
  return content
elseif string.match (file, "%.sty$" ) then
  content = string.gsub (content,
                         "\\ProvidesPackage{(.-)}%[.+ Josef",
                         "\\ProvidesPackage{%1}[" .. packagedate .." pdfcomment.sty v"..packageversionlegacy .." - Josef")
  return content
 elseif string.match (file, "^README.md$") then
   content = string.gsub (content,
                         "Version: %d%.%d+%l?",
                         "Version: " .. packageversion )
   return content
 elseif string.match (file, "%.tex$" ) then
   content = string.gsub (content,
                         "\\date{.-}",
                         "\\date{"..packagedate.."}")
   content = string.gsub (content,
                         "\\Fileversion{.-}",
                         "\\Fileversion{v"..packageversion.."}")
   return content
 end
 return content
 end
