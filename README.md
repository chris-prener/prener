
<!-- README.md is generated from README.Rmd. Please edit that file -->
prener <img src="man/figures/logo.png" align="right" />
=======================================================

[![Travis-CI Build Status](https://travis-ci.org/chris-prener/prener.svg?branch=master)](https://travis-ci.org/chris-prener/prener) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/chris-prener/prener?branch=master&svg=true)](https://ci.appveyor.com/project/chris-prener/prener) [![codecov](https://codecov.io/gh/chris-prener/prener/branch/master/graph/badge.svg)](https://codecov.io/gh/chris-prener/prener) [![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/prener)](https://cran.r-project.org/package=prener)

The goal of `prener` is to document functions that I use frequently in my own research and teaching.

Installation
------------

`prener` is not available from CRAN (and likely never will be!). You can install `prener` from [Github](https://github.com/chris-prener/prener) with `devtools`:

``` r
# install.packages("devtools")
devtools::install_github("chris-prener/prener")
```

Useage
------

### Plotting and Mapping

`prener` includes a number of functions that I use in conjunction with `ggplot2`, including a function (`cp_points()`) for converting measurements from points to inches, centimeters, and millimeters and a function (`cp_plotSave()`) for standardized export options.

The package also includes a theme specification for `ggplot2` that is designed to produce clean, minimal plots and maps for lectures and presentations. The theme is built on top of [`ggthemes`](https://github.com/jrnold/ggthemes) and can be used with a number of backgrounds. Both plots and maps can be produced with a white and a transparent background, and plots can also be produced using a particular shade of gray (`#EBEBEB`) that I use in the background of my slides.

Finally, the package contains `cp_breaks()` for calculating breaks in mapping. It is a wrapper around the `classInt` package's `classIntervals` function along with `cut` for calculating factor variables containing breaks for mapping. The various approaches to calculating breaks are summarized in the [`classInt` documentation](https://cran.r-project.org/web/packages/classInt/classInt.pdf).

### Statistics

`prener` includes a helper function for calculating p-values under the t-distribution:

``` r
> cp_probt(3.6308, df = 72)
[1] 0.0005254992
```

Contributor Code of Conduct
---------------------------

Please note that this project is released with a [Contributor Code of Conduct](CODE_OF_CONDUCT.md). By participating in this project you agree to abide by its terms.
