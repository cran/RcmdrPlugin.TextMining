TDM <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgTDM <- tktoplevel()
tkwm.title(dlgTDM,"Creating TermDocumentMatrix...")

#TDM name
tdm.name <- tclVar("test")
entry.tdm <- tkentry(dlgTDM,width="20", textvariable=tdm.name)

#Corpus name
name <- tclVar("test")
entry.name <- tkentry(dlgTDM,width="20", textvariable=name)

#Type of TermDocumentMatrix
fraTDM <- tkframe(dlgTDM, relief="groove",borderwidth=2)
rbTDM <- tkradiobutton(fraTDM)
rbDTM <- tkradiobutton(fraTDM)
rbValue <- tclVar("TermDocumentMatrix")
tkconfigure(rbTDM,variable=rbValue,value="TermDocumentMatrix")
tkconfigure(rbDTM,variable=rbValue,value="DocumentTermMatrix")

#Weighting type
fraWeight <- tkframe(dlgTDM,relief="groove",borderwidth=2)
rbWbin <- tkradiobutton(fraWeight)
rbWtf <- tkradiobutton(fraWeight)
rbWTfIdf <- tkradiobutton(fraWeight)

rbWValue <- tclVar("weightBin")
tkconfigure(rbWbin,variable=rbWValue,value="weightBin")
tkconfigure(rbWtf,variable=rbWValue,value="weightTf")
tkconfigure(rbWTfIdf,variable=rbWValue,value="weightTfIdf")


#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name for Corpus!")
            return()
            
    }else {
    txtCommand <- paste(tclvalue(tdm.name), " <- ", tclvalue(rbValue),"(", tclvalue(name), ",control=list(weighting =", tclvalue(rbWValue)," ))", sep = "")
#tdm <- TermDocumentMatrix(crude, control = list(weighting = weightTfIdf
    doItAndPrint(txtCommand)
    #print(txtCommand)
    tkdestroy(dlgTDM)    
    }                   
  }

OKCancelHelp(window=dlgTDM, helpSubject="TDM")
tkgrid(tklabel(fraTDM,text="Specify type of TermDocumentMatrix",foreground="blue"),columnspan="2")
tkgrid(tklabel(fraTDM,text="TermDocumentMatrix"),rbTDM,sticky="e")
tkgrid(tklabel(fraTDM,text="DocumentTermMatrix"),rbDTM,sticky="e")
tkgrid(tklabel(fraTDM,text=" "))

tkgrid(tklabel(fraWeight,text="Specify weighting type",foreground="blue"),columnspan="2")
tkgrid(tklabel(fraWeight,text="weightBin"),rbWbin,sticky="e")
tkgrid(tklabel(fraWeight,text="weightTf"),rbWtf,sticky="e")
tkgrid(tklabel(fraWeight,text="weightTfIdf"),rbWTfIdf,sticky="e")


tkgrid(tklabel(dlgTDM,text="Enter a name for TermDocumentMatrix:"),entry.tdm, sticky="w")
tkgrid(tklabel(dlgTDM,text="Enter a name of Corpus:"),entry.name, sticky="w")
tkgrid(tklabel(dlgTDM,text=" "))
tkgrid(fraTDM,fraWeight,sticky="n")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

