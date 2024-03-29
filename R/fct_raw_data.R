# WARNING - Generated by {fusen} from /dev/flat_raw_data.Rmd: do not edit by hand

#' raw_data
#'
#'
#'
#' @noRd
#'
#' @examples
#' raw_data(
#' 	"Colin"
#' )
raw_data <- function(
	name_choice,
	filter_by_dep = FALSE,
	dep = "01",
	filter_by_sex = FALSE,
	sex_choice = "F"
				) {
	f <- prenoms::prenoms |>
		dplyr::filter(.data$name == name_choice)
	if (filter_by_sex) {
		f <- f |>
			dplyr::filter(.data$sex == sex_choice)
	}
	if (filter_by_dep) {
		f <- f |>
			dplyr::filter(.data$dpt == dep)
	}

	f |>
		dplyr::group_by(.data$year, .data$name) |>
		dplyr::summarise(total = sum(.data$n)) |>
		dplyr::arrange(.data$year) |>
		DT::datatable()
}
