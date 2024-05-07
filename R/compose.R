compose <- function (qry) {
    if (is.Query(qry)) {
        if ("" %in% axis(qry, 1)) {
            stop("Columns must be set, and cannot contain blank entries")
        }
        mdx <- paste0("SELECT {", paste(axis(qry, 1), collapse = ", "),
            "} ON AXIS(0)")
        if (length(qry$axes) > 1) {
            for (i in 2:length(qry$axes)) {
                axis <- axis(qry, i)
                if ("" %in% axis) {
                  stop("Axes cannot contain blank entries")
                }
                axisName <- paste0("AXIS(", as.character(i -
                  1), ")")
                mdx <- paste0(mdx, ", {", paste(axis, collapse = ", "),
                  "} ON ", axisName)
            }
        }
        if ("" %in% cube(qry) || length(cube(qry)) > 1) {
            stop("A single Cube must be set")
        }
        mdx <- paste0(mdx, " FROM ", paste(cube(qry), collapse = ", "))
        if (!("" %in% slicers(qry))) {
            mdx <- paste0(mdx, " WHERE {", paste(slicers(qry),
                collapse = ", "), "}")
        }
        return(mdx)
    }
    else {
        stop("attempt to access 'compose' on object that is not a Query")
    }
}
