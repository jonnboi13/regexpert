# Build a letter pattern

Build a letter pattern

## Usage

``` r
xp_build_letters(pattern = NULL, case = "both", n = NULL)
```

## Arguments

- pattern:

  (Optional) An existing pattern from the pipe.

- case:

  "both" (default), "lower", or "upper".

- n:

  Exact number of repetitions.

## Value

A character string.

## Examples

``` r
xp_build_letters(case = "upper", n = 3)
#> [1] "[[:upper:]]{3}"
xp_build_digits(1) %>% xp_build_letters(case = "lower", n = 2)
#> Error in xp_build_digits(1) %>% xp_build_letters(case = "lower", n = 2): could not find function "%>%"
```
