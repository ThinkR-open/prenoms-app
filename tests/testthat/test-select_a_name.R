# WARNING - Generated by {fusen} from /dev/flat_fct_utils.Rmd: do not edit by hand

test_that("select_a_name works", {
	expect_true(inherits(select_a_name, "function"))
	expect_true(
		grepl(
			"shiny-input-container",
			select_a_name("pif")
		)
	)
	expect_true(
		grepl(
			"pif",
			select_a_name("pif")
		)
	)
})
