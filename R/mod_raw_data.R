#' raw_data UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_raw_data_ui <- function(id) {
  ns <- NS(id)
  sk_row(
    sk_col(
      width = 3,
      h3(HTML("Select a <br>name")),
      textInput(
        ns("name_choice"),
        "Name:",
        value = "Colin"
      ),
      filter_by_dep(
        ns("dep")
      ),
      uiOutput(
        ns("depchoiceui")
      ),
      filter_by_sex(
        ns("sexe")
      ),
      uiOutput(
        ns("sexchoiceui")
      ),
      render_button(
        ns("render")
      )
    ),
    sk_col(
      width = 9,
      DT::DTOutput(ns("raw_data"))
    )
  )
}

#' raw_data Server Functions
#'
#' @noRd
mod_raw_data_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    ns <- session$ns
    output$depchoiceui <- renderUI({
      if (input$dep) {
        select_a_dep(
          ns("depchoice")
        )
      } else {
        NULL
      }
    })
    output$sexchoiceui <- renderUI({
      if (input$sexe) {
        select_a_sex(
          ns("sexchoice")
        )
      } else {
        NULL
      }
    })

    choice <- reactiveValues(
      pl = raw_data(
        name_choice = "Colin"
      )
    )
    observeEvent(input$render, {
      choice$pl <- memoise::memoise(
        raw_data,
        cache = cachem::cache_disk(app_sys("cache"))
      )(
        name_choice = input$name_choice,
        filter_by_dep = input$dep %||% FALSE,
        dep = input$depchoice,
        filter_by_sex = input$sexe %||% FALSE,
        sex_choice = input$sexchoice
      )
    })
    output$raw_data <- DT::renderDataTable({
      choice$pl
    })
  })
}

## To be copied in the UI
# mod_raw_data_ui("raw_data_1")

## To be copied in the server
# mod_raw_data_server("raw_data_1")
