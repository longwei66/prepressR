## -----------------------------------------------------------------------------
##
## -----------------------------------------------------------------------------
makePhotoData <- reactive({
	return(
		MakePhotoSummary(dT = dF,
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
## -- Section "A"
output$photoKeyInfo <- renderDT(
	makePhotoData(), options = list(scrollX = TRUE, lengthMenu = c(5, 10, 20, 30, 50))
)


output$exifGgExplorer <- renderPlotly({
	makeGgExif()
})