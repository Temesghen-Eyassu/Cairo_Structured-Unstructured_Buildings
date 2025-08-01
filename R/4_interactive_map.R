#' Interactive Area Map for Structured and Unstructured Buildings
#'
#' Creates an interactive leaflet map comparing building areas
#' for structured and unstructured building datasets.
#'
#' @param buildings A list with two `sf` objects: `structured` and `unstructured`.
#'        Each must have a numeric `area` column or else it will be computed.
#' @return A `tmap` interactive map (in "view" mode).
#' @export
plot_interactive_area_map <- function(buildings) {
  tmap_mode("view")

  if (!"area" %in% colnames(buildings$structured)) {
    buildings$structured$area <- as.numeric(st_area(buildings$structured))
  }
  if (!"area" %in% colnames(buildings$unstructured)) {
    buildings$unstructured$area <- as.numeric(st_area(buildings$unstructured))
  }

  break1 <- c(26, 770, 1514, 2258, 3001, 3745, 4488)
  label1 <- c("26-770 m²", "770-1514 m²", "1514-2258 m²", "2258-3001 m²", "3001-3745 m²", "3745-4488 m²")

  break2 <- c(15, 351, 687, 1028, 1359, 1695, 2031)
  label2 <- c("15-351 m²", "351-687 m²", "687-1028 m²", "1028-1359 m²", "1359-1695 m²", "1695-2031 m²")

  map <- tm_shape(buildings$structured) +
    tm_polygons(
      fill = "area",
      fill.scale = tm_scale_intervals(
        breaks = break1,
        labels = label1,
        values = "Blues"
      ),
      fill.legend = tm_legend(title = "Structured: Area")
    ) +
    tm_shape(buildings$unstructured) +
    tm_polygons(
      fill = "area",
      fill.scale = tm_scale_intervals(
        breaks = break2,
        labels = label2,
        values = "Reds"
      ),
      fill.legend = tm_legend(title = "Unstructured: Area")
    )


  return(map)
}


buildings <- list(
  structured = st_read("E:/EAGLE/Second_Semester/Scientific_Graphs/Five_ classes/NewCairo_structured.gpkg"),
  unstructured = st_read("E:/EAGLE/Second_Semester/Scientific_Graphs/Five_ classes/NewCairo_unstructured.gpkg")
)

interactive_map <- plot_interactive_area_map(buildings)

print(interactive_map)  # This will open an interactive map viewer

