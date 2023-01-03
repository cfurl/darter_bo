#install.packages('remotes', dependencies=TRUE, repos='http://cran.rstudio.com/')

library(tidyverse)
library(shiny)
library(shiny.router)
library(shinyWidgets)
library(markdown)
library(thematic)
library(knitr)
library(kableExtra)

# modules for home_page
source(".\\home_page\\hero_image_UI.R")
source(".\\home_page\\hero_image_server.R")

# modules for boxplots comparing vegetation types
source(".\\box_plot_page\\darter_veg_UI.R")
source(".\\box_plot_page\\darter_veg_Server.R")


# modules for comparing dropnet time series plots
source(".\\time_series_page\\darter_mod_UI.R")
source(".\\time_series_page\\darter_mod_server.R")

# modules for vegetation coverage
source(".\\veg_coverage_barplot_page\\veg_coverage_UI.R")
source(".\\veg_coverage_barplot_page\\veg_coverage_Server.R")


home_page <- hero_image_UI("still_curious_function_naming")
test_text<-fluidPage(includeMarkdown(knit(".\\text\\template_markdown_test.RMD")))
veg_comparison_page <- darter_veg_UI("some_name")
veg_time_series_page <- darter_mod_UI("something")
veg_coverage_page<-veg_coverage_UI("lets_go")

router <- make_router(
  route("/", home_page),
  route("veg_comp", veg_comparison_page),
  route("veg_time", veg_time_series_page),
  route("veg_coverage",veg_coverage_page),
  route("text_tester", test_text)  
)

ui <- fluidPage(
  theme = "main.css",
  tags$ul(
    tags$li(a(href = route_link("/"),"Home")),
    tags$li(a(href = route_link("text_tester"), "Background")),
    tags$li(a(href = route_link("veg_comp"), "Darter Boxplots")),
    tags$li(a(href = route_link("veg_time"), "Darter Time Series")),
    tags$li(a(href = route_link("veg_coverage"), "Vegetation Coverage"))
  ),
  router$ui
)

server <- function(input, output, session) {
  router$server(input, output, session)
  
  {hero_image_Server("still_curious_function_naming")
   # fullpage_img_Server("still_curious_function_naming")
    darter_veg_Server("some_name")
    darter_mod_Server("something")
    veg_coverage_Server("lets_go")
    
}}

shinyApp(ui, server)