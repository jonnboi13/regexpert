#' Anchor to the start of the string
#'
#' Adds the \code{^} anchor to the beginning of the pattern, ensuring 
#' the match must start at the very first character of the string.
#'
#' @param pattern A \code{regexpert} object or character string from the pipe.
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Match "Hello" only if it's at the very start
#' xp_build_literal("Hello") %>% xp_wrap_start()
xp_wrap_start <- function(pattern) {
  res <- paste0("^", as.character(pattern))
  new_xp(res)
}