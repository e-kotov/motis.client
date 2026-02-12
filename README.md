

<!-- README.md is generated from README.Rmd. Please edit that file -->

# motis.client

<!-- badges: start -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html#experimental)
[![CRAN
status](https://www.r-pkg.org/badges/version/motis.client)](https://CRAN.R-project.org/package=motis.client)
<!-- badges: end -->

The goal of `motis.client` is to auto-wrap
\[https://github.com/motis-project/motis\] API automatically based on
OpenAPI specification. This is not intended to be a user facing package,
but rather low level api client for other packages to build on top of
it. `motis.client` is generated entirely from OpenAPI specification
using https://github.com/e-kotov/openapi3/ experimental R package.
`motis.client` is intended to be wrapped by
[`rmotis`](https://github.com/e-kotov/rmotis) R package that is intended
to be a user facing package for `MOTIS` that automates installation of
the server and provides user friendly API for the most common use cases
in a manner simialar to [`{r5r}`](https://github.com/ipeaGIT/r5r/) and
[`osrm`](https://github.com/riatelab/osrm) +
[`osrm.backend`](https://github.com/e-kotov/osrm.backend).

## Installation

You can install the development version of motis.client from
[GitHub](https://github.com/e-kotov/motis.client) with:

``` r
# install.packages("pak")
pak::pak("e-kotov/motis.client")
```
