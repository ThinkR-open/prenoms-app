#' The application User-Interface
#'
#' @param request Internal parameter for `{shiny}`.
#'     DO NOT REMOVE.
#' @import shiny
#' @import skeleton
#' @noRd
app_ui <- function(request) {
  tagList(
    # Leave this function for adding external resources
    golem_add_external_resources(),
    # Your application UI logic
    sk_page(
      sk_row(
        h2("A dead simple, responsive boilerplate."),
      ),
      sk_nav(
        sk_nav_item(
          id = "one",
          title = "ONE",
          ui = mod_tab1_ui("tab1_1")
        ),
        sk_nav_item(
          id = "two",
          title = "TWO",
          ui = mod_tab2_ui("tab2_1")
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
      app_title = "prenomsappreborn"
    )
    # Add here other external resources
    # for example, you can add shinyalert::useShinyalert()
  )
}
