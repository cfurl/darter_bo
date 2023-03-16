text_maps_UI <- function(id) {
  # Define UI for application that draws a histogram
  #shinyUI(
  fluidPage(
    
    tags$head(
      tags$link(rel="stylesheet", type="text/css", href="main.css")
    ),
    
    tags$body(
      
      tags$main(
        
        
        tags$img(class="left", src="Upper Spring Run.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="Landa Lake.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="Old Channel.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="New Channel.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="spring lake dam reach.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="City park.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="IH35 reach.jpg", alt="eggs", height="896px",width="1383px")
        
      )#main
      
    )#body
    
  )
  #)
}