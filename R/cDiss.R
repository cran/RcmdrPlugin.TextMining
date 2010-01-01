cDiss <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgDiss <- tktoplevel()
tkwm.title(dlgDiss,"Finding Dissimilarity...")

#TermDocumentMatrix name
name <- tclVar("Test")
entry.name <- tkentry(dlgDiss,width="25", textvariable=name)

#Methods 
lstMethVar<- pr_DB$get_entry_names() 
tmp <- tclVar()
tclvalue(tmp) <- lstMethVar[21]
cboMeth <- ttkcombobox(dlgDiss, values=lstMethVar,textvariable=tmp )

#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of TermDocumentMatrix!")
            return()
    }        
    else {

    txtCommand <- paste("dissimilarity(",tclvalue(name),",method='",tclvalue(tmp),"')", sep = "")
    #dissimilarity(tdm, method = "cosine")

    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgDiss)
  }
}   

OKCancelHelp(window=dlgDiss, helpSubject="cDiss")

tkgrid(tklabel(dlgDiss,text="Enter a name of Term Document Matrix:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgDiss,text="Choose Method:"),cboMeth,sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

