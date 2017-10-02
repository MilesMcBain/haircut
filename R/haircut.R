#' Return matching characters matching an expression.
#'
#' Given a vector of chracter strings, this function returns matches as a vector.
#' This allows a chainable regex filtering style that is readily compatible with `%>%`.
#' All matches from the resulting regexec call are pasted together. This will create
#' weird behaviour if you use capturing groups. Best to use non-capturing `(?:)`.
#'
#' @param text a vector of charcter strings to be matched.
#' @param pattern a regular expression.
#'
#' @return vector of substrings of `text` that matched the `pattern`.
#' @export
#' @examples
#' \dontrun{
#' rblogger_urls %>%
#'   regex_match("(?<=\")http.*(?=\")") %>%
#'   regex_match_except("^https*://") %>%
#'   regex_match("[A-Za-z0-9-.]+(?=/|\"|$)") %>%
#'   datapasta::dpasta()
#  c("dmlc.ml", "lionel-.github.io", "jean9208.github.io", "ryouready.wordpress.com", "rveryday.wordpress.com",
#  "www.talyarkoni.org", "rtricks.wordpress.com")
#' }
regex_match <- function(text, pattern){
  text_matches <- regexec(text = text, pattern = pattern, perl = TRUE)
  match_content <- regmatches(text, text_matches)
  unlist(lapply(match_content, paste0, collapse = ""))
}

#' Return characters not matching a regular expression
#'
#' Given a vector of chracter strings, this function returns portions of the stirng
#' that do not march a pattern, as a vector. This allows a chainable regex
#' filtering style that is readily compatible with `%>%`.
#' All matches from the resulting regexec call are pasted together. This will create
#' weird behaviour if you use capturing groups. Best to use non-capturing `(?:)`.
#'
#' @param text a vector of characer strings to be (un)matched.
#' @param pattern a regular expression.
#'
#' @return vector of substrings of `text` that dit not match the `pattern`.
#' @export
regex_match_except <- function(text, pattern){
  text_matches <- regexec(text = text, pattern = pattern, perl = TRUE)
  match_content <- regmatches(text, text_matches, invert = TRUE)
  unlist(lapply(match_content, paste0, collapse = ""))
}

#' Substitute characters matching a regular expression.
#'
#' Given a vector of character strings, substitute parts of the strings
#' matching `pattern` with `replacement`. `replacement` can be a vector
#' argument, in which case it must be the same length as `text`, and
#' the substiuted `text` is made per `replacement` string.
#'
#' The default mode is to substitute all pattern matches. This can be
#' switched to first match only by setting `sub_all = FALSE`.
#'
#' @param text a vector of character strings to have patterns substituted.
#' @param pattern a string pattern that, if matched in `text` will be substituded with `replacement`.
#' @param replacement either a string or vector of strings to replace matching patterns in `text`.
#' @param sub_all Determined if all matches are substited (default), or the first ocurrence per input string.
#'
#' @return a vector of character strings
#' @export
#'
#' @examples
#' \dontrun{
#' regex_sub(c("ABC", "AXYZ", "DEFA"),"A", "_")
#' regex_sub(c("ABC_", "AXY_", "DEF_"),"_", c(1,2,3)
#' }
#'
regex_sub <- function(text, pattern, replacement, sub_all = TRUE){
  if(sub_all){
    sub_func <- gsub
  } else {
    sub_func <- sub
  }

  if(length(replacement) == length(text)){
    result <-
      mapply(
        FUN = sub_func,
        replacement = replacement,
        x = text,
        MoreArgs = list(
          pattern = pattern,
          perl = TRUE
        )
      )
  } else if(length(replacement) == 1){
    result <- sub_func(pattern,
                       replacement,
                       x = text,
                       perl = TRUE
                       )
  } else {
    stop("regex sub expected replacement argument of
         length ", length(text)," or length 1 got length",
         length(replacement),".")
  }
  result
}
