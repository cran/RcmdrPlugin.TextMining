cPlot <-
function() {
#require(Rgraphviz)
initializeDialog(title=gettextRcmdr("Plot TermDocumentMatrix"),preventCrisp=TRUE)
    nameVar <- tclVar("tdm")
    nameEntry <- tkentry(top, width="25", textvariable=nameVar)
    treshVar <- tclVar("0.7")
    treshEntry <- tkentry(top, width="6", textvariable=treshVar)
    weightingVar <- tclVar("1")
    weightingBox <- tkcheckbutton(top, variable=weightingVar)
    graphAttr <- tclVar("")
    clustAttr <- tclVar("")
    nodeAttr <- tclVar("")
    edgeAttr <- tclVar("")
cColor <- c("","white","black","red","turquoise","sienna")
cRank <- c("","same","min","source","max","sink")
cDir <- c("","normal","inv","dot","empty")

selectGraphAttribute <- function() {
	initializeDialog(subdialog, title=gettextRcmdr("Specify Graph attributes"))
	#Background color
	bgColorComboVal <- cColor
	tmpBg <- tclVar()
	tclvalue(tmpBg) <- bgColorComboVal[1]
	bgColorCombo <- ttkcombobox(subdialog, values=bgColorComboVal, textvariable=tmpBg)
	#Font color
	fontColorComboVal <- cColor
	tmpfont <- tclVar()
	tclvalue(tmpfont) <- bgColorComboVal[1]
	fontColorCombo <- ttkcombobox(subdialog, values=fontColorComboVal, textvariable=tmpfont )
	#Ratio
	ratioComboVal <- c("","fill","compress","expand", "auto")
	tmpratio <- tclVar()
	tclvalue(tmpratio) <- ratioComboVal[1]
	ratioCombo <- ttkcombobox(subdialog, values=ratioComboVal, textvariable=tmpratio )
	ratioVar <- tclVar("0.5")
	ratioEntry <- tkentry(subdialog, width="6", textvariable=ratioVar)
	#Overlap
	overlapComboVal <- c("","true","scale","false")
	tmpoverlap <- tclVar()
	tclvalue(tmpoverlap) <- overlapComboVal[1]
	overlapCombo <- ttkcombobox(subdialog, values=overlapComboVal, textvariable=tmpoverlap )
	# Spline
	splineVar <- tclVar("1")
	splineBox <- tkcheckbutton(subdialog, variable=splineVar)
	#Rank
	rankComboVal <- cRank
	tmprank <- tclVar()
	tclvalue(tmprank) <- rankComboVal[1]
	rankCombo <- ttkcombobox(subdialog, values=rankComboVal, textvariable=tmprank )
	#Size
	sizeVar <- tclVar("7,7")
	sizeEntry <- tkentry(subdialog, width="6", textvariable=sizeVar)
	#Rank direction
	rankDirComboVal <- c("","TB", "LR", "BT", "RL")
	tmprankDir <- tclVar()
	tclvalue(tmprankDir) <- rankDirComboVal[1]
	rankDirCombo <- ttkcombobox(subdialog, values=rankDirComboVal, textvariable=tmprankDir )

	#node = list(label = "foo", fillcolor = "lightgreen"),


		onOKsub <- function() {
		closeDialog(subdialog)
		rat <- tclVar("")
		if (!is.na(as.numeric(tclvalue(ratioVar)))){
		rat <- ratioVar
		}else{
		rat <- tmpratio
		}
		graphAttr <- paste("graph = list(bgcolor='", tclvalue(tmpBg),"',fontcolor='",tclvalue(tmpfont),"',ratio='",tclvalue(rat),
		 "',overlap='",tclvalue(tmpoverlap),"',splines=",as.logical(as.numeric(tclvalue(splineVar))),",rank='",tclvalue(tmprank),
		 "',size='",tclvalue(sizeVar),"',rankdir='",tclvalue(tmprankDir),"')", sep="")
		#print(graphAttr)
		tclvalue(graphAttrVar) <- graphAttr
		tkconfigure(graphAttrEntry,textvariable=graphAttrVar)
		}


	subOKCancelHelp()
	tkgrid(tklabel(subdialog, text="Choose background color"), bgColorCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose font color"), fontColorCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose ratio"), ratioCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="or enter ratio value"),ratioEntry, sticky="e")
	tkgrid(tklabel(subdialog, text="Overlap?"), overlapCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Spline"), splineBox, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose rank"), rankCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Enter size of graph (x,y)"), sizeEntry, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose rank direction"), rankDirCombo, sticky="e")

  tkgrid(subButtonsFrame, sticky="w",columnspan=3)
	tkgrid.configure(bgColorCombo, sticky="w")
	tkgrid.configure(fontColorCombo, sticky="w")
	tkgrid.configure(ratioCombo, sticky="w")
	tkgrid.configure(ratioEntry, sticky="w")
  tkgrid.configure(overlapCombo, sticky="w")
  tkgrid.configure(splineBox, sticky="w")
  tkgrid.configure(rankCombo, sticky="w")
  tkgrid.configure(sizeEntry, sticky="w")
  tkgrid.configure(rankDirCombo, sticky="w")

