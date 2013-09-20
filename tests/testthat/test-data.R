test_that("data loads as expected", {

  expect_equal(dim(gpdd_data)[2], 10)
  expect_equal(dim(gpdd_main)[2], 25)
  expect_equal(dim(gpdd_datasource)[2], 9)

})
