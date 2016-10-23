library(ggplot2)

test_that("Data can be loaded and used", {
  crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
  expect_silent({
    print(
      ggplot(crimes, aes(map_id = state)) +
        geom_map(aes(fill = Murder), map = fifty_states) +
        expand_limits(x = fifty_states$long, y = fifty_states$lat) +
        coord_map()
    )
  })
})

test_that("Inset borders can be loaded and used", {
  crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
  expect_silent({
    print(
      ggplot(crimes, aes(map_id = state)) +
        geom_map(aes(fill = Murder), map = fifty_states) +
        expand_limits(x = fifty_states$long, y = fifty_states$lat) +
        coord_map() + fifty_states_inset_boxes()
    )
  })
})
