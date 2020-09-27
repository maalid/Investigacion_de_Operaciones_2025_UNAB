# Taller N°3


# Integrantes:
  
# Riola San Martin Saez
# Georgette Pilquinao 


library(lpSolve)
library(tibble)

# A) Formule correctamente este problema de Transporte, definiendo las variables
# de decisión, la función objetivo, los nodos, los suministros, las demandas, 
# los arcos, las capacidades y los costos.


#                     costo por producto

#  planta              1    2    3    4  ... 5 capacidad disponible

#    1                41   27   28   24  ...             75
#    2                40   29        23  ...             75
#    3                37   30   27   21  ...             45
#    :                :     :   :     :                  :


#tasa de produccion   20   30   30   40      75          190




# Variable de desicion

#x1=  produccion de planta 1 en producto 1 
#x2=  produccion de planta 1 en producto 2
#x3=  produccion de planta 1 en producto 3
#x4=  produccion de planta 1 en producto 4 
#x5=  produccion de planta 2 en producto 1
#x6=  produccion de planta 2 en producto 2
#x7=  produccion de planta 2 en producto 3
#x8=  produccion de planta 2 en producto 4
#x9=  produccion de planta 3 en producto 1 
#x10= produccion de planta 3 en producto 2 
#x11= produccion de planta 3 en producto 3
#x12= produccion de planta 3 en producto 4
#x13= produccion de planta 1 en producto 5 (ficticia)
#x14= produccion de planta 2 en producto 5 (ficticia)
#x15= produccion de planta 3 en producto 5 (ficticia)

#De manera resumida podemos definir las 12 variables anteriores mediante una
#sola expresión. En efecto, para i=1,2,3 y j=1,2,3,4, sea:

# xij:produccion de planta i, productos producidos j.

# Funsion objetivo 

#minZ=   41x1 + 27x2  + 28x3  + 24x4  + 0x13
#       +20x5 + 29x6  + 0x7   + 23x8  + 0x14
#       +37x9 + 30x10 + 27x11 + 21x12 + 0x15


s.A.

#  x1  +  x2   +  x3   +  x4  = 75 produccion de planta 1 
#  x5  +  x6   +  x7   +  x8  = 75 produccion de planta 2
#  x9  +  x10  +  x11  +  x12 = 45 produccion de planta 3 
#  x1  +  x5   +  x9          = 20 demanda producto 1
#  x2  +  x6   +  x10         = 30 demanda producto 2
#  x3  +  x7   +  x11         = 30 demanda producto 3
#  x4  +  x8   +  x12         = 40 demanda producto 4
#  x13 + x14   +  x15         = 75 demanda producto 5 (fictisio)
#                          xij>= 0 no negatividad de las variables



# b) Encuentre el plan óptimo de producción de cada planta, que minimiza los costos


#       Transcribimos el modelo anterior a R.

#	matrix de costo

Cost_mat_2 <- matrix(c( 41, 27,28,24,0,
                        40, 29, 0,23,0,
                        37, 30,27,21,0),
                     ncol = 5,
                     byrow = TRUE)

Cost_mat_2


# Direccion de las desigualdades de las restricciones para las filas (oferta)


row_constr_sign_2 <- c("==","==","==")

row_constr_sign_2



#Coeficientes de las restricciones para las filas (oferta)

row_rhs_2 <- c(75,75,45)
row_rhs_2



#Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs_2 <- c ("==","==","==","==","==")
col_constr_signs_2


#Coeficientes de las restricciones para las columnas (demanda)

col_rhs_2 <-c(20,30,30,40,75)
col_rhs_2



# C) Interprete los resultados. 

library(lpSolve)

solucion_2 <- lp.transport(cost.mat =  Cost_mat_2,
                           direction = "min",
                           row.signs = row_constr_sign_2,
                           row.rhs = row_rhs_2,
                           col.signs = col_constr_signs_2,
                           col.rhs = col_rhs_2,
                           presolve = 0)

solucion_2$solution



#  Valores optimos para las variables de decision

# cantidad de produccion de planta 1 a producto 2

#                                      x2= 30
                                      
# cantidad de produccion de planta 1 a producto 5

#                                      x13= 50

# cantidad de produccion de planta 2 a producto 3

#                                      x7=30

# cantidad de produccion de planta 2 a producto 4

#                                      x8=15

# cantidad de produccion de planta 2 a producto 5

#                                      x14=30

# cantidad de produccion de planta 3 a producto 1

#                                      x9=20

# cantidad de produccion de planta 3 a producto 4
                                      
#                                      x25=25                                      


# costo minimo asociado al plan de transporte

solucion_2

# Z* =  $ 2.420




