#' tab1 UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd
#'
#' @importFrom shiny NS tagList
mod_pop_over_time_ui <- function(id) {
	ns <- NS(id)
	sk_row(
		sk_col(
			width = 3,
			h3(HTML("Select a <br>name")),
			select_a_name(
				ns("choix")
			),
			filter_by_dep(
				ns("dep")
			),
			uiOutput(
				ns("selectui")
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

#' tab1 Server Functions
#'
#' @noRd
mod_pop_over_time_server <- function(id) {
	moduleServer(id, function(input, output, session) {
		ns <- session$ns
		choice <- reactiveValues(
			prenom = "Colin",
			f = prenomsapp::colin
		)

		output$selectui <- renderUI({
			if (input$dep) {
				select_a_dep(
					ns("depchoice")
				)
			} else {
				NULL
			}
		})

		observeEvent(input$render, ignoreInit = TRUE, {
			if (capwords(input$choix) %in% prenomsapp::unique_names) {
				choice$prenom <- capwords(input$choix)
				choice$f <- prenoms::prenoms |>
					dplyr::filter(.data$name == capwords(choice$prenom))

				if (input$dep) {
					choice$f <- choice$f |>
						dplyr::filter(.data$dpt == input$depchoice)
				}
				if (nrow(choice$f) == 0) {
					shinyalert::shinyalert(
						"No result",
						"No result for this name/department.",
						type = "error"
					)
				}
			} else {
				choice$prenom <- NULL
				shinyalert::shinyalert(
					"Name not found",
					"This name is not in the database.",
					type = "error"
				)
			}
		})
		output$dy <- dygraphs::renderDygraph({
			validate(
				need(
					choice$prenom,
					"No data for this name"
				)
			)
			validate(
				need(
					nrow(choice$f) != 0,
					"No data for this department"
				)
			)
			memoise::memoise(
				display_mod_1_dygraph,
				cache = cachem::cache_disk(app_sys("cache"))
			)(choice$f)
		})
	})
}

## To be copied in the UI
# mod_pop_over_time_ui("tab1_1")

## To be copied in the server
# mod_pop_over_time_server("tab1_1")
