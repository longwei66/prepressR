## =============================================================================
## Generate UI elements for Explorer
## =============================================================================
getPhotoExplorer <- reactive({
        myPhotos <- as.character(unique(dF$absolute.photo.files.url))
        message(length(myPhotos))
        return(
                list(
                        "absolute.photo.files.url" = myPhotos
                )
        )
})



observe({
        ## get the data
        data <- getPhotoExplorer()
        ## allocate the data
        photos.references <- sort(data$absolute.photo.files.url)

        
        ## Server side generation of choice list without selection
        updateSelectizeInput(session, 'myPhotoRef', choices = photos.references, server = TRUE)
 
})