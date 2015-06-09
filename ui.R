library(shiny)

shinyUI(fluidPage(
    title = 'dataView',
    sidebarLayout(
        sidebarPanel(
                checkboxGroupInput('show_vars', 'Columns in data set to show:',
                                   names(Theoph), selected = names(Theoph)),
                width = 2
            
        ),
        mainPanel(
            tabsetPanel(
                id = 'dataset',
                tabPanel('data', DT::dataTableOutput('mytable1'))
            )
        )
    )
))
