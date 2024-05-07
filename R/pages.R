pages <- function (x) {
    if (is.Query(x))
        return(axis(x, 3))
    else stop("attempt to access 'pages' on object that is not a Query")
}

`pages<-` <- function (x, value) {
    if (is.Query(x)) {
        axis(x, 3) <- value
        return(x)
    }
    else {
        stop("attempt to access 'pages' on object that is not a Query")
    }
}
