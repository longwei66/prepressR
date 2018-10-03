#' MakePhotoSummary
#' 
#' Generate summary tables of a Photo
#'
#' @param dT an PA photo EXIF data.table
#' @param sla.ref the vector of chapters
#'
#' @return
#' @export
#'
#' @examples
MakePhotoSummary <- function(dT, photo.ref){
        
        ## subset the referenced incidents
        dT <- dT[ absolute.photo.files.url %in% photo.ref ]
        
        ## reduce dimensions
        dT <- dT[, 1:20]
        
        ## Return data
        return(dT)
}