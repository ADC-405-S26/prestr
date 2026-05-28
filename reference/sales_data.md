# Monthly Sales Performance Data

A dataset containing monthly sales performance metrics across four
product categories over one year. Useful for demonstrating
[`create_ppt_report()`](https://adc-405-s26.github.io/prestr/reference/create_ppt_report.md),
[`auto_chart()`](https://adc-405-s26.github.io/prestr/reference/auto_chart.md),
and
[`summarize_insights()`](https://adc-405-s26.github.io/prestr/reference/summarize_insights.md).

## Usage

``` r
sales_data
```

## Format

A data frame with 48 rows and 5 variables:

- month:

  Month name (e.g., "January")

- category:

  Product category: Electronics, Clothing, Food, or Furniture

- sales:

  Total sales in dollars

- profit:

  Total profit in dollars

- units_sold:

  Number of units sold

## Examples

``` r
data(sales_data)
head(sales_data)
#>      month    category sales profit units_sold
#> 1  January Electronics 15200   4200        152
#> 2 February Electronics 13400   3800        134
#> 3    March Electronics 16800   4900        168
#> 4    April Electronics 14200   3900        142
#> 5      May Electronics 17500   5100        175
#> 6     June Electronics 19200   5800        192
summarize_insights(sales_data)
#>       column  min   max     mean median
#> 1      sales 2900 28900 10395.83   8150
#> 2     profit  700  9100  2863.54   2050
#> 3 units_sold   58   815   291.27    263
```
