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

	message(paste0("Processing : ",img.url.in))
	
	## load the image file
	my.image <- magick::image_read(img.url.in)
	## reseize
	my.image.thumb <- image_scale(my.image, width)
	## Save image	
	thumb.path <- paste0(path.out,basename(img.url.in),".",thumb.type)
	image_write(image = my.image.thumb, path = thumb.path, format = thumb.type)
	message(paste0("---> Thumbnail saved : ",thumb.path))
	
	## return the thumb absolute path, this can be used for faster access to the file later
	thumb.path <- gsub(pattern = "^\\.(.*)", replacement = "\\1", x = thumb.path)
	
	## clean
	rm(my.image)
	gc()
	
	return(paste0(getwd(),thumb.path))
}