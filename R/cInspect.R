cInspect <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgInspect <- tktoplevel()
tkwm.title(dlgInspect,"Inspecting Corpus...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgInspect,width="25", textvariable=name)
#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
    }        
    else {

    txtCommand <- paste("inspect(",tclvalue(name),")", sep = "")

    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgInspect)
  }
}   

OKCancelHelp(window=dlgInspect, helpSubject="cInspect")

tkgrid(tklabel(dlgInspect,text="Enter a name of Corpus:"),entry.name, sticky="w")  
#tkgrid(tklabel(dlgInspect,text="Choose Source file:"),entry.wr,btnChoose,sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

