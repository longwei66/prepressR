## -----------------------------------------------------------------------------
##
## -----------------------------------------------------------------------------
makePhotoData <- reactive({
	return(
		MakePhotoSummary(dT = pa.photo.db,
				 photo.ref = input$myPhotoRef,
				 chapter.ref = input$myChapterRef)
	)
})

makeGgExif <- reactive({
	## Get data with input filters applied
	data <- makePhotoData()
	
	#plot_ly(makePhotoData(), x = ~XResolution, y = ~YResolution)
	## return the ggplot graph
	g <- ggplot(data)
	## X & Y Axis
	g <- g + geom_point(aes_string(x = input$ggXaxis,
				       y = input$ggYaxis,
				       size = input$ggSize,
				       shape = input$ggShape))
	
	## Facets
	if( is.null(input$ggFaceth) & is.null(input$ggFacetv )){ 
		## do nothing
	} else {
		## adjust the right fact forumula
		if( !is.null(input$ggFaceth) & !is.null(input$ggFacetv) ){
			facet.formula = paste0(input$ggFaceth, " ~ ", input$ggFacetv )	
		} else {
			if(is.null(input$ggFaceth)) {
				facet.formula = paste0(". ~", input$ggFacetv )	
			} else {
				facet.formula = paste0(input$ggFaceth, " ~ .")	
			}
		}
		g <- g + facet_grid(facets = as.formula(facet.formula))	
	}
	
	return(ggplotly(g))
})


## =============================================================================
##      Generates Shiny outputs for each block
## =============================================================================

## -- Key Report information
output$photoKeyInfo <- renderDT(
	makePhotoData(), options = list(scrollX = TRUE, lengthMenu = c(5, 10, 20, 30, 50))
)

## -- ggplotly explorer
output$exifGgExplorer <- renderPlotly({
	makeGgExif()
})

## -- thumbnails
output$thumbnails <- renderImage({
	data <- makePhotoData()
	if (is.null(data)) {
		return(NULL)
	}
	
	return(list(
		src = data$thumbnail.url[1],
		filetype = data$MIMEType[1],
		alt = data$FileName[1]
	))
	
}, deleteFile = FALSE)

## Loop to build UI for thumbnails
output$thumbnailsTable<- renderUI({
	## Get filtered data based on menu inputs
	data <- (makePhotoData())
	## Build a functiont to render Image
	viewImage <- function(df,i){
		box( 
			footer = renderText(df$FileName[i]),
			status = "warning",
			renderImage({list(
				src = df$thumbnail.url[i],
				filetype = df$MIMEType[i],
				alt = df$FileName[i]
			)})
		)
	}
	## loop in all images selected
	lapply(1:nrow(data), function(i){viewImage(data,i)})
})
