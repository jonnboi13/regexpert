#' Add an alternative pattern (OR)
#'
#' Adds an "either/or" condition to the pattern. This is equivalent to the 
#' regex pipe \code{|} operator.
#'
#' @param pattern A \code{regexpert} object or character string from the pipe.
#' @param alternative The alternative pattern or string to match.
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Match "cat" or "dog"
#' xp_build_literal("cat") %>% xp_op_either("dog")
#' 
#' # Match a digit or a letter
#' xp_build_digits() %>% xp_op_either(xp_build_letters())
xp_op_either <- function(pattern, alternative) {
  # Wrap both in a non-capturing group to prevent logic leakage
  # e.g., ^a|b$ should usually be ^(?:a|b)$
  res <- paste0("(?:", as.character(pattern), "|", as.character(alternative), ")")
  new_xp(res)
}