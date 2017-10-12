test_that("multiple matches with caputing groups just return first match",{
  expect_equal(
    regex_match(c("<tr>\n<td>URL:</td>\n<td>\n<a href=\"http://dplyr.tidyverse.org\">http://dplyr.tidyverse.org</a>",
      "<a href=\"https://github.com/tidyverse/dplyr\">https://github.com/tidyverse/dplyr</a>\n</td>\n</tr>"),
      "(ht)(t.*)(?=\">)"),
    c("http://dplyr.tidyverse.org",
      "https://github.com/tidyverse/dplyr")
  )
})
