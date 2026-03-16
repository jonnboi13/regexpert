# Repeat a pattern

Specifies how many times a pattern should occur. Can handle exact
counts, ranges, or unbounded "many" matches.

## Usage

``` r
xp_op_repeat(pattern, n, max = NULL)
```

## Arguments

- pattern:

  A character string.

- n:

  Minimum number of repetitions.

- max:

  Maximum number of repetitions. Use Inf for "or more". If NULL
  (default), matches exactly n times.

## Value

A character string wrapped in a non-capturing group.

## Examples

``` r
# Exactly 3 digits
xp_build_digits() %>% xp_op_repeat(3)
#> Error in xp_build_digits() %>% xp_op_repeat(3): could not find function "%>%"

# Between 2 and 5 letters
xp_build_letters() %>% xp_op_repeat(2, 5)
#> Error in xp_build_letters() %>% xp_op_repeat(2, 5): could not find function "%>%"

# 1 or more (The "Plus" logic)
xp_build_alnum() %>% xp_op_repeat(1, Inf)
#> Error in xp_build_alnum() %>% xp_op_repeat(1, Inf): could not find function "%>%"
```
