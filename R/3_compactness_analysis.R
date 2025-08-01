#' Calculate area and compactness, summarize stats, and plot compactness maps
#'
#' This function replicates a full analysis pipeline: calculates area and compactness,
#' prints summary statistics, and returns a compactness comparison plot.
#'
#' @param buildings A list with two `sf` objects named `unstructured` and `structured`.
#' @return A list with:
#'   \describe{
#'     \item{data}{The updated `buildings` list with `area` and `compactness` columns (with units).}
#'     \item{plot}{A ggplot2/patchwork plot showing compactness maps side-by-side.}
#'   }
#' @import sf
#' @import dplyr
#' @import units
#' @import ggplot2
#' @importFrom patchwork plot_layout
#' @export
analyze_compactness_full <- function(buildings) {
  # Compute area and compactness with units
  buildings$unstructured <- buildings$unstructured %>%
    mutate(
      area = st_area(.),
      compactness = 4 * pi * area / (st_perimeter(.)^2)
    )

  buildings$structured <- buildings$structured %>%
    mutate(
      area = st_area(.),
      compactness = 4 * pi * area / (st_perimeter(.)^2)
    )

  # Print summaries
  message("Summary of Unstructured Building Area:")
  print(summary(buildings$unstructured$area))
  message("Summary of Structured Building Area:")
  print(summary(buildings$structured$area))
  message("Summary of Unstructured Compactness:")
  print(summary(buildings$unstructured$compactness))
  message("Summary of Structured Compactness:")
  print(summary(buildings$structured$compactness))

  # Drop units for plotting
  buildings$unstructured$compactness_numeric <- drop_units(buildings$unstructured$compactness)
  buildings$structured$compactness_numeric   <- drop_units(buildings$structured$compactness)

  # Create plots
  p1 <- ggplot() +
    geom_sf(data = buildings$unstructured, aes(fill = compactness_numeric), color = NA) +
    scale_fill_viridis_c(name = "Shape Compactness", option = "C") +
    ggtitle("Unstructured Buildings") +
    theme_void()

  p2 <- ggplot() +
    geom_sf(data = buildings$structured, aes(fill = compactness_numeric), color = NA) +
    scale_fill_viridis_c(name = "Shape Compactness", option = "C") +
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


