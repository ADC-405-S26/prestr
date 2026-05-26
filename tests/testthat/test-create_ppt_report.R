library(testthat)

sample_df <- data.frame(
  Name  = c("Alice", "Bob", "Carol"),
  Score = c(88, 92, 75)
)

# Test 1: Output file is actually created on disk
test_that("create_ppt_report() writes a .pptx file to disk", {
  tmp <- tempfile(fileext = ".pptx")
  create_ppt_report(sample_df, title = "Test Report", output_file = tmp)
  expect_true(file.exists(tmp))
  unlink(tmp)
})

# Test 2: Non-data-frame input throws an error
test_that("create_ppt_report() errors when data is not a data frame", {
  expect_error(
    create_ppt_report(data = list(a = 1, b = 2), title = "Bad Input"),
    regexp = "data.frame"
  )
})

# Test 3: Empty data frame throws an error
test_that("create_ppt_report() errors on a zero-row data frame", {
  empty_df <- data.frame(Name = character(0), Score = numeric(0))
  expect_error(
    create_ppt_report(empty_df, title = "Empty"),
    regexp = "row"
  )
})
