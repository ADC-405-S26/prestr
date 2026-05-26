#' Monthly Sales Performance Data
#'
#' A dataset containing monthly sales performance metrics across
#' four product categories over one year. Useful for demonstrating
#' \code{create_ppt_report()}, \code{auto_chart()}, and
#' \code{summarize_insights()}.
#'
#' @format A data frame with 48 rows and 5 variables:
#' \describe{
#'   \item{month}{Month name (e.g., "January")}
#'   \item{category}{Product category: Electronics, Clothing, Food, or Furniture}
#'   \item{sales}{Total sales in dollars}
#'   \item{profit}{Total profit in dollars}
#'   \item{units_sold}{Number of units sold}
#' }
#'
#' @examples
#' data(sales_data)
#' head(sales_data)
#' summarize_insights(sales_data)
#'
"sales_data"
