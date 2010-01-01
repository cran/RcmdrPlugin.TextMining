cSummary <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgSummary <- tktoplevel()
tkwm.title(dlgSummary,"Corpus summary...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgSummary,width="25", textvariable=name)
#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
    }        
    else {

    txtCommand <- paste("summary(",tclvalue(name),")", sep = "")

    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgSummary)
  }
}   

OKCancelHelp(window=dlgSummary, helpSubject="cSummary")

tkgrid(tklabel(dlgSummary,text="Enter a name of Corpus:"),entry.name, sticky="w")  
#tkgrid(tklabel(dlgInspect,text="Choose Source file:"),entry.wr,btnChoose,sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

