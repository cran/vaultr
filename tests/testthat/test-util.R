test_that("Sys_getenv", {
  expect_null(Sys_getenv("VAULTR_NONEXISTANT"))

  withr::with_envvar(c("VAULTR_NONEXISTANT" = 123), {
    expect_equal(Sys_getenv("VAULTR_NONEXISTANT"), "123")
    expect_equal(Sys_getenv("VAULTR_NONEXISTANT", mode = "integer"), 123L)
  })

  withr::with_envvar(c("VAULTR_NONEXISTANT" = "foo"), {
    expect_equal(Sys_getenv("VAULTR_NONEXISTANT"), "foo")
    expect_error(Sys_getenv("VAULTR_NONEXISTANT", mode = "integer"),
                 "Invalid input for integer 'foo'")
    expect_error(Sys_getenv("VAULTR_NONEXISTANT", mode = "other"),
                 "Invalid value for 'mode'")
  })
})


test_that("pretty_sec", {
  expect_equal(pretty_sec(1), "1s")
  expect_equal(pretty_sec(10), "10s")
  expect_equal(pretty_sec(100), "~2m")
  expect_equal(pretty_sec(1000), "~17m")
  expect_equal(pretty_sec(10000), "~3h")
  expect_equal(pretty_sec(100000), "~1d")
  expect_equal(pretty_sec(1000000), "~12d")
})


test_that("free_port: failure", {
  skip_on_cran()
  skip_if_not_installed("mockery")
  mockery::stub(free_port, "check_port", FALSE)
  expect_error(free_port(10000, 0),
               "Did not find a free port between 10000..9999")
  expect_error(free_port(10000, 10),
               "Did not find a free port between 10000..10009")
})


test_that("free_port: used", {
  srv <- test_vault_test_server()
  expect_false(check_port(srv$port))
})


test_that("raw_data_input", {
  d <- "foo"
  expect_error(raw_data_input(d), "Expected raw data for 'd'")
  d <- as.raw(0:255)
  expect_silent(raw_data_input(d))
  expect_identical(raw_data_input(d), encode64(d))
})


test_that("format lease", {
  expect_equal(pretty_lease(10),
               "ok, duration: 10 s (10s)")
  expect_equal(pretty_lease(1000),
               "ok, duration: 1000 s (~17m)")
  expect_equal(pretty_lease(10000),
               "ok, duration: 10000 s (~3h)")
})
