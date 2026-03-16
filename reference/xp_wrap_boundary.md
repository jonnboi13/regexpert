# Wrap pattern in word boundaries

Ensures the pattern matches as a whole word, preventing matches inside
other strings (e.g., matching 'cat' in 'category').

## Usage

``` r
xp_wrap_boundary(pattern)
```

## Arguments

- pattern:

  A character string.

## Value

A character string wrapped in '\b'.

## Examples

``` r
# Matches '123' but not '01234'
xp_build_digits(3) %>% xp_wrap_boundary()
#> Error in xp_build_digits(3) %>% xp_wrap_boundary(): could not find function "%>%"
```
