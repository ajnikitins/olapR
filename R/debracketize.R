debracketize <- function (testStr) {
  result <- .Call("debracketizeTestHelper", testStr, PACKAGE = "olapR")
  return(result)
}
