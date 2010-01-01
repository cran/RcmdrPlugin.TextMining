cTolower <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgTolower <- tktoplevel()
tkwm.title(dlgTolower,"Translate characters to lower case...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgTolower,width="25", textvariable=name)
#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
    }        
    else {

    txtCommand <- paste(tclvalue(name)," <- tm_map(",tclvalue(name),",tolower)", sep = "")
#reuters <- tm_map(reuters, tolower) 
    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgTolower)
  }
}   

OKCancelHelp(window=dlgTolower, helpSubject="cTolower")

tkgrid(tklabel(dlgTolower,text="Enter a name of Corpus:"),entry.name, sticky="w")  
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

