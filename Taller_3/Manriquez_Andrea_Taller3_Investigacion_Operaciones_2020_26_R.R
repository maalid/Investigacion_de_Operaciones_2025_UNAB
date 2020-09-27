# TALLER 3 
#INVESTIGACION DE OPERACIONES

#INTEGRANTEs: ANDREA MANRIQUEZ, CAROLINA CONTRERAS

# EJERCICIO 1

# La BETTER PRODUCTS COMPANY ha decidido iniciar la fabricación de cuatro nuevos productos 
# en tres plantas que por el momento tienen exceso de capacidad de producción. Los productos 
# requieren de un esfuerzo productivo comparable por unidad, por lo que la capacidad de 
#producción disponible en las plantas se mide por el número de unidades de cualquier 
# producto que se pueden fabricar por día, como se muestra en la última columna de la tabla.

#  ___________________________________________________________________________
# |                |  Costo Unitario del Producto ($)      |                  |
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

# El último renglón muestra la producción diaria que se requiere para satisfacer
# las ventas proyectadas. Cada planta puede producir cualquiera de estos productos, 
# excepto la planta 2 que no puede fabricar el producto 3. Sin embargo, el costo 
# variable por unidad de cada producto difiere entre una planta y otra, como se muestra 
# en el cuerpo principal de la tabla. La administración necesita tomar la decisión de 
# cómo dividir la producción entre las plantas, y para esto, decide permitir la 
# separación de productos, de tal manera que el mismo producto se pueda fabricar 
# en más de una planta.
#
# Se pide:

# a.	Formule correctamente este problema de Transporte, definiendo las variables de decisión, la función objetivo, los nodos, los suministros, las demandas, los arcos, las capacidades y los costos.
# b.	Encuentre el plan óptimo de producción de cada planta, que minimiza los costos.
# c.	Interprete los resultados.

# Desarrollo:
#
# a)
#  ______________________________________________________________________________________
# |                |           Costo Unitario del Producto ($)       |                  |
# |                |_________________________________________________|    Capacidad     |
# |                |    1    |    2    |    3    |    4    |    5    |    Disponible    |
# |________________|_________|_________|_________|_________|_________|__________________|
# | Planta       1 |    41   |    27   |    28   |    24   |    0    |         75       |
# | Planta       2 |    40   |    29   |    -    |    23   |    0    |         75       |
# | Planta       3 |    37   |    30   |    27   |    21   |    0    |         45       |
# |________________|_________|_________|_________|_________|_________|__________________|
# |                |         |         |         |         |         |                  |
# |   Tasa de      |         |         |         |         |         |                  |
# |  Producción    |    20   |    30   |    30   |    40   |    75   |        195       |
# |________________|_________|_________|_________|_________|_________|__________________|
#
# m = número de orígenes
# n = número de destinos
# bi = Recursos del origen i (donde i= 1,2,3,?,m)
# aj = Demanda del destino j (donde j= 1,2,3,?,n)
# xij = Variable de decisión que denota la cantidad enviada del origen i al destino j.
# cij = Costo unitario de transporte de una unidad del origen i al destino j
#
# El objetivo del modelo es determinar las incognitas xij que puedan minimizar el costo total de transporte
# y que a la vez satisfagan las restricciones de oferta y demanda

#
# En el problema de transporte planteado vemos claramente que existe una sobre oferta, 
# ya que la oferta es mayor a la demanda por lo cual se debe balancear al relación.
# Para esto crearemos un nodo de demanda ficticia que necesite la producción de 75 unidades
# adicionales de un Producto que llamaremos "5". Es por eso que en la nueva tabla agregamos
# la columna del Producto "5".

# Definición de las variables de decisión:
# Existen 3 ofertas y 5 demandas ahora que agregamos la ficticia, por lo tanto en total
# tenemos 15 variables de decisión. Las cuales son las siguientes:
#
# S. A.:

# x11: Número de productos producidos por la planta 1, que corresponden al del tipo 1
# x12: Número de productos producidos por la planta 1, que corresponden al del tipo 2
# x13: Número de productos producidos por la planta 1, que corresponden al del tipo 3
# x14: Número de productos producidos por la planta 1, que corresponden al del tipo 4
# x15: Número de productos producidos por la planta 1, que corresponden al del tipo 5 (Demanda ficticia)
# x21: Número de productos producidos por la planta 2, que corresponden al del tipo 1
# x22: Número de productos producidos por la planta 2, que corresponden al del tipo 2
# x23: Número de productos producidos por la planta 2, que corresponden al del tipo 3
# x24: Número de productos producidos por la planta 2, que corresponden al del tipo 4
# x25: Número de productos producidos por la planta 2, que corresponden al del tipo 5 (Demanda ficticia)
# x31: Número de productos producidos por la planta 3, que corresponden al del tipo 1
# x32: Número de productos producidos por la planta 3, que corresponden al del tipo 2
# x33: Número de productos producidos por la planta 3, que corresponden al del tipo 3
# x34: Número de productos producidos por la planta 3, que corresponden al del tipo 4
# x35: Número de productos producidos por la planta 3, que corresponden al del tipo 5 (Demanda ficticia)

# En resumen las 15 variables anteriores podemos definirlas mediante una sola expresión
# 
# en efecto, 
# para i= 1,2,3
# para j = 1,2,3,4,5, sea:

