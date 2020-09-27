# TALLER 3

# La BETTER PRODUCTS COMPANY ha decidido iniciar la fabricación de cuatro nuevos productos en tres
# plantas que por el momento tienen exceso de capacidad de producción. Los productos requieren de
# un esfuerzo productivo comparable por unidad, por lo que la capacidad de producción disponible en
# las plantas se mide por el número de unidades de cualquier producto que se pueden fabricar por día,
# como se muestra en la última columna de la tabla.

# Tabla
#                   Costo unitario por producto ($) |Capacidad | 
#                        |  1   |  2   |  3  |  4   |Disponible|
#                   ____________________________________________ 
#                   | 1  |  41  |  27  |  28 |  24  |    75    |
#         Planta    | 2  |  40  |  29  |  0  |  23  |    75    |
#                   | 3  |  37  |  30  |  27 |  21  |    45    |
#                   ____________________________________________
#     Tasa de Produccion |  20  |  30  |  30 |  40  |


# El último renglón muestra la producción diaria que se requiere para satisfacer las ventas proyectadas.
# Cada planta puede producir cualquiera de estos productos, excepto la planta que no puede fabricar
# el producto . Sin embargo, el costo variable por unidad de cada producto difiere entre una planta y
# otra, como se muestra en elcuerpo principal de la tabla. La administración necesita tomar la decisión
# de cómo dividir la producción entre las plantas, y para esto, decide permitir la separación de
# productos, de tal manera que el mismo producto se pueda fabricar en más de una planta.
# a. Formule correctamente este problema de Transporte, definiendo las variables de decisión, la función objetivo, los nodos, los suministros, las demandas, los arcos, las capacidades y los costos.
# b. Encuentre el plan óptimo de producción de cada planta, que minimiza los costos.
# c. Interprete los resultados.

# SOLUCIÓN

# La capacidad total del sistema es 75 + 75 + 45 = 195 que excede la producción total, la cual es 20 + 30 + 30 + 40 = 120 
# esto nos obliga a generar un destino ficticio (producto 5) con una demanda de 75 para balancear el problema.

# Nueva Tabla 
#                      Costo unitario por producto ($)    |Capacidad | 
#                        |  1   |  2   |  3  |  4   |  5  |Disponible|
#                   __________________________________________________ 
#                   | 1  |  41  |  27  |  28 |  24  |  0  |    75    |
#         Planta    | 2  |  40  |  29  |  M  |  23  |  0  |    75    |
#                   | 3  |  37  |  30  |  27 |  21  |  0  |    45    |
#                   __________________________________________________
#     Tasa de Produccion |  20  |  30  |  30 |  40  |  75 |


# a. Formule correctamente este problema de Transporte, definiendo las variables de decisión, la función objetivo, los nodos, los suministros, las demandas, los arcos, las capacidades y los costos.

# Definicion de las variables de decisión.

# x11 : Produccion de la planta 1 del producto 1 por dia.
# x12 : Producción de la planta 1 del producto 2 por dia.
# x13 : Producción de la planta 1 del producto 3 por dia.
# x14 : Producción de la planta 1 del producto 4 por dia.
# x15 : Producción de la planta 1 del producto 5 (ficticio) por dia.
# x21 : Producción de la planta 2 del producto 1 por dia.
# x22 : Producción de la planta 2 del producto 2 por dia.
# x23 : Producción de la planta 2 del producto 3 por dia.
# x24 : Producción de la planta 2 del producto 4 por dia.
# x25 : Producción de la planta 2 del producto 5 (ficticio) por dia.
# x31 : Producción de la planta 3 del producto 1 por dia.
# x32 : Producción de la planta 3 del producto 2 por dia.
# x33 : Producción de la planta 3 del producto 3 por dia.
# x34 : Producción de la planta 3 del producto 4 por dia.
# x35 : Producción de la planta 3 del producto 5 (ficticio) por dia.

# i: 1, 2, 3
# j: 1, 2, 3, 4, 5

# Xij: Produccion la planta i del producto j por dia.

