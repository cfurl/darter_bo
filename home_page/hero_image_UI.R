library(tidyverse)
library(shiny)
library(shiny.router)
library(shinyWidgets)

backgroundImageCSS <- "/* background-color: #cccccc; */
                       height: 91vh;
                       background-position: center;
                       background-repeat: no-repeat;
                       background-size: cover;
                       background-image: url('%s');
                       
                       "


hero_image_UI <- function(id) {
fluidPage(
  #theme="hero_a.css"
  style = sprintf(backgroundImageCSS,  "https://images.unsplash.com/photo-1583542225715-473a32c9b0ef?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80")
   # style = sprintf(backgroundImageCSS, "C:\\Users\\cfurl\\OneDrive - Edwards Aquifer Authority\\shiny_prac\\routing\\www\\Comal-Springs-Web.jpg")
  #style = sprintf(backgroundImageCSS,'Comal-Springs-Web.jpg')
  )
}

