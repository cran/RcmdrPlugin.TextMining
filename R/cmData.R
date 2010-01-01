cmData <-
function()
{
require(tcltk)
require(tm)
#Creating dialog

dlgMeta <- tktoplevel()
tkwm.title(dlgMeta,"Corpus Meta Data...")

#Corpus name
name <- tclVar("Test")
entry.name <- tkentry(dlgMeta,width="30", textvariable=name)

#Meta data Tag
tag.name <- tclVar("Tag")
entry.tag <- tkentry(dlgMeta,width="30", textvariable=tag.name) 

#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
            
    }else if (tclvalue(tag.name) == "") {
                txtCommand <- paste("meta(",tclvalue(name),",type='corpus')", sep = "")
    		doItAndPrint(txtCommand)                                                                                               
    		#print(txtCommand)
    		tkdestroy(dlgMeta)
            }

    else {
    
    txtCommand <- paste("meta(",tclvalue(name),",tag='",tclvalue(tag.name),"',type='corpus')", sep = "")
    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgMeta)
    }                   
  }

OKCancelHelp(window=dlgMeta, helpSubject="cmData")

tkgrid(tklabel(dlgMeta,text="Enter a name for Corpus:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgMeta,text="Enter a tag:"),entry.tag,sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")
}

