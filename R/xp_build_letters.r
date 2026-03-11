#' Build a letter pattern
#'
#' @param pattern (Optional) An existing pattern from the pipe.
#' @param case "both" (default), "lower", or "upper".
#' @param n Exact number of repetitions.
#' @return A character string.
#' @export
#' @examples
#' xp_build_letters(case = "upper", n = 3)
#' xp_build_digits(1) %>% xp_build_letters(case = "lower", n = 2)
xp_build_letters <- function(pattern = NULL, case = "both", n = NULL) {
  class <- switch(case,
    "lower" = "[[:lower:]]",
    "upper" = "[[:upper:]]",
    "[[:alpha:]]"
  )
  new_piece <- if (is.null(n)) class else paste0(class, "{", n, "}")
  if (is.null(pattern)) return(new_piece)
  paste0(pattern, new_piece)
}