#' The application server-side
#'
#' @param input,output,session Internal parameters for {shiny}.
#'     DO NOT REMOVE.
#' @import shiny
#' @noRd
app_server <- function(input, output, session) {
  mod_pop_over_time_server("tab1_1")
  mod_birth_server("birth_1")
  mod_by_dep_server("by_dep_1")
  mod_top_names_server("top_names_1")
  mod_raw_data_server("raw_data_1")
}
