## =============================================================================
## Generate UI elements for Explorer
## =============================================================================
getPhotoExplorer <- reactive({
        myPhotos <- as.character(unique(dF$absolute.photo.files.url))
        myChapters <- as.character(unique(dF$sla.filename))
        
        return(
                list(
                        "absolute.photo.files.url" = myPhotos,
                        "sla.filename" = myChapters
                )
        )
})



observe({
        ## get the data
        data <- getPhotoExplorer()
        ## allocate the data
        photos.references <- sort(data$absolute.photo.files.url)
        chapter.references <- sort(data$sla.filename)
        
        ## Server side generation of choice list without selection
        updateSelectizeInput(session, 'myPhotoRef', choices = photos.references, server = TRUE)
        updateSelectizeInput(session, 'myChapterRef', choices = chapter.references, server = TRUE)
 
})