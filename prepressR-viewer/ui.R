## =============================================================================
##
##      prepressR-Explorer
##      a shiny app to explore and analyse photos for PA prepress
##
## =============================================================================

## Load libraries
library(data.table)
library(shinydashboard)
library(shinyjs)
library(DT)
library(ggplot2)
library(plotly)



## Load general config data

## Load functions
source("./R/make-photo-summary.R")
source("./R/generate-menulist-exploratory.R")

## Load functions
source("./R/load-data.R")


## Load source for interface (ui) objects
source("./ui-components/dashboard-header-ui.R", local = TRUE)
source("./ui-components/dashboard-sidebar-ui.R", local = TRUE)
source("./ui-components/dashboard-body-ui.R", local = TRUE)
source("./ui-components/exploratory-analysis.R", local = TRUE)






## -----------------------------------------------------------------------------
##      Generates the shiny dashboard interface
## -----------------------------------------------------------------------------
ui <- div(
        
        ## Show loading message while loading data
        useShinyjs(),
        
        
        div(
                id = "loading_page",
                dashboardPage(
                        skin = "black",
                        dashboardHeader(title = "Loading data, please wait"),
                        dashboardSidebar(),
                        dashboardBody()
                )
        ),
        hidden(
                div(
                        id = "main_content",
                        dashboardPage(
                                skin = "purple",
                                # Header
                                # -----------------------------
                                dashboard_header,
                                
                                # Side bar menu and controls
                                # -----------------------------
                                dashboard_sidebar,
                                
                                # Main body of the dashboard
                                # -----------------------------
                                dashboard_body
                        )
                )
        )
        
)