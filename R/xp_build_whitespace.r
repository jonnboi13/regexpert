#' Build a whitespace pattern
#'
#' @param pattern (Optional) An existing pattern from the pipe.
#' @param n Exact number of spaces/tabs.
#' @return A character string.
#' @export
#' @examples
#' xp_literal("Word") %>% xp_build_whitespace() %>% xp_literal("Word")
#' xp_build_whitespace(n = 2)
xp_build_whitespace <- function(pattern = NULL, n = NULL) {
  new_piece <- if (is.null(n)) "\\s" else paste0("\\s{", n, "}")
  if (is.null(pattern)) return(new_piece)
  paste0(pattern, new_piece)
}