# xij: número de productos producidos por la planta i, que corresponden al del tipo j.
# 
# Modelo matemático completo: Basado en la información entregada y la definición de las variables de decisión, 
# considerando que la Planta 2 no puede producir los productos del tipo 3 y además 
# que debemos usar "M" en el modelo para valorizar los costos, se formula el modelo
# de Programación lineal a resolver, el cual es el siguiente:
#
#   MIN Z = 41x11 + 27x12 + 28x13 + 24x14 + 0x15
#           40x21 + 29x22 + Mx23  + 23x24 + 0x25
#           37x31 + 30x32 + 27x33 + 21x34 + 0x35

#   x11 +  x12 + x13 + x14 + x15 = 75 (Producción máxima planta 1)
#   x21 +  x22 + x23 + x24 + x15 = 75 (Producción máxima planta 2)
#   x31 +  x32 + x33 + x34 + x35 = 45 (Producción máxima planta 3)

#   x11 +  x21 + x31 	       = 20 (Demanda proyectada del producto 1)
#   x12 +  x22 + x32 	       = 30 (Demanda proyectada del producto 2)
#   x13 +  x23 + x33 	       = 30 (Demanda proyectada del producto 3)
#   x14 +  x24 + x34 	       = 40 (Demanda proyectada del producto 4)
#   x15 +  x25 + x35 	       = 75 (Demanda proyectada del producto 5, ficticia)
#
# xij  >= 0 (condición de no negatividad)
#
# Trancribimos el modelo anterior a R
#
# Matriz de costos 
#( Para que no se consideren los productos producidos del tipo 2 por la Planta 1,
# se le asocia un costo elevado para que no sea considerada como una solución factible)
# M = 1000
#
Matriz_costos <- matrix(c( 41,  27, 28, 24, 0,
                           40, 29, 1000, 23, 0,
                           37,  30, 27, 21, 0), ncol = 5, byrow = TRUE)

Matriz_costos
# Matriz de costos
#       [,1] [,2] [,3] [,4] [,5]
# [1,]   41   27   28   24    0
# [2,]   40   29 1000   23    0
# [3,]   37   30   27   21    0
#
# Dirección de las desigualdades de las restricciones para las filas (oferta)

signos_restricciones <- c ("==", "==", "==")

signos_restricciones
#signos_restricciones
#[1] "==","==","=="

Capacidad_disponible <- c(75, 75, 45)
#
Capacidad_disponible
# Capacidad disponible
# [1] 75 75 45

# Dirección de las desigualdades de las restricciones para las columnas (demanda)

sign_restric_col <- c ("==", "==", "==", "==","==")

sign_restric_col
#sign_restric_col
#[1] "==, "==", "==", "==", "=="

# Coeficientes de las restricciones para las columnas (demanda)

coef_demandas <- c(20, 30, 30, 40, 75)

coef_demandas
#coef_demandas
# [1] (20, 30, 30, 40,)

#Resolvemos:

#install.packages ("lpSolve")

library(lpSolve)

solucion1 <- lp.transport(cost.mat = Matriz_costos,
                           direction = "min",
                           row.signs = signos_restricciones,
                           row.rhs = Capacidad_disponible,
                           col.signs = sign_restric_col,
                           col.rhs = coef_demandas, 
                           presolve = 0)

solucion1$solution

> solucion1$solution
#       [,1] [,2] [,3] [,4] [,5]
# [1,]    0   30   30    0   15
# [2,]    0    0    0   15   60
# [3,]   20    0    0   25    0


#Valores óptimos para las variables de decisión

# Unidades producidas por la Planta 1 que corresponden al producto 2:
# x12= 30

# Unidades producidads por la Planta 1 que corresponden al producto 3:
# x13 = 30

#Unidades producidas por la Planta 1 que corresponden al producto 5 (ficticio):
# x15 = 15

#Unidades producidas por la Planta 2 que corresponden al producto 4:
# x24 = 15

#Unidades producidas por la planta 2 que corresponden al producto 5 (ficticio):
# x25 = 60

#Unidades producidas por la planta 3 que corresponden al producto 1:
# x31 = 20

#Unidades producidas por la planta 3 que corresponden al producto 4:
# x34 =25



#Interpretación de los resultados


# Dentro de la solución podemos decir que:

#la Planta 1 en realidad no producirá 15 productos (nodo ficticio)
# y si los llegase a producir, serían 15 productos que no se ocuparan, por lo que
# quedarían en stock, en bodega o almacenamiento.

#la Planta 2 en realidad no producirá 60 productos del tipo 5 (nodo ficticio)
# y si los llegase a producir, serían 60 productos que no se ocuparan, por lo que
# quedarían en stock, en bodega o almacenamiento.
#
# Si llegasemos a utilizar el nodo ficticio como parte de la realidad, es decir evaluar 
# esta solución y llevarla a cabo , se crearía un nuevo producto con la condición de 
# cambiar el Plan de producción (flexibilizar el Plan de Producción para cumplir con 
# la demanda), ya que sabemos que hay 75 productos del "tipo 5" que sobrarían. Por tanto, 
# en el Plan de Producción se deberían dejar de producir diariamente 15 productos del tipo "5". 
# Y en la Planta 1 se deberían dejar de producir diariamente 60 productos del tipo "5".
# Las demandas de los productos 1, 2, 3, 4 quedarían satisfechan
# El producto tipo 4 quedaría satisfecho en su demanda gracias a a los 15 productos producidos
#Planta 2 y los 25 productos producidos por la Planta 3


solucion1

#> solucion1
#Success: the objective function is 3260 


# Interpretación de los resultados

# El valor de la función objetivo es $3.260, por lo tanto este valor representa 
# el costo mínimo de mi Plan óptimo de transporte.
 