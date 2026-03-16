#' Build an "any character" pattern
#'
#' Matches any single character except for a newline (the regex dot).
#'
#' @param pattern (Optional) An existing pattern from a pipe.
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Match anything between two brackets
#' xp_build_literal("[") %>% xp_build_any() %>% xp_op_repeat(0, Inf) %>% xp_build_literal("]")
xp_build_any <- function(pattern = NULL) {
  new_piece <- "."
  res <- if (is.null(pattern)) new_piece else paste0(as.character(pattern), new_piece)
  new_xp(res)
}