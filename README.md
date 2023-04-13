
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{prenomsapp}`

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![R-CMD-check](https://github.com/ThinkR-open/prenoms-app/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ThinkR-open/prenoms-app/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

## Run

You can launch the application by running:

``` r
prenomsapp::run_app()
```

## About

You are reading the doc about version : 0.0.0.9000

This README has been compiled on the

``` r
Sys.time()
#> [1] "2023-04-13 09:59:29 CEST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ℹ Loading prenomsapp
#> ── R CMD check results ────────────────────────────── prenomsapp 0.0.0.9000 ────
#> Duration: 18.3s
#> 
#> 0 errors ✔ | 0 warnings ✔ | 0 notes ✔
```

``` r
covr::package_coverage()
#> prenomsapp Coverage: 82.73%
#> R/run_app.R: 0.00%
#> R/fct_dy_birth.R: 50.00%
#> R/fct_top_names.R: 58.82%
#> R/fct_by_dep.R: 66.67%
#> R/fct_raw_data.R: 69.23%
#> R/mod_pop_over_time.R: 71.95%
#> R/mod_top_names.R: 74.65%
#> R/mod_raw_data.R: 75.00%
#> R/mod_birth.R: 80.95%
#> R/mod_by_dep.R: 82.61%
#> R/fct_utils.R: 90.16%
#> R/app_config.R: 100.00%
#> R/app_server.R: 100.00%
#> R/app_ui.R: 100.00%
#> R/fct_display_mod_1_dygraph.R: 100.00%
#> R/golem_utils_server.R: 100.00%
#> R/golem_utils_ui.R: 100.00%
#> R/group_by_sex.R: 100.00%
```
