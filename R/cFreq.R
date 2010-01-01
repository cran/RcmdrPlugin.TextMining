cFreq <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgFreq <- tktoplevel()
tkwm.title(dlgFreq,"Find frequent terms...")

#TDM name
name <- tclVar("test")
entry.name <- tkentry(dlgFreq,width="25", textvariable=name)


#Frequency
freqVal <- tclVar("")
entry.freq <- tkentry(dlgFreq,width="10", textvariable=freqVal)

#Create dictionary?
cbDict <- tkcheckbutton(dlgFreq)
cbValue <- tclVar("0")
tkconfigure(cbDict,variable=cbValue)

#Dictionary name
dict <- tclVar("test")
entry.dict <- tkentry(dlgFreq,width="25", textvariable=dict)
tkconfigure(entry.dict, state="disabled")

cbDict.state<-function(){
    cboValue<-tclvalue(cbValue)
    if(cboValue=="0") tkconfigure(entry.dict, state="normal")
    if(cboValue=="1") tkconfigure(entry.dict, state="disabled")
}
tkbind(cbDict,"<Button-1>",cbDict.state)



#Ok Cancel Help buttons
  onOK <- function(){
  a<-as.numeric(tclvalue(freqVal))
    if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name TermDocumentMatrix!")
            return()
           
            }
    else if (tclvalue(freqVal) == "" | is.na(a)) {
             tkmessageBox(title = "Eror", message = "You must enter frequency!")
              return()
            }
    
    else {
    temp <- strsplit(tclvalue(dict),";")
          cboValue <- tclvalue(cbValue)
         if (cboValue=="0"){
            txtCommand <- paste("findFreqTerms(",tclvalue(name),",",tclvalue(freqVal),")" , sep = "")
            #findFreqTerms(dtm, 5)
            
            doItAndPrint(txtCommand)
            #print(txtCommand)
            tkdestroy(dlgFreq)

         }else if (cboValue=="1"){
            #d <- Dictionary(c("prices", "crude", "oil"))) 
            txtCommand <- paste(tclvalue(dict),"<-Dictionary(findFreqTerms(",tclvalue(name),",",tclvalue(freqVal),"))", sep = "" )
            #txtCommand <- paste("findFreqTerms(",tclvalue(name),",",tclvalue(freq),")" , sep = "")
            
            doItAndPrint(txtCommand)
            #print(txtCommand)
            tkdestroy(dlgFreq)
        
         }
         
   }                    
  }

OKCancelHelp(window=dlgFreq, helpSubject="cFreq")

tkgrid(tklabel(dlgFreq,text="Enter a name of TermDocumentMatrix:"),entry.name, sticky="w")  
#tkgrid(tklabel(dlgFreq,text='Enter word:'),entry.word, sticky="w")         
tkgrid(tklabel(dlgFreq,text='Enter frequency (numeric):'),entry.freq, sticky="w")         
tkgrid(tklabel(dlgFreq,text="Create dictionary?"),cbDict, sticky="w")
tkgrid(tklabel(dlgFreq,text="Dictionary name"),entry.dict, sticky="w")
tkgrid(buttonsFrame, sticky="w",columnspan="2")
}

