#' Calculate area and compactness, and plot compactness maps
#'
#' This function calculates the area and shape compactness for each building in both structured
#' and unstructured datasets. It then plots them side by side using a viridis color scale.
#'
#' Compactness is calculated using the formula: \eqn{4 * \pi * \text{area} / \text{perimeter}^2}.
#' Values range from 0 to 1, where 1 represents a perfect circle.
#'
#' @param buildings A list of two `sf` objects: `unstructured` and `structured`. Each must contain polygon features.
#' @return A list of two items:
#'   \describe{
#'     \item{data}{The modified `buildings` list with new columns: `area` and `compactness` (unitless).}
#'     \item{plot}{A patchwork side-by-side ggplot showing compactness maps.}
#'   }
#' @import sf
#' @import units
#' @import dplyr
#' @import ggplot2
#' @importFrom patchwork plot_layout
#' @export
analyze_and_plot_compactness <- function(buildings) {
  # Calculate area and compactness for unstructured
  buildings$unstructured <- buildings$unstructured %>%
    mutate(
      area = st_area(.),
      compactness = drop_units(4 * pi * area / (st_perimeter(.)^2))
    )

  # Calculate area and compactness for structured
  buildings$structured <- buildings$structured %>%
    mutate(
      area = st_area(.),
      compactness = drop_units(4 * pi * area / (st_perimeter(.)^2))
    )

  # Create side-by-side compactness maps
  p1 <- ggplot() +
    geom_sf(data = buildings$unstructured, aes(fill = compactness), color = NA) +
    scale_fill_viridis_c(name = "Compactness", option = "C") +
    ggtitle("Unstructured Buildings") +
    theme_void()

  p2 <- ggplot() +
    geom_sf(data = buildings$structured, aes(fill = compactness), color = NA) +
    scale_fill_viridis_c(name = "Compactness", option = "C") +
    ggtitle("Structured Buildings") +
    theme_void()

  divider <- ggplot() +
    theme_void() +
    theme(panel.background = element_rect(fill = "black"))

  compactness_plot <- (p1 + divider + p2) + plot_layout(ncol = 3, widths = c(0.5, 0.01, 1))

  return(list(
    data = buildings,
    plot = compactness_plot
  ))
}
