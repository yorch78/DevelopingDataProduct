library(leaflet)

shinyUI(pageWithSidebar(
  headerPanel('Spanish population by Province'),
  sidebarPanel(
    selectInput('province', 'Select a Province:', c("A Coruña", "Álava", "Albacete", "Alicante/Alacant",
                                                "Almería", "Asturias", "Ávila", "Badajoz", "Barcelona",
                                                "Burgos", "Cáceres", "Cádiz", "Cantabria", "Castellón/Castelló",
                                                "Ceuta", "Ciudad Real", "Córdoba", "Cuenca", "Girona", "Granada",
                                                "Guadalajara", "Guipúzcoa", "Huelva", "Huesca", "Illes Balears",
                                                "Jaén", "La Rioja", "Las Palmas", "León", "Lleida", "Lugo", 
                                                "Madrid", "Málaga", "Melilla", "Murcia", "Navarra", "Ourense",
                                                "Palencia", "Pontevedra", "Salamanca", "Santa Cruz de Tenerife",
                                                "Segovia", "Sevilla", "Soria", "Tarragona", "Teruel", "Toledo",
                                                "Valencia/València", "Valladolid", "Vizcaya", "Zamora", "Zaragoza")),
    h1("App summary:"),
    p("This application allows you to know the population of every province in Spain.
      By selecting the Province, the map will display automatically a spot for every city of the Province
      and will present also their related info, just by clicking on. It will show extra info about men and women.")),
  mainPanel(
    leafletOutput('mapProvince')
  )
))