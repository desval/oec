#' Creates a network of exports for a given year
#' @export
#' @return Creates an \code{HTML} file with a network visualization for a given year.
#' @param origin is the country code of origin (e.g. "chl" for Chile)
#' @param destination is the country code of origin (e.g. "chn" for China)
#' @param initial_year The OEC's API ranges from 1962 to 2014. This needs to be lower than `final_year`
#' @param final_year The OEC's API ranges from 1962 to 2014. This needs to be greater than `initial_year`
#' @param classification refers to the trade classification that can be "6" (HS92 6 characters) or "8" (HS92 8 characters) for the year 1995 and going or "4" (SITC rev.2 4 characters) for the year 1962 and ongoing
#' @param interval is an optional parameter to define the distance between years (by default set to 1)
#' @examples
#' # Run countries_list() to display the full list of countries
#' # Chile is "chl" and China is "chn"
#' # Visualize trade data from OEC's API (HS92 6 characters product list)
#' # for exports from Chile to China in the year 2014
#' # network("chl", "chn", 2014, 6)
#' # is the same as
#' # network("chl", "chn", 2014)
#' @keywords functions

network_interval <- function(origin, destination, initial_year, final_year, interval, classification) {

  countries_list <-  oec::countries_list

  d3_folder <- paste0(getwd(), "/d3plus-1.9.8")
  if(!file.exists(d3_folder)){
    print("D3plus not installed... installing using install_d3plus()...")
    install_d3plus()
  }

  if(missing(interval)) {
    interval = 1
  }

  if(missing(classification)) {
    classification = 6
  }

  variable <- "exports"

  input <- paste(origin, destination, initial_year, final_year, interval, classification, sep="_")
  input <- paste0(input, "char")

  getdata_interval(origin, destination, initial_year, final_year, classification, interval)

  code_lenght <- classification
  if(code_lenght == 4) {
    code_display <- "SITC code"
    edges <- "edges_sitc.json"
    nodes <- "nodes_sitc.json"

    if(!file.exists(edges) & !file.exists(nodes)) {
      ### nodes ###
      print("creating SITC rev. 2 nodes...")
      file.copy(from=system.file("extdata", "nodes_sitc.json", package = "oec"), to=getwd())
      ### edges ###
      print("creating SITC rev. 2 edges...")
      file.copy(from=system.file("extdata", "edges_sitc.json", package = "oec"), to=getwd())
    }
  }
  if(code_lenght == 6) {
    code_display <- "HS92 code"
    edges <- "edges_hs.json"
    nodes <- "nodes_hs.json"

    if(!file.exists(edges) & !file.exists(nodes)) {
      ### nodes ###
      print("creating HS92 nodes...")
      file.copy(from = system.file("extdata", "nodes_hs.json", package = "oec"), to = getwd())
      ### edges ###
      print("creating HS92 edges...")
      file.copy(from = system.file("extdata", "edges_hs.json", package = "oec"), to = getwd())
    }
  }
  if(variable == "exports") {
    if(code_lenght == 4 | code_lenght == 6) {
      replacement_variable <- ifelse(variable == "imports", "import_val",
                            ifelse(variable == "exports", "export_val",
                                   ifelse(variable == "exchange", "trade_exchange_val", "error")))
      replacement_name <- ifelse(variable == "imports", "Import",
                             ifelse(variable == "exports", "Export",
                                    ifelse(variable == "exchange", "Trade exchange", "error")))

      json_file <- paste0(input, ".json")
      if(!file.exists(json_file)){
        print("json file not found. run getdata() first")
      } else {
        ### html ###
        output <- input
        html_file <- paste0(output, "_network_exports", ".html")
        if(!file.exists(html_file)){
          print("creating network")
          network_interval_template <- paste(readLines(system.file("extdata", "network_interval_template.html", package = "oec"), warn = F), collapse = "\n")
          network_interval_template <- gsub("json_file", paste0(output, ".json"), network_interval_template)
          network_interval_template <- gsub("edges_file", edges, network_interval_template)
          network_interval_template <- gsub("nodes_file", nodes, network_interval_template)
          network_interval_template <- gsub("replace_variable", replacement_variable, network_interval_template)
          network_interval_template <- gsub("replace_name", replacement_name, network_interval_template)
          network_interval_template <- ifelse(classification == 6 | classification == 8, gsub("replace_group_id", "hs92_group_id", network_interval_template), gsub("replace_group_id", "sitc_rev2_group_id", network_interval_template))
          network_interval_template <- ifelse(classification == 6 | classification == 8, gsub("replace_group_name", "hs92_group_name", network_interval_template), gsub("replace_group_name", "sitc_rev2_group_name", network_interval_template))
          network_interval_template <- ifelse(classification == 6 | classification == 8, gsub("replace_product_id", "hs92_product_id", network_interval_template), gsub("replace_product_id", "sitc_rev2_product_id", network_interval_template))
          network_interval_template <- ifelse(classification == 6 | classification == 8, gsub("replace_product_name", "hs92_product_name", network_interval_template), gsub("replace_product_name", "sitc_rev2_product_name", network_interval_template))
          network_interval_template <- ifelse(classification == 6 | classification == 8, gsub("replace_color", "hs92_color", network_interval_template), gsub("replace_color", "sitc_rev2_color", network_interval_template))
          network_interval_template <- ifelse(classification == 6 | classification == 8, gsub("replace_icon", "hs92_icon", network_interval_template), gsub("replace_icon", "sitc_rev2_icon", network_interval_template))
          network_interval_template <- gsub("code_display", code_display, network_interval_template)
          network_interval_template <- ifelse(origin == "all", gsub("origin_id_replace", "the rest of the World", network_interval_template),
                                     gsub("origin_id_replace", countries_list[countries_list$country_code == origin, 1], network_interval_template))
          network_interval_template <- ifelse(origin == "all", gsub("destination_id_replace", "the rest of World", network_interval_template),
                                     gsub("destination_id_replace", countries_list[countries_list$country_code == destination, 1], network_interval_template))
          network_interval_template <- ifelse(variable == "exports", gsub("variable_replace", "export to", network_interval_template),
                                     ifelse(variable == "imports", gsub("variable_replace", "import from", network_interval_template),
                                            "exchange with"))
          network_interval_template <- gsub("initial_year_replace", initial_year, network_interval_template)
          network_interval_template <- gsub("final_year_replace", final_year, network_interval_template)
          print("writing html file...")
          writeLines(network_interval_template, paste0(output, "_network_exports", ".html"))
          print("opening html files in the browser.")
          httw(pattern = NULL, daemon = TRUE)
        } else {
          print("html network file already exists. skipping.")
          print("opening html files in the browser.")
          httw(pattern = NULL, daemon = TRUE)
        }
      }
    }
  } else {
    print('network() only admits 4 characters codes (SITC) or 6 characters codes (HS92). This method only allows "exports".')
  }
}