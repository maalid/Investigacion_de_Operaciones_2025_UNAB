#TALLER 3
#PROBLEMA DE TRASPORTE

#ALFREDO SILVA BURGOS
#18.291.662-5
#
########La BETTER PRODUCTS COMPANY##########
#
#------------------------------------------#-----------------------------------------------#
library("lpSolveAPI", character.only=TRUE)


#Oferta(Origen)------------------------- Demanda(Destino)
#
#              x1         x2      x3        x4         x5
#            Demanda1 Demanda2  Demanda3  Demanda4  Demanda5       
#Oferta 1 x1   41       27        28        24         0      75
#Oferta 2 x2   40       29      1000        23         0      75 Oferta
#Oferta 3 x3   37       30        27        21         0      45
#DEMANDA       20       30        30        40        75   

#Se genera un nodo ficticio D5 para equiparar la oferta y demanda para optimizar los costos de produccion

#

#VARIABLE DE DECISION

#x11: Cantidad del producto 1 producido por la planta 1
#x12: Cantidad del producto 2 producido por la planta 1
#x13: Cantidad del producto 3 producido por la planta 1
#x14: Cantidad del producto 4 producido por la planta 1
#x15: Cantidad del producto 5 producido por la planta 1
#x21: Cantidad del producto 1 producido por la planta 2
#x22: Cantidad del producto 2 producido por la planta 2
#x23: Cantidad del producto 3 producido por la planta 2
#x24: Cantidad del producto 4 producido por la planta 2
#x25: Cantidad del producto 5 producido por la planta 2
#x31: Cantidad del producto 1 producido por la planta 3
#x32: Cantidad del producto 2 producido por la planta 3
#x33: Cantidad del producto 3 producido por la planta 3
#x34: Cantidad del producto 4 producido por la planta 3
#x35: Cantidad del producto 5 producido por la planta 3
#
#xij:cantidad de producto i, para satisfacer las ventas proyectadas j.
#
#MODELO MATEMATICO EN DETALLE
#
#FUNCION OBJETIVO
#
# Min Z : 41x11 + 27x12 +   28x13 + 24x14 + 0x15
#       + 40x21 + 29x22 +   1000x23 + 23x24 + 0x25
#       + 37x31 + 30x32 +   27x33 + 21x34 + 0x35
#
# RESTRICCIONES DE OFERTA
#
# x11 + x12 + x13 + x14 + x15 = 75
# x21 + x22 + x23 + x24 + x25 = 75
# x31 + x32 + x33 + x34 + x35 = 45
#
#RESTRICCIONES DE DEMANDA
#
# x11 + x21 + x31 = 20 
# x12 + x22 + x32 = 30
# x13 + x23 + x33 = 30
# x14 + x24 + x34 = 40
# x15 + x25 + x35 = 75
#
#RESTRICCIÓN DE NO NEGATIVIDAD
#
#xij >= 0
#
#COSTOS

cost_mat_1 <- matrix(c(41,     27,    28,    24,     0,      
              40,     29,    1000,  23,     0,
              37,     30,    27,    21,     0),
            ncol = 5,
            byrow = TRUE)

cost_mat_1

#Direccion de las desigualdades de las restricciones para las filas (oferta)

Z1 <- c("==", "==", "==")

Z1

#Coeficientes de las Restricciones de Filas (ofertas)

Z2 <- c(75, 75, 45 )

Z2

#Direccion de las desigualdades de las restricciones para las columnas (demanda)

Z3 <- c("==", "==", "==", "==", "==")

Z3

#Coeficientes de las restricciones para las columnas (Demanda)

Z4 <- c (20, 30, 30, 40, 75)

Z4

#install.packages("lpsolve")
#library(lpsolve)

solucion_1 <- lp.transport(cost.mat = cost_mat_1,
                           direction = "min",
                           row.signs = Z1,
                           row.rhs = Z2,
                           col.signs = Z3,
                           col.rhs = Z4, 
                           presolve = 0)
solucion_1$solution

#
#ANALISIS
#
#La planta 1 debe producir 0 UN del producto 1 
#La planta 1 debe producir 30 UN del producto 2 
#La planta 1 debe producir 30 UN del producto 3 
#La planta 1 debe producir 0  UN del producto 4 
#La planta 1 debe producir 15 UN del producto 5, las 15 unidades corresponden al nodo ficticio creado, que no se utiliza, pero se agrega a la matriz para obtener la optimización.
#La planta 2 debe producir 0  UN del producto 1 
#La planta 2 debe producir 0  UN del producto 2 
#La planta 2 debe producir 0  UN del producto 3 
#La planta 2 debe producir 15 UN del producto 4 
#La planta 2 debe producir 60 UN del producto 5, las 60 unidades corresponden al nodo ficticio creado, que no se utiliza, pero se agrega a la matriz para obtener la optimización.
#La planta 3 debe producir 20 UN del producto 1 
#La planta 3 debe producir 0  UN del producto 2 
#La planta 3 debe producir 0  UN del producto 3 
#La planta 3 debe producir 25 UN del producto 4 
#La planta 3 debe producir 0  UN del producto 5, 0 unidades del nodo ficticio.
#
#
#Para optimizar el costo de produccion diario La BETTER PRODUCTS COMPANY debe hacer lo siguiente:
# La planta 1 debe producir 0 UN del producto 1, producir 30 UN del producto 2, 30 UN del producto 3, 0 UN del producto 4, 15 UN del producto 5.
# La planta 2 debe producir 0 UN del producto 1, 0 UN del producto 2,0 UN del producto 3, 15 UN del producto 4, 60 UN del producto 5.
# La Planta 3 debe producir 20 UN del producto 1, 0 UN del producto 2, 0 UN del producto 3, 25 UN del producto 4, 0 UN del producto 5.
# De esta forma se puede optimizar el costo de produccion diario, y obtener un monto minimo:
#
# Min Z : 41(0) + 27(30) +   28(30) + 24(0) + 0(15)
#       + 40(0) + 29(0) + 1000(0) + 23(15) + 0(60)
#       + 37(20) + 30(0) +   27(0) + 21(25) + 0(0)
#
# Min Z = $ 3260. "Costo de produccion diario"

