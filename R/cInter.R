cInter <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgInter <- tktoplevel()
tkwm.title(dlgInter,"Intersect...")

#Corpus name
name <- tclVar("test")
entry.name <- tkentry(dlgInter,width="25", textvariable=name)

#Document ID
ID.name <- tclVar("1")
entry.ID <- tkentry(dlgInter,width="5", textvariable=ID.name) 

#Words
words <- tclVar("")
entry.words <- tkentry(dlgInter,width="40", textvariable=words)

#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name for Corpus!")
            return()
            
    }else if (tclvalue(ID.name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter document ID!")
            return()
            }
    if (tclvalue(words) == "") {
            tkmessageBox(title = "Eror", message = "You must enter words!")
            return()
            }
    else {
    temp <- strsplit(tclvalue(words),";")

    txtCommand <- paste("tm_intersect(",tclvalue(name),"[[",tclvalue(ID.name),"]],",temp,")" , sep = "")
    #tm_intersect(crude[[1]], c("crude", "oil","salt"))
    doItAndPrint(txtCommand)
    #print(txtCommand)
    tkdestroy(dlgInter)    
   }                    
  }

OKCancelHelp(window=dlgInter, helpSubject="cInter")

tkgrid(tklabel(dlgInter,text="Enter a name for Corpus:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgInter,text="Enter document ID:"),entry.ID)         
#tkgrid(tklabel(dlgInter ,text="Select Reader"),cboReader, sticky="w")
tkgrid(tklabel(dlgInter,text='Enter words separated by ";":'),entry.words, sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")
}

