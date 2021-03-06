#' The Observatory of Economic Complexity
#'
#' Package's details.
#'
#' This package was created to simplify user interaction with the OEC's API. It will download trade data from MIT Media Lab servers and it will save that both in CSV and JSON formats.
#'
#' You can use this package just to download information but it also creates D3Plus visualizations that are suitable for presentations or a context where you need to show data. These visualizations do not need internet connection after you obtain the data.
#'
#' All of the datasets provided within this package provide data that cannot be obtained from the API and do help creating better visualizations.
#'
#' The functions provided within this package are:
#'
#' \code{\link{install_d3plus}}	Installs D3 and D3Plus.
#'
#' \code{\link{demos}} Copies the demo file.
#'
#' \code{\link{getdata}} Downloads and processes the data from the API for a certain year.
#'
#' \code{\link{getdata_interval}} Downloads and processes the data from the API for an interval of years.
#'
#' \code{\link{network}} Creates a network for a given year.
#'
#' \code{\link{network_interval}} Creates a network for an interval of years.
#'
#' \code{\link{treemap}} Creates a treemap for a given year.
#'
#' \code{\link{treemap_interval}} Creates a treemap for an interval of years.
#'
#' The datasets provided within this package are:
#'
#' \code{\link{countries_list}}	A list of all the countries in the world and its respective country code.
#'
#' \code{\link{hs92_2char}}	HS92 groups.
#'
#' \code{\link{hs92_4char}}	HS92 products (4 characters codes).
#'
#' \code{\link{hs92_6char}}	HS92 products (6 characters codes).
#'
#' \code{\link{hs92_colors}} HS92 colors.
#'
#' \code{\link{sitc_rev2_2char}} SITC (rev. 2) groups.
#'
#' \code{\link{sitc_rev2_4char}} SITC (rev. 2) products (4 characters codes).
#'
#' \code{\link{sitc_rev2_colors}} SITC (rev. 2) colors.
#'
#' The additional files provided within this package are:
#'
#' \code{\link{treemap_template.html}} A template to display a treemap of the imports, exports or trade balance of a country for a certain year using HS92 or SITC (rev.2) product classification.
#'
#' \code{\link{network_template.html}} A template to display a network of exports of a country for a certain year using HS92 or SITC (rev.2) product classification.
#'
#' \code{\link{nodes_hs92_4char.json}} A part of a pre-drawn network to create network visualizations using HS92 product classification.
#'
#' \code{\link{edges_hs92_4char.json}} A with a part of a pre-drawn network to create network visualizations using HS92 product classification.
#'
#' \code{\link{nodes_sitc_rev2_4char.json}} A file with a part of a pre-drawn network to create network visualizations using SITC (rev.2) product classification.
#'
#' \code{\link{edges_sitc_rev2_4char.json}} A file with a part of a pre-drawn network to create network visualizations using SITC (rev.2) product classification.
#'
#' \code{\link{d3plus-1.9.8.zip}} Contains D3Plus and D3 to display the visualization.
#'
#' @name oec-package
#' @aliases oec
#' @docType package
NULL
