\docType{methods}
\name{plot-methods}
\alias{plot,stanfit-method}
\alias{plot,stanfit,missing-method}

\title{Plots for stanfit objects} 
\description{The default plot shows posterior uncertainty intervals and point 
estimates for parameters and generated quantities. The \code{plot} method can 
also be used to call the other \strong{rstan} plotting functions via the 
\code{plotfun} argument (see Examples).}

\usage{
  \S4method{plot}{stanfit,missing}(x, ..., plotfun)
} 

\arguments{
  \item{x}{An instance of class \code{\linkS4class{stanfit}}.}
  \item{plotfun}{A character string naming the plotting function to apply to the
  stanfit object. If \code{plotfun} is missing, the default is to call
  \code{\link{stan_plot}}, which generates a plot of credible intervals and
  point estimates. See \code{\link{rstan-plotting-functions}} for the names and
  descriptions of the other plotting functions. \code{plotfun} can be either the
  full name of the plotting function (e.g. \code{"stan_hist"}) or can be 
  abbreviated to the part of the name following the underscore 
  (e.g. \code{"hist"}).}
  \item{...}{Optional arguments to \code{plotfun}.}
}
\value{
A \code{\link[ggplot2]{ggplot}} object that can be further customized
using the \pkg{ggplot2} package.
}
\note{
Because the \pkg{rstan} plotting functions use \pkg{ggplot2} (and thus the 
resulting plots behave like \code{ggplot} objects), when calling a plotting 
function within a loop or when assigning a plot to a name 
(e.g., \code{graph <- plot(fit, plotfun = "rhat")}),
if you also want the side effect of the plot being displayed you 
must explicity print it (e.g., \code{(graph <- plot(fit, plotfun = "rhat"))}, 
\code{print(graph <- plot(fit, plotfun = "rhat"))}).
}
\seealso{
\code{\link[=rstan-plotting-functions]{List of RStan plotting functions}},
\code{\link[=rstan_gg_options]{Plot options}}
}
\examples{
\dontrun{
library(rstan)
fit <- stan_demo("eight_schools")
plot(fit)
plot(fit, show_density = TRUE, ci_level = 0.5, fill_color = "purple")
plot(fit, plotfun = "hist", pars = "theta", include = FALSE)
plot(fit, plotfun = "trace", pars = c("mu", "tau"), inc_warmup = TRUE)
plot(fit, plotfun = "rhat") + ggtitle("Example of adding title to plot")
}
} 
\keyword{methods}
