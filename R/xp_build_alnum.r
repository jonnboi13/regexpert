#' Build an alphanumeric pattern
#'
#' @param pattern (Optional) An existing pattern from the pipe.
#' @param n Exact number of characters.
#' @return A character string.
#' @export
#' @examples
#' xp_build_alnum(n = 5)
#' xp_literal("#") %>% xp_build_alnum(n = 3)
xp_build_alnum <- function(pattern = NULL, n = NULL) {
  class <- "[[:alnum:]]"
  new_piece <- if (is.null(n)) class else paste0(class, "{", n, "}")
  if (is.null(pattern)) return(new_piece)
  paste0(pattern, new_piece)
}