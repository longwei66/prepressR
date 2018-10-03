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
                                    photo.ref = input$myPhotoRef)
                )
})


## =============================================================================
##      Generates Shiny outputs for each block
## =============================================================================

## -- Key Report information
## -- Section "A"
output$photoKeyInfo <- renderDT(
        makePhotoData()
)