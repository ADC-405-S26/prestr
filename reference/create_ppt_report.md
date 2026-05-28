# Create a PowerPoint Report from a Data Frame

Generates a PowerPoint presentation (.pptx) from a data frame. The
output includes a formatted title slide and a data table slide
displaying the provided data. Useful for quickly turning analysis
results into presentation-ready output.

## Usage

``` r
create_ppt_report(data, title, output_file = "report.pptx", subtitle = NULL)
```

## Arguments

- data:

  A data frame to include in the presentation. Must have at least one
  row and one column.

- title:

  A single character string used as the presentation title.

- output_file:

  A single character string specifying the output file path. Must end in
  `.pptx`. Defaults to `"report.pptx"`.

- subtitle:

  An optional single character string for the title slide subtitle.
  Defaults to `NULL` (no subtitle shown).

## Value

Invisibly returns the file path of the saved `.pptx` file.

## Examples

``` r
if (FALSE) { # \dontrun{
df <- data.frame(
  Category = c("A", "B", "C"),
  Value    = c(10, 25, 15)
)
create_ppt_report(df, title = "My Report", output_file = "my_report.pptx")
} # }
```
