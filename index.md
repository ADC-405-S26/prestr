## Overview

**prestr** is an R package that helps you go from raw data to a
presentation-ready PowerPoint in minutes. Whether you’re reporting
results, summarizing findings, or building slides for a meeting,
`prestr` handles the heavy lifting.

The package provides three core functions:

- [`create_ppt_report()`](https://adc-405-s26.github.io/prestr/reference/create_ppt_report.md)
  : Generate a `.pptx` file with a title slide and data table
- [`auto_chart()`](https://adc-405-s26.github.io/prestr/reference/auto_chart.md)
  : Create bar, line, or scatter charts from a data frame
- [`summarize_insights()`](https://adc-405-s26.github.io/prestr/reference/summarize_insights.md)
  : Extract key statistics from numeric columns

------------------------------------------------------------------------

## Installation

You can install `prestr` directly from GitHub:

``` r
# install.packages("devtools")
devtools::install_github("ADC-405-S26/prestr")
```

------------------------------------------------------------------------

## Usage

### Create a PowerPoint Report

``` r
library(prestr)

data(sales_data)

create_ppt_report(
  data        = sales_data,
  title       = "Monthly Sales Report",
  subtitle    = "Q1 - Q4 Performance",
  output_file = "sales_report.pptx"
)
```

### Auto-Generate a Chart

``` r
library(prestr)

data(sales_data)

# Filter to one category
electronics <- sales_data[sales_data$category == "Electronics", ]

auto_chart(
  data       = electronics,
  x          = "month",
  y          = "sales",
  chart_type = "line",
  title      = "Electronics Monthly Sales"
)
```

### Summarize Insights

``` r
library(prestr)

data(sales_data)

summarize_insights(sales_data)
#>      column   min    max     mean  median
#> 1     sales  2900  28900  10564.58  8500
#> 2    profit   700   9100   2916.67  2350
#> 3 units_sold    58   815    306.46   272
```

------------------------------------------------------------------------

## Dataset

`prestr` includes a built-in dataset `sales_data` — monthly sales
performance across four product categories (Electronics, Clothing, Food,
Furniture) over one year. Use it to explore and test all three functions
right away.

``` r
data(sales_data)
head(sales_data)
```

------------------------------------------------------------------------

## Functions

### `create_ppt_report(data, title, output_file, subtitle)`

| Argument      | Type       | Description                           |
|---------------|------------|---------------------------------------|
| `data`        | data frame | Data to display in the presentation   |
| `title`       | character  | Title shown on the title slide        |
| `output_file` | character  | File path for the output `.pptx`      |
| `subtitle`    | character  | Optional subtitle for the title slide |

------------------------------------------------------------------------

### `auto_chart(data, x, y, chart_type, title)`

| Argument     | Type       | Description                                  |
|--------------|------------|----------------------------------------------|
| `data`       | data frame | Data to plot                                 |
| `x`          | character  | Column name for the x-axis                   |
| `y`          | character  | Column name for the y-axis (must be numeric) |
| `chart_type` | character  | One of `"bar"`, `"line"`, or `"scatter"`     |
| `title`      | character  | Optional chart title                         |

------------------------------------------------------------------------

### `summarize_insights(data, round_digits)`

| Argument       | Type       | Description                                 |
|----------------|------------|---------------------------------------------|
| `data`         | data frame | Data frame with at least one numeric column |
| `round_digits` | integer    | Decimal places to round to (default: `2`)   |

------------------------------------------------------------------------

## Dependencies

- [`officer`](https://davidgohel.github.io/officer/) — PowerPoint file
  generation
- [`flextable`](https://ardata-fr.github.io/flextable-book/) — Table
  formatting
- [`ggplot2`](https://ggplot2.tidyverse.org/) — Chart generation
- [`checkmate`](https://mllg.github.io/checkmate/) — Input validation
- [`rlang`](https://rlang.r-lib.org/) — Tidy evaluation support

------------------------------------------------------------------------
