# 📊 Análisis de Vehículos Registrados en Municipios Metropolitanos de Jalisco (1980–2023)

## 🚀 Descripción del Proyecto

Este proyecto realiza un análisis exploratorio y visualización interactiva de los vehículos registrados en los principales municipios del Área Metropolitana de Guadalajara (AMG), utilizando datos históricos desde 1980 hasta 2023.

El objetivo es calcular el porcentaje de usuarios por categoría, visualizar los resultados y detectar patrones que ayuden a entender la movilidad actual en la ciudad.

---

## 🛠️ Herramientas Utilizadas

- **R** como lenguaje de programación
- `tidyverse` para manipulación y limpieza de datos
- `plotly` para gráficos interactivos
- `scales` para el formato numérico
- `ggplot2` para visualización de datos

---
## 📌 Funcionalidades principales

- Transformación de un conjunto de datos de formato ancho a largo.
- Filtrado de los municipios pertenecientes al AMG:
  - *Guadalajara*
  - *Zapopan*
  - *San Pedro Tlaquepaque*
  - *Tonalá*
  - *Tlajomulco de Zúñiga*
- Gráfica interactiva de la evolución de vehículos registrados por municipio.
- Visualización adicional del municipio con:
  - El **mayor** número de vehículos registrados por año.
  - El **menor** número de vehículos registrados por año.

---

## 📥 Cómo Reproducir el Proyecto

1. Clona este repositorio:
   ```bash
   git clone https://github.com/Simei97/AnalisisUsoTransporteGDL.git

2. Instala las dependencias necesarias en R:
   ```bash
   install.packages(c("tidyverse", "readr", "plotly", "scales"))
   
3. Corre los scripts desde la carpeta **scripts/:**
   - Para analizar los datos desde un **.csv**
  
4. Explora los gráficos en la carpeta **images/**

## 📊 Resultados
Ejemplo de visualización generada:
![Linea del Tiempo de vehiculos registrados](images/LineaTiempo.png)

## 📚 Fuentes de datos
- [IMEPLAN - Encuesta Origen Destino](https://imeplan.mx/)
- [Datos Abiertos del Estado de Jalisco](https://datos.jalisco.gob.mx/dataset/vehiculos-de-motor-registrados-en-circulacion-por-municipio-en-jalisco-1998-2020)

## 🧑‍💻 Autor
- Simei97
- [Mi perfil de GitHub](https://github.com/Simei97)
