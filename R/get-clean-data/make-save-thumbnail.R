#' makeSaveThumbnail
#' 
#' a function which makes a thumbnail from an image
#'  and save it in a dedicated folder
#'
#' @param img.url.in 
#' @param path.out 
#' @param width 
#'
#' @return
#' @export
#'
#' @examples
makeSaveThumbnail <- function(img.url.in,
			  path.out,
			  thumb.type = jpg,
			  width=200){
	require(imager)
	
	## load the image file
	my.image <- imager::load.image(img.url.in)
	my.image.thumb <- imager::resize(my.image,width,round(width * height(my.image)/width(my.image)))
	
	#The file format is defined by the extension.
	#We call imager::save.image to avoid ambiguity, as base R already has a save.image function
	thumb.path <- paste0(path.out,basename(img.url.in),".",thumb.type)
	imager::save.image(my.image.thumb,
			   thumb.path)
	## return the thumb absolute path, this can be used for faster access to the file later
	thumb.path <- gsub(pattern = "^\\.(.*)", replacement = "\\1", x = thumb.path)
	return(paste0(getwd(),thumb.path))
}