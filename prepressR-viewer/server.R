## -----------------------------------------------------------------------------
##      Generates the shiny server
## -----------------------------------------------------------------------------
function(input, output, session) {



        load_data()

        
        # Load the different functions of the dashboard w/m/y
        # ------------------------------------------------------------
        source('./server-components/generate-inputs-server.R', local = TRUE)
        source('./server-components/search-photos-tabs-server.R', local = TRUE)
        source('./server-components/search-photos-boxes-server.R', local = TRUE)
	source("./server-components/search-photos-boxes-server.R", local = TRUE)
        
        
        hide(id = "loading_page")
        show("main_content")
}