rsSource <-
function()
{
require(tcltk)
require(tm)
require(XML)
#Creating dialog
dlgReuters <- tktoplevel()
tkwm.title(dlgReuters,"Creating ReutersSource...")

#Corpus name
name <- tclVar("rsCorpus")
entry.name <- tkentry(dlgReuters,width="25", textvariable=name)

#URL of gmane directory
rs.name <- tclVar("Source file:")
entry.rs <- tkentry(dlgReuters,width="30", textvariable=rs.name) 
  onCoose <- function() 
  {
  tclvalue(rs.name) <- tkgetOpenFile()
  }
btnChoose <- ttkbutton(dlgReuters, text="...",command=onCoose)

#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name for Corpus!")
            return()
            
    }else if (tclvalue(rs.name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter source!")
            return()
            }

    else {
    txtCommand <- paste(tclvalue(name), ' <- Corpus(ReutersSource("', tclvalue(rs.name), '"))', sep = "")
    
    
    doItAndPrint(txtCommand)
    tkdestroy(dlgReuters)

    }                   
  }

OKCancelHelp(window=dlgReuters, helpSubject="rsSource")

tkgrid(tklabel(dlgReuters,text="Enter a name for Corpus:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgReuters,text="Choose Source file:"),entry.rs,btnChoose,sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")
 # C:/Program Files/R/R-2.11.1/library/tm/texts/reuters-21578.xml     
}

