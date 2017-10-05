
test_that("match_except capturing groups error",{
  expect_error(
  regex_match_except(c("<12>", "<345678>", "<91011>"),
              "(<)[0-9]+(>)"))

})

test_that("match_except non-capturing groups no error",{
  expect_equal(
    regex_match_except(c("<12>", "<345678>", "<91011>"),
                       "(?:<)[0-9]+(?:>)"),
    c("","",""))

})
