# Getting Started with regexpert

## The Problem with Regular Expressions

If you’ve ever needed to extract a phone number or pull out specific
text in R, you’ve probably run into something like this:

``` r
stringr::str_extract_all("Call us at 800-555-1234", "\\d+")
```

That `"\\d+"` is a regular expression. It works — but what does it
*mean*? For anyone who doesn’t have regex memorized, this is a wall. You
have to stop what you’re doing, look up the syntax, and hope you get the
escaping right.

This is the problem `regexpert` solves.

## The Build → Act Workflow

`regexpert` breaks pattern matching into two plain-English steps:

1.  **Build** your pattern using a descriptive `xp_build_*` function.
2.  **Act** on it using
    [`xp_find()`](https://Jonnboi13.github.io/regexpert/reference/xp_find.md)
    to return matches.

These steps are connected with the pipe (`%>%` or `|>`), so your code
reads like a sentence:

``` r
"Call us at 800-555-1234" %>%
  xp_build_digits() %>%
  xp_find()
#> [1] "800" "555" "1234"
```

No regex required. You described what you wanted in plain English, and
`regexpert` handled the rest.

## The Builders

### `xp_build_digits()`

Matches any numeric character (0–9).

``` r
"Order #88412 placed on 2024-01-15" %>%
  xp_build_digits() %>%
  xp_find()
#> [1] "88412" "2024" "01" "15"
```

Use `negate = TRUE` to find everything *except* digits:

``` r
"Price: $100!" %>%
  xp_build_digits(negate = TRUE) %>%
  xp_find()
#> [1] "Price: $" "!"
```

### `xp_build_letters()`

Matches any alphabetic character (a–z, A–Z).

``` r
"Order #88412 placed" %>%
  xp_build_letters() %>%
  xp_find()
#> [1] "Order" "placed"
```

Use `negate = TRUE` to find everything *except* letters:

``` r
"abc123" %>%
  xp_build_letters(negate = TRUE) %>%
  xp_find()
#> [1] "123"
```

### `xp_build_whitespace()`

Matches spaces, tabs, and newlines.

``` r
"hello   world" %>%
  xp_build_whitespace() %>%
  xp_find()
#> [1] " " " " " "
```

Use `negate = TRUE` to find everything *except* whitespace:

``` r
"hello   world" %>%
  xp_build_whitespace(negate = TRUE) %>%
  xp_find()
#> [1] "hello" "world"
```
