## =============================================================================
##              SearchPhoto
##              ---------------
##
## =============================================================================
SearchPhoto <- tabItem(
	tabName = "search-photo",
	
	fluidRow(
		
		## -------------------------------------------------------------
		## Column 1 : filter on 1 Photo
		## -------------------------------------------------------------
		column(
			width = 3,
			# Photo File Name selector
			box(
				title = "Chapter file url #",
				width = NULL,
				status = "info",
				solidHeader = TRUE,
				collapsible = TRUE,
				collapsed = FALSE,
				selectizeInput(
					inputId = 'myChapterRef',
					label = NULL,
					choices = NULL,
					multiple = TRUE)
				
			),
			box(
				title = "Photo url #",
				width = NULL,
				status = "info",
				solidHeader = TRUE,
				collapsible = TRUE,
				collapsed = FALSE,
				selectizeInput(
					inputId = 'myPhotoRef',
					label = NULL,
					choices = NULL,
					multiple = TRUE)
				
			),
			
			
			## Value box with KPI of the incident
			fluidRow(valueBoxOutput("photoIamgeWidth",width = 12))
		),
		
		## -------------------------------------------------------------
		## Column 2 : dataviewer with tabs
		## -------------------------------------------------------------
		column(
			width = 9,
			
			box(
				title = "Exif Viewer (Extract)",
				width = NULL,
				status = "info",
				solidHeader = TRUE,
				collapsible = TRUE,
				collapsed = TRUE,
				
				## ---------------------------------------------
				##  First tab set - main data
				## ---------------------------------------------
				
				tabBox(
					#title = "Data",
					width = 12,
					# The id lets us use input$tabset1
					# on the server to find the current tab
					id = "tabset1", 
					
					## -----------------------------
					##  Tab : Key information
					## -----------------------------
					tabPanel(title = "Key Information",
						 icon = icon("key"),
						 DTOutput("photoKeyInfo")
					),
					
					## -----------------------------
					##  Tab : Thumbnail
					## -----------------------------
					tabPanel(title = "Thumbnail",
						 icon = icon("image"),
						 #imageOutput("thumbnails")
						 # UI output
						 uiOutput("thumbnailsTable")
					)
					
				)
			),
			box(
				title = "Exif Analyser",
				width = NULL,
				status = "warning",
				solidHeader = TRUE,
				collapsible = TRUE,
				collapsed = TRUE,        
				## ---------------------------------------------
				##  First tab set - main data
				## ---------------------------------------------
				
				tabBox(
					#title = "Cause Analysis",
					width = 12,
					# The id lets us use input$tabset1
					# on the server to find the current tab
					id = "tabset2", 
					
					## -----------------------------
					##  Tab : Operations
					## -----------------------------
					tabPanel(title = "Scatterplot",
						 icon = icon("tasks"), #,
						 
						 fluidRow(
						 	
						 	column(
						 		width = 4,
						 		selectizeInput(
						 			inputId = 'ggXaxis',
						 			label = "X axis",
						 			choices = NULL,
						 			multiple = TRUE),
						 		selectizeInput(
						 			inputId = 'ggYaxis',
						 			label = "Y axis",
						 			choices = NULL,
						 			multiple = TRUE),
						 		selectizeInput(
						 			inputId = 'ggSize',
						 			label = "Size",
						 			choices = NULL,
						 			multiple = TRUE)
						 	),
						 	column(
						 		width = 4,
						 		selectizeInput(
						 			inputId = 'ggFaceth',
						 			label = "Horizontal Facet",
						 			choices = NULL,
						 			multiple = TRUE),
						 		selectizeInput(
						 			inputId = 'ggFacetv',
						 			label = "Vertical Facet",
						 			choices = NULL,
						 			multiple = TRUE),
						 		selectizeInput(
						 			inputId = 'ggShape',
						 			label = "Shape",
						 			choices = NULL,
						 			multiple = TRUE)
						 	),
						 	column(
						 		width = 4,
						 		selectizeInput(
						 			inputId = 'ggColorDiscrete',
						 			label = "Color as discrete (priority)",
						 			choices = NULL,
						 			multiple = TRUE),
						 		selectizeInput(
						 			inputId = 'ggColorContinuous',
						 			label = "Color as continuous",
						 			choices = NULL,
						 			multiple = TRUE),
						 		selectizeInput(
						 			inputId = 'ggLabel',
						 			label = "Label",
						 			choices = NULL,
						 			multiple = TRUE)
						 	)
						 	
						 ),
						 fluidRow(
						 	plotlyOutput("exifGgExplorer")
						 )
					)
				)
				
			)
		)
	)
)
