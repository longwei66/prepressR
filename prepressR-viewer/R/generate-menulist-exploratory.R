#' generateFeaturesList
#' 
#' a function which returns the class of each feature 
#' in a data.table as well as the type of ggplot visualisation
#' which can be applied to
#'
#' @param myDT 
#'
#' @return
#' @export
#'
#' @examples
generateFeaturesList <- function(myDT){
	require(data.table)
	## get class type of all features in the 
	features.class <- sapply(myDT,class)
	
	## create a data.table with results
	## map with the possible visualisation in a scatterplot
	featureDT <- data.table(
		feature = names(features.class),
		type = features.class,
		character.as.factor = 0,
		xaxis = 0,
		yaxis = 0,
		size = 0,
		faceth = 0,
		facetv = 0,
		shape = 0,
		color.discrete = 0,
		color.continuous = 0,
		label = 0
	)

	## Estimate if character could be considered as factor
	## a short string with less than 50 different cases
	## To be done...
	
	
	## xaxis, yaxis
	featureDT[ type %in% c("numeric", "integer", "logical", "factor") ,':=' (
		 	xaxis = 1,
		 	yaxis = 1
		 	)
		 ]
	## size
	featureDT[ type %in% c("numeric", "integer") ,':=' (
		size = 1,
		color.continuous = 1
		)
	]
	## facets, shape, color discrete and labels
	featureDT[ type %in% c("factor", "character") ,':=' (
		faceth = 1,
		facetv = 1,
		shape = 1,
		color.discrete = 1,
		label = 1
	)
	]
	

	return(featureDT[1:nrow(featureDT)])
}