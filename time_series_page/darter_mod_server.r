library(tidyverse)


veg_types<-unique(both_darter$dominant_veg)

## server module
darter_mod_Server  <- function(id) {
  
  moduleServer(id,function(input, output, session) {
      
      # selected <- reactive(cm_darter %>% 
      #                        filter(Reach %in% input$reach) %>%
      #                        filter(dominant_veg %in% input$vegtype) %>%
      #                        filter(Date>= input$date[1] & Date <= input$date[2]))
      # 
    
    # both_darter is filtered on system
    riv_system <- reactive({both_darter %>%       
        filter(system == input$system)
    }) #site reactive
    
    # both_darter is filtered on selected reach
    site <- reactive({both_darter %>%       
        filter(Reach == input$reach)
    }) #site reactive
    
    observeEvent(riv_system(), {
      riv_choices<-unique(riv_system()$Reach)
      updateRadioButtons(inputId = "reach", choices = riv_choices, selected=riv_choices[1])
    }) #observeEvent
    
    
    
    observeEvent(site(), {
      choices<-unique(arrange(site(),dominant_veg)$dominant_veg)
      updateCheckboxGroupInput(inputId = "vegtype", choices = choices, selected=choices[1]) 
      }) #observeEvent
      
    selected <- reactive({site() %>%  
        req(input$vegtype) %>%
        filter(dominant_veg==input$vegtype)%>%
        filter(Date>= input$date[1] & Date <= input$date[2])
    }) #selected reactive 
    
    
      summary <- reactive({selected()}) 
      
      output$plot <- renderPlot({
        
          summary() %>%
            ggplot(aes(Date, freq, color=dominant_veg))+
            geom_point()+
            labs(y = expression(paste("Fountain Darters /", m^2)),x="")
        } , res = 96)   
      
      
      
      output$data <- renderDataTable(selected(), options = list(pageLength = 5))  
      
      output$download <- downloadHandler(
        filename = function(){paste("data-", Sys.Date(), ".csv", sep="")}, 
        content = function(fname){
          write.csv(selected(), fname)}) 
      
    }
    
  )
  
}    
