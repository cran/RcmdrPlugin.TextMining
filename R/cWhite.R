cWhite <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgWhite <- tktoplevel()
tkwm.title(dlgWhite,"Strip Whitespace from a Text Document...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgWhite,width="25", textvariable=name)
#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
    }        
    else {

    txtCommand <- paste(tclvalue(name)," <- tm_map(",tclvalue(name),",stripWhitespace)", sep = "")
#reuters <- tm_map(reuters, removePunctuation) 
    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgWhite)
  }
}   

OKCancelHelp(window=dlgWhite, helpSubject="cWhite")

tkgrid(tklabel(dlgWhite,text="Enter a name of Corpus:"),entry.name, sticky="w")  
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

