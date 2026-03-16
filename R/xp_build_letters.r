#' Build a letter pattern
#'
#' Matches alphabetical characters.
#'
#' @param pattern (Optional) An existing pattern from a pipe.
#' @param case Character. One of "both" (default), "lower", or "upper".
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Match lowercase letters
#' xp_build_letters(case = "lower")
#' 
#' # Build a username pattern (Letters followed by numbers)
#' xp_build_letters() %>% xp_op_repeat(1, Inf) %>% xp_build_digits()
xp_build_letters <- function(pattern = NULL, case = c("both", "lower", "upper")) {
  case <- match.arg(case)
  new_piece <- switch(case,
    both  = "[A-Za-z]",
    lower = "[a-z]",
    upper = "[A-Z]"
  )
  res <- if (is.null(pattern)) new_piece else paste0(as.character(pattern), new_piece)
  new_xp(res)
}