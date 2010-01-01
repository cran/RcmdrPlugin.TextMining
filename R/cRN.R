cRN <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgRN <- tktoplevel()
tkwm.title(dlgRN,"Remove Numbers from a Text Document...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgRN,width="25", textvariable=name)
#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
    }        
    else {

    txtCommand <- paste(tclvalue(name)," <- tm_map(",tclvalue(name),",removeNumbers)", sep = "")
#reuters <- tm_map(reuters, removeNumbers) 
    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgRN)
  }
}   

OKCancelHelp(window=dlgRN, helpSubject="cRN")

tkgrid(tklabel(dlgRN,text="Enter a name of Corpus:"),entry.name, sticky="w")  
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

