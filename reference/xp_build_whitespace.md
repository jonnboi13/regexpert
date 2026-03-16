# Build a whitespace pattern

Build a whitespace pattern

## Usage

``` r
xp_build_whitespace(pattern = NULL, n = NULL)
```

## Arguments

- pattern:

  (Optional) An existing pattern from the pipe.

- n:

  Exact number of spaces/tabs.

## Value

A character string.

## Examples

``` r
xp_literal("Word") %>% xp_build_whitespace() %>% xp_literal("Word")
#> Error in xp_literal("Word") %>% xp_build_whitespace() %>% xp_literal("Word"): could not find function "%>%"
xp_build_whitespace(n = 2)
#> [1] "\\s{2}"
```
