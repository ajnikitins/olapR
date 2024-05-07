rows <- function (x) {
    if (is.Query(x))
        return(axis(x, 2))
    else stop("attempt to access 'rows' on object that is not a Query")
}

`rows<-` <- function (x, value) {
    if (is.Query(x)) {
        axis(x, 2) <- value
        return(x)
    }
    else {
        stop("attempt to access 'rows' on object that is not a Query")
    }
}
