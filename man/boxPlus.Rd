% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/boxes.R
\name{boxPlus}
\alias{boxPlus}
\title{Create a box for the main body of a dashboard}
\usage{
boxPlus(..., title = NULL, footer = NULL, status = NULL,
  solidHeader = FALSE, background = NULL, width = 6, height = NULL,
  collapsible = FALSE, collapsed = FALSE, closable = TRUE,
  enable_label = FALSE, label_text = NULL, label_status = "primary",
  enable_dropdown = FALSE, dropdown_icon = "wrench",
  dropdown_menu = NULL, enable_sidebar = FALSE,
  sidebar_content = NULL, sidebar_title = NA_character_,
  sidebar_width = 25, sidebar_background = "#222d32",
  sidebar_start_open = FALSE, sidebar_icon = "cogs",
  footer_padding = TRUE)
}
\arguments{
\item{...}{Contents of the box.}

\item{title}{Optional title.}

\item{footer}{Optional footer text.}

\item{status}{The status of the item This determines the item's background
color. Valid statuses are listed in \link{validStatuses}.}

\item{solidHeader}{Should the header be shown with a solid color background?}

\item{background}{If NULL (the default), the background of the box will be
white. Otherwise, a color string. Valid colors are listed in
\link{validColors}.}

\item{width}{The width of the box, using the Bootstrap grid system. This is
used for row-based layouts. The overall width of a region is 12, so the
default valueBox width of 4 occupies 1/3 of that width. For column-based
layouts, use \code{NULL} for the width; the width is set by the column that
contains the box.}

\item{height}{The height of a box, in pixels or other CSS unit. By default
the height scales automatically with the content.}

\item{collapsible}{If TRUE, display a button in the upper right that allows
the user to collapse the box.}

\item{collapsed}{If TRUE, start collapsed. This must be used with
\code{collapsible=TRUE}.}

\item{closable}{If TRUE, display a button in the upper right that allows the user to close the box.}

\item{enable_label}{Whether to display a label in the boxtool.}

\item{label_text}{label text.}

\item{label_status}{status of the box label: "danger", "success", "info", "primary", "warning".}

\item{enable_dropdown}{Whether to display a dropdown menu in the boxtool. FALSE by default.}

\item{dropdown_icon}{Dropdown icon. "wrench" by default.}

\item{dropdown_menu}{List of items in the the boxtool dropdown menu. Use dropdownItemList().}

\item{enable_sidebar}{Whether to display the box sidebar. FALSE by default.}

\item{sidebar_content}{Box sidebar content, if any.}

\item{sidebar_title}{Box sidebar title.}

\item{sidebar_width}{Box sidebar width in percentage. 25\% by default. Numeric value between 0 and 100.}

\item{sidebar_background}{Box sidebar background color. Dark by default.}

\item{sidebar_start_open}{Whether the box sidebar is open at start. FALSE by default.}

\item{sidebar_icon}{Box sidebar icon.}

\item{footer_padding}{TRUE by default: whether the footer has margin or not.}
}
\description{
Boxes can be used to hold content in the main body of a dashboard.
}
\examples{
## Only run this example in interactive R sessions
if (interactive()) {
 library(shiny)
 library(shinydashboard)

 shinyApp(
   ui = dashboardPagePlus(
     dashboardHeaderPlus(),
     dashboardSidebar(),
     dashboardBody(
      fluidRow(
       boxPlus(
        title = "Closable Box with dropdown", 
         closable = TRUE, 
         status = "warning", 
         solidHeader = FALSE, 
         collapsible = TRUE,
         enable_dropdown = TRUE,
         dropdown_icon = "wrench",
         dropdown_menu = dropdownItemList(
          dropdownItem(url = "https://www.google.com", name = "Link to google"),
          dropdownItem(url = "#", name = "item 2"),
          dropdownDivider(),
          dropdownItem(url = "#", name = "item 3")
         ),
         p("Box Content")
       ),
       boxPlus(
        title = "Closable box, with label", 
         closable = TRUE, 
         enable_label = TRUE,
         label_text = 1,
         label_status = "danger",
         status = "warning", 
         solidHeader = FALSE, 
         collapsible = TRUE,
         p("Box Content")
       )
     )
    )
   ),
   server = function(input, output) {}
 )
 
 # boxPlus with sidebar
 shinyApp(
  ui = dashboardPagePlus(
    dashboardHeaderPlus(),
    dashboardSidebar(),
    dashboardBody(
      fluidRow(
        boxPlus(
          title = "Closable Box with dropdown", 
          closable = TRUE, 
          status = "warning", 
          solidHeader = FALSE, 
          collapsible = TRUE,
          enable_sidebar = TRUE,
          sidebar_width = 25,
          sidebar_title = "Title",
          sidebar_start_open = TRUE,
          sidebar_content = sliderInput(
           "obs", 
           "Number of observations:",
           min = 0, 
           max = 1000, 
           value = 500
          ),
          plotOutput("distPlot")
        )
      )
    )
  ),
  server = function(input, output) {
    output$distPlot <- renderPlot({
      hist(rnorm(input$obs))
    })
  }
 )
}
}
\concept{boxes}
