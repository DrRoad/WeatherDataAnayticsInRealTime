library(shiny)
library(rPython)
ui<-shinyUI(fluidPage(
  titlePanel("Weather analysis"),
  sidebarLayout(
    sidebarPanel(
      column(5,h3(""),actionButton("action1",label="Temperature trend"),br(),br()),
      column(4,h3(""),actionButton("action2",label="Humidity trend"),br(),br()),
      column(3,h3(""),actionButton("action3",label="PM level trend"),br(),br())
    ),
    mainPanel(plotOutput("distPlot"))
  )
  
))
server<-shinyServer(function(input,output){
  observeEvent(input$action1,{output$distPlot<-renderPlot({
    c <- source("C:/Users/username/Desktop/FinalProjectFiles/visualization.R")
    plot(c$value)})
  }

  )
 observeEvent(input$action2,{output$distPlot<-renderPlot({
   d<-source("/home/username/Desktop/ProjectFinal/visual_humidity.R")
   plot(d$value)
   
 })
 
  }
 ) 
 observeEvent(input$action3,{output$distPlot<-renderPlot({
   e<-source("/home/username/Desktop/ProjectFinal/visual_pmlevel.R")
   plot(e$value)
   
 })
})
})
shinyApp(ui=ui,server=server)
