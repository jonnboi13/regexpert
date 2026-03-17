# regexpert <img src="man/figures/logo.svg" align="right" height="139" alt="Regexpert Logo"/>

<!-- [![Lifecycle: experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://lifecycle.r-lib.org/articles/stages.html)
[![R-CMD-check](https://github.com/byuirpytooling/regexpert/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/byuirpytooling/regexpert/actions)
[![Documentation](https://img.shields.io/badge/docs-pkgdown-blue.svg)](https://byuirpytooling.github.io/regexpert/) -->


The goal of **regexpert** is to make regular expressions in R less of a headache. It provides a pipe-friendly, human-readable DSL for building and executing regex patterns — no symbol memorization required.

## Installation

You can install the development version of regexpert from [GitHub](https://github.com/) with:
```r
# install.packages("devtools")
devtools::install_github("byuirpytooling/regexpert")
```

## Why regexpert?

Standard regular expressions are powerful but often unreadable. `regexpert` breaks the process into three logical steps:

1. **Build:** Describe what you're looking for using plain-English functions like `xp_build_digits()`.
2. **Operate:** Refine your pattern with `xp_op_repeat()`, `xp_op_optional()`, and more.
3. **Act:** Use `xp_action_find()` to return matches, or `xp_action_view()` to inspect the raw regex being generated.

## Example

The `regexpert` workflow is designed to be used with the pipe (`%>%` or `|>`):
```r

# Find digits in a string
xp_build_digits() %>%
  xp_op_repeat(1, Inf) %>%
  xp_action_find("Order #88412 placed")
#> [1] "88412"

# Find only the letters
xp_build_letters(case = "both") %>%
  xp_op_repeat(1, Inf) %>%
  xp_action_find("Order #88412 placed")
#> [1] "Order" "placed"

# Use a standard pattern for common data types
xp_build_standard("email") %>%
  xp_action_find("Contact us at support@regexpert.com")
#> [1] "support@regexpert.com"

# Inspect the regex being built under the hood
xp_build_digits() %>%
  xp_op_repeat(3) %>%
  xp_action_view()
#> Current Regex Pattern:
#> (?:\d){3}
```

## Documentation

Full documentation, including function references and vignettes, is available at <https://byuirpytooling.github.io/regexpert/>.

📖 **Get started:** [Getting Started with regexpert](https://byuirpytooling.github.io/regexpert/articles/getting-started.html)