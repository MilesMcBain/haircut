# haircut

[![Travis-CI Build Status](https://travis-ci.org/MilesMcBain/haircut.svg?branch=master)](https://travis-ci.org/MilesMcBain/haircut) [![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/MilesMcBain/haircut?branch=master&svg=true)](https://ci.appveyor.com/project/MilesMcBain/haircut)[![Coverage Status](https://img.shields.io/codecov/c/github/MilesMcBain/haircut/master.svg)](https://codecov.io/github/MilesMcBain/haircut?branch=master)

Give your strings a haircut with tidyverse-friendly regex.

The goal of `haircut` is to provide a simple interface to regular expressions in R that covers most common usecases. It differs from base and `string*` packages by:

* Having a simple, memorable API. 
  - `regex_match`, `regex_match_except`, `regex_sub`
  - 3 Functions!
* Having `%>%`,`dplyr`, and `purrr` friendly arguments and outputs.
  - Data vector is the first argument.
  - Always returns a vector of strings!
* No dependencies on other R packages or C++ libraries.
  - Installs in seconds!

