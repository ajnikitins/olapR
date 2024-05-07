rFalse <- function () {
  result <- .Call("R_FALSETestHelper", PACKAGE = "olapR")
  return(result)
}
