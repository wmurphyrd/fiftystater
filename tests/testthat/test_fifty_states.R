library(ggplot2)

test_that("Data can be loaded and used", {
  crimes <- data.frame(state = tolower(rownames(USArrests)), USArrests)
  data("fifty_states")
    expect_silent({
    print(
      ggplot(crimes, aes(map_id = state)) +
        geom_map(aes(fill = Murder), map = fifty_states) +
        expand_limits(x = fifty_states$long, y = fifty_states$lat) +
        coord_map()
    )
  })
})

