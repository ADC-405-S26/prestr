# Summarize Key Insights from a Data Frame

Computes a summary of numeric columns in a data frame, returning key
statistics including minimum, maximum, mean, and median for each numeric
variable. Useful for quickly extracting insights before building a
presentation with
[`create_ppt_report()`](https://adc-405-s26.github.io/prestr/reference/create_ppt_report.md).

## Usage

``` r
summarize_insights(data, round_digits = 2)
```

## Arguments

- data:

  A data frame with at least one numeric column.

- round_digits:

  An integer specifying the number of decimal places to round numeric
  results to. Defaults to `2`.

## Value

A data frame with one row per numeric column containing:

- column:

  Name of the numeric column

- min:

  Minimum value

- max:

  Maximum value

- mean:

  Mean value

- median:

  Median value

## Examples

``` r
df <- data.frame(
  Category = c("A", "B", "C"),
  Sales    = c(100, 250, 175),
  Profit   = c(20, 80, 55)
)
summarize_insights(df)
#>   column min max   mean median
#> 1  Sales 100 250 175.00    175
#> 2 Profit  20  80  51.67     55
summarize_insights(df, round_digits = 0)
#>   column min max mean median
#> 1  Sales 100 250  175    175
#> 2 Profit  20  80   52     55
```
