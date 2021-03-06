
#' Shiny app ui
#'
#' @return
#' @export
#'
app_ui = function() {
  shiny::tagList(
  shiny::tags$head(shiny::includeHTML(("google-analytics.html"))),
  shiny::navbarPage("Covid-19 BR Viz", theme = shinythemes::shinytheme("cosmo"),
    shiny::tabPanel("Países",
                    shiny::sidebarLayout(
                      shiny::sidebarPanel(
                        shiny::selectInput("yaxis_world", "Eixo y", choices = list(Casos="cases", Mortes="deaths", Mortalidade="death_rate", `Variação de Casos`="new_cases", `Variação de Mortes`="new_deaths", `Variação de Casos (%)`="percent_case_increase", `Variação de Mortes (%)`="percent_death_increase")),
                        shiny::selectInput("xaxis_world", "Eixo X", choices = list(Data="date", `Dias depois de 10 Casos`="days_gt_10",
                                                                                    `Dias depois de 100 Casos`="days_gt_100", `Casos Acumulados`="cases")),
                        shiny::selectInput("filter_country_world", "Países", multiple = TRUE, choices = sort(unique(coronavirusbrazil::coronavirus_world$country)), selected = c("Brazil")),
                        shiny::checkboxInput("log_scale_world", "Escala Log", value = TRUE),
                        shiny::checkboxInput("facet_country_world", "Gráficos Individuais", value = TRUE),
                        shiny::checkboxInput("linear_smooth_world", "Tendência")
                      ),
                      shiny::mainPanel(
                        plotly::plotlyOutput("plot_countries")
                      )
                    )
    ),
      shiny::tabPanel("Estados",
        shiny::sidebarLayout(
          shiny::sidebarPanel(
            shiny::selectInput("yaxis_states", "Eixo y", choices = list(Casos="cases", Mortes="deaths", Mortalidade="death_rate", `Variação de Casos`="new_cases", `Variação de Mortes`="new_deaths", `Variação de Casos (%)`="percent_case_increase", `Variação de Mortes (%)`="percent_death_increase")),
            shiny::selectInput("xaxis_states", "Eixo X", choices = list(Data="date", `Dias depois de 10 Casos`="days_gt_10",
                                                                        `Dias depois de 100 Casos`="days_gt_100", `Casos Acumulados`="cases")),
            shiny::selectInput("filter_uf_states", "Estados", multiple = TRUE, choices = sort(unique(coronavirusbrazil::coronavirus_br_states$state)), selected = c("SP", "RJ")),
            shiny::checkboxInput("log_scale_states", "Escala Log", value = TRUE),
            shiny::checkboxInput("facet_uf_states", "Gráficos Individuais", value = TRUE),
            shiny::checkboxInput("linear_smooth_states", "Tendência")
               ),
          shiny::mainPanel(
            plotly::plotlyOutput("plot_states")
          )
        )
    ),
    shiny::tabPanel("Cidades",
                    shiny::sidebarLayout(
                      shiny::sidebarPanel(
                        shiny::selectInput("yaxis_cities", "Eixo y", choices = list(Casos="cases", Mortes="deaths", Mortalidade="death_rate", `Variação de Casos`="new_cases", `Variação de Mortes`="new_deaths", `Variação de Casos (%)`="percent_case_increase", `Variação de Mortes (%)`="percent_death_increase")),
                        shiny::selectInput("xaxis_cities", "Eixo X", choices = list(Data="date", `Dias depois de 10 Casos`="days_gt_10",
                                                                                    `Dias depois de 100 Casos`="days_gt_100", `Casos Acumulados`="cases")),
                        shiny::selectInput("filter_cities", "Cidades", multiple = TRUE, choices = sort(unique(coronavirusbrazil::coronavirus_br_cities$city)), selected = c("Rio de Janeiro", "São Paulo")),
                        shiny::checkboxInput("log_scale_cities", "Escala Log", value = TRUE),
                        shiny::checkboxInput("facet_cities", "Gráficos Individuais", value = TRUE),
                        shiny::checkboxInput("linear_smooth_cities", "Tendência")
                      ),
                      shiny::mainPanel(
                        plotly::plotlyOutput("plot_cities")
                      )
                    )
    ),
    shiny::tabPanel("Mapas",
      shiny::tabsetPanel(
        shiny::tabPanel("Países",
          shiny::tabsetPanel(
            shiny::tabPanel("Casos", mapview::mapviewOutput("map_cases_countries")),
            shiny::tabPanel("Mortes",  mapview::mapviewOutput("map_deaths_countries"))
          )
        ),
        shiny::tabPanel("Estados",
                        shiny::tabsetPanel(
                          shiny::tabPanel("Casos", mapview::mapviewOutput("map_cases_states")),
                          shiny::tabPanel("Mortes",  mapview::mapviewOutput("map_deaths_states"))
                        )
        ),
        shiny::tabPanel("Cidades",
          shiny::tabsetPanel(
            shiny::tabPanel("Casos", mapview::mapviewOutput("map_cases_cities")),
            shiny::tabPanel("Mortes",  mapview::mapviewOutput("map_deaths_cities"))
          )
        ),
        shiny::tabPanel("RJ",
          shiny::tabsetPanel(
            shiny::tabPanel("Casos", mapview::mapviewOutput("map_cases_rj")),
            shiny::tabPanel("Mortes", mapview::mapviewOutput("map_deaths_rj"))
          )
        )
      )
    ),
    shiny::tabPanel("Sobre",
      shiny::includeMarkdown("Sobre.md")
    )
  )
  )
}
