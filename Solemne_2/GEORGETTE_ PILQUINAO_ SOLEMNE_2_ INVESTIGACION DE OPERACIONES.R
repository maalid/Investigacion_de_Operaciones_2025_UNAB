# Solemne N2

# Georgette Pilquinao.

library(lpSolve)

#Ejercicio 1

#problema de transporte

# Mes      instalaciones   produccion   costo unitario  costo unitario
#           programadas     maxima      de produccion    de almacenaje  
#  1           10             25             1.08           0.015
#  2           15             35             1.11           0.015
#  3           25             30             1.10           0.015
#  4           20             10             1.13        


#
#         Costos Por unidad
#             Destinos

#     [,1] [,2] [,3] [,4]  [,5]
#[1,] 1080 1095 1110 1125    0
#[2,]    0 1110 1125 1140    0
#[3,]    0    0 1100 1115    0
#[4,]    0    0    0 1130    0
#

# xij: cantidad de de turbinas a instalar en el mes i, al destino j


# A) Formule este problema como uno de transporte.




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



# c) Interprete los resultados óptimos obtenidos.

#
# Cantidad de turbinas a fabricar el mes 1 al destino 3
#                                                       x1= 15
#
# Cantidad de turbinas a fabricar el mes 1 al destino 4
#                                                       x2= 5

# Cantidad de turbinas a fabricar  el mes 1 al destino ficticio
#                                                       x3= 5
#
# Cantidad de turbinas a fabricar  el mes 2 al destino 1
#                                                       x4= 10

# Cantidad de turbinas a fabricar  el mes 2 al destino ficticio
#                                                       x5= 25
#
# Cantidad de turbinas a fabricar  el mes 3 al destino 2
#                                                       x6= 15
#
# Cantidad de turbinas a fabricar  el mes 3 al destino 4
#                                                       x7= 15
#
# Cantidad de turbinas a fabricar  el mes 4 al destino 3
#                                                       x8= 10


sol_1



# El valor optimo de transporte,tiene un costo asociado de 39000  U/M


 

#Ejercicio 2

#Problema de transbordo


# A) Formule este problema como uno de transporte.




cost_mat_2 <- matrix(c(5,8,1000,1000,1000,
                       3,11,1000,1000,1000,
                       1000,4,14,11,12,
                       4,1000,13,13,10),
                     ncol=5,
                     byrow=TRUE)





cost_mat_2



#Direcciones  desigualdades de las restricciones ORIGENES.

row_constr_sings_2 <- c("==","==","==","==","==")
row_constr_sings_2

#Coeficeintes de las restricciones oRIGNES.

row_rhs_2 <- c(2000,3000,5000,5000,5000)
row_rhs_2

#Direcciones desigualdades de las restricciones DESTINOS.

col_constr_sings_2 <- c("==","==","==","==","==")
col_constr_sings_2

#Coeficeintes de las restricciones DESTINOS.

col_rhs_2 <-c(5000,5000,1500,1700,1800)
col_rhs_2

#solución óptima

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

#problema de asignacion


#Tipo de nado     Carls  Chris  David  Tony   Ken

#  Dorso          37.7   32.9   33.8   37.0   35.4
#  Pecho          43.4   33.1   42.2   34.7   41.8
#  Mariposa       33.3   28.5   38.9   30.4   33.6
#  libre          29.2   26.4   29.6   28.5   31.1
#  fisticio        0      0      0      0      0



# Variable de desicion

# x1  = tipo de nado dorso por el nadador Carls
# x2  = tipo de nado dorso por el nadador Chris
# x3  = tipo de nado dorso por el nadador David
# x4  = tipo de nado dorso por el nadador Tony
# x5  = tipo de nado dorso por el nadador ken

# x6  = tipo de nado pecho por el nadador Carls
# x7  = tipo de nado pecho por el nadador Chris
# x8  = tipo de nado pecho por el nadador David
# x9  = tipo de nado pecho por el nadador Tony
# x10 = tipo de nado pecho por el nadador ken

# x11 = tipo de nado mariposa por el nadador Carls
# x12 = tipo de nado mariposa por el nadador Chris 
# x13 = tipo de nado mariposa por el nadador David
# x14 = tipo de nado mariposa por el nadador Tony
# x15 = tipo de nado mariposa por el nadador ken

# x16 = tipo de nado libre por el nadador Carls
# x17 = tipo de nado libre por el nadador Chris 
# x18 = tipo de nado libre por el nadador David
# x19 = tipo de nado libre por el nadador Tony
# x20 = tipo de nado libre por el nadador ken

# x21 = tipo de nado fictisio por el nadador Carls
# x22 = tipo de nado fictisio por el nadador Chris 
# x23 = tipo de nado fictisio por el nadador David
# x24 = tipo de nado fictisio por el nadador Tony
# x25 = tipo de nado fictisio por el nadador ken



