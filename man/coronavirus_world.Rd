% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/datasets.R
\docType{data}
\name{coronavirus_world}
\alias{coronavirus_world}
\title{The Coronavirus COVID-19 World Dataset}
\format{A data.frame object
\describe{
  \item{date}{Date}
  \item{cases}{Confirmed Cases}
  \item{deaths}{Deaths}
  \item{new_cases}{Confirmed Cases daily variation}
  \item{new_deaths}{Deaths daily variation}
  \item{days_gt_10}{Days since 10th Confirmed Case}
  \item{days_gt_100}{Days since 100th Confirmed Case}
  \item{death_rate}{Confirmed Cases / Deaths}
  \item{percent_case_increase}{Percentage daily increase in cases}
  \item{percent_death_increase}{Percentage daily increase in deaths}
}}
\source{
\href{https://covid.saude.gov.br}{Ministerio da Saude}
}
\usage{
coronavirus_world
}
\description{
Daily summary of the Coronavirus (COVID-19) cases in Brazil
}
\details{
The dataset contains the daily summary of world coronavirus cases (confirmed cases and deaths)
}
\examples{

data(coronavirus_world)

}
\keyword{COVID19}
\keyword{coronavirus_br}
\keyword{datasets}
