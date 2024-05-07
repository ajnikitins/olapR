slicers <- function (x) {
    if (is.Query(x))
        return(x$slicers)
    else stop("attempt to access 'slicers' on object that is not a Query")
}

`slicers<-` <- function (x, value) {
    if (is.Query(x)) {
        x$slicers <- value
        return(x)
    }
    else {
        stop("attempt to access 'slicers' on object that is not a Query")
    }
}
