% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_and_reporting.R
\name{umxSummaryGxE}
\alias{umxSummaryGxE}
\alias{umxSummary.MxModelGxE}
\title{Summarize a GxE model}
\usage{
umxSummaryGxE(
  model = NULL,
  digits = 2,
  xlab = NA,
  location = "topleft",
  separateGraphs = FALSE,
  file = getOption("umx_auto_plot"),
  returnStd = NULL,
  std = NULL,
  reduce = FALSE,
  CIs = NULL,
  report = c("markdown", "html"),
  show = NULL,
  ...
)
}
\arguments{
\item{model}{A fitted \code{\link[=umxGxE]{umxGxE()}} model to summarize}

\item{digits}{round to how many digits (default = 2)}

\item{xlab}{label for the x-axis of plot}

\item{location}{default = "topleft"}

\item{separateGraphs}{If TRUE, both std and raw plots in one figure (default FALSE)}

\item{file}{The name of the dot file to write: NA = none; "name" = use the name of the model}

\item{returnStd}{Whether to return the standardized form of the model (default = FALSE)}

\item{std}{Whether to show the standardized model (not implemented! TRUE)}

\item{reduce}{Whether run and tabulate a complete model reduction...(Defaults to FALSE)}

\item{CIs}{Confidence intervals (FALSE)}

\item{report}{"markdown" or "html" = open a browser for copyable tables}

\item{show}{not doing anything yet (required for all summary functions)}

\item{...}{Optional additional parameters}
}
\value{
\itemize{
\item optional \code{\link[=mxModel]{mxModel()}}
}
}
\description{
Summarize a genetic moderation model, as returned by \code{\link[=umxGxE]{umxGxE()}}. Prints graphs of A, C, and E, standardized and raw.
}
\details{
Note: see also \code{\link[=umxReduce]{umxReduce()}} which knows how to reduce a GxE model.
}
\examples{
# The total sample has been subdivided into a young cohort, 
# aged 18-30 years, and an older cohort aged 31 and above.
# Cohort 1 Zygosity is coded as follows 1 == MZ females 2 == MZ males 
# 3 == DZ females 4 == DZ males 5 == DZ opposite sex pairs
require(umx)
data(twinData) 
twinData$age1 = twinData$age2 = twinData$age
selDVs  = c("bmi1", "bmi2")
selDefs = c("age1", "age2")
selVars = c(selDVs, selDefs)
mzData  = subset(twinData, zygosity == "MZFF", selVars)
dzData  = subset(twinData, zygosity == "DZMM", selVars)
# Exclude cases with missing Def
mzData = mzData[!is.na(mzData[selDefs[1]]) & !is.na(mzData[selDefs[2]]),]
dzData = dzData[!is.na(dzData[selDefs[1]]) & !is.na(dzData[selDefs[2]]),]
\dontrun{
m1 = umxGxE(selDVs = selDVs, selDefs = selDefs, dzData = dzData, mzData = mzData)
# Plot Moderation
umxSummaryGxE(m1)
umxSummaryGxE(m1, location = "topright")
umxSummaryGxE(m1, separateGraphs = FALSE)
}
}
\references{
\itemize{
\item \url{https://github.com/tbates/umx}, \url{https://tbates.github.io}
}
}
\seealso{
\itemize{
\item \code{\link[=umxGxE]{umxGxE()}}, \code{\link[=umxReduce]{umxReduce()}}, \code{\link[=plot]{plot()}}, [umxSummary)] all work for IP, CP, GxE, and ACE models.
}

[umxSummary)]: R:umxSummary)

Other Twin Reporting Functions: 
\code{\link{umxPlotCP}()},
\code{\link{umxPlotDoC}()},
\code{\link{umxReduceACE}()},
\code{\link{umxReduceGxE}()},
\code{\link{umxReduce}()},
\code{\link{umxSummarizeTwinData}()},
\code{\link{umxSummaryACEcov}()},
\code{\link{umxSummaryACEv}()},
\code{\link{umxSummaryACE}()},
\code{\link{umxSummaryCP}()},
\code{\link{umxSummaryDoC}()},
\code{\link{umxSummaryGxEbiv}()},
\code{\link{umxSummaryIP}()},
\code{\link{umxSummarySexLim}()},
\code{\link{umxSummarySimplex}()},
\code{\link{umx}}
}
\concept{Twin Reporting Functions}
