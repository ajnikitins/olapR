#' @export
executeMD <- function (olapCnn, qry) {
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
    result <- .Call("olapRExecuteMD", olapCnn$cnn, mdx, PACKAGE = "olapR")
    return(result)
}
