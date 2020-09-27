

#solemne 2

#Nombre: Jaime Bravo

#Ejercicio 1

#
#
#
#
#
#         Costos Por unidad
#             Destinos
#    [,1] [,2] [,3] [,4] [,5]
#[1,] 1080 1095 1110 1125    0
#[2,]    0 1110 1125 1140    0
#[3,]    0    0 1100 1115    0
#[4,]    0    0    0 1130    0
#
# xij: cantidad de de turbinas a instalar en el mes i, al destino j

# A) Formule este problema como uno de transporte.


library(lpSolve)

cost_mat_1 <- matrix(c(1080,1095,1110,1125,0,
                       0,1110,1125,1140,0,
                       0,0,1100,1115,0,
                       0,0,0,1130,0),
                       ncol=5,
                       byrow=TRUE)

cost_mat_1

#Direcciones de las desigualdades de las restricciones (ORIGENES)

row_constr_sings_1 <- c("==","==","==","==")
row_constr_sings_1

#Coeficeintes de las restricciones (ORIGNES)
row_rhs_1 <- c(25,35,30,10)
row_rhs_1
#Direcciones de las desigualdades de las restricciones (DESTINOS)
col_constr_sings_1 <- c("==","==","==","==","==")
col_constr_sings_1
#Coeficeintes de las restricciones (DESTINOS)
col_rhs_1 <-c(10,15,25,20,30)
col_rhs_1

# Obtenga una solución óptima.

sol_1 <-lp.transport(cost.mat = cost_mat_1,
                     direction = "min",
                     row.signs = row_constr_sings_1,
                     row.rhs = row_rhs_1,
                     col.signs = col_constr_sings_1,
                     col.rhs = col_rhs_1,
                     presolve=0,
                     compute.sens=0)
sol_1$solution

#  [,1] [,2] [,3] [,4] [,5]
#[1,]    0    0   15    5    5
#[2,]   10    0    0    0   25
#[3,]    0   15    0   15    0
#[4,]    0    0   10    0    0

# c) Interprete los resultados óptimos obtenidos.
#
# Cantidad de turbinas a fabricar en el mes 1 al destino 3
#  x13= 15
#
# Cantidad de turbinas a fabricar en el mes 1 al destino 4
#  x14= 5
#
# Cantidad de turbinas a fabricar en el mes 1 al destino ficticio
#  x15= 5
#
# Cantidad de turbinas a fabricar en el mes 2 al destino 1
#  x21= 10
#
# Cantidad de turbinas a fabricar en el mes 2 al destino ficticio
#  x25= 25
#
# Cantidad de turbinas a fabricar en el mes 3 al destino 2
#  x32= 15
#
# Cantidad de turbinas a fabricar en el mes 3 al destino 4
#  x34= 15
#
# Cantidad de turbinas a fabricar en el mes 4 al destino 3
#  x43= 10

sol_1

# Success: the objective function is 39000 

# El valor optimo de transporte descrito anterioremente,  
# tiene un costo asociado de 39000  U/M

#Ejercicio 2
#
#
#
#
# A) Formule este problema como uno de transporte.




cost_mat_2 <- matrix(c(5,8,0,0,0,
                       3,11,0,0,0,
                       0,4,14,11,12,
                       4,0,13,13,10,
                       0,0,0,0,0),
                     ncol=5,
                     byrow=TRUE)


cost_mat_2

#Direcciones de las desigualdades de las restricciones (ORIGENES)

row_constr_sings_2 <- c("==","==","==","==","==")
row_constr_sings_2

#Coeficeintes de las restricciones (ORIGNES)
row_rhs_2 <- c(7000,8000,5000,5000,5000)
row_rhs_2
#Direcciones de las desigualdades de las restricciones (DESTINOS)
col_constr_sings_2 <- c("==","==","==","==","==")
col_constr_sings_2
#Coeficeintes de las restricciones (DESTINOS)
col_rhs_2 <-c(5000,5000,6500,6700,6800)
col_rhs_2

# Obtenga una solución óptima.

