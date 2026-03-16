#' Build a digit pattern
#'
#' Matches any single digit (0-9).
#'
#' @param pattern (Optional) An existing pattern from a pipe.
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Match exactly three digits
#' xp_build_digits() %>% xp_op_repeat(3)
#' 
#' # Combine digits with literal text
#' xp_build_literal("Year: ") %>% xp_build_digits() %>% xp_op_repeat(4)
xp_build_digits <- function(pattern = NULL) {
  new_piece <- "\\d"
  res <- if (is.null(pattern)) new_piece else paste0(as.character(pattern), new_piece)
  new_xp(res)
}