#' Repeat a pattern
#'
#' Specifies how many times a pattern should occur. This function acts as a 
#' quantifier, allowing for exact counts, ranges, or unbounded "many" matches.
#' 
#' @details 
#' The function automatically optimizes common regex quantifiers:
#' \itemize{
#'   \item 0 to Inf becomes \code{*}
#'   \item 1 to Inf becomes \code{+}
#'   \item Exact counts use \code{{n}}
#' }
#' It also wraps the incoming pattern in a non-capturing group \code{(?:)} 
#' to ensure the quantifier applies to the entire preceding logic rather than 
#' just the last character.
#'
#' @param pattern A \code{regexpert} object or character string from the pipe.
#' @param n Integer. The minimum number of repetitions. 
#' @param max Integer or Inf. The maximum number of repetitions. 
#' If \code{NULL} (default), the pattern must match exactly \code{n} times.
#'
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' # Match exactly 3 digits
#' xp_build_digits() %>% xp_op_repeat(3)
#' 
#' # Match between 2 and 5 lowercase letters
#' xp_build_letters(case = "lower") %>% xp_op_repeat(2, 5)
#' 
#' # Match 1 or more alphanumeric characters
#' xp_build_alnum() %>% xp_op_repeat(1, Inf)
xp_op_repeat <- function(pattern, n, max = NULL) {
  
  # 1. Handle the quantifier logic
  if (is.null(max)) {
    # Exact: {n}
    suffix <- paste0("{", n, "}")
  } else if (is.infinite(max)) {
    # Unbounded logic (* or + or {n,})
    if (n == 0) {
      suffix <- "*"
    } else if (n == 1) {
      suffix <- "+"
    } else {
      suffix <- paste0("{", n, ",}")
    }
  } else {
    # Range: {n,max}
    suffix <- paste0("{", n, ",", max, "}")
  }
  
  # 2. Extract string, wrap safely, and re-seal as xp object
  # (?:) is a non-capturing group that keeps the pattern logic together
  res <- paste0("(?:", as.character(pattern), ")", suffix)
  
  new_xp(res)
}