dialogSuffix(subdialog, focus=subdialog, onOK=onOKsub)
}

selectClustAttribute <- function() {
	initializeDialog(subdialog, title=gettextRcmdr("Specify Cluster attributes"))
	#Background color
	bgColorComboVal <- cColor
	tmpBg <- tclVar()
	tclvalue(tmpBg) <- bgColorComboVal[1]
	bgColorCombo <- ttkcombobox(subdialog, values=bgColorComboVal, textvariable=tmpBg)
	# color
	colorComboVal <- cColor
	tmpColor <- tclVar()
	tclvalue(tmpColor) <- colorComboVal[1]
	colorCombo <- ttkcombobox(subdialog, values=colorComboVal, textvariable=tmpColor)
	#Rank
	rankComboVal <- cRank
	tmprank <- tclVar()
	tclvalue(tmprank) <- rankComboVal[1]
	rankCombo <- ttkcombobox(subdialog, values=rankComboVal, textvariable=tmprank )

		onOKsub <- function() {
		closeDialog(subdialog)
		clustAttr <- paste("cluster = list(bgcolor='", tclvalue(tmpBg),"',color='", tclvalue(tmpColor),"',rank='",tclvalue(tmprank),"')", sep="")
		#print(clustAttr)
		tclvalue(clustAttrVar) <- clustAttr
		tkconfigure(clustAttrEntry,textvariable=clustAttrVar)

		}

	subOKCancelHelp()
	tkgrid(tklabel(subdialog, text="Choose background color"), bgColorCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose cluster color"), colorCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose rank"), rankCombo, sticky="e")


  	tkgrid(subButtonsFrame, sticky="w",columnspan=3)
	tkgrid.configure(bgColorCombo, sticky="w")
	tkgrid.configure(colorCombo, sticky="w")
  	tkgrid.configure(rankCombo, sticky="w")
dialogSuffix(subdialog, focus=subdialog, onOK=onOKsub)
}

