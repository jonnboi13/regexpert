#' Wrap pattern in word boundaries
#'
#' Ensures the pattern matches as a whole word, preventing matches 
#' inside other strings (e.g., matching 'cat' in 'category').
#'
#' @param pattern A character string.
#' @return A character string wrapped in '\\b'.
#' @export
#' @examples
#' # Matches '123' but not '01234'
#' xp_build_digits(3) %>% xp_wrap_boundary()
xp_wrap_boundary <- function(pattern) {
  paste0("\\\\b", pattern, "\\\\b")
}