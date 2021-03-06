library(shiny)

shinyServer(function(input, output, session) {
    rdsData <- NULL
    if (is.null(rdsData)) {
        #give some initial data to plot out in case none available
        rdsData <- Theoph
        if(!file.exists('data.rds')) {
            saveRDS(Theoph, 'data.rds')
        }
    }
    
    rdsData <- reactiveFileReader(1000, session, 'data.rds', readRDS)
    observe({
        col_names <- names(rdsData())
        updateCheckboxGroupInput(session, 'show_vars', 'Columns in data set to show:',
                             choices =  col_names, 
                             selected =  col_names)
        
    })
    # a large table, reative to input$show_vars
    output$mytable1 <- DT::renderDataTable({
        data <- rdsData()
        data[, input$show_vars, drop = FALSE]
    }, options = list(orderClasses = TRUE, lengthMenu = c(10, 30, 50), pageLength = 15))
    
        
    
    
})
