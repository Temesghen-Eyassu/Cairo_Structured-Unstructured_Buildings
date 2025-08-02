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
Quick visual comparison of spatial distribution and layout differences. 
Left (p1): Unstructured buildings (raw or irregular footprints).
Right (p2): Structured buildings (planned or regular footprints

 ![Comparing and visualizing the structured and unstructured]!(https://github.com/user-attachments/assets/4750e61b-4ac1-4a89-850c-5f3ca137be10)
 
