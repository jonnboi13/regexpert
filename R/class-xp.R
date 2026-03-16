#' Create a regexpert object
#'
#' This is an internal constructor that converts a string into a \code{regexpert} object. 
#' It allows for custom printing and ensures operators handle patterns correctly.
#'
#' @param x A character string representing a regex pattern.
#' @return An object of class \code{xp}.
#' @keywords internal
new_xp <- function(x) {
  structure(as.character(x), class = "xp")
}

#' Print a regexpert pattern
#'
#' Custom print method to display \code{xp} objects cleanly in the console.
#'
#' @param x A regexpert object.
#' @param ... Unused.
#' @export
print.xp <- function(x, ...) {
  cat("<regexpert pattern>\n")
  cat("  ", as.character(x), "\n", sep = "")
  invisible(x)
}