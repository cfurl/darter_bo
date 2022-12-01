veg_coverage_Server <- function(id) {
  
  
  moduleServer(id,function(input, output,session) {
  
   
    
   
    riv_system <- reactive({sys %>%       
        filter(veg_system == input$system)
    }) #site reactive
   
    observeEvent(riv_system(), {
      riv_choices<-unique(riv_system()$veg_reach)
      updateCheckboxGroupInput(inputId = "reach", choices = riv_choices, selected=riv_choices[1])
    }) #observeEvent
   
   
  selectedd <- reactive(x %>% 
                         filter(Reach %in% input$reach) )#%>%
                         #filter(dominant_veg %in% input$vegtype) %>%
                         #filter(Date>= input$date[1] & Date <= input$date[2]))
  
  summaryy <- reactive({selectedd()}) 
  
  
  
  output$plot <- renderPlot({
   ggplot(summaryy(), aes(x = Date, y = Coverage, fill = Veg, group = Veg)) +
  geom_bar(stat = "identity", width = 0.5) +
  facet_wrap(~Reach, nrow = 2, scales = "free_y")+
  #scale_fill_brewer(palette = "Paired") +
  scale_fill_manual(values=c("cadetblue3","blue2","mediumpurple1","red","orange","darkorange3","khaki","yellow","darkgreen","purple"))+
  theme_bw() +
  scale_x_discrete(breaks = function(x){x[c(TRUE, FALSE)]}) +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  theme(axis.text = element_text(size = 9)) +
  theme(axis.title = element_text(size = 12)) +
  theme(legend.title = element_blank()) +
  theme(legend.text = element_text(size = 12)) +
  theme(legend.position = "bottom")+
  theme(axis.text.x = element_text(color = "black")) +
  theme(axis.text.y = element_text(color = "black")) +
  labs(y = expression(paste("Areal Coverage ",( m^2))),x="") +
  #ylab(expression(paste("Areal Coverage ",( m^2))))
  theme(panel.grid.major.x = element_blank(),
        panel.grid.major.y = element_line( size=.1, color="gray85"),
        panel.grid.minor = element_blank())
    }, height = "auto", width = "auto",res=96)

  output$data <- renderDataTable(summaryy(), options = list(pageLength = 5)) 
  
  }
  )
}