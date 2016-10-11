#' Fifty U.S. States and Washington D.C. with Alaska and Hawaii as Insets
#'
#' Map data to plot the entire United States by transforming Alaska and Hawaii
#' to appear nearby the continental states.
#'
#' @format A data frame with 13694 rows and 7 variables:
#' \describe{
#'   \item{long,lat}{Numeric, lattitude and longitude coordinates for shapes.}
#'   \item{order}{Integer, drawing order of shapes.}
#'   \item{hole}{Logical, whteher the shape represents a negation.}
#'   \item{piece}{Factor, groupings of shapes.}
#'   \item{id}{Character, lower case state names mapped to plot data via
#'      the \code{map_id} aesthetic in \code{\link[ggplot2]{geom_map}}.}
#'   \item{group}{Factor, groupings of shapes.}
#' }
#'
#' @source Original shapefile from
#' \href{http://www.arcgis.com/home/item.html?id=f7f805eb65eb4ab787a0a3e1116ca7e5}{ArcGIS}.
#' Transformations based on code from Barry Rowlingson on StackOverflow
#' \url{http://stackoverflow.com/a/13767984}.
"fifty_states"
