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
