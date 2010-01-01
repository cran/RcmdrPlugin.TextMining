cAsoc <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgAsoc <- tktoplevel()
tkwm.title(dlgAsoc,"Find associations...")

#TDM name
name <- tclVar("test")
entry.name <- tkentry(dlgAsoc,width="25", textvariable=name)

#Word
word <- tclVar("")
entry.word <- tkentry(dlgAsoc,width="10", textvariable=word)

#Correlation
tcor <- tclVar("")
entry.tcor <- tkentry(dlgAsoc,width="10", textvariable=tcor)


#Ok Cancel Help buttons
  onOK <- function(){
  a<-as.numeric(tclvalue(tcor))
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name TermDocumentMatrix!")
            return()
            
    }else if (tclvalue(word) == "") {
            tkmessageBox(title = "Eror", message = "You must enter word!")
            return()
            }
    else if (tclvalue(tcor) == "" | is.na(a)) {
             tkmessageBox(title = "Eror", message = "You must enter correlation!")
              return()
            }
    
    else {
    temp <- strsplit(tclvalue(word),";")

    txtCommand <- paste("findAssocs(",tclvalue(name),",'",tclvalue(word), "',",tclvalue(tcor),")" , sep = "")
    #findAssocs(dtm, "opec", 0.8)
    doItAndPrint(txtCommand)
    #print(txtCommand)
    tkdestroy(dlgAsoc)    
   }                    
  }

OKCancelHelp(window=dlgAsoc, helpSubject="cAsoc")

tkgrid(tklabel(dlgAsoc,text="Enter a name of TermDocumentMatrix:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgAsoc,text='Enter word:'),entry.word, sticky="w")         
tkgrid(tklabel(dlgAsoc,text='Enter correlation (numeric):'),entry.tcor, sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")
}

