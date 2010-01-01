cSFT <-
function()
{
require(tcltk)
require(tm)
#Creating dialog

dlgSFT <- tktoplevel()
tkwm.title(dlgSFT,"Full text search...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgSFT,width="25", textvariable=name)

#Pattern
pat.name <- tclVar("")
entry.pat <- tkentry(dlgSFT,width="10", textvariable=pat.name) 

#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
            
    }else if (tclvalue(pat.name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter pattern")
            return()
            }

    else {
    
    txtCommand <- paste(tclvalue(name),"<-tm_filter(",tclvalue(name),",pattern='",tclvalue(pat.name) ,"')", sep = "")
    # a <- tm_filter(ovid,pattern="qui")
    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgSFT)
    }                   
  }

OKCancelHelp(window=dlgSFT, helpSubject="cSFT")

tkgrid(tklabel(dlgSFT,text="Enter a name for Corpus:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgSFT,text="Enter pattern:"),entry.pat,sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")
}