# Modelo matemático completo.

# Función objetivo

#  MIN Z =   41X11 + 27X12 + 28X13 + 24X14 + 0X15 
#          + 40X21 + 29X22 +  MX23 + 23X24 + 0X25 
#          + 37X31 + 30X32 + 27X33 + 21X34 + 0X35

# X11 + X12 + X13 + X14 + X15 <= 75 (Capacidad disponible de planta 1)
# X21 + X22 + X23 + X24 + X25 <= 75 (Capacidad disponible de planta 2)
# X31 + X32 + X33 + X34 + X35 <= 45 (Capacidad disponible de planta 3)
#             X11 + X21 + X31 => 20 (Tasa de Produccion del producto 1)
#             X12 + X22 + X32 => 30 (Tasa de Produccion del producto 2)
#             X13 + X23 + X33 => 30 (Tasa de Produccion del producto 3)
#             X14 + X24 + X34 => 40 (Tasa de Produccion del producto 4)
#             X15 + X25 + X35 => 75 (Tasa de Produccion del producto 5 ficticio)
#                        X ij => 0  (No negatividad)

# b. Encuentre el plan óptimo de producción de cada planta, que minimiza los costos.

# Transcribimos del modelo matematico a R.


# Como la planta 2 no puede entregar el producto 3, dentro de la matriz se agrega un valor alto con respecto a los demas, de esta forma
# "R" no va a considerar a la planta 2 en la produccion del producto 3, por esto se a dejado MX23 = 1000.

library(lpSolve)

# Matriz de costos

costo <- matrix(c( 41, 27,    28, 24, 0,
                   40, 29,  1000, 23, 0,
                   37, 30,    27, 21, 0), ncol = 5, byrow = TRUE)

costo

# Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs <- c("==", "==", "==")

row_constr_signs

# Coeficientes de las restricciones para las filas (oferta)

row_rhs <- c(75, 75, 45)

row_rhs

# Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs <- c("==", "==", "==", "==", "==")

col_constr_signs

# Coeficientes de las restricciones para las columnas (demanda)

col_rhs <- c(20, 30, 30, 40, 75)

col_rhs

# Resolvemos

solucion <- lp.transport(cost.mat = costo,
                         direction = "min",
                         row.signs = row_constr_signs,
                         row.rhs = row_rhs,
                         col.signs = col_constr_signs,
                         col.rhs = col_rhs, 
                         presolve = 0)

solucion$solution

#       [,1] [,2] [,3] [,4] [,5]
# [1,]    0   30   30    0   15
# [2,]    0    0    0   15   60
# [3,]   20    0    0   25    0

# c. Interprete los resultados.

# Valores óptimos para las variables de decisión. (Plan optimo de distribución)

# Tasa de produccion diaria de la planta 1 para el producto 2 por dia.
# X12 = 30

# Tasa de produccion diaria de la planta 1 para el producto 3 por dia.
# X13 = 30

# Tasa de produccion diaria de la planta 1 para el producto ficticio 5 por dia.
# X15 = 15

# Tasa de produccion diaria de la planta 2 para el producto 4 por dia.
# X24 = 15

# Tasa de produccion diaria de la planta 2 para el producto ficticio 5 por dia.
# X25 = 60

# Tasa de produccion diaria de la planta 3 para el producto 1 por dia.
# X31 = 20

# Tasa de produccion diaria de la planta 3 para el producto 4 por dia.
# X34 = 25

# Analisis plan optimo

# El producto 1 sera suministrado 100% por la planta 3 por dia.

# El producto 2 sera suministrado 100% por la planta 1 por dia.

# El producto 3 sera suministrado 100% por la planta 1 por dia.

# El producto 4 sera suministrado 37.5% por la planta 2 y 62.5% por la planta 3 por dia.

# El producto 5 ficticio sera suministrado 80% por la planta 1 y 20% por la planta 2, de forma ficticia por dia.

# Costo mínimo asociado al plan de transporte.

solucion

# Z* = 3260

# El costo minimo asociado para este plan es de $3.260 unidades monetarias.  
