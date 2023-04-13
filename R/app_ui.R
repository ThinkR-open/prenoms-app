#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import skeleton
#' @noRd
app_ui <- function(request) {
  # This is litterally to make attachment happy
  markdown::smartypants("x")
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    sk_page(
      sk_header(
        h2(
          sprintf("Baby names in France - %s:%s", min(prenoms::prenoms$year), max(prenoms::prenoms$year))
        ),
      ),
      sk_nav(
        sk_nav_item(
          id = "one",
          title = "Popularity over time",
          ui = mod_pop_over_time_ui("tab1_1")
        ),
        sk_nav_item(
          id = "two",
          title = "BIRTH",
          ui = mod_birth_ui("birth_1")
        ),
        sk_nav_item(
          id = "three",
          title = "BY DEPARTEMENT",
          ui = mod_by_dep_ui("by_dep_1")
        ),
        sk_nav_item(
          id = "four",
          title = "TOP NAMES",
          ui = mod_top_names_ui("top_names_1")
        ),
        sk_nav_item(
          id = "five",
          title = "RAW DATA",
          ui = mod_raw_data_ui("raw_data_1")
        ),
        sk_nav_item(
          id = "six",
          title = "ABOUT",
          ui = tagList(
            sk_col(
              width = 6,
              includeMarkdown(
                app_sys("app/www/about.md")
              )
            ),
            sk_col(
              width = 6,
              includeMarkdown(
                app_sys("app/www/links.md")
              )
            )
          )
        )
      )
    )
  )
}

#' Add external Resources to the Application
#'
#' This function is internally used to add external
#' resources inside the Shiny application.
#'
#' @import shiny
#' @import skeleton
#' @importFrom golem add_resource_path activate_js favicon bundle_resources
#' @noRd
golem_add_external_resources <- function() {
  add_resource_path(
    "www",
    app_sys("app/www")
  )

  tags$head(
    favicon(),
    bundle_resources(
      path = app_sys("app/www"),
      app_title = "{prenoms}"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
