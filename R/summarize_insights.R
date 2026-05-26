#' Summarize Key Insights from a Data Frame
#'
#' Computes a summary of numeric columns in a data frame, returning
#' key statistics including minimum, maximum, mean, and median for each
#' numeric variable. Useful for quickly extracting insights before
#' building a presentation with \code{create_ppt_report()}.
#'
#' @param data A data frame with at least one numeric column.
#' @param round_digits An integer specifying the number of decimal places
#'   to round numeric results to. Defaults to \code{2}.
#'
#' @return A data frame with one row per numeric column containing:
#'   \describe{
#'     \item{column}{Name of the numeric column}
#'     \item{min}{Minimum value}
#'     \item{max}{Maximum value}
#'     \item{mean}{Mean value}
#'     \item{median}{Median value}
#'   }
#'
#' @examples
#' df <- data.frame(
#'   Category = c("A", "B", "C"),
#'   Sales    = c(100, 250, 175),
#'   Profit   = c(20, 80, 55)
#' )
#' summarize_insights(df)
#' summarize_insights(df, round_digits = 0)
#'
#' @importFrom checkmate assert_data_frame assert_integerish
#' @importFrom stats median
#' @export
summarize_insights <- function(data, round_digits = 2) {

  checkmate::assert_data_frame(data, min.rows = 1, min.cols = 1)
  checkmate::assert_integerish(round_digits, lower = 0, len = 1)

  numeric_cols <- names(data)[sapply(data, is.numeric)]

  if (length(numeric_cols) == 0) {
    stop("data must contain at least one numeric column.")
  }

  results <- lapply(numeric_cols, function(col) {
    vals <- data[[col]]
    data.frame(
      column = col,
      min    = round(min(vals,    na.rm = TRUE), round_digits),
      max    = round(max(vals,    na.rm = TRUE), round_digits),
      mean   = round(mean(vals,   na.rm = TRUE), round_digits),
      median = round(median(vals, na.rm = TRUE), round_digits),
      stringsAsFactors = FALSE
    )
  })

  do.call(rbind, results)
}
