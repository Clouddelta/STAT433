# install.packages("shiny")
library(shiny)
# need a file called app.R.
# app.R has three components:
# 1) a user interface object:  ui
# 2) a server function:  server
# 3) a call to the shinyApp function:  shinyApp(ui = ui, server = server)

# The user interface (ui) object controls 
#     the layout and appearance of your app. 
# The server function contains the instructions 
#     that your computer needs to build your app. 
# Finally the shinyApp function creates Shiny 
#     app objects from an explicit UI/server pair.


# Define UI for app that draws a histogram ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Hello Shiny!"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # Input: Slider for the number of bins ----
      sliderInput(inputId = "bins",
                  label = "Number of bins:",
                  min = 1,
                  max = 50,
                  value = 30)
      
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot")
      
    )
  )
)

server <- function(input, output) {
  
  # Histogram of the Old Faithful Geyser Data ----
  # with requested number of bins
  # This expression that generates a histogram is wrapped in a call
  # to renderPlot to indicate that:
  #
  # 1. It is "reactive" and therefore should be automatically
  #    re-executed when inputs (input$bins) change
  # 2. Its output type is a plot
  output$distPlot <- renderPlot({
    
    x    <- faithful$waiting
    bins <- seq(min(x), max(x), length.out = input$bins + 1)
    
    hist(x, breaks = bins, col = "#75AADB", border = "white",
         xlab = "Waiting time to next eruption (in mins)",
         main = "Histogram of waiting times")
    
  })
  
}

shinyApp(ui = ui, server = server)

# the logic flow....
#  when you change the input data, 
#    the server function gets new input.
#    it runs, makes a plot. which ui renders.


# Every Shiny app has the same structure: 
#   an app.R file that contains ui and server. 
#   You can create a Shiny app by making a new 
#   directory and saving an app.R file inside it. 
#   It is recommended that each app will 
#   live in its own unique directory.
# 
# You can run a Shiny app by giving the 
#   name of its directory to the function runApp. 
#   For example if your Shiny app is in a 
#   directory called my_app, run it with the 
#   following code:
# 
