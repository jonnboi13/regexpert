#' Find matches in text
#'
#' Extracts all occurrences of a pattern from the text and returns 
#' them as a character vector.
#'
#' @param text The character vector to search.
#' @param pattern The regex pattern to use.
#' @param unlist Logical. If TRUE (default), returns a single vector of all matches.
#' @return A character vector (or list if unlist = FALSE).
#' @export
#' @examples
#' "Order 123 and 456" %>% xp_find(xp_build_digits(3))
xp_find <- function(text, pattern, unlist = TRUE) {
  matches <- regmatches(text, gregexpr(pattern, text))
  if (unlist) return(unlist(matches))
  matches
}