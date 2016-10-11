# Create map data with AK, HI inset.
# Inspired by http://stackoverflow.com/a/13767984
library(rgeos)
library(maptools)
library(rgdal)
library(ggplot2)
library(dplyr)

transform_state <- function(object, rot, scale, shift){
  object %>% elide(rotate = rot) %>%
    elide(scale = max(apply(bbox(object), 1, diff)) / scale) %>%
    elide(shift = shift)
}

#state shape file from
# http://www.arcgis.com/home/item.html?id=f7f805eb65eb4ab787a0a3e1116ca7e5
loc <- file.path(tempdir(), "stats_dat")
unzip("inst/extdata/states_21basic.zip", exdir = loc)
fifty_states_sp <- readOGR(dsn = loc, layer = "states") %>%
  spTransform(CRS("+init=epsg:2163"))

alaska <- fifty_states_sp[fifty_states_sp$STATE_NAME == "Alaska", ] %>%
  transform_state(-35, 2.5, c(-2400000, -2100000))
proj4string(alaska) <- proj4string(fifty_states_sp)

hawaii <- fifty_states_sp[fifty_states_sp$STATE_NAME == "Hawaii", ] %>%
  transform_state(-35, .75, c(-1000000,-2300000))
proj4string(hawaii) <- proj4string(fifty_states_sp)

fifty_states <-
  fifty_states_sp[!fifty_states_sp$STATE_NAME %in% c("Alaska","Hawaii"), ] %>%
  rbind(alaska) %>%
  rbind(hawaii) %>%
  spTransform(CRS("+init=epsg:4326")) %>%
  fortify(region = "STATE_NAME") %>%
  mutate(id = tolower(id))

if (file.exists("data/fifty_states.rda")) unlink("data/fifty_states.rda")
devtools::use_data(fifty_states)
