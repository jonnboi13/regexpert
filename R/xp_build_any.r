#' Build a wildcard pattern
#'
#' @param pattern (Optional) An existing pattern from the pipe.
#' @param n Exact number of characters.
#' @return A character string.
#' @export
#' @examples
#' xp_literal("A") %>% xp_build_any() %>% xp_literal("C")
#' xp_build_any(n = 10)
xp_build_any <- function(pattern = NULL, n = NULL) {
  new_piece <- if (is.null(n)) "." else paste0(".{", n, "}")
  if (is.null(pattern)) return(new_piece)
  paste0(pattern, new_piece)
}