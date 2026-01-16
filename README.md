# American Airlines Flight Booking Interface

A Shiny web application that simulates the American Airlines flight booking experience.

## Features

- Flight Search: Search for flights between major US cities
- American Airlines Branding: Custom CSS styling with AA colors and design
- Interactive Booking: Select flights and enter passenger information
- Responsive Design: Clean, professional interface
- Real-time Updates: Dynamic UI based on user selections

## How to Run

1. Make sure you have R installed with the following packages:
   ```r
   install.packages(c("shiny", "DT"))
   ```

2. Run the application:
   ```r
   shiny::runApp("flight_app.R")
   ```

## Application Structure

- flight_app.R: Complete Shiny application with UI and server logic
- README.md: This documentation file

## Styling

The application uses American Airlines brand colors:
- Primary Red: #c41e3a
- Dark Red: #8b1538
- Clean, professional typography
- Responsive layout