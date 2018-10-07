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
getGgplotDimensions <- reactive({
	features <- generateFeaturesList(dF)
	
	return(
		list(
			"xaxis" = features[xaxis == 1, feature],
			"yaxis" = features[yaxis == 1, feature],
			"size" = features[size == 1, feature],
			"faceth" = features[faceth == 1, feature],
			"facetv" = features[facetv == 1, feature],
			"shape" = features[shape == 1, feature],
			"color.discrete" = features[color.discrete == 1, feature],
			"color.continuous" = features[color.continuous == 1, feature],
			"label" = features[label == 1, feature]
		)
	)
})

observe({
        ## get the data
        data <- getPhotoExplorer()
        ggplotMenus <- getGgplotDimensions()
        
        ## allocate the data
        photos.references <- sort(data$absolute.photo.files.url)
        chapter.references <- sort(data$sla.filename)

                
        ## Server side generation of choice list without selection
        updateSelectizeInput(session, 'myPhotoRef', choices = photos.references, server = TRUE)
        updateSelectizeInput(session, 'myChapterRef', choices = chapter.references, server = TRUE)
        updateSelectizeInput(session, 'ggXaxis', choices = ggplotMenus$xaxis, server = TRUE)
        updateSelectizeInput(session, 'ggYaxis', choices = ggplotMenus$yaxis, server = TRUE)
        updateSelectizeInput(session, 'ggSize', choices = ggplotMenus$size, server = TRUE)
        updateSelectizeInput(session, 'ggFaceth', choices = ggplotMenus$faceth, server = TRUE)
        updateSelectizeInput(session, 'ggFacetv', choices = ggplotMenus$facetv, server = TRUE)
        updateSelectizeInput(session, 'ggShape', choices = ggplotMenus$shape, server = TRUE)
        updateSelectizeInput(session, 'ggColorDiscrete', choices = ggplotMenus$color.discrete, server = TRUE)
        updateSelectizeInput(session, 'ggColorContinuous', choices = ggplotMenus$color.continuous, server = TRUE)
        updateSelectizeInput(session, 'ggLabel', choices = ggplotMenus$label, server = TRUE)
})