selectNodeAttribute <- function() {
	initializeDialog(subdialog, title=gettextRcmdr("Specify Node attributes"))
	#Node shape
	shapeComboVal <- c("box","polygon","ellipse","circle","point","egg","triangle","plaintext","diamond","trapezium","parallelogram","house","pentagon","hexagon","septagon","octagon","doublecircle","doubleoctagon","tripleoctagon","invtriangle invtrapezium","invhouse","Mdiamond","Msquare","Mcircle","rect","rectangle")
	tmpShape <- tclVar()
	tclvalue(tmpShape) <- shapeComboVal[1]
	shapeCombo <- ttkcombobox(subdialog, values=shapeComboVal, textvariable=tmpShape)
	#Fixed size?
	fsVar <- tclVar("1")
	fsBox <- tkcheckbutton(subdialog, variable=fsVar)
	#Node fillcolor
	fillColorComboVal <- cColor
	tmpFillColor <- tclVar()
	tclvalue(tmpFillColor) <- fillColorComboVal[1]
	fillColorCombo <- ttkcombobox(subdialog, values=fillColorComboVal, textvariable=tmpFillColor)
	#Node label
	labelComboVal <- c("\\\\N","\\\\G","\\\\T","\\\\H" )
	tmpLabel <- tclVar()
	tclvalue(tmpLabel) <- labelComboVal[1]
	labelCombo <- ttkcombobox(subdialog, values=labelComboVal, textvariable=tmpLabel)
	# Node color
	colorComboVal <- cColor
	tmpColor <- tclVar()
	tclvalue(tmpColor) <- colorComboVal[1]
	colorCombo <- ttkcombobox(subdialog, values=colorComboVal, textvariable=tmpColor)
	# Node font color
	fColorComboVal <- cColor
	tmpfColor <- tclVar()
	tclvalue(tmpfColor) <- fColorComboVal[1]
	fColorCombo <- ttkcombobox(subdialog, values=fColorComboVal, textvariable=tmpfColor)
	#Font size
	fSizeVar <- tclVar("14")
	fSizeEntry <- tkentry(subdialog, width="6", textvariable=fSizeVar)
	#Node height
	heightVar <- tclVar("0.2")
	heightEntry <- tkentry(subdialog, width="6", textvariable=heightVar)
	#Node width
	widthVar <- tclVar("0.5")
	widthEntry <- tkentry(subdialog, width="6", textvariable=widthVar)



		onOKsub <- function() {
		closeDialog(subdialog)
		nodeAttr <- paste("node = list(shape='", tclvalue(tmpShape),"',fixedsize=", as.logical(as.numeric(tclvalue(fsVar))),",fillcolor='",tclvalue(tmpFillColor),
		"',label='",tclvalue(tmpLabel),"',color='",tclvalue(tmpColor),"',fontcolor='",tclvalue(tmpfColor),"',fontsize='",as.numeric(tclvalue(fSizeVar)),
		"',height='",as.numeric(tclvalue(heightVar)),"',width='",as.numeric(tclvalue(widthVar)),"')", sep="")
		#print(nodeAttr)
		tclvalue(nodeAttrVar) <- nodeAttr
		tkconfigure(nodeAttrEntry,textvariable=nodeAttrVar)

		}

	subOKCancelHelp()
	tkgrid(tklabel(subdialog, text="Choose node shape"), shapeCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Fixed size?"), fsBox, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose node fillcolor"), fillColorCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose node label"), labelCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose node color"), colorCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose node font color"), fColorCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose node font size"), fSizeEntry, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose node height"), heightEntry, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose node width"), widthEntry, sticky="e")


  	tkgrid(subButtonsFrame, sticky="w",columnspan=3)
	tkgrid.configure(colorCombo, sticky="w")
	tkgrid.configure(fsBox, sticky="w")
	tkgrid.configure(fillColorCombo, sticky="w")
	tkgrid.configure(labelCombo, sticky="w")
	tkgrid.configure(colorCombo, sticky="w")
	tkgrid.configure(fColorCombo, sticky="w")
	tkgrid.configure(fSizeEntry, sticky="w")
	tkgrid.configure(heightEntry, sticky="w")
	tkgrid.configure(widthEntry, sticky="w")

dialogSuffix(subdialog, focus=subdialog, onOK=onOKsub)
}

