# TC01.-Estadistica-Inferencial

## Del archivo "cars.csv" se extrajo la siguiente informacion:
### 1. ¿Cuantas filas tiene?
#### El numero de filas se obtuvo mediante una funcion que recorre la primera fila del dataframe, se llevo el conteo de estas para posteriormente retornar como valor el numero de total de filas osea 428.  
~~~
NumFilas <- function(df)
{
  cnt <- 0
  for(i in df[, 1])
    cnt <- cnt + 1 
  return(cnt)
}
~~~
### 2. ¿Cuantas columnas tiene?
#### El recorrido para obtener el numero de columnas del dataframe se hizo de la siguiente forma:
~~~
NumColumnas <- function(df)
{
  cnt <- 0
  for(i in df)
    cnt <- cnt + 1
  return(cnt)
}
~~~
#### De la misma manera que en el recorrido de las filas, aqui solo se recorren las columnas y se hace un conteo. En total, son 19 columnas.
### 3. ¿Cuales son los diferentes valores de la columna de nuemero de cilindros? (cylenders)
#### Para obtener los distintos valores de cilindrajes se hizo uso de la funcion unique() de R:
~~~
ValorCilindros <- function(df)
  return(unique(df$cylenders))
~~~
Al ejecutar la instruccion se muestran los distintos valores:
~~~
[1]  4  6  3  8  5 12 10 -1
~~~
### 4. ¿Cual es el valor promedio de los caballos de fuerza? (horsepower)
#### Esta funcion retorna como resultado el promedio de la columna correspondiente a los caballos de fuerza.
~~~
PromCF <- function(df)
  return(mean(df$horsepower))
~~~
#### Con ayuda de la funcion mean() que sirve para obtener el promedio se obtuvo el siguiente resultado:
~~~
[1] 215.8855
~~~

### 5. ¿Cual es el valor maximo de los caballos de fuerza?
Para obtener el valor maximo de la columna relacionada con los caballos de fuerza, se hizo uso de la funcion max( ) con la cual se puede extraer el mayor de los valores.
~~~
ValorMaxCF <- function(df)
  return(max(df$horsepower))
~~~
~~~
[1] 500
~~~
### 6. ¿Cual es el auto mas costoso? (dealer_Cost)
#### La siguiente funcion retorna como resultado el costo mas alto que se obtuvo de la columna Dealer_Cost:
~~~
CostoMax <- function(df)
  return(max(df$Dealer_Cost))
~~~
#### El costo maximo que se obtiene es:
~~~
[1] 173560
~~~
### 7. Se renombra la columna name por car_name
~~~
# 7. Cambia el nombre de la columna name por "car_name".
  names(AutosBD)[1]<- "car_name"
~~~
### 8. Se crea un nuevo dataframe formado por las columnas del nombre del automovil y su precio. Esta nueva tabla se llama car_pricing.
~~~
8. Crea un nuevo dataframe formado por las columnas del nombre
# automovil y su precio. Llama car_pricing a esta nueva tabla
  car_pricing <- data.frame(Nombre = AutosBD$car_name, Precio = AutosBD$Price)
  write.csv(car_pricing, "car_pricing.csv", row.names = FALSE)
~~~
### 9. Se añade una columna llamada category que indica BAJO si el precio es menor a 20,000, MODERADO si el precio es mayor oigual a 20,000 pero menor que 35,000 y ALTO si el precio es mayor que 35,000.
~~~
# 9. Añadir una columna llamada category que indique BAJO si el precion
#    es menor a 20000, que indique MODERADO si el precio es mayor o igual a 20000
#    pero menor que 35000, y que indique ALTO si el precio es mayor que 35000
  car_pricing$Category <- ifelse(car_pricing$Precio < 20000, "BAJO", 
                                ifelse(car_pricing$Precio >= 20 & car_pricing$Precio < 35000, "MODERADO", "ALTO"))
~~~
#### Los cambios se ven reflejados en en el archivo "car_pricing.csv".
### 10. ¿Cuantos automoviles son de categoria baja, moderada y alta?
~~~
table(car_pricing$Category)
~~~
#### Categorias: 
~~~
    ALTO      BAJO   MODERADO 
     137       98      193 
~~~
