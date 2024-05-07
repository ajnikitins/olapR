trimRemainder <- function (testStr) {
  result <- .Call("trimRemainderTestHelper", testStr, PACKAGE = "olapR")
  return(result)
}
