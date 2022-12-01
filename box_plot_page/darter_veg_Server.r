library(tidyverse)


  darter_veg_Server <- function(id) {

    moduleServer(id,function(input, output, session) {
 
      # both_darter is filtered on selected system
      riv_system <- reactive({both_darter %>%
          filter(system == input$system)
      }) #riv_system reactive

      # cm_darter is filtered on selected reach
      site <- reactive({both_darter %>%       
        filter(Reach == input$reach)
      }) #site reactive
      
      #cm_darter is filtered on selected reach drop na's to get rid of veg types w/o ltbg
      this_way <- reactive({both_darter %>%       
        filter(Reach == input$reach) %>%
        drop_na()
      }) #this_way reactive
      
      observeEvent(riv_system(), {

        riv_choices<-unique(riv_system()$Reach)
        updateRadioButtons(inputId = "reach", choices = riv_choices, selected=riv_choices[1])
      }) #observeEvent


      # Make your vegetation choices reactive, and choose your vegetation species to play with
      
      observeEvent(site(), {
        
        choices<-unique(arrange(site(),dominant_veg)$dominant_veg)#vegetation choices are updated with selected location: 
        choicez<-unique(arrange(this_way(),dominant_veg)$dominant_veg)#ltbg choices are updated with selected location:
       
        updateCheckboxGroupInput(inputId = "vegtype", choices = choices, selected=choices[1])
        updateCheckboxGroupInput(inputId = "ltbg", choices = choicez,selected=choicez[1])
      }) #observeEvent


      #selected is populated by user choosing one or multiple vegetation species
      
      selected <- reactive({site() %>%  
        req(input$vegtype) %>%
        filter(dominant_veg==input$vegtype)
      }) #selected reactive    
      
      selected_ltbg <- reactive({site() %>%  
          req(input$ltbg) %>%
          filter(dominant_veg==input$ltbg)
      }) #selected reactive 

theme_update(panel.background=element_rect(fill="#EBEFFF"),
                   plot.background=element_rect(fill="#FFFFFF"),
                   panel.grid=element_line(color="#476CFF"),
                   text=element_text(family="mono",angle=0,color="black",face="bold"),
                   axis.text.x =element_text(family="mono",angle=0,color="black",face="bold") )       
  
    output$plot <- renderPlot({

      ggplot()+
        geom_boxplot(data=selected(),aes(dominant_veg, freq, group=dominant_veg),
                     fill="#6281ff",
                     outlier.shape=NA,
                     lwd=0.75)+
        labs(y = expression(paste("Fountain Darters /", m^2)),x="")+
        
        geom_jitter(data=selected(),aes(dominant_veg, freq, group=dominant_veg),alpha=0.2,
                    width=0.2)+
        geom_point(data=selected_ltbg(),aes(x=dominant_veg,y=ltbg),color="red",size=4)

    },res=96)

  output$data <- renderDataTable(selected(), options = list(pageLength = 5))

}  )#moduleServer
} #darter_veg_Server
