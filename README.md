
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

### Plotting

`prener` includes a number of functions that I use in conjunction with `ggplot2`, including a function (`cp_points()`) for converting measurements from points to inches, centimeters, and millimeters and a function (`cp_plotSave()`) for standardized export options.

### Tables

The package also includes functionality

### Statistics

`prener` includes a helper function for calculating p-values under the t-distribution:

``` r
> cp_probt(3.6308, df = 72)
[1] 0.0005254992
```

Contributor Code of Conduct
---------------------------

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
