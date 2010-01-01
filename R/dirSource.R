dirSource <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgDir <- tktoplevel()
tkwm.title(dlgDir,"Creating DirSource...")

#Corpus name
name <- tclVar("newCorpus")
entry.name <- tkentry(dlgDir,width="25", textvariable=name)

#Source directory
dir.name <- tclVar("Directory for source")
entry.dir <- tkentry(dlgDir,width="30", textvariable=dir.name) 

  onCoose <- function() 
  {
  tclvalue(dir.name) <- tkchooseDirectory(initialdir="C:/Program Files/R/R-2.11.1/library/tm/")
  }
btnChoose <- ttkbutton(dlgDir, text="...",command=onCoose)

#Readers 
lstReaderVar<- getReaders()
tmp <- tclVar()
tclvalue(tmp) <- lstReaderVar[6]
cboReader <- ttkcombobox(dlgDir, values=lstReaderVar, textvariable=tmp )
#Language
lang <- tclVar("bos")
entry.lang <- tkentry(dlgDir,width="3", textvariable=lang)
#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name for Corpus!")
            return()
            
    }else if (tclvalue(dir.name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter directory of source!")
            return()
            }
    if (tclvalue(lang) == "") {
            tkmessageBox(title = "Eror", message = "You must enter language name!")
            return()
            }
    else {
    txtCommand <- paste(tclvalue(name), " <- Corpus(DirSource('", tclvalue(dir.name), "'),readerControl=list(reader=", tclvalue(tmp)," ,language= '",tclvalue(lang),"'))", sep = "")

    doItAndPrint(txtCommand)
    tkdestroy(dlgDir)    
    }                   
  }

OKCancelHelp(window=dlgDir, helpSubject="dirSource")

tkgrid(tklabel(dlgDir,text="Enter a name for Corpus:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgDir,text="Choose directory where source is:"),entry.dir,btnChoose,sticky="w")         
tkgrid(tklabel(dlgDir ,text="Select Reader"),cboReader, sticky="w")
tkgrid(tklabel(dlgDir,text="Enter language:"),entry.lang, sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")
 # C:/Program Files/R/R-2.11.1/library/tm/texts/txt
}

