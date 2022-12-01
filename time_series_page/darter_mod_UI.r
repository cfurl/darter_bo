## ui module

# cm_darter<-read_csv("C:\\Users\\cfurl\\OneDrive - Edwards Aquifer Authority\\shiny_prac\\darter\\cm_darter.csv",
#                     col_types=cols(
#                       Date=col_date(format="%m/%d/%Y")
#                     ))

veg_types<-unique(both_darter$dominant_veg) 

darter_mod_UI <- function(id) {
  
  fluidPage(
    fluidRow(
      column(2,
             wellPanel(
               radioButtons(NS(id,"system"), "River System", choices = c("Comal","San Marcos"),selected = "Comal"),
               radioButtons(NS(id,"reach"), "Location", choices = c("Landa Lake","Old Channel Reach", "Upper New Channel Reach", 
                                                                    "Upper Spring Run"  ),selected = "Landa Lake"),
               checkboxGroupInput(NS(id,"vegtype"), "Vegetation", choices = veg_types,selected = "Hygrophila"),
               sliderInput(NS(id,"date"),"Date",
                           min = as.Date("2000-01-01", "%Y-%m-%d"),
                           max = as.Date("2022-01-01", "%Y-%m-%d"),
                           value = c(as.Date("2008-02-01", "%Y-%m-%d"),as.Date("2020-02-01", "%Y-%m-%d")),
                           timeFormat = "%Y", ticks = T, animate = F
               )
               
               
               
             ), #wellPanel
      ), #column
      
      column(10,
             wellPanel(plotOutput(NS(id,"plot")),
                       br(),
                       dataTableOutput(NS(id,"data")),
                       downloadButton(NS(id,'download'),"Download the data")
             ) #wellPanel
      ) #column
    ) #fluid Row
  ) 
  
} # close function
