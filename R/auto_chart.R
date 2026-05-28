#' Auto-Generate a Chart from a Data Frame
#'
#' Creates a styled \code{ggplot2} chart from a data frame. Supports bar,
#' line, and scatter chart types. The returned object can be further
#' customized with standard \code{ggplot2} functions or passed into
#' \code{create_ppt_report()}.
#'
#' @param data A data frame with at least one row and one column.
#' @param x A single character string naming the x-axis column. Can be
#'   any type. Must exist in \code{data}.
#' @param y A single character string naming the y-axis column. Must exist
#'   in \code{data} and must be numeric.
#' @param chart_type One of \code{"bar"}, \code{"line"}, or
#'   \code{"scatter"}. Defaults to \code{"bar"}.
#' @param title An optional character string for the chart title.
#'   Defaults to \code{NULL}.
#'
#' @return A \code{ggplot} object styled with \code{theme_minimal()}.
#'   Can be printed, further modified, or saved with \code{ggsave()}.
#'
#' @examples
#' df <- data.frame(Category = c("A", "B", "C"), Value = c(10, 25, 15))
#'
#' # Bar chart (default)
#' auto_chart(df, x = "Category", y = "Value")
#'
#' # Line chart with title
#' auto_chart(df, x = "Category", y = "Value",
#'            chart_type = "line", title = "Trend")
#'
#' # Scatter plot
#' auto_chart(df, x = "Category", y = "Value", chart_type = "scatter")
#'
#' @seealso \code{\link{create_ppt_report}}, \code{\link{summarize_insights}}
#'
#' @importFrom ggplot2 ggplot aes geom_col geom_line geom_point labs theme_minimal
#' @importFrom checkmate assert_data_frame assert_string assert_choice
#' @importFrom rlang .data
#' @export
auto_chart <- function(data,
                       x,
                       y,
                       chart_type = "bar",
                       title      = NULL) {

  checkmate::assert_data_frame(data, min.rows = 1, min.cols = 1)
  checkmate::assert_string(x, min.chars = 1)
  checkmate::assert_string(y, min.chars = 1)
  checkmate::assert_choice(chart_type, choices = c("bar", "line", "scatter"))

  if (!x %in% names(data)) {
    stop(paste0("Column '", x, "' not found in data."))
  }
  if (!y %in% names(data)) {
    stop(paste0("Column '", y, "' not found in data."))
  }
  if (!is.numeric(data[[y]])) {
    stop(paste0("Column '", y, "' must be numeric."))
  }
  if (!is.null(title)) {
    checkmate::assert_string(title, min.chars = 1)
  }


  p <- ggplot2::ggplot(data, ggplot2::aes(x = .data[[x]], y = .data[[y]]))

  if (chart_type == "bar") {
    p <- p + ggplot2::geom_col(fill = "#2C7BB6")
  } else if (chart_type == "line") {
    p <- p + ggplot2::geom_line(color = "#2C7BB6", linewidth = 1) +
      ggplot2::geom_point(color = "#2C7BB6", size = 2)
  } else if (chart_type == "scatter") {
    p <- p + ggplot2::geom_point(color = "#2C7BB6", size = 3)
  }

  p <- p + ggplot2::labs(title = title, x = x, y = y) +
    ggplot2::theme_minimal()

  return(p)
}
