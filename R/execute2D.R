#' @export
execute2D <- function (olapCnn, qry) {
    stopifnot(is.OlapConnection(olapCnn))
    stopifnot(is.Query(qry) || is.character(qry))
    if (is.Query(qry)) {
        if (qry$vldt) {
            if (!validateQuery(olapCnn, qry)) {
                stop("Invalid Query detected")
            }
        }
        mdx <- compose(qry)
    }
    else {
        mdx <- qry
    }
    result <- .Call("olapRExecute2D", olapCnn$cnn, mdx, PACKAGE = "olapR")
    if (!is.data.frame(result)) {
        stop("Unknown object received from olapRExecuteRecordset")
    }
    return(result)
}
