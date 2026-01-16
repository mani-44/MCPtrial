library(shiny)
library(DT)

generate_flights <- function() {
  data.frame(
    Flight = c("AA1234", "AA5678", "AA9012"),
    Departure = c("08:00", "12:30", "16:45"),
    Arrival = c("11:30", "16:00", "20:15"),
    Price = c("$299", "$329", "$279"),
    stringsAsFactors = FALSE
  )
}

ui <- fluidPage(
  titlePanel(div(style = "background: #c41e3a; color: white; padding: 20px; text-align: center;", 
                 h1("American Airlines Flight Booking"))),
  
  tags$style(HTML("
    .btn-primary { background-color: #c41e3a; border-color: #c41e3a; }
    .btn-primary:hover { background-color: #8b1538; }
  ")),
  
  fluidRow(
    column(4,
      wellPanel(
        h3("Search Flights"),
        selectInput("from", "From:", 
                   choices = c("New York (JFK)" = "JFK", "Los Angeles (LAX)" = "LAX")),
        selectInput("to", "To:", 
                   choices = c("Los Angeles (LAX)" = "LAX", "New York (JFK)" = "JFK")),
        dateInput("date", "Date:", value = Sys.Date() + 1),
        numericInput("passengers", "Passengers:", value = 1, min = 1, max = 9),
        actionButton("search", "Search Flights", class = "btn-primary")
      )
    ),
    
    column(8,
      conditionalPanel(
        condition = "input.search > 0",
        h3("Available Flights"),
        DT::dataTableOutput("flights"),
        br(),
        conditionalPanel(
          condition = "input.flights_rows_selected",
          wellPanel(
            h4("Book Selected Flight"),
            textInput("name", "Passenger Name:"),
            textInput("email", "Email:"),
            actionButton("book", "Confirm Booking", class = "btn-primary")
          )
        )
      ),
      
      conditionalPanel(
        condition = "input.book > 0",
        div(style = "background: #d4edda; padding: 15px; border-radius: 5px; margin-top: 20px;",
            h4("Booking Confirmed!"),
            p("Your flight has been booked successfully.")
        )
      )
    )
  )
)

server <- function(input, output, session) {
  output$flights <- DT::renderDataTable({
    if (input$search > 0) {
      generate_flights()
    }
  }, selection = 'single', options = list(pageLength = 5))
}

shinyApp(ui = ui, server = server)