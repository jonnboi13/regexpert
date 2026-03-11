#' View regex matches
#'
#' Displays which parts of the text are being captured by your pattern.
#' 
#' @param text The character vector to search.
#' @param pattern The regex pattern to test.
#' @return A list of matches found.
#' @export
#' @examples
#' "The cat in the hat" %>% xp_view(xp_build_letters(case = "lower"))
xp_view <- function(text, pattern) {
  # This uses the built-in R extraction for quick console viewing
  regmatches(text, gregexpr(pattern, text))
}