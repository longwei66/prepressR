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
library(xml2)
library(magick)
library(dplyr)

## -- config
data.dir.url <- "/home/longwei/owncloudBOP/BOP/04-Photo-Analogies/PA#3/"

## -- functions
source(file = "./R/get-clean-data/sla-to-photo-files-url.R")
source(file = "./R/get-clean-data/make-save-thumbnail.R")


## =============================================================================
## [1] Get & Clean Data
## =============================================================================

## -- get list of sla files
sla.files <- list.files(path = data.dir.url,
			pattern = "\\.sla$", 
			full.names = TRUE,
			recursive = FALSE)


## -- extract photofiles url for each sla.file
## -- using apply, get a list, binded by row with rbindlist
photo.files <- rbindlist(lapply(sla.files, slaToPhotoFilesUrl)) 


## -- add absolute url and sla file name
photo.files[ , absolute.photo.files.url := paste0(data.dir.url, photo.files.url)]
photo.files[ , sla.filename := gsub(pattern = ".*/(.*)$", replacement = "\\1", x = photo.files$sla.file.url)]
## -- read exif metada for each file
dF <- read_exif(photo.files$absolute.photo.files.url)

## -- merge both data table
pa.photo.db <- merge(x = photo.files, y = dF, by.x = "absolute.photo.files.url", by.y = "SourceFile")

## =============================================================================
## [2] Generate thumbnails
## =============================================================================

thumblist <- lapply(X = pa.photo.db$absolute.photo.files.url, FUN = makeSaveThumbnail, path.out = "./data/thumbnails/", thumb.type = "jpg", width = 250)

## -- Add Thumbnails url to dF (faster to display later)
## -- to debug with 20 photos
pa.photo.db[ , thumbnail.url := ""]
pa.photo.db[ , thumbnail.url := unlist(thumblist)]

## -- Save data
save(pa.photo.db, file = './data/pa-photo-db.Rda')

## -- to uncomment for production script
## dF[ 1:20 , thumbnail.url := unlist(thumblist)]

## =============================================================================
## [2] Exploratory Analysis
## =============================================================================
g <- ggplot(data = dF) +
	geom_point(
		aes(x = ImageWidth, y = ImageHeight, col = as.factor(XResolution))
	) +
	facet_grid(facets = sla.filename ~ ColorSpaceData + MIMEType)
g

