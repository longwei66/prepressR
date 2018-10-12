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
	## with Magick
	require(magick)
	## load the image file
	my.image <- magick::image_read(img.url.in)
	## reseize
	my.image.thumb <- image_scale(my.image, width)
	## Save image	
	thumb.path <- paste0(path.out,basename(img.url.in),".",thumb.type)
	image_write(image = my.image.thumb,
		    path = thumb.path,
		    format = thumb.type)
	
	## return the thumb absolute path, this can be used for faster access to the file later
	thumb.path <- gsub(pattern = "^\\.(.*)", replacement = "\\1", x = thumb.path)
	return(paste0(getwd(),thumb.path))
}