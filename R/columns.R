columns <- function (x) {
    if (is.Query(x))
        return(axis(x, 1))
    else stop("attempt to access 'columns' on object that is not a Query")
}

`columns<-` <- function (x, value) {
    if (is.Query(x)) {
        axis(x, 1) <- value
        return(x)
    }
    else {
        stop("attempt to access 'columns' on object that is not a Query")
    }
}
