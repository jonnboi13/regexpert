# Anchor pattern to the end

Forces the pattern to match only if it appears at the end of the string.

## Usage

``` r
xp_wrap_end(pattern)
```

## Arguments

- pattern:

  A character string.

## Value

A character string with a '\$' suffix.

## Examples

``` r
xp_build_letters() %>% xp_wrap_end()
#> Error in xp_build_letters() %>% xp_wrap_end(): could not find function "%>%"
```
