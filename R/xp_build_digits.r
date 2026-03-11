#' Build a digit pattern
#'
#' @param pattern (Optional) An existing pattern from the pipe.
#' @param n Exact number of digits.
#' @return A character string.
#' @export
#' @examples
#' xp_build_digits(n = 3)
#' xp_literal("Area Code: ") %>% xp_build_digits(3)
xp_build_digits <- function(pattern = NULL, n = NULL) {
  new_piece <- if (is.null(n)) "\\d" else paste0("\\d{", n, "}")
  if (is.null(pattern)) return(new_piece)
  paste0(pattern, new_piece)
}