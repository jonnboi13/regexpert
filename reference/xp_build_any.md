# Build a wildcard pattern

Build a wildcard pattern

## Usage

``` r
xp_build_any(pattern = NULL, n = NULL)
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
xp_literal("A") %>% xp_build_any() %>% xp_literal("C")
#> Error in xp_literal("A") %>% xp_build_any() %>% xp_literal("C"): could not find function "%>%"
xp_build_any(n = 10)
#> [1] ".{10}"
```
