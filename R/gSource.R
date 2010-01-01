gSource <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgGmane <- tktoplevel()
tkwm.title(dlgGmane,"Creating GmaneSource...")

#Corpus name
name <- tclVar("gCorpus")
entry.name <- tkentry(dlgGmane,width="25", textvariable=name)

#URL of gmane directory
url.name <- tclVar("Addres of source:")
entry.url <- tkentry(dlgGmane,width="30", textvariable=url.name) 


#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name for Corpus!")
            return()
            
    }else if (tclvalue(url.name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter URL of source!")
            return()
            }

    else {
    txtCommand <- paste(tclvalue(name), ' <- Corpus(GmaneSource("', tclvalue(url.name), '"))', sep = "")
    
    doItAndPrint(txtCommand)
    tkdestroy(dlgGmane)
    }                   
  }

OKCancelHelp(window=dlgGmane, helpSubject="gSource")

tkgrid(tklabel(dlgGmane,text="Enter a name for Corpus:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgGmane,text="Choose URL of source:"),entry.url,sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")
 # http://rss.gmane.org/gmane.comp.lang.r.general
}

