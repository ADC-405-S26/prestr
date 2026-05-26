#' Create a PowerPoint Report from a Data Frame
#'
#' Generates a PowerPoint presentation (.pptx) from a data frame. The output
#' includes a formatted title slide and a data table slide displaying the
#' provided data. Useful for quickly turning analysis results into
#' presentation-ready output.
#'
#' @param data A data frame to include in the presentation. Must have at least
#'   one row and one column.
#' @param title A single character string used as the presentation title.
#' @param output_file A single character string specifying the output file path.
#'   Must end in \code{.pptx}. Defaults to \code{"report.pptx"}.
#' @param subtitle An optional single character string for the title slide
#'   subtitle. Defaults to \code{NULL} (no subtitle shown).
#'
#' @return Invisibly returns the file path of the saved \code{.pptx} file.
#'
#' @examples
#' \dontrun{
#' df <- data.frame(
#'   Category = c("A", "B", "C"),
#'   Value    = c(10, 25, 15)
#' )
#' create_ppt_report(df, title = "My Report", output_file = "my_report.pptx")
#' }
#'
#' @importFrom officer read_pptx add_slide ph_with ph_location_type
#' @importFrom flextable flextable autofit theme_vanilla
#' @importFrom checkmate assert_data_frame assert_string assert_true
#' @export
create_ppt_report <- function(data,
                              title,
                              output_file = "report.pptx",
                              subtitle    = NULL) {

  checkmate::assert_data_frame(data, min.rows = 1, min.cols = 1)
  checkmate::assert_string(title, min.chars = 1)
  checkmate::assert_string(output_file, min.chars = 1)
  checkmate::assert_true(
    grepl("\\.pptx$", output_file, ignore.case = TRUE),
    .var.name = "output_file must end with '.pptx'"
  )
  if (!is.null(subtitle)) {
    checkmate::assert_string(subtitle, min.chars = 1)
  }

  prs <- officer::read_pptx()

  prs <- officer::add_slide(prs, layout = "Title Slide", master = "Office Theme")
  prs <- officer::ph_with(prs, value = title,
                          location = officer::ph_location_type(type = "ctrTitle"))

  if (!is.null(subtitle)) {
    prs <- officer::ph_with(prs, value = subtitle,
                            location = officer::ph_location_type(type = "subTitle"))
  }

  prs <- officer::add_slide(prs, layout = "Title and Content", master = "Office Theme")
  prs <- officer::ph_with(prs, value = paste("Data:", title),
                          location = officer::ph_location_type(type = "title"))

  ft <- flextable::flextable(data)
  ft <- flextable::theme_vanilla(ft)
  ft <- flextable::autofit(ft)

  prs <- officer::ph_with(prs, value = ft,
                          location = officer::ph_location_type(type = "body"))

  print(prs, target = output_file)

  invisible(output_file)
}
