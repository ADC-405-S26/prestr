library(testthat)

sample_df <- data.frame(
  Category = c("A", "B", "C"),
  Value    = c(10, 25, 15)
)

# Test 1: Returns a ggplot
test_that("auto_chart() returns a ggplot object", {
  p <- auto_chart(sample_df, x = "Category", y = "Value", chart_type = "bar")
  expect_s3_class(p, "ggplot")
})

# Test 2: Errors when chart_type is invalid
test_that("auto_chart() errors on invalid chart_type", {
  expect_error(
    auto_chart(sample_df, x = "Category", y = "Value", chart_type = "pie"),
    regexp = "pie"
  )
})

# Test 3: Errors when y column is not numeric
test_that("auto_chart() errors when y column is not numeric", {
  bad_df <- data.frame(Category = c("A", "B"), Value = c("x", "y"))
  expect_error(
    auto_chart(bad_df, x = "Category", y = "Value"),
    regexp = "numeric"
  )
})

# Test 4: Bar chart uses geom_col
test_that("auto_chart() produces a bar chart with geom_col", {
  p <- auto_chart(sample_df, x = "Category", y = "Value", chart_type = "bar")
  geom_types <- sapply(p$layers, function(l) class(l$geom)[1])
  expect_true("GeomCol" %in% geom_types)
})

# Test 5: Line chart uses geom_line
test_that("auto_chart() produces a line chart with geom_line", {
  p <- auto_chart(sample_df, x = "Category", y = "Value", chart_type = "line")
  geom_types <- sapply(p$layers, function(l) class(l$geom)[1])
  expect_true("GeomLine" %in% geom_types)
})

# Test 6: Scatter chart uses geom_point
test_that("auto_chart() produces a scatter chart with geom_point", {
  p <- auto_chart(sample_df, x = "Category", y = "Value", chart_type = "scatter")
  geom_types <- sapply(p$layers, function(l) class(l$geom)[1])
  expect_true("GeomPoint" %in% geom_types)
})
