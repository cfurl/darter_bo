library(tidyverse)
library(bslib)

# call in the data.  I think I'll do this on the UI side until I see a reason not to.

both_darter<-read_csv("data/both_darter.csv",
                    col_types=cols(
                      Date=col_date(format="%m/%d/%Y")
                    )) %>%
  mutate(per_sqm=freq/2) %>%
  select(-freq) %>%
  select(per_sqm,everything()) %>%
  rename(freq=per_sqm)


# populate a list of vegetation types that can be used for checkboxGroupInput
# (it appears to me this is really used by updatecheckboxGroupInput on server side)

veg_types_box<-unique(both_darter$dominant_veg) %>%
  as_tibble()%>%
  rename(ddd=value)%>%
  arrange(ddd)



darter_veg_UI <- function(id) {
  
  fluidPage(theme = bslib::bs_theme(bootswatch = "flatly"),
            
            tags$style(
              "div.dataTables_filter{
              text-align: left;
              }"
            ),

                        #titlePanel("Fountain Darter"),
            
            fluidRow(
              column(2,
                     wellPanel(
                       
                       radioButtons(NS(id,"system"), "River System", choices = c("Comal","San Marcos"),selected = "Comal"),
                       radioButtons(NS(id,"reach"), "Location", choices = c("Landa Lake","Old Channel Reach", "Upper New Channel Reach", 
                                                                   "Upper Spring Run"  ),selected = "Landa Lake"),
                       checkboxGroupInput(NS(id,"vegtype"), "Vegetation", choices = veg_types_box,selected = "Hygrophila"),
                       checkboxGroupInput(NS(id,"ltbg"),"LTBG", choices = veg_types_box,selected = "Bryophytes"),
                       tags$div(tags$span(style="font-weight:bold;", "Boxplots of fountain darter densities from dropnet results 2000-2021."))
                       
                       
                     ), #wellPanel
              ), #column
              
              column(10,
                    
                     wellPanel(plotOutput(NS(id,"plot")),
                               br(),
                               br(),
                              dataTableOutput(NS(id,"data"))          
                     ) #wellPanel
              ),#column
                                
            ) #fluid Row
  ) #fluidPage
} # close function