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
                        width = 2,
                        # Photo File Name selector
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
                        width = 10,
                        
                        box(
                                title = "Photo Exif",
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
                                        )
                                )
                        ),
                        box(
                                title = "Cause analysis",
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
                                        tabPanel(title = "Details",
                                                 icon = icon("cogs") #,
                                                 #DTOutput("")
                                        ),
                                        
                                        
                                        ## -----------------------------
                                        ##  Tab : Drug & Alcool
                                        ## -----------------------------
                                        tabPanel(title = "Drug & Alcool",
                                                 icon = icon("beer") #,
                                                 #DTOutput("incidentDrugInfo")
                                        )
                                )
                                
                        )
                )
        )
)