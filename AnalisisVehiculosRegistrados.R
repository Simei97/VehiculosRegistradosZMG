#Cargamos la paquetería necesaria
install.packages("plotly")

library(tidyverse)
library(scales)
library(plotly)


#Cargamos nuestro archivo que vamos a analizar
datos <- read_csv("Vehiculos Registrados Jalisco.csv")

#Vemos las primeras filas del archivo
head(datos)

# Variable que almacenara los años (1980-2023)
Año <- c(1980:2023)

#Transformar a formato largo
datos_largo <- datos %>% 
        pivot_longer(
                cols = matches("^\\d{4}$"),
                names_to = "Año",
                values_to = "Total"
        ) %>% 
        mutate(
                Año = as.integer(Año),
                Total = na_if(Total, 0),
                Total = as.numeric(Total)
        )

#Filtrar municipios metropolitanos
municipios_meta <- c("Guadalajara", "Zapopan", "San Pedro Tlaquepaque", "Tonala", "Tlajomulco de Zuniga")

datos_filtrados <- datos_largo %>% 
        filter(Municipio %in% municipios_meta)

#Graficamos la linea del tiempo
grafica <- ggplot(datos_filtrados, aes(x = Año, y = Total, color = Municipio)) +
        geom_line(linewidth = 1.2, na.rm = TRUE) +
        geom_point(size = 1.5, na.rm = TRUE, aes(text = paste0(
                "Municipio: ", Municipio, "<br>",
                "Año: ", Año, "<br>",
                "Total: ", scales::comma(Total)
        ))) +
        labs(title = "Evolución de vehículos registrados (1980-2023)",
             subtitle = "Municipios del AMG",
             caption = "Fuente: Datos de vehículos registrados en Jalisco",
             x = "Año",
             y = "Total registrado") +
        scale_y_continuous(labels = label_comma()) +
        theme_minimal()


# Convertir a interactivo
ggplotly(grafica, tooltip = "text")

#Nombramos las variables que utilizaremos para agrupar el numero maximo y minimo de vehiculos registrados
registro_max <- datos_filtrados %>%
        group_by(Año) %>%
        filter(Total == max(Total, na.rm = TRUE)) %>%
        ungroup()

registro_min <- datos_filtrados %>%
        group_by(Año) %>%
        filter(Total == min(Total, na.rm = TRUE)) %>%
        ungroup()

# Agregar los puntos para el municipio con mayor registro por año
grafica_max <- grafica +
        geom_point(data = registro_max, aes(x = Año, y = Total, color = Municipio), 
                   size = 3, shape = 17, color = "red") +
        labs(title = "Municipios con mayor registro de vehículos (1980-2023)")

# Agregar los puntos para el municipio con menor registro por año
grafica_min <- grafica +
        geom_point(data = registro_min, aes(x = Año, y = Total, color = Municipio), 
                   size = 3, shape = 17, color = "blue") +
        labs(title = "Municipios con menor registro de vehículos (1980-2023)")

# Convertir las gráficas a interactivas
grafica_interactiva <- ggplotly(grafica, tooltip = "text")
grafica_max_interactiva <- ggplotly(grafica_max, tooltip = "text")
grafica_min_interactiva <- ggplotly(grafica_min, tooltip = "text")

# Mostrar las gráficas
grafica_interactiva
grafica_max_interactiva
grafica_min_interactiva