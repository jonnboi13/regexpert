# Find matches in text

Extracts all occurrences of a pattern from the text and returns them as
a character vector.

## Usage

``` r
xp_find(text, pattern, unlist = TRUE)
```

## Arguments

- text:

  The character vector to search.

- pattern:

  The regex pattern to use.

- unlist:

  Logical. If TRUE (default), returns a single vector of all matches.

## Value

A character vector (or list if unlist = FALSE).

## Examples

``` r
"Order 123 and 456" %>% xp_find(xp_build_digits(3))
#> Error in "Order 123 and 456" %>% xp_find(xp_build_digits(3)): could not find function "%>%"
```