selectEdgeAttribute <- function() {
	initializeDialog(subdialog, title=gettextRcmdr("Specify Edge attributes"))
	# Edge color
	colorComboVal <- cColor
	tmpColor <- tclVar()
	tclvalue(tmpColor) <- colorComboVal[1]
	colorCombo <- ttkcombobox(subdialog, values=colorComboVal, textvariable=tmpColor)
	#direction
	dirComboVal <- cDir
	tmpDir <- tclVar()
	tclvalue(tmpDir) <- dirComboVal[1]
	dirCombo <- ttkcombobox(subdialog, values=dirComboVal, textvariable=tmpDir)
	#weight
	weightVar <- tclVar("1.0")
	weightEntry <- tkentry(subdialog, width="6", textvariable=weightVar)
	#Edge label
	labelComboVal <- c("\\\\N","\\\\G","\\\\T","\\\\H" )
	tmpLabel <- tclVar()
	tclvalue(tmpLabel) <- labelComboVal[1]
	labelCombo <- ttkcombobox(subdialog, values=labelComboVal, textvariable=tmpLabel)
	# Edge font color
	fColorComboVal <- cColor
	tmpfColor <- tclVar()
	tclvalue(tmpfColor) <- fColorComboVal[1]
	fColorCombo <- ttkcombobox(subdialog, values=fColorComboVal, textvariable=tmpfColor)
	#arrowhead
	aHeadComboVal <- cDir
	tmpaHead <- tclVar()
	tclvalue(tmpaHead) <- aHeadComboVal[1]
	aHeadCombo <- ttkcombobox(subdialog, values=aHeadComboVal, textvariable=tmpaHead)
	#arrowtail
	aTailComboVal <- cDir
	tmpaTail <- tclVar()
	tclvalue(tmpaTail) <- aTailComboVal[1]
	aTailCombo <- ttkcombobox(subdialog, values=aTailComboVal, textvariable=tmpaTail)
	#Font size
	fSizeVar <- tclVar("14")
	fSizeEntry <- tkentry(subdialog, width="6", textvariable=fSizeVar)
	#Label Font size
	lfSizeVar <- tclVar("14")
	lfSizeEntry <- tkentry(subdialog, width="6", textvariable=lfSizeVar)
	#arrowsize
	arrowsizeVar <- tclVar("1.0")
	arrowsizeEntry <- tkentry(subdialog, width="6", textvariable=arrowsizeVar)
	#Edge style
	styleComboVal <- c("dashed", "dotted", "solid", "invis","bold" )
	tmpStyle <- tclVar()
	tclvalue(tmpStyle) <- styleComboVal[3]
	styleCombo <- ttkcombobox(subdialog, values=styleComboVal, textvariable=tmpStyle)
	#minlen
	minlenVar <- tclVar("14")
	minlenEntry <- tkentry(subdialog, width="6", textvariable=minlenVar)


		onOKsub <- function() {
		closeDialog(subdialog)
		edgeAttr <- paste("edge = list(color='", tclvalue(tmpColor),"',dir='", tclvalue(tmpDir),"',weight='",tclvalue(weightVar),
		"',label='",tclvalue(tmpLabel),"',fontcolor='",tclvalue(tmpfColor),"',arrowhead='",tclvalue(tmpaHead),"',arrowtail='",tclvalue(tmpaTail),
		"',fontsize='",as.numeric(tclvalue(fSizeVar)),"',labelfontsize='",as.numeric(tclvalue(lfSizeVar)),
		"',arrowsize='",as.numeric(tclvalue(arrowsizeVar)),"',style='",tclvalue(tmpStyle),"',minlen='",as.numeric(tclvalue(minlenVar)),"')", sep="")
		#print(edgeAttr)
		tclvalue(edgeAttrVar) <- edgeAttr
		tkconfigure(edgeAttrEntry,textvariable=edgeAttrVar)

		}

	subOKCancelHelp()
	tkgrid(tklabel(subdialog, text="Choose edge color"), colorCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose directing"), dirCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Enter weight"), weightEntry, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose label"), labelCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose font color"), fColorCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose arrowhead"), aHeadCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Choose arrowtail"), aTailCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Enter font size"), fSizeEntry, sticky="e")
	tkgrid(tklabel(subdialog, text="Enter label font size"), lfSizeEntry, sticky="e")
	tkgrid(tklabel(subdialog, text="Enter arrowsize"), arrowsizeEntry, sticky="e")
	tkgrid(tklabel(subdialog, text="Enter arrowsize"), styleCombo, sticky="e")
	tkgrid(tklabel(subdialog, text="Enter arrowsize"), minlenEntry, sticky="e")

  tkgrid(subButtonsFrame, sticky="w",columnspan=3)
	tkgrid.configure(colorCombo, sticky="w")
	tkgrid.configure(dirCombo, sticky="w")
	tkgrid.configure(weightEntry, sticky="w")
	tkgrid.configure(labelCombo, sticky="w")
	tkgrid.configure(fColorCombo, sticky="w")
	tkgrid.configure(aHeadCombo, sticky="w")
	tkgrid.configure(aTailCombo, sticky="w")
	tkgrid.configure(fSizeEntry, sticky="w")
	tkgrid.configure(lfSizeEntry, sticky="w")
	tkgrid.configure(arrowsizeEntry, sticky="w")
	tkgrid.configure(styleCombo, sticky="w")
	tkgrid.configure(minlenEntry, sticky="w")
