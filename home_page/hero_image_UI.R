library(tidyverse)
library(shiny)
library(shiny.router)
library(shinyWidgets)

hero_image_UI <- function(id) {
  fluidPage(
    
    
    
    style = "height: 90vh;
                       background-position: center;
                       background-repeat: no-repeat;
                       background-size: cover;
                       background-image: url('FountainDarter_HR_outline.jpg');
                       background-size: contain;
                       background-position: right;
                       background-origin: border-box;
                       ",
    
    tags$style (".will-this-work {color: #002035;
                position: fixed;
  	            bottom: 10px;
                font-family: sans-serif;
                float:right;
                font-size: 2.8em}"),
    
    tags$p(class="will-this-work" ,"EAHCP Biological Objectives Subcommittee")
  )
}
#
