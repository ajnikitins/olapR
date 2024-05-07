axis <- function (x, i) {
    if (is.Query(x))
        return(x$axes[[i]])
    else stop("attempt to access 'axis' on object that is not a Query")
}

`axis<-` <- function (x, i, value) {
    if (is.Query(x)) {
        while (i > length(x$axes)) {
            x$axes <- c(x$axes, "")
        }
        x$axes[[i]] <- value
        return(x)
    }
    else {
        stop("attempt to access 'axis' on object that is not a Query")
    }
}
