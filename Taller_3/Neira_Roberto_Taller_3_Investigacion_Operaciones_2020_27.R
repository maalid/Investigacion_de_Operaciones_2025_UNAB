#         TALLER 3
#         INVESTIGACION DE OPERACIONES


#         ROBERTO NEIRA C
#         

# EJERCICIO 1
#
# La BETTER PRODUCTS COMPANY ha decidido iniciar la fabricación de cuatro nuevos productos en tres plantas 
# que por el momento tienen exceso de capacidad de producción. Los productos requieren de un esfuerzo productivo 
# comparable por unidad, por lo que la capacidad de producción disponible en las plantas se mide por el número 
# de unidades de cualquier producto que se pueden fabricar por día, como se muestra en la última columna de la tabla.
#
#  ___________________________________________________________________________
# |                |    Costo Unitario del Producto ($)    |                  |
# |                |_______________________________________|    Capacidad     |
# |                |    1    |    2    |    3    |    4    |    Disponible    |
# |________________|_________|_________|_________|_________|__________________|
# | Planta       1 |    41   |    27   |    28   |    24   |         75       |
# | Planta       2 |    40   |    29   |    -    |    23   |         75       |
# | Planta       3 |    37   |    30   |    27   |    21   |         45       |
# |________________|_________|_________|_________|_________|__________________|
# |                |         |         |         |         |        195       |
# |   Tasa de      |         |         |         |         |__________________|
# |  Producción    |    20   |    30   |    30   |    40   |        120       |
# |________________|_________|_________|_________|_________|__________________|

# El último renglón muestra la producción diaria que se requiere para satisfacer las ventas proyectadas. 
# Cada planta puede producir cualquiera de estos productos, excepto la planta 2 que no puede fabricar el
# producto 3. Sin embargo, el costo variable por unidad de cada producto difiere entre una planta y otra, 
# como se muestra en el cuerpo principal de la tabla. La administración necesita tomar la decisión de cómo 
# dividir la producción entre las plantas, y para esto, decide permitir la separación de productos, 
# de tal manera que el mismo producto se pueda fabricar en más de una planta.

# Se solicita:


#   a).- Formule correctamente este problema de Transporte, definiendo las variables de decisión, la función objetivo, 
#        los nodos, los suministros, las demandas, los arcos, las capacidades y los costos.
#   b).- Encuentre el plan óptimo de producción de cada planta, que minimiza los costos.
#   c).- Interprete los resultados.


# DESARROLLO:

# la administración decidió permitir la separación de los productos para que un producto sea 
# fabricado en más de una planta), se muestra una tabla de parámetros para un problema de transporte.
# Así los recursos se interpretan como las capacidades de producción y la demanda como las tasas de 
# producción que se requiere. Además como la planta 2 no puede fabricar el producto 3, se le asignará
# la gran M y por último como la capacidad total (recursos), excede la producción total(demanda), se
# necesitará un destino ficticio de 75 para balancear lo mencionado antes.


#  _____________________________________________________________________________________
# |                |           Costo Unitario del Producto ($)       |                  |
# |                |_________________________________________________|    Capacidad     |
# |                |    1    |    2    |    3    |    4    |    5    |    Disponible    |
# |________________|_________|_________|_________|_________|_________|__________________|
# | Planta       1 |    41   |    27   |    28   |    24   |    0    |         75       |
# | Planta       2 |    40   |    29   |    M    |    23   |    0    |         75       |
# | Planta       3 |    37   |    30   |    27   |    21   |    0    |         45       |
# |________________|_________|_________|_________|_________|_________|__________________|
# |                |         |         |         |         |         |                  |
# |   Tasa de      |         |         |         |         |         |                  |
# |  Producción    |    20   |    30   |    30   |    40   |    75   |        195       |
# |________________|_________|_________|_________|_________|_________|__________________|

# m=Número de orígenes.
# n=Número de destinos.
# bi=Recursos del origen i (donde i=1,2,3,???,m).
# aj=Demanda del destino j (donde j=1,2,3,???,n).
# Cij=Costo unitario de transporte de una unidad del origen i al destino j.
# Xij=Variable de decisión que denota la cantidad enviada del origen i al destino j.

