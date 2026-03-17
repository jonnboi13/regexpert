#' Register a Custom Standard
#' 
#' Adds a custom regex pattern to the global library for the current session.
#'
#' @param name A character string to name the pattern.
#' @param pattern A regex string or regexpert object.
#' @export
xp_register <- function(name, pattern) {
  # Get current list or create empty one if it doesn't exist
  customs <- getOption("regexpert.custom", list())
  
  # Add the new pattern (ensuring it is a string)
  customs[[name]] <- as.character(pattern)
  
  # Save back to global options
  options(regexpert.custom = customs)
  
  message(paste0("Pattern '", name, "' registered to standards library."))
}

#' Build a standard Pattern
 
#' Access a library of pre-defined, complex regex patterns for common data types.

#' @param type A character string specifying the pattern.
#' Options include: \code{"email"}, \code{"phone"}, \code{"zip"}, \code{"date_iso"}, \code{"date_us"}, \code{"credit_card"}, \code{"ipv4"}, \code{"hex_color"}, \code{"time_24"}, \code{"ssn"}, \code{"mac_address"}.
#' @return A \code{regexpert} object.
#' @export
#' @examples
#' xp_build_standard("email")
#' xp_build_standard("zip") %>% xp_action_find("My code is 83440")
xp_build_standard <- function(type) {
  std_list <- list(
    # EMAIL
    # Logic: Username + @ + Domain + TLD
    # e.g., john.doe@example.com
    "email" = "[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}",

    # PHONE (North American)
    # Logic: Optional country code (1) + optional parens + 3 digits + separator + 3 digits + separator + 4 digits
    # Separator can be a dash, dot, or nothing. Parentheses around area code are optional.
    # e.g., 208-555-1234 or (208) 555-1234 or 208.555.1234 or 1-208-555-1234
    "phone" = "(?:1[-.]?)?\\(?\\d{3}\\)?[-.]?\\d{3}[-.]?\\d{4}",

    # ZIP CODE
    # Logic: 5 digits followed by an optional dash and 4 digits
    # e.g., 83440 or 83440-1234
    "zip" = "\\d{5}(-\\d{4})?",

    # DATE (ISO)
    # Logic: YYYY-MM-DD format
    # e.g., 2026-03-17
    "date_iso" = "\\d{4}-\\d{2}-\\d{2}",

    # DATE (US)
    # Logic: MM/DD/YYYY or MM-DD-YYYY with validation for months (01-12) and days (01-31)
    # e.g., 03/17/2026
    "date_us" = "(?:0[1-9]|1[0-2])[/-](?:0[1-9]|[12][0-9]|3[01])[/-](?:19|20)\\d{2}",

    # CREDIT CARD
    # Logic: 16 digits often separated by spaces or dashes into groups of four
    # e.g., 1234-5678-9012-3456
    "credit_card" = "\\d{4}[ -]?\\d{4}[ -]?\\d{4}[ -]?\\d{4}",

    # IP ADDRESS (IPv4)
    # Logic: 4 sets of 0-255 separated by dots
    # e.g., 192.168.1.1
    "ipv4" = "(?:(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)\\.){3}(?:25[0-5]|2[0-4]\\d|[01]?\\d?\\d)",

    # HEX COLOR CODE
    # Logic: # followed by 3 or 6 hex characters (0-9, a-f)
    # e.g., #ffffff or #333
    "hex_color" = "#(?:[0-9a-fA-F]{3}){1,2}",

    # 24-HOUR TIME
    # Logic: HH:MM or HH:MM:SS in 24-hour format
    # e.g., 13:45 or 23:59:59
    "time_24" = "(?:[01]\\d|2[0-3]):[0-5]\\d(?::[0-5]\\d)?",

    # SOCIAL SECURITY NUMBER (SSN)
    # Logic: Standard 3-2-4 digit grouping with dashes
    # e.g., 000-00-0000
    "ssn" = "\\d{3}-\\d{2}-\\d{4}",

    # MAC ADDRESS
    # Logic: 6 pairs of hex digits separated by colons or dashes
    # e.g., 01:23:45:67:89:ab
    "mac_address" = "(?:[0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}"
)
  
  # 2. Check the Global Registry (for user-added patterns)
  customs <- getOption("regexpert.custom", list())
  full_library <- modifyList(std_list, customs)
  
  # 3. Validation
  if (!type %in% names(full_library)) {
    stop(paste0("Pattern type '", type, "' not found. Available types: ", 
                paste(names(full_library), collapse = ", ")))
  }
  
  # 4. Return as an S3 regexpert object
  new_xp(full_library[[type]])
}