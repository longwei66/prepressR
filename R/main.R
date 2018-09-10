## =============================================================================
##
##      prepressR
##      ---------
##      a set of script and analysis for photos & imagine
##      objective : prepress of magazine
##
## =============================================================================


## =============================================================================
## [0] Load libraries, configuration and functions
## =============================================================================

## -- Libs
library(tidyverse)
library(exifr)
library(data.table)

## -- config
photo.dir.url <- "/home/barthelemy/Documents/__Design/Images/"



## =============================================================================
## [1] Get & Clean Data
## =============================================================================

## -- get the list of all files in the folder
photo.files <- list.files(path = photo.dir.url, pattern = "jpg$|png$", full.names = TRUE)

## -- read exif metada
dF <- read_exif(photo.files)



## =============================================================================
## [2] Exploratory Analysis
## =============================================================================
g <- ggplot(data = dF) +
        geom_point(
                aes(x = ImageWidth, y = ImageHeight, col = as.factor(XResolution))
        ) +
        facet_grid(facets = ColorSpaceData ~ MIMEType)
g
                       
