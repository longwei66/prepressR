## -----------------------------------------------------------------------------
## Reactive function : ({ makeIncidentData )}
##
## Parameters : 
##      hzLiquid - a data.table with incident data
##      hzLiquidCodeBook - a data.table the associated codebook
##      input$myIncidentRef - the REPORT_NUMBER vector used in input
## Require :
##      MakeIncidentSummary function
## Returns :
##      The summary of incident data with features as row
## -----------------------------------------------------------------------------
makePhotoData <- reactive({
	return(
		MakePhotoSummary(dT = dF,
				 photo.ref = input$myPhotoRef,
				 chapter.ref = input$myChapterRef)
	)
})


## =============================================================================
##      Generates Shiny outputs for each block
## =============================================================================

## -- Key Report information
## -- Section "A"
output$photoKeyInfo <- renderDT(
	makePhotoData(), options = list(scrollX = TRUE, lengthMenu = c(5, 10, 20, 30, 50))
)