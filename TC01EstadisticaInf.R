setwd("C:/Users/soulg/OneDrive/Desktop/Probabilidad_Y_Estadistica/MyData") 
AutosBD <- read.csv("cars.csv")
View(AutosBD)
#' @author J. Octavio Nicolas Diaz
## 1. ¿Cuantas filas tiene?
## R: 428
#' @param df es un data-frame
#' @return El numero de filas de \code{df}
NumFilas <- function(df)
{
  cnt <- 0
  for(i in df[, 1])
    cnt <- cnt + 1 
  return(cnt)
}
## 2. ¿Cuantas columnas tiene?
## R: 19
#' @param df es un data-frame
#' @return El numero de columnas que contiene \code{df}
NumColumnas <- function(df)
{
  cnt <- 0
  for(i in df)
    cnt <- cnt + 1
  return(cnt)
}
## 3. ¿Cuales son los diferentes valores de la columna de cilindros?
#' @param df es un data-frame
#' @return Los diferentes valores de cilindraje \code{unique(df$cylenders)}
ValorCilindros <- function(df)
  return(unique(df$cylenders))
## 4. ¿Cual es el valor promedio de los caballos de fuerza
##    (horsepower)?. 
#' @param df es un data-frame
#' @return Regresa el valor promedio de los caballos de fuerza \code{mean(df$horsepower)}
PromCF <- function(df)
  return(mean(df$horsepower))
# 5. ¿Cual es el valor maximo de los caballos de fuerza?
# R: 500.0
#' @param df es un data-frame
#' @return El valor maximo de \code{max(df$horsepower)}
ValorMaxCF <- function(df)
  return(max(df$horsepower))
# 6. ¿Cual es el auto mas costoso (dealer cost)?
#' @param df es un data-frame
#' @return El valor maximo de \code{max(df$Dealer_Cost)}
CostoMax <- function(df)
  return(max(df$Dealer_Cost))
#' @description Funcion principal 
main <- function()
{
  NumFilas(AutosBD)
  NumColumnas(AutosBD)
  ValorCilindros(AutosBD)
  PromCF(AutosBD)
  ValorMaxCF(AutosBD)
  CostoMax(AutosBD)
# 7. Cambia el nombre de la columna name por "car_name".
  names(AutosBD)[1]<- "car_name"
# 8. Crea un nuevo dataframe formado por las columnas del nombre
# automovil y su precio. Llama car_pricing a esta nueva tabla
  car_pricing <- data.frame(Nombre = AutosBD$car_name, Precio = AutosBD$Price)
  write.csv(car_pricing, "car_pricing.csv", row.names = FALSE)
# 9. Añadir una columna llamada category que indique BAJO si el precion
#    es menor a 20000, que indique MODERADO si el precio es mayor o igual a 20000
#    pero menor que 35000, y que indique ALTO si el precio es mayor que 35000
  car_pricing$Category <- ifelse(car_pricing$Precio < 20000, "BAJO", 
                                ifelse(car_pricing$Precio >= 20 & car_pricing$Precio < 35000, "MODERADO", "ALTO"))
# 10. ¿Cuantos automoviles son de categoria baja, moderada, y alta?
# R: ALTO:137 BAJO:98 MODERADO:193
  table(car_pricing$Category)
  View(car_pricing)
}

if(!interactive())
  main()