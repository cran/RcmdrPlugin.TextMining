cPlain <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgPlain <- tktoplevel()
tkwm.title(dlgPlain,"Convert documents to plain text...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgPlain,width="25", textvariable=name)
#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
    }        
    else {

    txtCommand <- paste(tclvalue(name)," <- tm_map(",tclvalue(name),",as.PlainTextDocument)", sep = "")
#reuters <- tm_map(reuters, as.PlainTextDocument)
    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgPlain)
  }
}   

OKCancelHelp(window=dlgPlain, helpSubject="cPlain")

tkgrid(tklabel(dlgPlain,text="Enter a name of Corpus:"),entry.name, sticky="w")  
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

