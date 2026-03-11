#' Match one of two patterns
#'
#' Provides an 'OR' logic between two different patterns.
#'
#' @param pattern_a The first pattern.
#' @param pattern_b The second pattern.
#' @return A character string.
#' @export
#' @examples
#' xp_op_either(xp_build_digits(3), xp_build_letters(2))
xp_op_either <- function(pattern_a, pattern_b) {
  paste0("(?:", pattern_a, "|", pattern_b, ")")
}