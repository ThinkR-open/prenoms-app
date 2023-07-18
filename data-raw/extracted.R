## code to prepare `extracted` dataset goes here

colin <- prenoms::prenoms |>
	dplyr::filter(name == "Colin")
usethis::use_data(colin, overwrite = TRUE)
checkhelper::use_data_doc("colin")

unique_names <- unique(prenoms::prenoms$name)
usethis::use_data(unique_names, overwrite = TRUE)
checkhelper::use_data_doc("unique_names")

deps <- unique(prenoms::prenoms$dpt)
usethis::use_data(deps, overwrite = TRUE)
checkhelper::use_data_doc("deps")

birth_by_year <- prenoms::prenoms |>
	dplyr::group_by(year) |>
	dplyr::summarise(n = sum(n))
usethis::use_data(birth_by_year, overwrite = TRUE)
checkhelper::use_data_doc("birth_by_year")

birth_by_year_and_sex <- prenoms::prenoms |>
	dplyr::group_by(year, sex) |>
	dplyr::summarise(n = sum(n))
usethis::use_data(birth_by_year_and_sex, overwrite = TRUE)
checkhelper::use_data_doc("birth_by_year_and_sex")

prenoms_dates <- unique(prenoms::prenoms$year)
usethis::use_data(prenoms_dates, overwrite = TRUE)
checkhelper::use_data_doc("prenoms_dates")
