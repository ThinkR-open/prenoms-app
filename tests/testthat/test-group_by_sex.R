# WARNING - Generated by {fusen} from /dev/flat_fct_utils.Rmd: do not edit by hand

test_that("group_by_sex works", {
	expect_true(inherits(group_by_sex, "function"))
	expect_true(
		grepl(
			"shiny-input-container",
			group_by_sex("pif")
		)
	)
	expect_true(
		grepl(
			"pif",
			group_by_sex("pif")
		)
	)
})
