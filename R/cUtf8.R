cUtf8 <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgUtf8 <- tktoplevel()
tkwm.title(dlgUtf8,"Convert Encoding to UTF-8...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgUtf8,width="25", textvariable=name)
#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
    }        
    else {

    txtCommand <- paste(tclvalue(name)," <- tm_map(",tclvalue(name),",enc2utf8)", sep = "")
#reuters <- tm_map(reuters, as.PlainTextDocument) convert_UTF_8(crude[[1]])

    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgUtf8)
  }
}   

OKCancelHelp(window=dlgUtf8, helpSubject="cUtf8")

tkgrid(tklabel(dlgUtf8,text="Enter a name of Corpus:"),entry.name, sticky="w")  
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

