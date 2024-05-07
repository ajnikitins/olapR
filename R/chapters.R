chapters <- function (x) {
    if (is.Query(x))
        return(axis(x, 4))
    else stop("attempt to access 'chapters' on object that is not a Query")
}

`chapters<-` <- function (x, value) {
    if (is.Query(x)) {
        axis(x, 4) <- value
        return(x)
    }
    else {
        stop("attempt to access 'chapters' on object that is not a Query")
    }
}
