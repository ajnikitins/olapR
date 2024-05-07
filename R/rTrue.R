rTrue <- function () {
  result <- .Call("R_TRUETestHelper", PACKAGE = "olapR")
  return(result)
}
