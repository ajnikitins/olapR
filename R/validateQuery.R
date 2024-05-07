validateQuery <- function (olapCnn, qry) {
  if (is.Query(qry) && is.OlapConnection(olapCnn)) {
    result <- .Call("olapRValidateQuery", olapCnn$cnn, qry$cube,
                    qry$axes, PACKAGE = "olapR")
    if (result == FALSE) {
      stop("Query validation error")
    }
    return(result)
  }
  else {
    stop("Invalid argument specified")
  }
}
