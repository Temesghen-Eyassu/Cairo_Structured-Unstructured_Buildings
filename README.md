# Cairo_Structured-Unstructured_Buildings
This package is developed to analyze and visualize structured and unstructured urban building footprints for Cairo city, including spatial metrics, hexbin aggregation, and thematic mapping. It was developed using R version 4.4.2.

## Description 
This package provides a comprehensive set of tools for analyzing and visualizing building footprints in both structured and unstructured urban environments. It supports the computation of spatial metrics such as area and compactness, as well as the aggregation of building data using hexagonal grid (hexbin) techniques. The package facilitates detailed thematic mapping, and also enabling the classification and visualization of built environments by area bins. These tools are particularly useful for urban morphology studies, spatial planning analyses, and understanding patterns of urban form. 
## Installation

To install the **Cairo_Structured-Unstructured_Buildings** package, use the following steps:

1. **Install the devtools package** (if not already installed)
    ```r
    install.packages("devtools")
    ```
2. **Install the Cairo_Structured-Unstructured_Buildings package from GitHub**:

    ```r
    library(devtools)
    install_github("Temesghen-Eyassu/Cairo_Structured-Unstructured_Buildings")
    ```
3. **Load the package**:

    ```r
    library(Cairo_Structured-Unstructured_Buildings)
    ```

---

### **Geometric Visualization**

#### Purpose 
To provide a quick visual comparison of the spatial distribution, shape, and layout characteristics of buildings in the structured and unstructured datasets. This helps identify differences in urban form, such as block organization, building alignment, and clustering patterns, at a glance. 

        -Left (p1): Unstructured buildings (raw or irregular footprints).
        -Right (p2): Structured buildings (planned or regular footprints
![Image](https://github.com/user-attachments/assets/2cfac23d-4f31-4620-a107-9586c89fd2c5)
 
### **	A single map with both datasets overlaid**
#### Purpose 
To visualize and compare the spatial distribution and layout patterns of buildings from both datasets in a single view. This overlay highlights differences in alignment, density, and organization, making it easier to detect contrasts in planning structures (e.g., grid-like vs. irregular layouts) and spatial overlaps between the structured and unstructured areas.

    -Unstructured buildings in red.
    -Structured buildings in blue.
![Image](https://github.com/user-attachments/assets/9e103bb3-c927-46cc-977c-47eaaf434740)

### **Compactness Map**
#### Purpose 
To compare the geometric regularity of buildings by evaluating their shape compactness—a measure of how closely each building's footprint resembles a regular, compact shape such as a circle or a square. Higher compactness values typically indicate more regular and less elongated building forms, which may reflect different planning or design patterns between the unstructured and structured areas.

    -Left (p_unstructured): Compactness of unstructured buildings (colored by value).
    -Right (p_structured): Compactness of structured buildings (Colored by values).
![Image](https://github.com/user-attachments/assets/badbd4dd-52ae-40df-b2d1-00a5c085d96a)

### **Interactive Map**
#### Purpose 
To enable dynamic exploration of building area distributions through interactive features such as zooming, panning, and clicking. Users can examine buildings, compare area ranges across the city, and gain detailed insights into spatial patterns.

To explore building area distributions interactively.
Users must zoom in and click on individual buildings to view their area values—no information is displayed until these actions are taken.

As you interact with the map, you can choose from three ancillary (background) maps by clicking the basemap selector. The available options are:

    -ESRI WorldGrayCanvas – a muted grayscale map ideal for highlighting overlay data
    -OpenStreetMap – a general-purpose, detailed street map
    -ESRI WorldTopoMap – a topographic map providing terrain and elevation context. 
    
These basemaps enhance spatial interpretation by providing different geographic reference layers behind the building footprints.
![Image](https://github.com/user-attachments/assets/70a62d00-855c-47b1-841f-d59455eb7fba)

### **Area Classification Map**
#### Purpose 
To classify buildings into discrete area bins (e.g., <16 m², 16–48 m², etc.) for easier comparison and visualization of building size distribution across the study area. This helps identify patterns such as the prevalence of small vs. large buildings and supports analysis of urban density and land use.

    - Left: Unstructured buildings (smaller bins, likely more small buildings).
    - Right: Structured buildings (larger bins, more uniform sizes).
![Image](https://github.com/user-attachments/assets/18fd90b3-3e0c-4722-b5f6-da527953a9aa)

### **Map Comparing Average Building Footprint Sizes Across Grid Cells**
#### Purpose
To compare the average size of buildings in different parts of the city by dividing the area into equal-sized hexagons. This helps show how building sizes vary between structured (planned) and unstructured (unplanned) area.Color represents the average building area within each hexagon.

    - Left Map – Unstructured Area: Shows high variability in average building size, with a mix of small and large buildings. This reflects a less organized, informal development pattern.
    - Right Map – Structured Area: Displays more uniform and consistent building sizes, with generally larger average areas. This suggests a planned, organized urban layout with regular building footprints.
![Image](https://github.com/user-attachments/assets/43b12144-eae9-4505-98b1-76b3deb95535)

### **Building Count per Hexagon Map**
#### Purpose
To visualize the density of buildings across structured and unstructured areas by counting how many buildings fall within each hexagonal cell. This reveals how building concentration varies spatially and highlights differences in urban density patterns between both types of development.

    - Left Map – Unstructured Area shows very high building density in many hexes, with counts reaching over 100 buildings per cell where bright yellow clusters in the center and south suggest intense, compact       development. In addition, Density is uneven, indicating irregular land parceling and informal growth patterns. Building footprints are smaller and more numerous.
    - Right Map – Structured Area with much lower building counts per hex, with most values between 4 and 16. It has consistent mid-range colors (orange/pink) show a regular and spaced-out layout. In addotion, 
      A few isolated bright hexes suggest local density increases, possibly due to apartment blocks or denser housing.
![Image](https://github.com/user-attachments/assets/021a4337-9bf1-43b8-a2e5-9184895883b5)

