calculateNumberOfCells <- function (testDims) {
  result <- .Call("calculateNumberOfCellsTestHelper", testDims, PACKAGE = "olapR")
  return(result)
}
