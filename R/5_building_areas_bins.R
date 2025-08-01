#' Classify Building Areas into Bins
#'
#' Takes an sf polygon object, calculates area (in CRS units), and bins into labeled categories.
#'
#' @param data An `sf` object with polygon geometries.
#' @return The same sf object with two new columns: `area` (numeric) and `area_bin` (factor).
#' @importFrom sf st_area
#' @importFrom dplyr mutate
#' @importFrom rlang .data
#' @export
create_bins <- function(data) {
  geom_col <- attr(data, "sf_column")

  data %>%
    dplyr::mutate(
      area = as.numeric(sf::st_area(.data[[geom_col]])),
      area_bin = cut(
        area,
        breaks = c(0, 16, 48, 90, 145, 255, 400, Inf),
        labels = c("<16 m²", "16-48 m²", "48-90 m²", "90-145 m²",
                   "145-255 m²", "255-400 m²", "400+ m²"),
        right = FALSE,
        include.lowest = TRUE
      )
    )
}

#' Plot Side-by-Side Area Binned Maps for Structured vs Unstructured Buildings
#'
#' Requires the input sf objects to have an `area_bin` factor column (use `create_bins()` first).
#'
#' @param structured An sf object with `area_bin`.
#' @param unstructured An sf object with `area_bin`.
#' @return A patchwork ggplot2 object plotting the two maps side-by-side.
#' @importFrom ggplot2 ggplot geom_sf labs theme_minimal theme element_blank scale_fill_viridis_d
#' @importFrom patchwork plot_layout plot_spacer
#' @importFrom rlang .data
#' @export
plot_area_bin_comparison <- function(structured, unstructured) {
  simple_theme <- ggplot2::theme_minimal() +
    ggplot2::theme(
      axis.text = ggplot2::element_blank(),
      panel.grid = ggplot2::element_blank(),
      legend.position = "bottom"
    )

  p_unstructured <- ggplot2::ggplot(unstructured) +
    ggplot2::geom_sf(ggplot2::aes(fill = .data$area_bin), color = NA) +
    ggplot2::scale_fill_viridis_d(name = "Building Area", direction = -1) +
    ggplot2::labs(title = "Unstructured Buildings") +
    simple_theme

  p_structured <- ggplot2::ggplot(structured) +
    ggplot2::geom_sf(ggplot2::aes(fill = .data$area_bin), color = NA) +
    ggplot2::scale_fill_viridis_d(name = "Building Area", direction = -1) +
    ggplot2::labs(title = "Structured Buildings") +
    simple_theme

  (p_unstructured + patchwork::plot_spacer() + p_structured) +
    patchwork::plot_layout(ncol = 3, widths = c(1, 0.03, 1)) &
    ggplot2::theme(legend.position = "bottom")
}


