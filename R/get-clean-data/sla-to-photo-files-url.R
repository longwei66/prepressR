#' slaToFilesUrl
#'
#' @param mySla a scribus file as xml_document (from read_xml) 
#'
#' @return a vector character containing photos/images files url
#' @export
#'
#' @examples 
slaToPhotoFilesUrl <- function(mySla){
	
	## -- read sla as xml
	sla.xml <- read_xml(mySla)
	
	## -- get all PAGEOBJECTS
	page.objects <- xml_find_all(sla.xml, ".//PAGEOBJECT")
	
	## -- do not use
	## xml_path(page.objects)
	
	## -- get the types of page objectc type "2" seems to be photos / images
	page.objects.type <- xml_attr(page.objects, "PTYPE")
	
	## -- get the PFILE attribute of PAGEOBJECTS, this is the relative url of the 
	## -- image file
	pfile.url <- xml_attr(page.objects, "PFILE")
	
	## -- Keep only pfile url of page.object type 2 (photos)
	pfile.photo.url <- pfile.url[ page.objects.type == "2"]
	
	return(data.table(
		sla.file.url = mySla,
		photo.files.url = pfile.photo.url))
}