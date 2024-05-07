extractComponent <- function (testStr) {
  result <- .Call("extractComponentTestHelper", testStr, PACKAGE = "olapR")
  return(result)
}
