#' Build an alphanumeric pattern
#'
#' Matches any single letter (A-Z, a-z) or digit (0-9).
#'
#' @param pattern (Optional) An existing pattern from a pipe.
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Match a string of 8 alphanumeric characters (like a serial number)
#' xp_build_alnum() %>% xp_op_repeat(8)
xp_build_alnum <- function(pattern = NULL) {
  new_piece <- "[A-Za-z0-9]"
  res <- if (is.null(pattern)) new_piece else paste0(as.character(pattern), new_piece)
  new_xp(res)
}