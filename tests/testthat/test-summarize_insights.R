library(testthat)

sample_df <- data.frame(
  Category = c("A", "B", "C"),
  Sales    = c(100, 250, 175),
  Profit   = c(20, 80, 55)
)

# Test 1: Returns a data frame with correct structure
test_that("summarize_insights() returns a data frame with correct columns", {
  result <- summarize_insights(sample_df)
  expect_s3_class(result, "data.frame")
  expect_true(all(c("column", "min", "max", "mean", "median") %in% names(result)))
})

# Test 2: Errors when no numeric columns exist
test_that("summarize_insights() errors when data has no numeric columns", {
  char_df <- data.frame(
    Name = c("Alice", "Bob"),
    City = c("NYC", "LA")
  )
  expect_error(
    summarize_insights(char_df),
    regexp = "numeric"
  )
})

# Test 3: Returns one row per numeric column
test_that("summarize_insights() returns one row per numeric column", {
  result <- summarize_insights(sample_df)
  expect_equal(nrow(result), 2)
})
