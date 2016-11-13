# This file is part of fiftystater.
#
# fiftystater is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, version 3.
#
# fiftystater is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with fiftystater  If not, see <http://www.gnu.org/licenses/>.

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
#' @source Original shapefile provided by Charlie Fitzpatrick
#' \href{http://www.arcgis.com/home/item.html?id=f7f805eb65eb4ab787a0a3e1116ca7e5}{via ArcGIS}.
#' Transformations based on code from Barry Rowlingson on StackOverflow
#' \url{http://stackoverflow.com/a/13767984}.
#'
#' @details The \code{fifty_states} data frame is provided in the format
#'   expected by the \code{map} argument to \code{\link[ggplot2]{geom_map}}.
#'   Border boxes for the inset states can be included by adding
#'   \code{\link{fifty_states_inset_boxes}} to the plot.
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
#'  p + fifty_states_inset_boxes()
#' }
#'
#' @seealso \code{\link{fifty_states_inset_boxes}}
"fifty_states"

#' Add inset box borders
#'
#' Border boxes for the insets of Alaska and Hawaii in
#' \code{\link{fifty_states}} can be added to the map with this function.
#'
#' Adding the result of this function to your ggplot will add a layer with
#' border boxes to highlight the insets. It draws data from the package data
#' object
#' \code{fifty_states_inset_boxes_data} and creates a layer to plot the borders
#'  with \code{\link[ggplot2]{annotate}}.
#'
#'
#' @return A ggplot2 layer object with path data to draw the inset border boxes
#'
#' @examples
#' if(require("mapproj") && require("ggplot2")) {
#'   crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
#'   ggplot(crimes, aes(fill = UrbanPop, map_id = state)) +
#'     geom_map(map = fifty_states) +
#'     expand_limits(x = fifty_states$long, y = fifty_states$lat) +
#'     coord_map() + fifty_states_inset_boxes()
#' }
#' @aliases fifty_states_inset_boxes_data
#' @export
fifty_states_inset_boxes <- function() {
  if(!requireNamespace("ggplot2")) {
    stop("Package 'ggplot2' required for inset box annotation.")
  }
  ggplot2::annotate("path",
                    x = fiftystater::fifty_states_inset_boxes_data$x,
                    y = fiftystater::fifty_states_inset_boxes_data$y,
                    group = fiftystater::fifty_states_inset_boxes_data$id)
}

