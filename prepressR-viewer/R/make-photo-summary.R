#' MakePhotoSummary
#' 
#' Generate summary tables of a Photo
#'
#' @param dT an PA photo EXIF data.table
#' @param photo.ref the vector of photos
#' @param chapter.ref the vector of chapters
#'
#' @return
#' @export
#'
#' @examples
MakePhotoSummary <- function(dT, photo.ref, chapter.ref){


	if(is.null(chapter.ref)){

		## subset the referenced photos
		dT <- dT[ absolute.photo.files.url %in% photo.ref] 
	} else {
		## subset the referenced chapters
		dT <- dT[ sla.filename %in% chapter.ref] 
	}
	
	## reduce dimensions
	## dT <- dT[, 1:20]
	
	## Return data
	return(dT)
}