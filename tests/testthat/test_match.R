
test_that("match capturing groups are ignored.",{
  regex_match(c("<12>", "<678>", "<91011>"),
              "<([0-9]{2})>")

})
