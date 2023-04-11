
<!-- README.md is generated from README.Rmd. Please edit that file -->

# `{prenomsapp}`

<!-- badges: start -->
<!-- badges: end -->

## Installation

You can install the development version of `{prenomsapp}` like so:

``` r
# FILL THIS IN! HOW CAN PEOPLE INSTALL YOUR DEV PACKAGE?
```

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
#> [1] "2023-04-11 12:02:52 CEST"
```

Here are the tests results and package coverage:

``` r
devtools::check(quiet = TRUE)
#> ══ Documenting ═════════════════════════════════════════════════════════════════
#> ℹ Installed roxygen2 version (7.2.3) doesn't match required (7.1.1)
#> ✖ `check()` will not re-document this package
#> ── R CMD check results ────────────────────────────── prenomsapp 0.0.0.9000 ────
#> Duration: 14.6s
#> 
#> ❯ checking R code for possible problems ... NOTE
#>   app_ui: no visible global function definition for ‘sk_page’
#>   app_ui: no visible global function definition for ‘sk_row’
#>   app_ui: no visible global function definition for ‘sk_nav’
#>   app_ui: no visible global function definition for ‘sk_nav_item’
#>   Undefined global functions or variables:
#>     sk_nav sk_nav_item sk_page sk_row
#> 
#> 0 errors ✔ | 0 warnings ✔ | 1 note ✖
```

``` r
covr::package_coverage()
#> prenomsapp Coverage: 0.00%
#> R/app_config.R: 0.00%
#> R/app_server.R: 0.00%
#> R/app_ui.R: 0.00%
#> R/mod_tab1.R: 0.00%
#> R/mod_tab2.R: 0.00%
#> R/run_app.R: 0.00%
```
