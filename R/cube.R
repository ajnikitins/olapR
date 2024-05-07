cube <- function (x) {
    if (is.Query(x))
        return(x$cube)
    else stop("attempt to access 'cube' on object that is not a Query")
}

`cube<-` <- function (x, value) {
    if (is.Query(x)) {
        if (is.character((value))) {
            x$cube <- value
            return(x)
        }
        else {
        }
    }
    else {
        stop("attempt to access 'cube' on object that is not a Query")
    }
}
