#' birth UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
#' @importFrom dygraphs dygraphOutput
mod_birth_ui <- function(id) {
	ns <- NS(id)
	sk_row(
		sk_col(
			width = 3,
			h3("Select a daterange"),
			slider_date_prenoms(
				ns("choix")
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
			dygraphOutput(ns("dynaissance"))
		)
	)
}


#' birth Server Functions
#'
#' @noRd
#' @importFrom dygraphs renderDygraph
mod_birth_server <- function(id) {
	moduleServer(id, function(input, output, session) {
		ns <- session$ns
		choices <- reactiveValues(
			choix = dy_birth(
				1900,
				2017
			)
		)
		observeEvent(input$render, {
			choices$choix <- memoise::memoise(
				dy_birth,
				cache = cachem::cache_disk(app_sys("cache"))
			)(
				input$choix[1],
				input$choix[2],
				input$sexe
			)
		})
		output$dynaissance <- renderDygraph({
			choices$choix
		})
	})
}

## To be copied in the UI
# mod_birth_ui("birth_1")

## To be copied in the server
# mod_birth_server("birth_1")
