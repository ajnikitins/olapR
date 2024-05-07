#' @export
explore <- function (olapCnn, cube = NULL, dimension = NULL, hierarchy = NULL,
    level = NULL) {
    if (!is.OlapConnection(olapCnn))
        stop("olapCnn must be of class 'OlapConnection'")
    if (!(is.null(cube) || is.character(cube)))
        stop("cube must be either null or a string")
    if (!(is.null(dimension) || is.character(dimension)))
        stop("dimension must be either null or a string")
    if (!(is.null(hierarchy) || is.character(hierarchy)))
        stop("hierarchy must be either null or a string")
    if (!(is.null(level) || is.character(level)))
        stop("level must be either null or a string")
    c <- !is.null(cube)
    d <- !is.null(dimension)
    h <- !is.null(hierarchy)
    l <- !is.null(level)
    if ((!c && (d || h || l)) || (!d && (h || l)) || (!h && (l))) {
        stop("Need higher level options to be filled before you can explore deeper. (i.e. you cannot explore dimension without a cube)")
    }
    if (c) {
        if (d) {
            if (h) {
                if (l) {
                  result = .Call("olapRExploreMembers", olapCnn$cnn,
                    cube, dimension, hierarchy, level, PACKAGE = "olapR")
                }
                else {
                  result = .Call("olapRExploreLevels", olapCnn$cnn,
                    cube, dimension, hierarchy, PACKAGE = "olapR")
                }
            }
            else {
                result = .Call("olapRExploreHierarchies", olapCnn$cnn,
                  cube, dimension, PACKAGE = "olapR")
            }
        }
        else {
            result = .Call("olapRExploreDimensions", olapCnn$cnn,
                cube, PACKAGE = "olapR")
        }
    }
    else {
        result = .Call("olapRExploreCubes", olapCnn$cnn, cube, PACKAGE = "olapR")
    }
}
