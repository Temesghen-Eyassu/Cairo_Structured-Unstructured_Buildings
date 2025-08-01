#' Plot side-by-side building geometries
#'
#' @param buildings A list of two `sf` objects: `unstructured` and `structured`.
#' @return A `ggpatchwork` plot showing both geometries side by side.
#' @import ggplot2
#' @importFrom patchwork plot_layout
#' @export
plot_buildings_side_by_side <- function(buildings) {
  p1 <- ggplot() +
    geom_sf(data = buildings$unstructured) +
    ggtitle("Unstructured")

  p2 <- ggplot() +
    geom_sf(data = buildings$structured) +
    ggtitle("Structured")

  divider <- ggplot() +
    theme_void() +
    theme(panel.background = element_rect(fill = "black"))

  (p1 + divider + p2) + plot_layout(ncol = 3, widths = c(1, 0.03, 1))
}


#' Plot overlaid comparison of building geometries
#'
#' @param buildings A list of two `sf` objects: `unstructured` and `structured`.
#' @return A `ggplot` with unstructured buildings in red and structured in blue.
#' @import ggplot2
#' @export
plot_buildings_overlay <- function(buildings) {
  ggplot() +
    geom_sf(data = buildings$unstructured, color = "red", fill = NA) +
    geom_sf(data = buildings$structured, color = "blue", fill = NA) +
    ggtitle("Unstructured (Red) vs Structured (Blue) Buildings")
}



