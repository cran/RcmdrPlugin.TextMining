cDissDoc <-
function()
{
require(tcltk)
require(tm)
require(proxy)
#Creating dialog
dlgDissDoc <- tktoplevel()
tkwm.title(dlgDissDoc,"Finding Dissimilarity...")

#frame index of document
fraIndex<-tkframe(dlgDissDoc)

lname <- tclVar()
f<-tclVar("")
lblIndex<-tclVar("Enter document index [1 to 1")
lblText<-tklabel(fraIndex,text=tclvalue(lblIndex))
tkconfigure(lblText,textvariable=lblIndex)
#Corpus name
a<-ls(.GlobalEnv)
lbName<-tklistbox(dlgDissDoc,height=4,listvariable = lname, selectmode = "single", exportselection=0)
for (i in 1:length(a)){
c<-parse(text=paste("attr(",a[i],',"class")',sep=" "))
d<-eval(c)
#Populate listbox
if (!is.null(d[1]) ){
	if (d[1]=="VCorpus" | d[1]=="PCorpus" | d[1]=="Corpus")
  	tkinsert(lbName,"end",a[i])  	
 	f<-strsplit(tclvalue(lname)," ")
 	tkconfigure(lbName,height=length(f[[1]]))
 	tkselection.set(lbName,1)

	}
}
onClick <- function() {
	    pos <- as.numeric(tkcurselection(lbName))+1
	    h<-strsplit(tclvalue(lname)," ")
	    h<-h[[1]]
	    m<-h[[pos]]
	    k<-parse(text=m[1])
	tclvalue(lblIndex) <- paste("Enter document index [1 to ", length(eval(k)), "]:", sep="")

}
 	tkbind(lbName,"<ButtonRelease-1>",onClick)
 	tkbind(lbName,"<Configure>",onClick)
#first document index
f <- tclVar("")
entry.f <- tkentry(fraIndex,width="7", textvariable=f)

#Second document index
sec <- tclVar("")
entry.sec <- tkentry(fraIndex,width="7", textvariable=sec)

#Methods 
lstMethVar<- pr_DB$get_entry_names() 
tmp <- tclVar()
tclvalue(tmp) <- lstMethVar[21]
cboMeth <- ttkcombobox(dlgDissDoc, values=lstMethVar,textvariable=tmp )


#Ok Cancel Help buttons
  onOK <- function(){
  a<-as.numeric(tclvalue(f))
  b<-as.numeric(tclvalue(sec))
  
    if (tclvalue(f) == "" | is.na(a) | tclvalue(sec) == "" | is.na(b) ) {
            tkmessageBox(title = "Eror", message = "You must enter index of documents")
            return()
    }else {
    pos <- as.numeric(tkcurselection(lbName))+1
    	    h<-strsplit(tclvalue(lname)," ")
    	    h<-h[[1]]
    	    m<-h[[pos]]
    
    txtCommand <- paste("dissimilarity(",m, "[[",tclvalue(f),"]],",m, "[[",tclvalue(sec),"]],method='",tclvalue(tmp),"')", sep = "")
    #dissimilarity(crude[[1]], crude[[2]], method = "eJaccard")

    doItAndPrint(txtCommand)                                                                                               
    #print(txtCommand)
    tkdestroy(dlgDissDoc)
  }
}
OKCancelHelp(window=dlgDissDoc, helpSubject="cDissDoc")

tkgrid(tklabel(dlgDissDoc,text="Choose corpus:"),lbName, sticky="w")  
tkgrid(lblText,entry.f,entry.sec,sticky="w")         
tkgrid(fraIndex,sticky="w",columnspan="2")         
tkgrid(tklabel(dlgDissDoc,text="Choose Method:"),cboMeth,sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")

}

