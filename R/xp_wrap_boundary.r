#' Wrap in word boundaries
#'
#' Adds \code{\\b} to both sides of the pattern. This ensures that the 
#' pattern is matched as a whole word (not inside another word).
#'
#' @param pattern A \code{regexpert} object or character string from the pipe.
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Match "cat" but not "category" or "bobcat"
#' xp_build_literal("cat") %>% xp_wrap_boundary()
xp_wrap_boundary <- function(pattern) {
  # Wrap in boundary markers
  res <- paste0("\\b", as.character(pattern), "\\b")
  new_xp(res)
}