cRP <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgRP <- tktoplevel()
tkwm.title(dlgRP,"Remove Punctuation Marks ...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgRP,width="25", textvariable=name)
#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
    }        
    else {

    txtCommand <- paste(tclvalue(name)," <- tm_map(",tclvalue(name),",removePunctuation)", sep = "")
#reuters <- tm_map(reuters, removePunctuation) 
    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgRP)
  }
}   

OKCancelHelp(window=dlgRP, helpSubject="cRP")

tkgrid(tklabel(dlgRP,text="Enter a name of Corpus:"),entry.name, sticky="w")  
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

