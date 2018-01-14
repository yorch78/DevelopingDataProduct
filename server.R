library(leaflet)
library(readxl)

shinyServer(function(input, output, session) {
  # Loads data from web that contains data of Spanish population by city.

  url <- "https://www.businessintelligence.info/assets/listado-longitud-latitud-municipios-espana.xls"
  destfile <- "listado_longitud_latitud_municipios_espana.xls"
  download.file(url, destfile)
  municipiosSpain <- read_excel(destfile, skip = 2)
    
  output$mapProvince <- renderLeaflet({
      
      # Subset of cities within the selected province.
      municipiosFiltrado <- subset(municipiosSpain, municipiosSpain$Provincia == input$province)
      
      # Label presented when the spot is clicked.
      content <- paste(
        "<b>",municipiosFiltrado$Población,"</b><br>",
        municipiosFiltrado$Provincia, "<br>",
        "Population: <b>", municipiosFiltrado$Habitantes, "</b><br>",
        "Men: ", municipiosFiltrado$Hombres, " - ",
        "Women: ", municipiosFiltrado$Mujeres
      )
      
      df %>%
        leaflet() %>%
        addTiles() %>%
        addMarkers(lat=municipiosFiltrado$Latitud,
                   lng=municipiosFiltrado$Longitud,
                   popup=content,
                   clusterOptions=markerClusterOptions())
    })
  })
