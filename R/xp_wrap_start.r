#' Anchor pattern to the start
#'
#' Forces the pattern to match only if it appears at the beginning of the string.
#'
#' @param pattern A character string.
#' @return A character string with a '^' prefix.
#' @export
#' @examples
#' xp_build_digits(3) %>% xp_wrap_start()
xp_wrap_start <- function(pattern) {
  paste0("^", pattern)
}