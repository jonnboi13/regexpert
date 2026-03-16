# Match one of two patterns

Provides an 'OR' logic between two different patterns.

## Usage

``` r
xp_op_either(pattern_a, pattern_b)
```

## Arguments

- pattern_a:

  The first pattern.

- pattern_b:

  The second pattern.

## Value

A character string.

## Examples

``` r
xp_op_either(xp_build_digits(3), xp_build_letters(2))
#> [1] "(?:3\\d|2[[:alpha:]])"
```
