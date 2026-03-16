#' Make a pattern optional
#'
#' Specifies that the preceding pattern should occur zero or one time.
#' Equivalent to the \code{?} quantifier.
#'
#' @param pattern A \code{regexpert} object or character string from the pipe.
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Match "color" or "colour"
#' xp_build_literal("colo") %>% 
#'   xp_build_literal("u") %>% 
#'   xp_op_optional() %>% 
#'   xp_build_literal("r")
#' 
#' # Optional area code
#' xp_build_literal("(") %>% xp_build_digits() %>% xp_op_repeat(3) %>% 
#'   xp_build_literal(") ") %>% 
#'   xp_op_optional() %>% 
#'   xp_build_digits() %>% xp_op_repeat(7)
xp_op_optional <- function(pattern) {
  # Use the ? quantifier
  res <- paste0("(?:", as.character(pattern), ")?")
  new_xp(res)
}