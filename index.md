# regexpert

The goal of **regexpert** is to make regular expressions in R less of a
headache. It provides a pipe-friendly, human-readable DSL for building
and executing regex patterns — no symbol memorization required.

## Installation

You can install the development version of regexpert from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("Jonnboi13/regexpert")
```

## Why regexpert?

Standard regular expressions are powerful but often unreadable.
`regexpert` breaks the process into two logical steps:

1.  **Build:** Describe what you’re looking for using plain-English
    functions like
    [`xp_build_digits()`](https://Jonnboi13.github.io/regexpert/reference/xp_build_digits.md).
2.  **Act:** Use
    [`xp_find()`](https://Jonnboi13.github.io/regexpert/reference/xp_find.md)
    to return matches, or
    [`xp_view()`](https://Jonnboi13.github.io/regexpert/reference/xp_view.md)
    to inspect the raw regex being generated.

## Example

The `regexpert` workflow is designed to be used with the pipe (`%>%` or
`|>`):

``` r
library(regexpert)
library(magrittr)

# Find digits in a string
"Order #88412 placed" %>%
  xp_build_digits() %>%
  xp_find()
#> [1] "88412"

# Find only the letters
"Order #88412 placed" %>%
  xp_build_letters() %>%
  xp_find()
#> [1] "Order" "placed"

# Negate a pattern — find everything that isn't whitespace
"hello world" %>%
  xp_build_whitespace(negate = TRUE) %>%
  xp_find()
#> [1] "hello" "world"

# Use xp_view() to inspect the regex your builder creates
xp_build_digits() %>%
  xp_view()
#> [1] "[\\d]"
```

## Documentation

Full documentation, including function references and vignettes, is
available at <https://Jonnboi13.github.io/regexpert/>.
