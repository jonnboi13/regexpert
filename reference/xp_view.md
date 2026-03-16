# View regex matches

Displays which parts of the text are being captured by your pattern.

## Usage

``` r
xp_view(text, pattern)
```

## Arguments

- text:

  The character vector to search.

- pattern:

  The regex pattern to test.

## Value

A list of matches found.

## Examples

``` r
"The cat in the hat" %>% xp_view(xp_build_letters(case = "lower"))
#> Error in "The cat in the hat" %>% xp_view(xp_build_letters(case = "lower")): could not find function "%>%"
```
