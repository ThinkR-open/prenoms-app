#' by_dep UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_by_dep_ui <- function(id) {
	ns <- NS(id)
	sk_row(
		sk_col(
			width = 3,
			h3("Select a department"),
			select_a_dep(
				ns("dep")
			),
			slider_date_prenoms(
				ns("date")
			),
			group_by_sex(
				ns("sexe")
			),
			render_button(
				ns("render")
			)
		),
		sk_col(
			width = 9,
			dygraphs::dygraphOutput(ns("dy"))
		)
	)
}

#' by_dep Server Functions
#'
#' @noRd
mod_by_dep_server <- function(id) {
	moduleServer(id, function(input, output, session) {
		ns <- session$ns
		vals <- reactiveValues(
			dg = by_dep(
				"01",
				c(min(prenomsapp::prenoms_dates), max(prenomsapp::prenoms_dates)),
				FALSE
			)
		)
		observeEvent(input$render, {
			vals$dg <- memoise::memoise(
				by_dep,
				cache = cachem::cache_disk(app_sys("cache"))
			)(
				input$dep,
				input$date,
				input$sexe
			)
		})
		output$dy <- dygraphs::renderDygraph({
			vals$dg
		})
	})
}

## To be copied in the UI
# mod_by_dep_ui("by_dep_1")

## To be copied in the server
# mod_by_dep_server("by_dep_1")
