SearchIncident <- tabItem(
        tabName = "exploratory-analysis",
        
        fluidRow(
                #HTML(markdown::markdownToHTML(knitr::knit('./Rmd/exploratory-analysis-report.Rmd', quiet = FALSE)))
        )
)