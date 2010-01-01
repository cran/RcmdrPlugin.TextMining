cChunks <-
function()
{
require(tcltk)
require(tm)
#Creating dialog

dlgChunks <- tktoplevel()
tkwm.title(dlgChunks,"Split corpus into chunks...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgChunks,width="25", textvariable=name)

#Size of chunks
size.name <- tclVar("5")
entry.size <- tkentry(dlgChunks,width="10", textvariable=size.name) 

#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
            
    }else if (tclvalue(size.name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter size of chunks")
            return()
            }

    else {
    
    txtCommand <- paste("makeChunks(",tclvalue(name),",",tclvalue(size.name) ,")", sep = "")

    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgChunks)
    }                   
  }

OKCancelHelp(window=dlgChunks, helpSubject="cChunks")

tkgrid(tklabel(dlgChunks,text="Enter a name for Corpus:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgChunks,text="Enter size of chunks:"),entry.size,sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")
}

