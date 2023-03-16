#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
text_Server  <- function(id) {
# Define server logic required to draw a histogram
#shinyServer(function(input, output) {
  moduleServer(id,function(input, output, session) {
    
 output$fd_goal_data_cm <- renderDataTable(cm_combined, options = list(paging = FALSE, info = FALSE, searching=FALSE))
 output$fd_goal_data_sm <- renderDataTable(sm_combined, options = list(paging = FALSE, info = FALSE, searching=FALSE)) 
 output$twr_goal <- renderDataTable(twr_goal, options = list(paging = FALSE, info = FALSE, searching=FALSE)) 

  
  

})
}



