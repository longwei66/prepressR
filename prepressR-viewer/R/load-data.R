load_data <- function() {
	## We sored the photo list and full exit in an R object we load
        load(file = "../data/pa-photo-db.Rda", envir = .GlobalEnv)
	
	## We use a hash for the TRC as it is in base64 and too big ...
	## spooky.32 is our friend
	pa.photo.db[ , ':=' (
		RedTRC = sapply(as.list(RedTRC), hashFunction::spooky.32),
		GreenTRC = sapply(as.list(RedTRC), hashFunction::spooky.32),
		BlueTRC = sapply(as.list(RedTRC), hashFunction::spooky.32),
		GrayTRC = sapply(as.list(RedTRC), hashFunction::spooky.32)
	)]
	
	## Some featuers contain list, we collapse these list
	mergeListInDT <- function(x) {
		return(paste0(x, collapse = "|| "))
	}
	pa.photo.db[ , ':=' (
		Keywords = sapply(Keywords, mergeListInDT),
		Subject = sapply(Subject, mergeListInDT),
		ToneCurve = sapply(ToneCurve, mergeListInDT),
		ToneCurveRed = sapply(ToneCurveRed, mergeListInDT),
		ToneCurveGreen = sapply(ToneCurveGreen, mergeListInDT),
		ToneCurveBlue = sapply(ToneCurveBlue, mergeListInDT),
		ToneCurvePV2012 = sapply(ToneCurvePV2012, mergeListInDT),
		ToneCurvePV2012Red = sapply(ToneCurvePV2012Red, mergeListInDT),
		ToneCurvePV2012Green = sapply(ToneCurvePV2012Green, mergeListInDT),
		ToneCurvePV2012Blue = sapply(ToneCurvePV2012Blue, mergeListInDT),
		Creator = sapply(Creator, mergeListInDT),
		HierarchicalSubject = sapply(HierarchicalSubject, mergeListInDT)
		)]
	
	## We don't want to keep all features, the list to keep is stored
	## in a csv
	keep.col <<- read.csv(file = "../data/codebook.csv", header = FALSE)
	selectcol <- keep.col[,2] %in% c(1)
	
	## We store the pa.photo.db object in the global environment to be accessible
	## from the shiny app
	pa.photo.db <<- pa.photo.db[,..selectcol]
}