# Donde el objetivo del modelo es determinarlas incognitas xij que minicen el costo total de trasporte, 
# y que al mismo tiempo satisfagan las restricciones de oferta y demanada.

# Definición de las variables de decisión. Como se poseen 3 ofertas y 5 demandas incluyendo la ficticia,
# tendremos 15 variables de decisión. Sean las siguientes las variables de decisión del problema: 


#	x11:número de unidades producidos por la planta 1, que corresponden al producto del tipo 1 por día.
#	x12:número de unidades producidos por la planta 1, que corresponden al producto del tipo 2 por día.
#	x13:número de unidades producidos por la planta 1, que corresponden al producto del tipo 3 por día.
#	x14:número de unidades producidos por la planta 1, que corresponden al producto del tipo 4 por día.
#	x15:número de unidades producidos por la planta 1, que corresponden al producto del tipo 5 por día. (Ficticio).
#	x21:número de unidades producidos por la planta 2, que corresponden al producto del tipo 1 por día.
#	x22:número de unidades producidos por la planta 2, que corresponden al producto del tipo 2 por día.
#	x23:número de unidades producidos por la planta 2, que corresponden al producto del tipo 3 por día.
#	x24:número de unidades producidos por la planta 2, que corresponden al producto del tipo 4 por día.
#	x25:número de unidades producidos por la planta 2, que corresponden al producto del tipo 5 por día. (Ficticio).
#	x31:número de unidades producidos por la planta 3, que corresponden al producto del tipo 1 por día.
#	x32:número de unidades producidos por la planta 3, que corresponden al producto del tipo 2 por día.
#	x33:número de unidades producidos por la planta 3, que corresponden al producto del tipo 3 por día.
#	x34:número de unidades producidos por la planta 3, que corresponden al producto del tipo 4 por día.
#	x35:número de unidades producidos por la planta 3, que corresponden al producto del tipo 5 por día. (Ficticio).

# De manera resumida podemos definir las 15 variables anteriores mediante una sola expresión. 
# En efecto, para i=1,2,3 y j=1,2,3,4,5, sea: 


#	xij:número de unidades producidos por la planta i, que corresponden al producto del tipo j por día.

# Funcion Objetivo.

#	                      	    MIN Z = 41x11 + 27x12 + 28x13 + 24x14 + 0x15
#		                            40x21 + 29x22 +  Mx23 + 23x24 + 0x15
#		                            37x31 + 30x32 + 27x33 + 21x34 + 0x35

# Modelo matemático completo. En base a la definición anterior para las variables de decisión, 
# a la información entregada y considerando que la planta 2 no puede producir los productos del 
# tipo 3 y que debemos utilizar un "M" en el modelo para valorizar estos costos, matemáticamente 
# el modelo de Programación Lineal a resolver es el siguiente: 

#	                      	    MIN Z = 41x11 + 27x12 + 28x13 + 24x14 + 0x15
#		                            40x21 + 29x22 +  Mx23 + 23x24 + 0x15
#		                            37x31 + 30x32 + 27x33 + 21x34 + 0x35

#	                S.A.    
#
#		              x11 +  x12 + x13 + x14 + x15 = 75 (Número máximo de productos producidos por la planta 1)
#		              x21 +  x22 + x23 + x24 + x25 = 75 (Número máximo de productos producidos por la planta 2)
#  		              x31 +  x32 + x33 + x34 + x35 = 45 (Número máximo de productos producidos por la planta 3)

#		              x11 +  x21 + x31 	       = 20 (Ventas proyectadas del producto 1)
#                 	      x12 +  x22 + x32 	       = 30 (Ventas proyectadas del producto 2)
#                 	      x13 +  x23 + x33 	       = 30 (Ventas proyectadas del producto 3)
#                 	      x14 +  x24 + x34 	       = 40 (Ventas proyectadas del producto 4)
#                 	      x15 +  x25 + x35 	       = 75 (Ventas proyectadas del producto 5, ficticio)