dialogSuffix(subdialog, focus=subdialog, onOK=onOKsub)
}


    graphAttrVar <- tclVar("graph=list()")
    graphAttrEntry <- tkentry(top, width="50", textvariable=graphAttrVar)
    graphButton <- tkbutton(top, text=gettextRcmdr("  Graph attributes"), foreground="red",relief="groove", command=selectGraphAttribute)

    clustAttrVar <- tclVar("cluster=list()")
    clustAttrEntry <- tkentry(top, width="50", textvariable=clustAttrVar)
    clustButton <- tkbutton(top, text=gettextRcmdr("Cluster attributes"), foreground="red",relief="groove", command=selectClustAttribute)

    nodeAttrVar <- tclVar("node=list()")
    nodeAttrEntry <- tkentry(top, width="50", textvariable=nodeAttrVar)
    nodeButton <- tkbutton(top, text=gettextRcmdr("   Node attributes"), foreground="red",relief="groove", command=selectNodeAttribute)

    edgeAttrVar <- tclVar("edge=list()")
    edgeAttrEntry <- tkentry(top, width="50", textvariable=edgeAttrVar)
    edgeButton <- tkbutton(top, text=gettextRcmdr("   Edge attributes"), foreground="red",relief="groove", command=selectEdgeAttribute)


onOK <- function(){
        closeDialog()
        txtCommand <- paste("plot(",tclvalue(nameVar),",corThreshold = ",as.numeric(tclvalue(treshVar)),",weighting=",as.logical(as.numeric(tclvalue(weightingVar))),
        ",attrs = list(",tclvalue(graphAttrVar),",",tclvalue(clustAttrVar),",",tclvalue(nodeAttrVar),",",tclvalue(edgeAttrVar),"))",sep="")
        #print(tclvalue(graphAttrVar))
        #plot(x,terms = sample(Terms(x), 20),corThreshold = 0.7,weighting = FALSE,attrs = list(
        #print(txtCommand)
        doItAndPrint(txtCommand)
    }


    OKCancelHelp(helpSubject="cPlot")
    tkgrid(tklabel(top, text="Enter Term Document Matrix name"), nameEntry, sticky="e")
    tkgrid(tklabel(top, text="Enter treshold"), treshEntry, sticky="e")
    tkgrid(tklabel(top, text="Weighting"), weightingBox, sticky="e")
    tkgrid(graphButton,graphAttrEntry,sticky="e")
    tkgrid(clustButton,clustAttrEntry,sticky="e")
    tkgrid(nodeButton,nodeAttrEntry,sticky="e")
    tkgrid(edgeButton,edgeAttrEntry,sticky="e")

    tkgrid(buttonsFrame, sticky="w", columnspan=2)
    tkgrid.configure(nameEntry, sticky="w")
    tkgrid.configure(treshEntry, sticky="w")
    tkgrid.configure(weightingBox, sticky="w")
    tkgrid.configure(graphAttrEntry,sticky="w")
    tkgrid.configure(clustAttrEntry,sticky="w")
    tkgrid.configure(nodeAttrEntry,sticky="w")
    tkgrid.configure(edgeAttrEntry,sticky="w")





#dialogSuffix(rows=8, columns=3, preventGrabFocus=TRUE)
}

