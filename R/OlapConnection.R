#' olapR OlapConnection Creation
#'
#' \code{OlapConnection} constructs a "OlapConnection" object.
#'
#' \code{OlapConnection} validates and holds an Analysis Services connection
#' string. By default, Analysis Services returns the first cube of the first
#' database. To connect to a specific database, use the Initial Catalog
#' parameter.
#'
#' @param connectionString A valid connection string for connecting to Analysis
#' Services
#' @param ocs An object of class "OlapConnection"
#' @return \code{OlapConnection} returns an object of type "OlapConnection". A
#' warning is shown if the connection string is invalid.
#' @seealso \code{\link{Query}}, \code{\link{executeMD}},
#' \code{\link{execute2D}, \code{\link{explore}}}
#' @references For more information on Analysis Services connection strings:
#' \url{https://docs.microsoft.com/sql/analysis-services/instances/connection-string-properties-analysis-services}
#' @examples
#'
#'
#' # Create the connection string. For a named instance, escape the instance name: localhost\my-other-instance
#' cnnstr <- "Data Source=localhost; Provider=MSOLAP; initial catalog=AdventureWorksCube"
#' olapCnn <- OlapConnection(cnnstr)
#'
#' @export
OlapConnection <- function (connectionString = "Data Source=localhost; Provider=MSOLAP;") {
    if (!is.character(connectionString) || is.null(connectionString)) {
        stop("cnn must be passed as a string")
    }
    re1 <- "Provider\\s*=\\s*MSOLAP;"
    if (!any(grepl(re1, connectionString))) {
        warning("cnn must contain 'Provider=MSOLAP;'")
    }
    re2 <- "Data Source\\s*=\\s*[^;]*;"
    if (!any(grepl(re2, connectionString))) {
        warning("cnn must contain 'Data Source=[a data source];'")
    }
    ocs <- list(cnn = connectionString)
    class(ocs) <- append(class(ocs), "OlapConnection")
    return(ocs)
}

is.OlapConnection <- function (x) inherits(x, "OlapConnection")

#' @exportS3Method
print.OlapConnection <- function (x) print(x$cnn)
