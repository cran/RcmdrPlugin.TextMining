cDict <-
function()
{
require(tcltk)
require(tm)
#Creating dialog
dlgDict <- tktoplevel()
tkwm.title(dlgDict,"Creating Dictionary...")
#Dictionary name
name <- tclVar("test")
entry.name <- tkentry(dlgDict,width="25", textvariable=name)


#Words
words <- tclVar("")
entry.words <- tkentry(dlgDict,width="40", textvariable=words)

#Ok Cancel Help buttons
  onOK <- function(){
     if (tclvalue(name) == "") {
            tkmessageBox(title = "Eror", message = "You must enter name for dictionary!")
            return()
                 
      }else if (tclvalue(words) == "") {
      tkmessageBox(title = "Eror", message = "You must enter words!")
       return()
       }
    else {
    temp <- strsplit(tclvalue(words),";")

    txtCommand <- paste("Dictionary(",temp,")" , sep = "")
    #d <- Dictionary(c("prices", "crude", "oil")))
    doItAndPrint(txtCommand)
    #print(txtCommand)
    tkdestroy(dlgDict)    
   }                    
  }

OKCancelHelp(window=dlgDict, helpSubject="cDict")
tkgrid(tklabel(dlgDict,text="Enter a name for dictionary:"),entry.name, sticky="w")  
tkgrid(tklabel(dlgDict,text='Enter words separated by ";"  :'),entry.words, sticky="w")         
tkgrid(buttonsFrame, sticky="w",columnspan="2")
}

