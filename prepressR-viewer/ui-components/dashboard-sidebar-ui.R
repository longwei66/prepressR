## =============================================================================
##
##              dashboard-sidebar.R
##              -------------------
##              Define the side bar menu and controls
##
## =============================================================================


dashboard_sidebar <-  dashboardSidebar(
        width = 200,
        
        sidebarMenu(
                id = "mainMenu",
                menuItem(
                        "Dashboards",
                        tabName = "",
                        icon = icon("dashboard", lib = "glyphicon"),
                        
                        ## -- Search photos by filename
                        menuSubItem(
                                "Search Photo",
                                tabName = "search-photo",
                                icon = icon("search")
                        ),
                        
                        
                        ## -- Exploratory Analysis
                        menuSubItem(
                                "Exploratory Analysis",
                                tabName = "exploratory-analysis",
                                icon = icon("list-alt", lib = "glyphicon")
                        )
                        
                ),
                
                menuItem(
                        "version 1",
                        icon = icon("info"),
                        tabName = "info")
                
        )
        
)