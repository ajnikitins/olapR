#' olapR Query Construction
#'
#' \code{Query} constructs a "Query" object. Set functions are used to build
#' and modify the Query axes and cube name.
#'
#' \code{Query} is the constructor for the Query object. Set functions are used
#' to specify what the Query should return. Queries are passed to the
#' \code{Execute2D} and \code{ExecuteMD} functions. \code{compose} takes the
#' Query object and generates an MDX string equivalent to the one that the
#' Execute functions would generate and use.
#'
#' @param validate A logical (TRUE, FALSE, NA) specifying whether the Query
#' should be validated during execution
#' @param qry An object of class "Query" returned by \code{Query}
#' @param cubeName A string specifying the name of the cube to query
#' @param axis A vector of strings specifying an axis. See example below.
#' @param n An integer representing the axis number to be set. axis(qry, 1) ==
#' columns(qry), axis(qry, 2) == pages(qry), etc.
#' @return \code{Query} returns an object of type "Query". \cr \code{cube}
#' returns a string. \cr \code{columns} returns a vector of strings. \cr
#' \code{rows} returns a vector of strings. \cr \code{pages} returns a vector
#' of strings. \cr \code{sections} returns a vector of strings. \cr \code{axis}
#' returns a vector of strings. \cr \code{slicers} returns a vector of strings.
#' \cr \code{compose} returns a string. \cr \code{is.Query} returns a boolean.
#' @note - A Query object is not as powerful as pure MDX. If the Query API is
#' not sufficient, try using an MDX Query string with one of the Execute
#' functions.
#' @seealso \code{\link{execute2D}}, \code{\link{executeMD}},
#' \code{\link{OlapConnection}, \code{\link{explore}}}
#' @references See \code{\link{execute2D}} or \code{\link{executeMD}} for
#' references.
#' @examples
#'
#' qry <- Query(validate = TRUE)
#'
#' cube(qry) <- "[Analysis Services Tutorial]"
#'
#' columns(qry) <- c("[Measures].[Internet Sales Count]", "[Measures].[Internet Sales-Sales Amount]")
#' rows(qry) <- c("[Product].[Product Line].[Product Line].MEMBERS")
#' axis(qry, 3) <- c("[Date].[Calendar Quarter].MEMBERS")
#'
#' slicers(qry) <- c("[Sales Territory].[Sales Territories].[Sales Territory Region].[Northwest]")
#'
#' print(cube(qry)) #[Analysis Services Tutorial]
#' print(axis(qry, 2)) #c("[Product].[Product Line].[Product Line].MEMBERS")
#'
#' print(compose(qry))  #SELECT {[Measures].[Internet Sales Count], [Measures].[Internet Sales-Sales Amount]} ON AXIS(0), {[Product].[Product Line].[Product Line].MEMBERS} ON AXIS(1), {[Date].[Calendar Quarter].MEMBERS} ON AXIS(2) FROM [Analysis Services Tutorial] WHERE {[Sales Territory].[Sales Territories].[Sales Territory Region].[Northwest]}
#'
#' @export
Query <- function (validate = FALSE) {
    if (!is.logical(validate)) {
        stop("Arguement 'validate' must be of type Logical")
    }
    qr <- list(vldt = validate, cube = "", axes = list(c("")),
        slicers = c(""))
    class(qr) <- append(class(qr), "Query")
    return(qr)
}

is.Query <- function (x) inherits(x, "Query")