sol_2 <-lp.transport(cost.mat = cost_mat_2,
                     direction = "min",
                     row.signs = row_constr_sings_2,
                     row.rhs = row_rhs_2,
                     col.signs = col_constr_sings_2,
                     col.rhs = col_rhs_2,
                     presolve=0,
                     compute.sens=0)
sol_2$solution



#Ejercicio 3




# Variable de Decision

# x1  = dorso por el nadador Carls
# x2  = dorso por el nadador Chris
# x3  = dorso por el nadador David
# x4  = dorso por el nadador Tony
# x5  = dorso por el nadador ken
# x6  = pecho por el nadador Carls
# x7  = pecho por el nadador Chris
# x8  = pecho por el nadador David
# x9  = pecho por el nadador Tony
# x10 = pecho por el nadador ken
# x11 = mariposa por el nadador Carls
# x12 = mariposa por el nadador Chris 
# x13 = mariposa por el nadador David
# x14 = mariposa por el nadador Tony
# x15 = mariposa por el nadador ken
# x16 = libre por el nadador Carls
# x17 = libre por el nadador Chris 
# x18 = libre por el nadador David
# x19 = libre por el nadador Tony
# x20 = libre por el nadador ken
# x21 = Nado ficticio por el nadador Carls
# x22 = Nado ficticio por el nadador Chris 
# x23 = Nado ficticio por el nadador David
# x24 = Nado ficticio por el nadador Tony
# x25 = Nado ficticio por el nadador ken

#De manera resumida podemos definir las 20 variables anteriores mediante una 
#sola expresión. En efecto, para i= dorso, pecho,mariposa,libre 
# y j= Carls, Chris, David, Tony y Ken.
#sea:
#  xij:tipo de nado i, nombre de los concursantes j.



# Funcion objetivo

#  min Z =     37.7x1 +  32.9x2  + 33.8x3  +37.0x4  +  35.4x5  +
#              43.4x6 + 33.1x7  + 42.2x8  + 34.7x9  + 41.8x10 +
#              33.3x11 + 28.5x12 + 38.9x13 + 30.4x14 + 33.6x15 +
#              29.2x16 + 26.4x17 + 29.6x18 + 28.5x19 + 31.1x20 +
#                 0x21 + 0x22 + 0x23 + 0x24 + 0x25

# Restricciones

#    x1  + x2  + x3  + x4  + x5  = 1  Restricción de tipos de nado dorso.
#    x6  + x7  + x8  + x9  + x10 = 1  Restricción de tipos de nado pecho.
#    x11 + x12 + x13 + x14 + x15 = 1  Restricción de tipos de nado mariposa.
#    x16 + x17 + x18 + x19 + x20 = 1  Restricción de tipos de nado libre.
#    x1  + x6  + x11 + x16       = 1  Restricción del nadador Carls.
#    x2  + x7  + x12 + x17       = 1  Restricción del nadador Chris.
#    x3  + x8  + x13 + x18       = 1  Restricción del nadador David.
#    x4  + x9  + x14 + x19       = 1  Restricción del nadador Tony.
#    x5  + x10 + x15 + x20       = 1  Restricción del nadador Ken.
#                  xij=0  o  xij = 1  


#Matriz de costos

cost_mat_3<-matrix(c(37.7 , 32.9 , 33.8 , 37.0 , 35.4 ,
                     43.4 , 33.1 , 42.2 , 34.7 , 41.8 ,
                     33.3 , 28.5 , 38.9 , 30.4 , 33.6 ,
                     29.2 , 26.4 , 29.6 , 28.5 , 31.1 ,
                     0 ,    0 ,    0 ,    0 ,    0),
                   ncol = 5,
                   byrow = TRUE)

cost_mat_3

#resolvemos 

sol_3<-lp.assign(cost_mat_3,
                      direction = "min",
                      presolve = 0,
                      compute.sens = 0)

sol_3$solution

# Obtenga una solución óptima.

                                               
# Tipo de nado dorso asignado para David x3= 1
# Tipo de nado pecho asignado para Tony x9= 1
# Tipo de nado mariposa asignado para Chris x12= 1
# Tipo de nado libre asignado para Carls   x16= 1
# Tipo de nado ficticio asignado para ken  x25= 1
                                                      


sol_3

#El mejro tiempo es de 126.2









