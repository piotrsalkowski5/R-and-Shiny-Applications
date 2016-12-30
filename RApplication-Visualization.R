
dane <- read.csv(file = "C:/PIOTREK/Praca_Dane_R.csv")




library(shinythemes)
library(ggplot2)
library(shiny)
library(leaflet)
library(RColorBrewer)


ui<-fluidPage(title = "Zarobki",theme = shinytheme("cerulean"),
  
  headerPanel("Zale¿noœci zarobkowe i zawodowe na podstawie informacji ofert pracy znalezionych na stronie www.goldenline.pl"),
  
  sidebarPanel(sliderInput(inputId = "slider",label = "Choose number of Id",min = 1,max=length(dane[,1]),step = 1,value = 1)),
               selectInput(inputId = "select",label = ("Choose Value"),choices = c("Zawód" = 1,"Firma" = 2,"Lokalizacja" = 3,"Wynagrodzenie" = 4)),
  
  mainPanel(
    radioButtons(inputId = "radiob",label = "Choose style",choices = c(1,2,3)),
    
      
    tabsetPanel(
      
      tabPanel(title = "Dane",
               fluidRow(column(12, verbatimTextOutput("value")))),
      
      tabPanel("Histogram",plotOutput("histt")),
      
      tabPanel("BoxPlot",plotOutput("box"))
    )
    
  )
  
  
  
  
  )


server<-function(input,output)
{
 output$value<-renderPrint(dane[input$slider,as.numeric(input$select)])
 
 Legenda <- dane[,3]
 
 h<-ggplot(data = dane,aes(x=dane[,4]))
 h2<-h + geom_histogram(binwidth = 300,aes(fill=Legenda),colour = "black") + xlab(colnames(dane)[4]) + ylab("Zlicz")
 
 output$histt<-renderPlot(h2)
 
 m<-ggplot(data = dane,aes(x=dane[,3],y=dane[,4],size=dane[,4],colour=dane[,3]))
 m2<-m+geom_boxplot(aes(fill=Legenda),colour = "black") + xlab(colnames(dane)[3]) + ylab(colnames(dane)[4])+scale_color_gradient(low = "white", high = "black")
 
 output$box <- renderPlot(m2)
  
    
  
  
}


shinyApp(ui,server)






















