cStem <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgStem <- tktoplevel()
tkwm.title(dlgStem,"Stem Words...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgStem,width="25", textvariable=name)
#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
    }        
    else {

    txtCommand <- paste(tclvalue(name)," <- tm_map(",tclvalue(name),",stemDocument)", sep = "")
#reuters <- tm_map(reuters, stemDocument) 
    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgStem)
  }
}   

OKCancelHelp(window=dlgStem, helpSubject="cStem")

tkgrid(tklabel(dlgStem,text="Enter a name of Corpus:"),entry.name, sticky="w")  
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

