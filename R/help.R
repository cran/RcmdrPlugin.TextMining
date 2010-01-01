#Theese two functions is adapted from Rcomander package writen by John Fox <jfox@mcmaster.ca>

helpAbout <- function() {
	if (as.numeric(R.Version()$major) >= 2) print(help("RcmdrPlugin.TextMining-package"))
	else help("RcmdrPlugin.TextMining-package")
}

manual <- function() {
	browseURL(paste(file.path(.path.package(package="RcmdrPlugin.TextMining")[1], "doc"),
			"/", gettextRcmdr("RcmdrPlugin.TextMining-manual"), ".pdf", sep=""))
}