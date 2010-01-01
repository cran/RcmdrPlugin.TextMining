cWrite <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgWrite <- tktoplevel()
tkwm.title(dlgWrite,"Writing Corpus to a disk...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgWrite,width="25", textvariable=name)

#URL of directory for Corpus
wr.name <- tclVar("C:/Test")
entry.wr <- tkentry(dlgWrite,width="30", textvariable=wr.name) 
  onCoose <- function() 
  {
  tclvalue(wr.name) <- tkchooseDirectory(initialdir="C:/Test")
  #print( tclvalue(wr.name) )
  }
btnChoose <- ttkbutton(dlgWrite, text="...",command=onCoose)

#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
            
    }else if (tclvalue(wr.name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter destination directory")
            return()
            }

    else {
    
    txtCommand <- paste('writeCorpus(',tclvalue(name),", path='",tclvalue(wr.name) , "',filenames=paste(seq_along(",tclvalue(name),"),'.txt', sep = ''))", sep = "")
    
    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgWrite)
    }                   
  }

OKCancelHelp(window=dlgWrite, helpSubject="cWrite")

tkgrid(tklabel(dlgWrite,text="Enter a name for Corpus:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgWrite,text="Choose Source file:"),entry.wr,btnChoose,sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")

 #paste(seq_along(crude), 

}

