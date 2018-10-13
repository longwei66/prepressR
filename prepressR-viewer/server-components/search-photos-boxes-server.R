## =============================================================================
##      Generates Shiny outputs for each ValueBox
## =============================================================================

## -- valuebox - Fatalities
output$photoIamgeWidth <- renderValueBox({
        valueBox(
                subtitle = "Image Width", 
                value =  mean(pa.photo.db[ absolute.photo.files.url %in% input$myPhotoRef, ImageWidth]),
                color = "red",
                #fill = 
                icon = icon("user", lib = "glyphicon")
        )
})