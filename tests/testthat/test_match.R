test_that("vector matches works",{
  expect_equal(
    regex_match(c("<tr>\n<td>URL:</td>\n<td>\n<a href=\"http://dplyr.tidyverse.org\">http://dplyr.tidyverse.org</a>",
      "<a href=\"https://github.com/tidyverse/dplyr\">https://github.com/tidyverse/dplyr</a>\n</td>\n</tr>"),
      "htt.*(?=\">)"),
    c("http://dplyr.tidyverse.org",
      "https://github.com/tidyverse/dplyr")
  )
})

test_that("multiple matches per string are found and concatenated",{
  expect_equal(
  regex_match( c("abc_123_abc", "123_abc_123"),
               "[a-z]+"),
  c("abcabc","abc")
  )
})

test_that("capture groups are ignored",{
  expect_equal(
    regex_match(c("https://github.com/njtierney/naniar",
                  "https://github.com/ropensci/visdat/releases"),
                "(ht)(tp).*\\.com"),
    c("https://github.com","https://github.com")
  )
})

test_that("multiple matches per string are found AND capture groups are ignored",{
  expect_equal(
    regex_match(c("abc_123_abc", "123_abc_123"),
                "12(3)"),
    c("123","123123")
  )
})

