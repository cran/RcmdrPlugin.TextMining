\name{RcmdrPlugin.TextMining-package}
\alias{RcmdrPlugin.TextMining-package}
\alias{RcmdrPlugin.TextMining}
\docType{package}
\title{
R-Commander plugin package that provide GUI for (tm) package
}
\description{
  The plugin adds a TexMining menu to the R-Commander. This plugin provide GUI for demontstrating
  functions for use in text mining using package {tm}

  The plugin is currently a beta version. You are welcome to report any bug or inconvenience.
  }
\section{Remark for Windows users}{
  John Fox, the author of R-Commander, has suggested to install R-Commander with the
  SDI (Single Document Interface) mode, and he also described how to change MDI to SDI,
  if R has been installed in the wrong mode.
  }


\details{
\tabular{ll}{
Package: \tab RcmdrPlugin.TextMining\cr
Type: \tab Package\cr
Version: \tab 1.0\cr
Date: \tab 2010-08-13\cr
License: \tab Artistic-2.0\cr
LazyLoad: \tab yes\cr
}
 Menu tree for RcmdrPlugin.TextMining\cr
\tabular{lll}{
TextMining \tab - Delete corpus ...\cr
\tab	  |- Plot ...\cr
\tab	  |- Create Corpus \tab - Create DirSource...\cr
\tab	  |\tab		  |- Create GmaneSource...\cr
\tab	  |\tab		  |- Create ReutersSource...\cr
\tab	  |- Edit Corpus \tab - Meta Data...\cr
\tab	  |\tab		|- Write Corpus...\cr
\tab	  |\tab		|- Make Chunks...\cr
\tab	  |\tab		|- Inspect Corpus...\cr
\tab	  |\tab		|- Corpus Summary...\cr
\tab	  |- Transformations \tab - To plain text documents...\cr
\tab	  |\tab		    |- Convert to UTF-8...\cr
\tab	  |\tab		    |- Remove numbers...\cr
\tab	  |\tab		    |- Remove punctuation...\cr
\tab	  |\tab		    |- Remove words...\cr
\tab	  |\tab		    |- Stem documents...\cr
\tab	  |\tab		    |- Strip whitespaces...\cr
\tab	  |\tab		    |- Convert to lowercase...\cr
\tab	  |- Filters \tab - Search full text...\cr
\tab	  |\tab	    |- Intersection...\cr
\tab	  |- TermDocumentMatrix  \tab - Create TermDocumentMatrix...\cr
\tab	  |\tab			|- Creating dictionary...\cr
\tab	  |\tab			|- Find associations...\cr
\tab	  |\tab			|- Find frequent terms...\cr
\tab	  |\tab			|- Remove sparse terms...\cr
\tab	  |- Dissimilarity \tab - For TermDocumentMatrix...\cr
\tab	  |\tab		  |- For text documents...\cr
	  }
}
\author{
Dzemil Lushija

Maintainer: Dzemil Lushija \email{dzemill@gmail.com}
}
\references{
You can find additional information about text mining package on <\url{http://cran.r-project.org/web/packages/tm/vignettes/tm.pdf}> and <\url{http://www.jstatsoft.org/v25/i05/paper}>.
}
\keyword{ package }
