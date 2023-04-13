#' top_names UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_top_names_ui <- function(id) {
  ns <- NS(id)
  sk_row(
    sk_col(
      width = 3,
      h3(HTML("Select a <br>year")),
      select_date_prenoms(
        ns("year")
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
      sk_button(
        ns("render"),
        "Render"
      )
    ),
    sk_col(
      width = 9,
      plotly::plotlyOutput(ns("top_names"))
    )
  )
}

#' top_names Server Functions
#'
#' @noRd
mod_top_names_server <- function(id) {
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

    vals <- reactiveValues(
      pl = top_names(
        1901
      )
    )
    observeEvent(input$render, {
      vals$pl <- memoise::memoise(
        top_names,
        cache = cachem::cache_disk(app_sys("cache"))
      )(
        year_choice = input$year,
        filter_by_dep = input$dep %||% FALSE,
        dep = input$depchoice,
        filter_by_sex = input$sexe %||% FALSE,
        sex_choice = input$sexchoice
      )
    })
    output$top_names <- plotly::renderPlotly({
      vals$pl
    })
  })
}

## To be copied in the UI
# mod_top_names_ui("top_names_1")

## To be copied in the server
# mod_top_names_server("top_names_1")
