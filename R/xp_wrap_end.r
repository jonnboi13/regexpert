#' Anchor pattern to the end
#'
#' Forces the pattern to match only if it appears at the end of the string.
#'
#' @param pattern A character string.
#' @return A character string with a '$' suffix.
#' @export
#' @examples
#' xp_build_letters() %>% xp_wrap_end()
xp_wrap_end <- function(pattern) {
  paste0(pattern, "$")
}