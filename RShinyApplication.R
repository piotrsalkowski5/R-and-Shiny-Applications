
library(rsconnect)

library(shiny)
library(leaflet)
library(RColorBrewer)


ui <- fluidPage(sliderInput(min=1,max=100,inputId = "numb", label = "wybierz", value = 200),
                  textInput(inputId = 'title', label = "wpisz tytul",value = "histogram"),
                  sliderInput(inputId = "slider",min = 1,max = 100,step = 2,value = 30,label='chice'),
                actionButton(inputId = "button",label = "Click Me !"),
                 plotOutput("histt"))


server <- function(input, output){
  observeEvent(input$button,{print(as.numeric(input$button))} )
  data<-reactive({
    rnorm(input$numb)
  })
  
  
  output$histt <- renderPlot({
    hist(data(),main = input$title)})
  
  
  
  output<-renderText({
    summary(data())
  })
}


shinyApp(ui,server)













