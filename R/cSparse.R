cSparse <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgSparse <- tktoplevel()
tkwm.title(dlgSparse,"Remove sparse terms...")

#TDM name
name <- tclVar("test")
entry.name <- tkentry(dlgSparse,width="25", textvariable=name)


#Sparsity
tsparse <- tclVar("")
entry.tsparse <- tkentry(dlgSparse,width="10", textvariable=tsparse)


#Ok Cancel Help buttons
  onOK <- function(){
  a<-as.numeric(tclvalue(tsparse))
  #print(a)
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name TermDocumentMatrix!")
            return()            
           }
    else if (tclvalue(tsparse) == "" | is.na(a)) {
             tkmessageBox(title = "Eror", message = "You must enter sparsity!")  
              return()
            }    
    else {
    txtCommand <- paste("removeSparseTerms(",tclvalue(name),",",tclvalue(tsparse),")" , sep = "")
    #removeSparseTerms(tdm, 0.2)
    
    doItAndPrint(txtCommand)
    #print(txtCommand)
    tkdestroy(dlgSparse)    
   }                    
  }

OKCancelHelp(window=dlgSparse, helpSubject="cSparse")

tkgrid(tklabel(dlgSparse,text="Enter a name of TermDocumentMatrix:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgSparse,text='Enter sparsity (numeric):'),entry.tsparse, sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")
}

