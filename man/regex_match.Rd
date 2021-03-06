% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/haircut.R
\name{regex_match}
\alias{regex_match}
\title{Return matching characters matching an expression.}
\usage{
regex_match(text, pattern)
}
\arguments{
\item{text}{a vector of charcter strings to be matched.}

\item{pattern}{a regular expression.}
}
\value{
vector of substrings of `text` that matched the `pattern`.
}
\description{
Given a vector of chracter strings, this function returns matches as a vector.
This allows a chainable regex filtering style that is readily compatible with `%>%`.
Capuring groups in `()` will be ignored.  Best to use non-capturing `(?:)`.
}
