#Integrantes: Guillermo Sanhueza 
#             Rosario Torres.

library(lpSolve)

#Taller 3

#Tabla
#             --- | 1|2 |3 |4 |5 |oferta|
#             ____________________________ 
#             | 1 |41|27|28|24|0 |  75  |
#             | 2 |40|29|0 |23|0 |  75  |
#             | 3 |37|30|27|21|0 |  45  |
#              ________________________
#         demanda |20|30|30|40|75|

#Con la finalidad de igualar la capacidad disponible de produccion (oferta) con la tasa de produccion (Demanda)
#es que se crea un prodcto 5 ficticio.

#Antes:   Capacidad de produccion = 195, Tasa de produccion = 120.
#Despues: Capacidad de produccion = 195, Tasa de produccion = 195.

#Definición de las variables de decisión.

# X11 = Tasa de produccion diaria de la planta 1 para el costo unitario del producto 1
# X12 = Tasa de produccion diaria de la planta 1 para el costo unitario del producto 2
# X13 = Tasa de produccion diaria de la planta 1 para el costo unitario del producto 3
# X14 = Tasa de produccion diaria de la planta 1 para el costo unitario del producto 4
# X15 = Tasa de produccion diaria de la planta 1 para el costo unitario del producto 5 (ficticia)

# X21 = Tasa de produccion diaria de la planta 2 para el costo unitario del producto 1
# X22 = Tasa de produccion diaria de la planta 2 para el costo unitario del producto 2
# X23 = Tasa de produccion diaria de la planta 2 para el costo unitario del producto 3
# X24 = Tasa de produccion diaria de la planta 2 para el costo unitario del producto 4
# X25 = Tasa de produccion diaria de la planta 2 para el costo unitario del producto 5 (ficticia)

# X31 = Tasa de produccion diaria de la planta 3 para el costo unitario del producto 1
# X32 = Tasa de produccion diaria de la planta 3 para el costo unitario del producto 2
# X33 = Tasa de produccion diaria de la planta 3 para el costo unitario del producto 3
# X34 = Tasa de produccion diaria de la planta 3 para el costo unitario del producto 4
# X35 = Tasa de produccion diaria de la planta 3 para el costo unitario del producto 5 (ficticia)

# i: 1, 2, 3

# j: 1, 2, 3, 4, 5

#Modelo matemático completo.

# función objetivo

#   Z =   41X11 + 27X12 + 28X13 + 24X14 + 0X15 
#       + 40X21 + 29X22 +  0X23 + 23X24 + 0X25 
#       + 37X31 + 30X32 + 27X33 + 21X34 + 0X35

#  S.A.

# X11 + X12 + X13 + X14 + X15 <= 75 (disponibilidad planta 1)
# X21 + X22 + X23 + X24 + X25 <= 75 (disponibilidad planta 2)
# X31 + X32 + X33 + X34 + X35 <= 45 (disponibilidad planta 3)
#             X11 + X21 + X31 => 20 (tasa produccion producto 1)
#             X12 + X22 + X32 => 30 (tasa produccion producto 2)
#             X13 + X23 + X33 => 30 (tasa produccion producto 3)
#             X14 + X24 + X34 => 40 (tasa produccion producto 4)
#             X15 + X25 + X35 => 75 (tasa produccion producto 5 ficcticia)
#                        X ij => 0  (no negatividad)


#Transcribimos el modelo anterior a R.

#   Matriz de costos

cost_mat_1 <- matrix(c( 41, 27,    28, 24, 0,
                        40, 29,  1000, 23, 0,
                        37, 30,    27, 21, 0), ncol = 5, byrow = TRUE)

#Puesto que la planta 2 tiene la limitacionde que no puede producir el producto 3 es que se le asigna un numero de
#valor alto para que "R" no considere a la planta 2 como la que produce el producto 3, o sea X23 = 1000.

#   Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs_1 <- c("==", "==", "==")

#   Coeficientes de las restricciones para las filas (oferta)

row_rhs_1 <- c(75, 75, 45)

#   Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs_1 <- c("==", "==", "==", "==", "==")

#   Coeficientes de las restricciones para las columnas (demanda)

col_rhs_1 <- c(20, 30, 30, 40, 75)

#Resolvemos

solucion_1 <- lp.transport(cost.mat = cost_mat_1,
                           direction = "min",
                           row.signs = row_constr_signs_1,
                           row.rhs = row_rhs_1,
                           col.signs = col_constr_signs_1,
                           col.rhs = col_rhs_1, 
                           presolve = 0)

solucion_1$solution

#      [,1] [,2] [,3] [,4] [,5]
#[1,]    0   30   30    0   15
#[2,]    0    0    0   15   60
#[3,]   20    0    0   25    0

#Valores óptimos para las variables de decisión. (Plan optimo de distribución)

# X12 = 30
#          Tasa de produccion diaria de la planta 1 para el producto 2

# X13 = 30
#          Tasa de produccion diaria de la planta 1 para el producto 3

# X15 = 15
#          Tasa de produccion diaria de la planta 1 para el producto 5

# X24 = 15
#          Tasa de produccion diaria de la planta 2 para el producto 4

# X25 = 60
#          Tasa de produccion diaria de la planta 2 para el producto 5

# X31 = 20
#          Tasa de produccion diaria de la planta 3 para el producto 1

# X34 = 25
#          Tasa de produccion diaria de la planta 3 para el producto 4

#Analisis plan optimo

# Solo la planta 1 se encargara de toda la produccion diaria del producto 2 y 3.

# Solo la planta 3 se encargara de toda la produccion diaria del producto 1.

# La planta 2 y 3 compartiran la produccion diaria del producto 4:
#   Planta 2:(15/40)*100 = 37,5%, Planta 3:(25/40)*100 = 62,5%

# Producto ficticio.

# La planta 1 y 2 compartiran la produccion diaria del producto 5 (ficticio):
#   Planta 1:(15/75)*100 = 20%, Planta 2:(60/75)*100 = 80%


#Costo mínimo asociado al plan de transporte.

solucion_1

# Z* = 3260

#El costo minimo asociado a este plan de produccion sera de $3.260.






