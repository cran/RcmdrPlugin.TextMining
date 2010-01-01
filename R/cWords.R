cWords <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgRemove <- tktoplevel()
tkwm.title(dlgRemove,"Removing words...")

#Corpus name
name <- tclVar("test")
entry.name <- tkentry(dlgRemove,width="25", textvariable=name)

#Stopwords file
stop.name <- tclVar("Stopwords file:")
entry.stop <- tkentry(dlgRemove,width="30", textvariable=stop.name) 
  onCoose <- function() 
  {
  tclvalue(stop.name) <- tkgetOpenFile()
  }
btnChoose <- ttkbutton(dlgRemove, text="...",command=onCoose)

#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name for Corpus!")
            return()
            
    }else if (tclvalue(stop.name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter stopwords file!")
            return()
            }

    else {
    fStop<- tclfile.tail(tclvalue(stop.name))
    txtCommand <- paste(tclvalue(name), ' <- tm_map(',tclvalue(name),',removeWords,stopwords("', (fStop), '"))', sep = "")
    #removeWords(crude[[1]], stopwords("english"))

    
    doItAndPrint(txtCommand)
    #print(txtCommand)
    tkdestroy(dlgRemove)

    }                   
  }

OKCancelHelp(window=dlgRemove, helpSubject="cWords")

tkgrid(tklabel(dlgRemove,text="Enter a name for Corpus:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgRemove,text="Choose Source file:"),entry.stop,btnChoose,sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")
 # T:\R-2.11.1\library\tm\stopwords\english     
}

