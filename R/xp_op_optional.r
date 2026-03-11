#' Make a pattern optional
#'
#' Tells the engine that the preceding pattern may appear 0 or 1 times.
#'
#' @param pattern A character string.
#' @return A character string.
#' @export
#' @examples
#' xp_build_digits(3) %>% xp_op_optional()
xp_op_optional <- function(pattern) {
  # We wrap in a non-capturing group to ensure the '?' applies to the whole pattern
  paste0("(?:", pattern, ")?")
}