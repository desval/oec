#' OEC: The Observatory of Economic Complexity
#'
#' Use The Observatory of Economic Complexity's API from R console to obtain international trade data to create spreadsheets (csv format) and D3Plus visualizations.
#'
#' The functions provided within this package are:
#'
#' \code{\link{install_d3plus}}	Installs D3 and D3plus.
#'
#' \code{\link{demos}} Copies the demo file.
#'
#' \code{\link{getdata}} Downloads and processes the data from the API.
#'
#' \code{\link{network}} Creates a network for a given year.
#'
#' \code{\link{network.comparison}} Creates a network to compare two years.
#'
#' \code{\link{treemap}} Creates a treemap for a given year.
#'
#' The datasets provided within this package are:
#'
#' \code{\link{countries_list}}	A list of all the countries in the world and its respective country code.
#'
#' \code{\link{hs92_2char}}	HS92 groups. This file is used to create spreadsheets and visualizations with trade data.
#'
#' \code{\link{hs92_6char}}	HS92 products (6 characters codes). This file is used to create spreadsheets and visualizations with trade data.
#'
#' \code{\link{hs92_8char}}	HS92 products (8 characters codes). This file is used to create spreadsheets and visualizations with trade data.
#'
#' \code{\link{hs_colors}} HS92 colors. This file is used to create spreadsheets and visualizations based on trade data.
#'
#' \code{\link{sitc_rev2_2char}} SITC (rev. 2) groups. This file is used to create spreadsheets and visualizations with trade data.
#'
#' \code{\link{sitc_rev2_4char}} SITC (rev. 2) products (4 characters codes). This file is used to create spreadsheets and visualizations with trade data.
#'
#' \code{\link{sitc_colors}} SITC (rev. 2) colors. This file is used to create spreadsheets and visualizations with trade data.
#'
#' @name oec-package
#' @docType package
NULL