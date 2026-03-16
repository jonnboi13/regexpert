# Build a digit pattern

Build a digit pattern

## Usage

``` r
xp_build_digits(pattern = NULL, n = NULL)
```

## Arguments

- pattern:

  (Optional) An existing pattern from the pipe.

- n:

  Exact number of digits.

## Value

A character string.

## Examples

``` r
xp_build_digits(n = 3)
#> [1] "\\d{3}"
xp_literal("Area Code: ") %>% xp_build_digits(3)
#> Error in xp_literal("Area Code: ") %>% xp_build_digits(3): could not find function "%>%"
```
