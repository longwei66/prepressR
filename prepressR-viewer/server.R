## -----------------------------------------------------------------------------
##      Generates the shiny server
## -----------------------------------------------------------------------------
function(input, output, session) {


        withProgress(message = 'Loading data',
                     detail = 'This may take a while...', 
                     value = 0, {
                             incProgress(amount = 1/2, detail = 'Connecting to Database')
                             load_data()
                             incProgress(amount = 1/2, detail = 'Cleaning')
                     })
        
        
        # Load the different functions of the dashboard w/m/y
        # ------------------------------------------------------------
        source('./server-components/generate-inputs-server.R', local = TRUE)
        source('./server-components/search-photos-tabs-server.R', local = TRUE)
        source('./server-components/search-photos-boxes-server.R', local = TRUE)
	source("./server-components/search-photos-boxes-server.R", local = TRUE)
        
        
        hide(id = "loading_page")
        show("main_content")
}