#De manera resumida podemos definir las 20 variables anteriores mediante una 
#sola expresión. En efecto, para i= dorso, pecho,mariposa,libre 
# y j= Carls, Chris, David, Tony y Ken.

#sea:

#  xij:tipo de nado i, nombre de los concursantes j.


# Modelo matemático completo.

# funsion objetivo

#  min Z =     37.7x1  +  32.9x2  +   33.8x3  +  37.0x4  +  35.4x5  +
#              43.4x6  +  33.1x7  +   42.2x8  +  34.7x9  +  41.8x10 +
#              33.3x11 +  28.5x12 +   38.9x13 +  30.4x14 +  33.6x15 +
#              29.2x16 +  26.4x17 +   29.6x18 +  28.5x19 +  31.1x20 +
#                 0x21 +     0x22 +      0x23 +     0x24 +     0x25

# S.A.

#    x1  + x2  + x3  + x4  + x5  = 1  (restricción de tipos de nado dorso.
#    x6  + x7  + x8  + x9  + x10 = 1  (restricción de tipos de nado pecho).
#    x11 + x12 + x13 + x14 + x15 = 1  (restricción de tipos de nado mariposa).
#    x16 + x17 + x18 + x19 + x20 = 1  (restricción de tipos de nado libre).
#    x1  + x6  + x11 + x16       = 1  (restricción del nadador Carls).
#    x2  + x7  + x12 + x17       = 1  (restricción del nadador Chris).
#    x3  + x8  + x13 + x18       = 1  (restricción del nadador David ).
#    x4  + x9  + x14 + x19       = 1  (restricción del nadador Tony).
#    x5  + x10 + x15 + x20       = 1  (restricción del nadador Ken).
#                  xij=0  o  xij = 1  (posibles valores de las variables).



#Transcribimos el modelo anterior a R. para encontrar el plan optimo

#Matriz de costos


Cost_mat_7<-matrix(c(37.7 , 32.9 , 33.8 , 37.0 , 35.4 ,
                     43.4 , 33.1 , 42.2 , 34.7 , 41.8 ,
                     33.3 , 28.5 , 38.9 , 30.4 , 33.6 ,
                     29.2 , 26.4 , 29.6 , 28.5 , 31.1 ,
                        0 ,    0 ,    0 ,    0 ,    0),
                   ncol = 5,
                   byrow = TRUE)

Cost_mat_7

#resolvemos 

solucion_7<-lp.assign(Cost_mat_7,
                      direction = "min",
                      presolve = 0,
                      compute.sens = 0)

solucion_7$solution

#Valores optimos para las variables de decision. (Plan óptimo de asignación)


# Tipo de nado dorso no es asignado para Carls
#                                                            x1= 0


# Tipo de nado dorso no es asignado para Chris
#                                                            x2= 0


# Tipo de nado dorso  es asignado para David
#                                                            x3= 1


# Tipo de nado dorso no es asignado para Tony
#                                                            x4= 0


# Tipo de nado dorso no es asignado para ken
#                                                            x5= 0

# Tipo de nado pecho no es asignado para Carls
#                                                            x6= 0


# Tipo de nado pecho no es asignado para Chris
#                                                            x7= 0


# Tipo de nado pecho no es asignado para David
#                                                            x8= 0

# Tipo de nado pecho  es asignado para Tony
#                                                            x9= 1


# Tipo de nado pecho no es asignado para ken
#                                                            x10= 0


# Tipo de nado mariposa no es asignado para Carls
#                                                            x11= 0


# Tipo de nado mariposa  es asignado para Chris
#                                                            x12= 1


# Tipo de nado mariposa no es asignado para David
#                                                            x13= 0

# Tipo de nado mariposa no es asignado para Tony
#                                                            x14= 0


# Tipo de nado mariposa no es asignado para ken
#                                                            x15= 0

# Tipo de nado libre es asignado para Carls
#                                                            x16= 1


# Tipo de nado libre no es asignado para Chris
#                                                            x17= 0


# Tipo de nado libre no  es asignado para David
#                                                            x18= 0


# Tipo de nado libre no es asignado para Tony
#                                                            x19= 0


# Tipo de nado libre no es asignado para ken
#                                                            x20= 0

# Tipo de nado fictisio es asignado para Carls
#                                                            x21= 0


# Tipo de nado fictisio no es asignado para Chris
#                                                            x22= 0


# Tipo de nado fictisio no  es asignado para David
#                                                            x23= 0


# Tipo de nado fictisio no es asignado para Tony
#                                                            x24= 0


# Tipo de nado fictisio no es asignado para ken
#                                                            x25= 1

# En resumen:

#David es asignado para el nado tipo dorso
#Tony es asignado para el nado tipo pecho
#Chris es asignado para el nado tipo mariposa
#Carls es asignado para el nado tipo libre
#Ken es asignado para el nado tipo fictisio

solucion_7

#El mejro tiempo es de 126.2








