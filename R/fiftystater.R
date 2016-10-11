#' Fifty U.S. States and Washington D.C. with Alaska and Hawaii as Insets
#'
#' Map data to plot the entire United States by transforming Alaska and Hawaii
#' to appear as insets nearby the continental states.
#'
#' @format A data frame with 13694 rows and 7 variables:
#' \describe{
#'   \item{long,lat}{Numeric, latitude and longitude coordinates for shapes.}
#'   \item{order}{Integer, drawing order of shapes.}
#'   \item{hole}{Logical, whether the shape represents a negation.}
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
#'
#' @details The \code{fifty_states} data frame is provided in the format
#'   expected by the \code{map} argument to \code{\link[ggplot2]{geom_map}}.
#'   Border boxes for the inset states can be included by adding the
#'   \code{fifty_states_inset_boxes} object to the plot. This object is a
#'   ggplot layer
#'   created with
#'   \code{\link[ggplot2]{annotate}}.
#'
#' @examples
#' if(require("mapproj") && require("ggplot2")) {
#'   crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
#'   p <- ggplot(crimes, aes(fill = UrbanPop, map_id = state)) +
#'     geom_map(map = fifty_states) +
#'     expand_limits(x = fifty_states$long, y = fifty_states$lat) +
#'     coord_map()
#'  p
#'  # Add bounding boxes for Alaska and Hawaii
#'  p + fifty_states_inset_boxes
#' }
"fifty_states"

#' @rdname fifty_states
"fifty_states_inset_boxes"