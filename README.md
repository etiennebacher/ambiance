
# ambiance

<!-- badges: start -->
<!-- badges: end -->

The goal of `{ambiance}` is to easily switch themes in RStudio. This is useful if you use different themes when you teach and when you work on personal projects for example.

## Installation

You can install the development version of `{ambiance}` with:

``` r
# install.packages("devtools")
devtools::install_github("etiennebacher/ambiance")
```

## How to use

1. Define different ambiances:

```r
define_ambiances(list(first = c("class", "textmate (default)"), c("perso", "cobalt")))
```

2. Apply a specific theme with the name of an ambiance you defined:

```r
ambiance("perso")
```
