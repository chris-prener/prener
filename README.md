<!-- README.md is generated from README.Rmd. Please edit that file -->
prener <img src="man/figures/logo.png" align="right" />
=======================================================

The goal of `prener` is to document functions that I use frequently in my own research and teaching.

Installation
------------

`prener` is not available from CRAN (and never will be!). You can install `prener` from [Github](https://github.com/chris-prener/prener) with `devtools`:

``` r
# install.packages("devtools")
devtools::install_github("chris-prener/prener")
```

Useage
------

### Plotting

`prener` includes a number of functions that I use in conjunction with `ggplot2`. One issue I address is that `ggsave()` does not accept measurements for `width` and `height` in points, but Keynote lays slides out using points as the unit of measurement. The `cp_points()` function will convert points to inches, centimeters, or millimeters (the units used by `ggsave()`).

``` r
prener::cp_points(200, units = "in")
#> [1] 2.77778
prener::cp_points(200, units = "cm")
#> [1] 7.05556
prener::cp_points(200, units = "mm")
#> [1] 70.5556
```

Contributor Code of Conduct
---------------------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
