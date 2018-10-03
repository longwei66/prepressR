source("./ui-components/search-photo-ui.R", local = TRUE)



# Define the Main body of the dashboard
# -----------------------------
dashboard_body <- dashboardBody(
        
        ## Load custom CSS File
        tags$head(
                tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
        ),
        
        ## Load the different tabs
        tabItems(
                ## -- Single incident search
                SearchPhoto
        )
)