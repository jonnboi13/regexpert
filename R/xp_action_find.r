#' Find matches in a string
#' 
#' Searches a character vector for matches to the built regex pattern.
#'
#' @param pattern A \code{regexpert} object or character string.
#' @param string A character vector to search within.
#' @return A character vector of matches.
#' @export
#' @examples
#' my_text <- "The year is 2026."
#' xp_build_digits() %>% xp_op_repeat(4) %>% xp_find(my_text)
xp_find <- function(pattern, string) {
  # Extract the raw string from the xp object
  regex_string <- as.character(pattern)
  
  # Use base R's regmatches and regexpr
  matches <- regmatches(string, regexpr(regex_string, string))
  
  if (length(matches) == 0) {
    message("No matches found.")
    return(character(0))
  }
  
  return(matches)
}