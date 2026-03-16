#' View the generated regex string
#' 
#' Prints the current regex pattern to the console in a clean format.
#'
#' @param pattern A \code{regexpert} object.
#' @export
#' @examples
#' xp_build_digits() %>% xp_op_repeat(3) %>% xp_view()
xp_view <- function(pattern) {
  # We use cat() because it renders the backslashes correctly for human reading
  cat("Current Regex Pattern:\n")
  cat(as.character(pattern), "\n")
  return(invisible(pattern)) # Returns the pattern so it can keep being piped
}