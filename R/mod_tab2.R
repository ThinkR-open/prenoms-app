#' tab2 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_tab2_ui <- function(id) {
  ns <- NS(id)
  tagList(
    "Hello tab2"
  )
}

#' tab2 Server Functions
#'
#' @noRd
mod_tab2_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
  })
}

## To be copied in the UI
# mod_tab2_ui("tab2_1")

## To be copied in the server
# mod_tab2_server("tab2_1")
