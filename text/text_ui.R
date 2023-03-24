#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

cm_combined<-read_csv("data/kable_goals_cm_combined.csv")
sm_combined<-read_csv("data/kable_goals_sm_combined.csv")
twr_goal<-read_csv("data/kable_goals_twr.csv")


text_UI <- function(id) {
# Define UI for application that draws a histogram
#shinyUI(
  fluidPage(
  
tags$head(
    tags$link(rel="stylesheet", type="text/css", href="main.css")
  ),
  
tags$body(
  
    tags$main(
      
      tags$div(class="EAHCP-biol-obj-wg",
        tags$h1("EAHCP Biological Objectives Subcommittee"),
        tags$p("This webpage serves as an electronic supplement for the Edwards Aquifer Habitat Conservation 
              Plan - Biological Objectives Subcommittee - Fountain darter/TWR team. This Subcommittee is part of the EAHCP 
              Permit Renewal effort and will serve as an avenue for species experts and other stakeholders to develop 
              recommendations for updating EAHCP Covered Species Biological Objectives. Three Subcommittee meetings for the 
               Fountain darter/TWR group have been scheduled"),
        tags$p(tags$span(style="font-weight:bold;", "Tuesday March 28th, 9:30-12:30, Pauline Espinosa Community Center (Lion's tube rental)")),
        tags$p(tags$span(style="font-weight:bold;","Friday April 21st, 12:30-3:30, Pauline Espinosa Community Center (Lion's tube rental)")),
        tags$p(tags$span(style="font-weight:bold;","Monday May 1st, 12:30-3:30, Pauline Espinosa Community Center (Lion's tube rental)")),
        tags$p("The meetings can also be attended using Microsoft Teams (invitations sent separately).  If you have difficulty joinging 
               via the Teams link please reach out to:"),
        tags$ol(class="help",
          tags$li("Olivia Ybarra - oybarra@edwardsaquifer.org"),
          tags$li("Jesus Hinojosa - jhinojosa@edwardsaquifer.org")
        ),
        tags$p("The Subcommittee has been assigned the following tasks:"),
        tags$ol(
          tags$li("Review USFWS guidance on developing biological objectives provided in the Habitat Conservation Planning 
                  and Incidental Take Permit Processing Handbook."),
          tags$li("Examine existing biological objectives and", tags$span( style="text-decoration-line:underline;","develop updated 
          draft biological objectives"), "adhering to HCP 
                  handbook recommendations and incorporating best available science surrounding the covered species."),
          tags$li("Produce a report for the EAHCP Program Manager detailing recommendations for updating biological 
                  objectives as part of the permit renewal effort. ")
              )
              ),#div1
      
      
      tags$div(class="USFWS-guidance",
        tags$h2("USFWS Guidance on Biological Objectives"),
        tags$p("The USFWS Habitat Planning Handbook (2016) provides guidance on developing Biological Objectives in" ,
         
          tags$a (href="https://www.fws.gov/sites/default/files/documents/habitat-conservation-planning-handbook-chapter-9.pdf", 
                  tags$span (style="color:rgb(159, 19, 112)", "Chapter 9: HCP Conservation Strategy")),
                "I would encourage Work Group members to read the short section covering Biological Goals and Biological Objectives. 
                  A few highlights from 9.1 Biological Goals and 9.2 Biological Objectives."
               ),
        tags$div(class="handbook-text",
                 tags$ol(
                   tags$li("Goals must be developed before developing objectives and conservation 
                        measures to orient management direction, both during plan development and throughout implementation."),
                   tags$li("Objectives are derived from goals, and they provide a foundation for determining conservation measures, monitoring 
                        direction, and evaluating effectiveness of the conservation strategy."),
                   tags$li("The number of objectives per goal will vary, but there should be 
                        enough to adequately describe how to achieve the goal.")
                 )
          
        ) #handbook-text div
        ),#div
      
      tags$div(class="highlights",
               tags$img(class="left", src="framework.png", alt="eggs", height="474px",width="947px"),
               tags$div(class="highlights-text",
                        
                        tags$h2("SMART Objectives"),
                        
                        tags$p(tags$span(style="font-weight:bold;", "Specific:"), " Objectives must clearly articulate what is to be achieved. Avoid ambiguity by phrasing 
                                objectives clearly. Be as specific as possible. Avoid phrases that are subject to interpretation, like maintain high-quality habitat"),
                        tags$p(tags$span(style="font-weight:bold;", "Measurable:")," Objectives should contain a measurable element that we can readily monitor 
                   to determine success or failure."),
                        tags$p(tags$span(style="font-weight:bold;", "Achievable:")," Objectives must be achievable. If you cannot determine how to achieve an 
                    objective, you must discard or rewrite it. Do not ask more of the land or wildlife than it can deliver, and use sound professional judgement to 
                    develop reasonable expectations of time, staff, and funds available to pursue the objective."),
                        tags$p(tags$span(style="font-weight:bold;", "Result-oriented:")," Objectives should specify an end result.  We should be able to envision the 
                   result of achieving the objective."),
                        tags$p(tags$span(style="font-weight:bold;", "Time-fixed:")," Objectives should indicate the time period during which they will be achieved. ")
               )#div2
      ),#div1
      
      
     tags$div(class="examples",
          tags$h2("Example Biological Goals and Objectives"),
            tags$p(tags$span(style="font-weight:bold;", "Long-term Biological Goal - Bogus Bat:")," self-sustaining population of bogus bats in the preserve system that can withstand threats, 
                   is genetically representative of neighboring populations, and contributes to the overall recovery of the species."),
            tags$ol(
              tags$li(tags$span(style="font-weight:bold;", "Objective:")," preserve 50% of the hibernacula and all maternity roosts of the bogus bat, in the plan area during the permit term"),
              tags$li(tags$span(style="font-weight:bold;", "Objective:")," enhance roosting habitat by protection and restoring any abandoned mine, cave, or building in the Preserve System and, 
                      if feasible, creating 5 artificial hibernacula during the permit term.")
                  ),
            tags$p(tags$span(style="font-weight:bold;", "Long-term Biological Goal - Swamp habitat:")," hydrologic integrity of the Mucky Swamp within the natural state of variability and 
                   function maintained within future climatic constraints."),
            tags$ol(
              tags$li(tags$span(style="font-weight:bold;", "Objective:")," preserve all area within 2500 feet of the 1900 high water line of Mucky swamp within 10 years of permit issuance through 
                      conservation easements and acquisition in fee title."),
              tags$li(tags$span(style="font-weight:bold;", "Objective:")," restore historic contours and elevations of Mucky swamp to increase retention and infill of sediment within 3 years of land preservation."),
              tags$li(tags$span(style="font-weight:bold;", "Objective:")," restore vegetation to historical conditions on preserved lands to increase infill into the Mucky Swamp from Stinky Creek and Curvey Creek 
                      within 20 years of permit issuance.")
          )
               
      ),#div1
      
      
      
      
      
      tags$div(class="existing",
        tags$h2("Existing Biological Goals and Objectives"),
          tags$p(
            tags$a(href="https://www.edwardsaquifer.org/wp-content/uploads/2022/07/Edwards-Aquifer-Recovery-Implementation-Program-Nov-2021.pdf",
                   tags$span (style="color:rgb(159, 19, 112)", "Chapter 9 of the EAHCP")),
                "contains the exisiting Biological Objectives for TWR and the Fountain Darter (Comal species - 4.1.1.1 and San Marcos species - 4.1.1.2; beginning
                  on pdf page 134)."),
          tags$h3("Fountain Dater"),
            tags$p("The long-term biological goals for the fountain darter are quantified as areal coverage of aquatic vegetation (habitat) within representative 
                   river reaches and fountain darter density (population measurement) per aquatic vegetation type. The habitat based and population measurement 
                   goals are presented below."),
           tags$p("Two Biological Objectives accompany the LTBG's for fountain darters in both systems."),
              tags$ol(
                tags$li("Submerged aquatic restoration will occur in the LTBG reach areas along with restoration reaches adjacent to the goal reaches."),
                tags$li("Surface water quality will not exceed a 10% deviation in daily average from long-term water quality averages.")
                      ),
        tags$div(class="darter-tables",
            
            tags$h5("Comal River Fountain darter LTBGs"),
            dataTableOutput(NS(id,"fd_goal_data_cm")),
            tags$h5("San Marcos River Fountain darter LTBGs"),
            dataTableOutput(NS(id,"fd_goal_data_sm"))
        ),
        
          
        tags$h3("Texas Wild-rice"),
            tags$p("The long-term biological goals for Texas Wild-Rice are areal coverage of Texas Wild-Rice within specific river reaches of the San Marcos River."),
           tags$p("There are three Biological Objectives that accompany the Biological Goals for TWR in the San Marcos."),
                 tags$ol(
                  tags$li("Minimum Texas wild-rice areal coverage per segment during drought of record-like conditions (Table 4-11). "),
                   tags$li("Recreation awareness throughout the whole river at all flows with designated control in the following high quality 
                           habitat areas below 100 cfs total San Marcos discharge (Table 4-12). "),
                  tags$li("Active restoration and Texas wild-rice expansion efforts and long-term monitoring focused on high-quality habitat areas."),     
        
        tags$div(class="twr-table",
        tags$h5("San Marcos River TWR LTBGs"),      
        dataTableOutput(NS(id,"twr_goal"))
        )
               
        ),
        
        tags$div(class="recommendations",
                 tags$h2("Biological Goals Work Group Recommendations ",
                         tags$a(href="https://www.edwardsaquifer.org/wp-content/uploads/2023/03/Biological-Goals-Subcommittee_Full_Report_2023.pdf",
                                tags$span (style="color:rgb(159, 19, 112)", "Report"))
                         ),
                 tags$p("Fountain darter - Conserve habitats, diverse native submerged aquatic vegetation assemblages, and resilient
                        fountain darter populations in the Comal and San Marcos spring and river systems."),
                 tags$p("TWR - Conserve and manage resilient Texas wild-rice populations in the San Marcos spring and river system.")
                 
        )#div1
        
        

              
      )
      
      )#main
    
  )#body

)
  #)
}
