library(shiny)
library(ggplot2)  # for the diamonds dataset

shinyUI(fluidPage(
    title = 'Examples of DataTables',
    sidebarLayout(
        sidebarPanel(
                checkboxGroupInput('show_vars', 'Columns in data set to show:',
                                   names(Theoph), selected = names(Theoph)),
                width = 2
            
        ),
        mainPanel(
            tabsetPanel(
                id = 'dataset',
                tabPanel('data', dataTableOutput('mytable1'))
            )
        )
    )
))
