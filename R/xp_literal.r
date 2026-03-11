#' Add literal text to a pattern
#'
#' @param pattern (Optional) An existing regex string from the pipe.
#' @param literal The exact text/symbols you want to add.
#' @return A character string.
#' @export
xp_literal <- function(pattern = NULL, literal = NULL) {
  
  # Logic: If the user only provides one argument, treat it as the literal.
  # This allows: xp_literal("$") 
  if (is.null(literal)) {
    literal <- pattern
    pattern <- NULL
  }

  # The Shield: Escape special characters
  safe_text <- gsub("([\\.\\?\\*\\+\\(\\)\\[\\]\\{\\}\\^\\$\\|])", "\\\\\\1", literal)
  
  if (is.null(pattern)) return(safe_text)
  paste0(pattern, safe_text)
}