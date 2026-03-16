# Make a pattern optional

Tells the engine that the preceding pattern may appear 0 or 1 times.

## Usage

``` r
xp_op_optional(pattern)
```

## Arguments

- pattern:

  A character string.

## Value

A character string.

## Examples

``` r
xp_build_digits(3) %>% xp_op_optional()
#> Error in xp_build_digits(3) %>% xp_op_optional(): could not find function "%>%"
```
