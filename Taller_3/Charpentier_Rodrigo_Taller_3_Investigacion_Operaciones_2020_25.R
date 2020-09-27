
#                                                 Gonzalo Venegas Carrasco
#                                                 Sebastian Venegas Carrasco
#Taller 3                                         Rodrigo Charpentier Brevis
#                                                                                                       
  
#Origen-------------Destino------------ Oferta
#        x1     x2    x3    x4    x5
#        D1     D2    D3    D4     D5       
#O1 x1   41     27    28    24     0      75
#O2 x2   40     29    1000  23     0      75
#O3 x3   37     30    27    21     0      45
#Demanda 20     30    30    40     75     

#

#Definicion de Variables de Decision

#x11 : Cantidad de producción de la planta 1 y costo unitario por el producto 1.
#x12 : Cantidad de producción de la planta 1 y costo unitario por el producto 2.
#x13 : Cantidad de producción de la planta 1 y costo unitario por el producto 3.
#x14 : Cantidad de producción de la planta 1 y costo unitario por el producto 4.
#x15 : Cantidad de producción de la planta 1 y costo unitario por el producto 5 (ficticia).
#x21 : Cantidad de producción de la planta 2 y costo unitario por el producto 1.
#x22 : Cantidad de producción de la planta 2 y costo unitario por el producto 2.
#x23 : Cantidad de producción de la planta 2 y costo unitario por el producto 3.
#x24 : Cantidad de producción de la planta 2 y costo unitario por el producto 4.
#x25 : Cantidad de producción de la planta 2 y costo unitario por el producto 5 (ficticia).
#x31 : Cantidad de producción de la planta 3 y costo unitario por el producto 1.
#x32 : Cantidad de producción de la planta 3 y costo unitario por el producto 2.
#x33 : Cantidad de producción de la planta 3 y costo unitario por el producto 3.
#x34 : Cantidad de producción de la planta 3 y costo unitario por el producto 4.
#x35 : Cantidad de producción de la planta 3 y costo unitario por el producto 5 (ficticia).

#Modelo Matematico Completo 
#
# Min Z : 41x11 + 27x12 +   28x13 + 24x14 + 0x15
#       + 40x21 + 29x22 + 1000x23 + 23x24 + 0x25
#       + 37x31 + 30x32 +   27x33 + 21x34 + 0x35

# Sujeto a Restricciones de Filas(Oferta)
#
# x11 + x12 + x13 + x14 + x15 = 75 (Capacidad de produccion de la planta 1)
# x21 + x22 + x23 + x24 + x25 = 75 (Capacidad de produccion de la planta 2)
# x31 + x32 + x33 + x34 + x35 = 45 (Capacidad de produccion de la planta 3)

#Sujeto a Restricciones de Columnas (Demanda)
#
# x11 + x21 + x31 = 20 (Cantidad a producir del producto 1)
# x12 + x22 + x32 = 30 (Cantidad a producir del producto 2)
# x13 + x23 + x33 = 30 (Cantidad a producir del producto 3)
# x14 + x24 + x34 = 40 (Cantidad a producir del producto 4)
# x15 + x25 + x35 = 75 (Cantidad a producir del producto 5)
#Rest No Negatividad 

#Matriz de Costos

C <- matrix(c(41,     27,    28,    24,     0,      
              40,     29,    1000,  23,     0,
              37,     30,    27,    21,     0),
            ncol = 5,
            byrow = TRUE)
C

#Direccion de las desigualdades de las restricciones para las filas (oferta)

DO <- c("==", "==", "==")

DO

#Coeficientes de las Restricciones de Filas (ofertas)

CO <- c(75, 75, 45 )

CO

#Direccion de las desigualdades de las restricciones para las columnas (demanda)

DD <- c("==", "==", "==", "==", "==")

DD

#Coeficientes de las restricciones para las columnas (Demanda)

CD <- c (20, 30, 30, 40, 75)

CD

solucion_2 <- lp.transport(cost.mat = C,
                           direction = "min",
                           row.signs = DO,
                           row.rhs = CO,
                           col.signs = DD,
                           col.rhs = CD, 
                           presolve = 0)
solucion_2$solution

solucion_2


#Plan Optimo de Produccion para minimizar costos.

#En la planta 1 se producen 0  unidades del producto 1 
#En la planta 1 se producen 30 unidades del producto 2 
#En la planta 1 se producen 30 unidades del producto 3 
#En la planta 1 se producen 0  unidades del producto 4 
#En la planta 1 se producen 15 unidades del producto 5, es una capacidad productiva no utilizada debido a que es un producto imaginario el que se agrega a la matriz.
#En la planta 2 se producen 0  unidades del producto 1 
#En la planta 2 se producen 0  unidades del producto 2 
#En la planta 2 se producen 0  unidades del producto 3 
#En la planta 2 se producen 15 unidades del producto 4 
#En la planta 2 se producen 60 unidades del producto 5, es una capacidad productiva no utilizada debido a que es un producto imaginario el que se agrega a la matriz.
#En la planta 3 se producen 20 unidades del producto 1 
#En la planta 3 se producen 0  unidades del producto 2 
#En la planta 3 se producen 0  unidades del producto 3 
#En la planta 3 se producen 25 unidades del producto 4 
#En la planta 3 se producen 0  unidades del producto 5 


# Para optimizar la funcion Costo/Produccion y para que el costo de produccion de los productos sea 3260 pesos diarios: 

# La planta 1 debe producir 0 unidades de producto 1, producir 30 unidades de producto 2, 30 unidades de producto 3, 0 unidades de producto 4 y 15 unidades de producto 5.
# La planta 2 debe poducir 0 unidades del producto 1, 2 y 3; 25 unidades del producto 4 y 60 unidades del producto 5.
# La Planta 3 debe producir 20 unidades del producto 1, 0 unidades del producto 2 y 3, 25 unidades del producto 4 y 0 unidades del producto 5.









































































































