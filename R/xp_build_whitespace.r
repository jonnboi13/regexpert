#' Build a whitespace pattern
#'
#' Matches spaces, tabs, and line breaks.
#'
#' @param pattern (Optional) An existing pattern from a pipe.
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Match two words separated by whitespace
#' xp_build_letters() %>% xp_build_whitespace() %>% xp_build_letters()
xp_build_whitespace <- function(pattern = NULL) {
  new_piece <- "\\s"
  res <- if (is.null(pattern)) new_piece else paste0(as.character(pattern), new_piece)
  new_xp(res)
}