# Build an alphanumeric pattern

Build an alphanumeric pattern

## Usage

``` r
xp_build_alnum(pattern = NULL, n = NULL)
```

## Arguments

- pattern:

  (Optional) An existing pattern from the pipe.

- n:

  Exact number of characters.

## Value

A character string.

## Examples

``` r
xp_build_alnum(n = 5)
#> [1] "[[:alnum:]]{5}"
xp_literal("#") %>% xp_build_alnum(n = 3)
#> Error in xp_literal("#") %>% xp_build_alnum(n = 3): could not find function "%>%"
```
