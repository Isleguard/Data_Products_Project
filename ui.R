#
#   Program:  Central Limit Theorm for Data Products
#
#   Written by Gary Baggett
#   Date: 11/16/2015
####################################################
library(ggplot2)
library(devtools)
library(shiny)
library(shinyapps)
library(rsconnect)

shinyUI(fluidPage(
    titlePanel("Central Limit Theorm"),
    h6("by Gary Baggett"),
    br(), br(),

    sidebarLayout(
        sidebarPanel(

            sliderInput("bins",
                        "Number of Samples/Group:",
                        min = 10,
                        max = 50,
                        step = 5,
                        value = 25),
            helpText("The Slider specifies the",
                     "number of the data elements",
                     "within the group"),
            br(),
            p(strong("Observational Notes:")),
            p("1. As the number of elements increases within the group, the Histgram of the data better fills in."),
            p("2. The Variance range converges [width decreases] as the data samples per group increases."),
            p("Note that there may be slight variations seen as the data is generated with each slide.")
        ),
        # Plot the generated distribution
        mainPanel(
            verticalLayout(
                h2("Histogram of grouped data values"),
                plotOutput("g"),
                h2("Variance plotted as a Histogram"),
                plotOutput("v")
            )
        )

    )
))
