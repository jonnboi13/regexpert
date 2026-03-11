#' Repeat a pattern
#'
#' Specifies how many times a pattern should occur. Can handle exact counts,
#' ranges, or unbounded "many" matches.
#'
#' @param pattern A character string.
#' @param n Minimum number of repetitions. 
#' @param max Maximum number of repetitions. Use Inf for "or more". 
#' If NULL (default), matches exactly n times.
#' @return A character string wrapped in a non-capturing group.
#' @export
#' @examples
#' # Exactly 3 digits
#' xp_build_digits() %>% xp_op_repeat(3)
#' 
#' # Between 2 and 5 letters
#' xp_build_letters() %>% xp_op_repeat(2, 5)
#' 
#' # 1 or more (The "Plus" logic)
#' xp_build_alnum() %>% xp_op_repeat(1, Inf)
xp_op_repeat <- function(pattern, n, max = NULL) {
  
  # Handle the suffix logic
  if (is.null(max)) {
    # Exact: {n}
    suffix <- paste0("{", n, "}")
  } else if (is.infinite(max)) {
    # Unbounded logic (* or +)
    if (n == 0) suffix <- "*"
    else if (n == 1) suffix <- "+"
    else suffix <- paste0("{", n, ",}") # e.g., 3 or more: {3,}
  } else {
    # Range: {n,max}
    suffix <- paste0("{", n, ",", max, "}")
  }
  
  paste0("(?:", pattern, ")", suffix)
}