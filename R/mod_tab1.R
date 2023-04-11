#' tab1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_tab1_ui <- function(id) {
  ns <- NS(id)
  tagList(
    "Hello tab1"
  )
}

#' tab1 Server Functions
#'
#' @noRd
mod_tab1_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
  })
}

## To be copied in the UI
# mod_tab1_ui("tab1_1")

## To be copied in the server
# mod_tab1_server("tab1_1")
