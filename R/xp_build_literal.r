#' Build or add literal text
#'
#' Converts raw text into a safe regex pattern by escaping special characters.
#'
#' @param pattern (Optional) An existing pattern from a pipe.
#' @param literal The exact text/symbols you want to match.
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Safely match a price with a dollar sign and decimal
#' xp_build_literal("$") %>% xp_build_digits() %>% xp_build_literal(".") %>% xp_build_digits()
#' 
#' # Starting a chain with a literal
#' xp_build_literal("v1.0") %>% xp_wrap_boundary()
xp_build_literal <- function(pattern = NULL, literal = NULL) {
  if (is.null(literal)) {
    literal <- pattern
    pattern <- NULL
  }
  
  safe_text <- gsub("([\\.\\?\\*\\+\\(\\)\\[\\]\\{\\}\\^\\$\\|])", "\\\\\\1", as.character(literal))
  
  res <- if (is.null(pattern)) safe_text else paste0(as.character(pattern), safe_text)
  new_xp(res)
}