#				         xij  >=  0 (no negatividad de las variables).


# Transcribimos el modelo anterior a R, para encontrar el plan óptimo.

# Matriz de costos, para que la solución óptima no considere los productos producidos por
# la planta 1 del tipo 2, se le asocia un costo elevado para que no este dentro de
# las soluciones factibles, en este caso M=1000.

Matriz_costos <- matrix(c( 41,  27, 28, 24, 0,
                        40, 29, 1000, 23, 0,
                        37,  30, 27, 21, 0), ncol = 5, byrow = TRUE)

Matriz_costos
# Matriz_costos
#       [,1] [,2] [,3] [,4] [,5]
# [1,]   41   27   28   24    0
# [2,]   40   29 1000   23    0
# [3,]   37   30   27   21    0

# Direccion de las desigualdades de las restricciones para las filas (oferta)

signos_restricciones <- c("==", "==", "==")

signos_restricciones
# signos_restricciones
# [1] "==" "==" "=="

# Coeficientes de las restricciones para las filas (oferta)

Capacidad_disponible <- c(75, 75, 45)

Capacidad_disponible
# Capacidad_disponible
# [1] 75 75 45

# Direccion de las desigualdades de las restricciones para las columnas (demanda)

sign_restric_col <- c("==", "==", "==", "==", "==")

sign_restric_col
# sign_restric_col
# [1] "==" "==" "==" "==" "=="

# Coeficientes de las restricciones para las columnas (demanda)

coef_demandas <- c(20, 30, 30, 40, 75)

coef_demandas
# coef_demandas
# [1] 20 30 30 40 75

#Resolvemos.

#install.packages("lpSolve")
library(lpSolve)


solucion_1 <- lp.transport(cost.mat = Matriz_costos,
                           direction = "min",
                           row.signs = signos_restricciones,
                           row.rhs = Capacidad_disponible,
                           col.signs = sign_restric_col,
                           col.rhs = coef_demandas, 
                           presolve = 0)

solucion_1$solution

# solucion_1$solution
#       [,1] [,2] [,3] [,4] [,5]
# [1,]    0   30   30    0   15
# [2,]    0    0    0    15   60
# [3,]   20    0    0   25    0


# Valores óptimos para las variables de decisión. (Plan óptimo de transporte)

# Unidades producidas por la planta 1 que correspondenden al producto 2:

#		X12 = 30

# Unidades producidas por la planta 1 que correspondenden al producto 3:

#		X13 = 30

# Unidades producidas por la planta 1 que correspondenden al producto 5 (ficticio):

#		X15 = 15

# Unidades producidas por la planta 2 que correspondenden al producto 4:

#		X24 = 15

# Unidades producidas por la planta 2 que correspondenden al producto 5 (ficticio):

#		X25 = 60

# Unidades producidas por la planta 3 que correspondenden al producto 1:

#		X31 = 20

# Unidades producidas por la planta 3 que correspondenden al producto 4:

#		X34 = 25


# Costo mínimo asociado al plan de transporte.

solucion_1

# solucion_1
# Success: the objective function is $ 3.260. 


# De todo lo anterior podemos decir:

# Las demandas de producción de los productos 1,2,3 y 4 quedan satisfechas.
# El producto 1 de demanda igual a 20 productos, es satisfecha integramente por la planta 3.
# El producto 2 y 3 de demandas iguales a 30 productos, son satisfecha simultaneamente por la planta 1.
# El producto 4 de demanda igual a 40 productos, es satisfecha en 15 productos por la planta 2 y en
# 25 productos por la planta 3.

# evaluar bajar la producción de la planta 1 en 15 productos y la producción de la planta 2
# en 60 diarios, dado que la producción de ambas plantas, no está siendo requerida 
# en estos momentos por las proyecciones de venta.

# plan óptimo de producción para satisfacer demanda de ventas proyectadas
# es de $ 3.260 diario.
