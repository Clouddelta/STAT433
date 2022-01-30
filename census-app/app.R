library(shiny)
ui <- fluidPage(
  titlePanel("censusVis"),
  
  sidebarLayout(
    sidebarPanel(
      helpText("Create demographic maps with 
               information from the 2010 US Census."),
      
      selectInput("var", 
                  label = "C-hoose a variable to display",
                  choices = c("Percent White", 
                              "Percent Black",
                              "Percent Hispanic", 
                              "Percent Asian"),
                  selected = "Percent White"),
      
      sliderInput("range", 
                  label = "Range of interest:",
                  min = 0, max = 100, value = c(0, 100))
    ),
    
    mainPanel(
      textOutput("selected_var")   # here is the output!
    )
  )
)

# Notice that textOutput takes an argument, the character string 
#   "selected_var". Each of the *Output functions require a single 
#   argument: a character string that Shiny will use as the name of 
#   your reactive element. Your users will not see this name, but you 
#   will use it later


# In the server function below, output$selected_var matches 
#   textOutput("selected_var") in your ui.

server <- function(input, output) {
  
  output$selected_var <- renderText({  # notice the render function!
    "You have selected this"
  })
  
}

# render functions... super annoying.

# render function	  creates
# renderDataTable	  DataTable
# renderImage	      images (saved as a link to a source file)
# renderPlot	      plots
# renderPrint	      any printed output
# renderTable	      data frame, matrix, other table like structures
# renderText	      character strings
# renderUI	        a Shiny tag object or HTML

# Each render* function takes a single argument: 
#   an R expression surrounded by braces, {}. 

# So far this example is boring.  text output doesn't change!
shinyApp(ui = ui, server = server)

# You can make the text reactive by asking Shiny to call a 
# widget value when it builds the text. Let鈥檚 look at how to do this.


# Take a look at the first line of code in the server function. 
#   Do you notice that the server function mentions two arguments, 
#   input and output? You already saw that output is a list-like 
#   object that stores instructions for building the R objects in your app.
# 
# input is a second list-like object. It stores the current values 
#   of all of the widgets in your app. These values will be saved 
#   under the names that you gave the widgets in your ui.

# So for example, our app has two widgets, one named "var" and 
#   one named "range" (you gave the widgets these names in Lesson 3). 
#   The values of "var" and "range" will be saved in input as input$var 
#   and input$range. Since the slider widget has two values 
#   (a min and a max), input$range will contain a vector of length two.
#   

server <- function(input, output) {
  
  output$selected_var <- renderText({ 
    paste("You have selected", input$var,'\n',input$range[1],input$range[2])
  })
  
}
shinyApp(ui = ui, server = server)

# After you put these functions into census-app/app.R, then run:

# Exercise!
# Add a second line of reactive text to the main panel 
#   of your Shiny app. This line should display 鈥淵ou 
#   have chosen a range that goes from something to 
#   something鈥�, and each something should show the current 
#   minimum (min) or maximum (max) value of the slider widget.



# In this lesson, you created your first reactive Shiny app. Along the way, you learned to
# 
# 1) use an *Output function in the ui to place reactive objects in your Shiny app,
# 2) use a render* function in the server to tell Shiny how to build your objects,
# 3) surround R expressions by curly braces, {}, in each render* function,
# 4) save your render* expressions in the output list, with one entry for each 
#       reactive object in your app, and
# 5) create reactivity by including an input value in a render* expression.
# If you follow these rules, Shiny will automatically make your objects reactive.


