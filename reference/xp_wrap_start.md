# Anchor pattern to the start

Forces the pattern to match only if it appears at the beginning of the
string.

## Usage

``` r
xp_wrap_start(pattern)
```

## Arguments

- pattern:

  A character string.

## Value

A character string with a '^' prefix.

## Examples

``` r
xp_build_digits(3) %>% xp_wrap_start()
#> Error in xp_build_digits(3) %>% xp_wrap_start(): could not find function "%>%"
```
