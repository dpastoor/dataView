library(shiny)

shinyServer(function(input, output, session) {
    rdsData <- NULL
    if (is.null(rdsData)) {
        rdsData <- Theoph
    }
    rdsData <- reactiveFileReader(1000, session, 'data.rds', readRDS)
    observe({
            updateCheckboxGroupInput(session, 'show_vars', 'Columns in data set to show:',
                                 choices =  names(rdsData()), 
                                 selected =  names(rdsData()))
        
    })
    # a large table, reative to input$show_vars
    output$mytable1 <- renderDataTable({
        data <- rdsData()
        data[, input$show_vars, drop = FALSE]
    }, options = list(orderClasses = TRUE, lengthMenu = c(10, 30, 50), pageLength = 15))
    
        
    
    
})
