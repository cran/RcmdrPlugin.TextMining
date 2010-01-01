cDelete <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgDelete <- tktoplevel()
tkwm.title(dlgDelete,"Delete Corpus...")

#Corpus name
a<-ls(.GlobalEnv)
name <- tclVar()
lbName<-tklistbox(dlgDelete,height=4,listvariable = name, selectmode = "single")
for (i in 1:length(a)){
c<-parse(text=paste("attr(",a[i],',"class")',sep=" "))
d<-eval(c)
if (!is.null(d[1]) ){
if (d[1]=="VCorpus")
  tkinsert(lbName,"end",a[i])
  f<-strsplit(tclvalue(name)," ")
  tkconfigure(lbName,height=length(f[[1]]))
}
}


#Ok Cancel Help buttons
  onOK <- function(){
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name of Corpus!")
            return()
    }        
    else {
    g<-f[[1]]
    pos <- as.numeric(tkcurselection(lbName))+1
    txtCommand <- paste("rm(",g[[pos]],")", sep = "")
    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgDelete)
  }
}   

OKCancelHelp(window=dlgDelete, helpSubject="cDelete")

tkgrid(tklabel(dlgDelete,text="Enter a name of Corpus:"),lbName, sticky="nw")  
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

