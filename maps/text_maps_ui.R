text_maps_UI <- function(id) {
  # Define UI for application that draws a histogram
  #shinyUI(
  fluidPage(
    
    tags$head(
      tags$link(rel="stylesheet", type="text/css", href="main.css")
    ),
    
    tags$body(
      
      tags$main(
        
        
        tags$h2("Comal maps"),
        tags$img(class="left", src="comal_resto.jpg", alt="eggs", height="1269px",width="1316px"),
        tags$img(class="left", src="Upper Spring Run.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="Landa Lake.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="Old Channel.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="New Channel.jpg", alt="eggs", height="896px",width="1383px"),
        tags$h2("San Marcos maps"),
        tags$img(class="left", src="sm_resto.jpg", alt="eggs", height="1058px",width="1340px"),
        tags$img(class="left", src="spring lake dam reach.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="City park.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="IH35 reach.jpg", alt="eggs", height="896px",width="1383px"),
        tags$img(class="left", src="access_upper.jpg", alt="eggs", height="1000px",width="1388px"),
        tags$img(class="left", src="access_lower.jpg", alt="eggs", height="974px",width="1336px"),
        tags$img(class="left", src="spg_lk.png", alt="eggs", height="888px",width="1416px"),
        tags$p("Thoughts for discussion I want to capture somewhere"),
        tags$p("Objectives should work at scales that match the darter's main population extent"),
        tags$p("they need to provide flexibility on sav makeup while generally avoiding large areas of monoculture"),
        tags$p("objectives should target areas of refuge in addition to high rec/impact areas"),
        tags$p("new delineation for rice reaches? Move off lake goals?"),
        tags$p("WQ goals")
      )#main
      
    )#body
    
  )
  #)
}