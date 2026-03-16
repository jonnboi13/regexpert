#' Anchor to the end of the string
#'
#' Adds the \code{$} anchor to the end of the pattern, ensuring 
#' the match must continue until the very last character of the string.
#'
#' @param pattern A \code{regexpert} object or character string from the pipe.
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Match ".com" only if it's at the very end
#' xp_build_literal(".com") %>% xp_wrap_end()
#' 
#' # Match an exact 5-digit string (start to end)
#' xp_build_digits() %>% xp_op_repeat(5) %>% xp_wrap_start() %>% xp_wrap_end()
xp_wrap_end <- function(pattern) {
  res <- paste0(as.character(pattern), "$")
  new_xp(res)
}