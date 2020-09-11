test_that("create_registry works", {
  codemeta <- makeregistry::create_codemetas(
    old_cm = NULL,
    folder = testthat::test_path("packages")
    )

  tmp <- tempdir(check = TRUE)

  jsonlite::write_json(
    codemeta,
    path = file.path(tmp, "raw_cm.json"),
    pretty=TRUE,
    auto_unbox = TRUE
    )

  options(repos = c(CRAN = "https://cran.rstudio.com"))

  makeregistry::create_registry(
    cm = file.path(tmp, "raw_cm.json"),
    outpat = file.path(tmp, "registry.json")
    )

  expect_snapshot_file(file.path(tmp, "registry.json"))


})