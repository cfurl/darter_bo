library(tidyverse)
library(grid)
library(shiny)

veg = read.table("data/veg_community_comp_full_cf.txt", header = TRUE)
sys = read_csv("data/system.txt")


#Comal
cr_veg = subset(veg, River == "CR")
smr_veg= subset(veg, River == "SMR")

# #Vegetation composition
# x = subset(cr_veg, Group == "A")
# x$Date = as.character(x$Date)
# x$Date = factor(x$Date, levels = unique(x$Date))
# x$Reach = as.character(x$Reach)
# x$Reach = factor(x$Reach, levels = unique(x$Reach))
# x$Veg = as.character(x$Veg)
# x$Veg = factor(x$Veg, levels = unique(x$Veg))
# levels(x$Reach) = c("Upper Spring Run", "Landa Lake", "Old Channel", "Upper New Channel", "Lower New Channel")


#Vegetation composition
x = subset(veg, Group == "A")
x$Date = as.character(x$Date)
x$Date = factor(x$Date, levels = unique(x$Date))
x$Reach = as.character(x$Reach)
x$Reach = factor(x$Reach, levels = unique(x$Reach))
x$Veg = as.character(x$Veg)
x$Veg = factor(x$Veg, levels = unique(x$Veg))
levels(x$Reach) = c("Upper Spring Run", "Landa Lake", "Old Channel", "Upper New Channel", "Lower New Channel","Spring Lake Dam","City Park","I-35")

##Build figures

veg_coverage_UI <- function(id){
  
fluidPage(
   fluidRow(
    column(2,
           wellPanel(
             
             radioButtons(NS(id,"system"), "River System", choices = c("Comal","San Marcos"),selected = "Comal"),
             checkboxGroupInput(NS(id,"reach"), "Location", choices = c("Landa Lake", "Upper Spring Run", "Old Channel",
                                                            "Upper New Channel", "Lower New Channel"),selected = "Landa Lake"),
             tags$div(tags$span(style="font-weight:bold;", "Stacked barplots of submerged aquatic vegetation coverage from 
                                biological monitoring surveys 2013-2021."))
             
             
             
             ), #wellPanel
    ), #column
    
    column(10,
           
           wellPanel(plotOutput(NS(id,"plot")),
                     br(),
                     dataTableOutput(NS(id,"data"))          
           ) #wellPanel
    ),#column
    
  ) #fluid Row
) #fluid page
}
