#
# Ivan Vidal Sepulveda - TALLER 3
#
#

#-----------------EJERCICIO 1-----------------------#


#
#             Beneficios Por unidad
#                   Destinos
#              [,1] [,2] [,3] [,4] Oferta
#        [1,]   80  100   85   90  1500
#        [2,]   95   85   80  100  1500
#        [3,]   90   80   95   90  1500
#        [4,]    0    0    0    0  200
#   Demanda     1000 1200 1500 1000
#
#
#
# x11=Beneficios producidos por planta A1 a destino 1
# x12=Beneficios producidos por planta A1 a destino 2
# x13=Beneficios producidos por planta A1 a destino 3
# x14=Beneficios producidos por planta A1 a destino 4
# x21=Beneficios producidos por planta A2 a destino 1
# x22=Beneficios producidos por planta A2 a destino 2
# x23=Beneficios producidos por planta A2 a destino 3
# x24=Beneficios producidos por planta A2 a destino 4
# x31=Beneficios producidos por planta A3 a destino 1
# x32=Beneficios producidos por planta A3 a destino 2
# x33=Beneficios producidos por planta A3 a destino 3
# x34=Beneficios producidos por planta A3 a destino 4
# x41=Beneficios producidos por planta ficticia a destino 1
# x42=Beneficios producidos por planta ficticia a destino 2
# x43=Beneficios producidos por planta ficticia a destino 3
# x44=Beneficios producidos por planta ficticia a destino 4
#
#
# xij: Beneficios a producir en la planta i, y enviarlos al destino j

# A) Formule este problema como uno de transporte.
#
#    MaxZ= 80x12 + 100x12 + 85x13 + 90x14
#          95x21 + 85x22 + 80x23 + 100x24
#          90x31 + 80x32 + 95x33 + 90x34 
#          0x41 + 0x42 + 0x43 + 0x44
#
#   S.A
#          x11 + x12 + x13 + x14 = 1500  Capacidad de produccion Planta A1
#          x21 + x22 + x23 + x24 = 1500  Capacidad de produccion Planta A2
#          x31 + x32 + x33 + x34 = 1500  Capacidad de produccion Planta A3
#          x41 + x42 + x43 + x44 = 200   Capacidad de produccion Planta Ficticia
#          x11 + x21 + x31 + x41 = 1000  Demanda Cliente Mayorista 1
#          x12 + x22 + x32 + x42 = 1200  Demanda Cliente Mayorista 2
#          x13 + x23 + x33 + x43 = 1500  Demanda Cliente Mayorista 3
#          x14 + x24 + x34 + x44 = 1000  Demanda Cliente Mayorista 4
#  

library(lpSolve)

cost_mat_1 <- matrix(c(80,100,85,90,
                       95,85,80,100,
                       90,80,95,90,
                       0,0,0,0),
                     ncol=4,
                     byrow=TRUE)

cost_mat_1


#Direcciones de las desigualdades de las restricciones (ORIGENES)

row_constr_sings_1 <- c("==","==","==","==")
row_constr_sings_1

#Coeficeintes de las restricciones (ORIGNES)
row_rhs_1 <- c(1500,1500,1500,200)
row_rhs_1
#Direcciones de las desigualdades de las restricciones (DESTINOS)
col_constr_sings_1 <- c("==","==","==","==")
col_constr_sings_1
#Coeficeintes de las restricciones (DESTINOS)
col_rhs_1 <-c(1000,1200,1500,1000)
col_rhs_1

# Obtenga una solución óptima.

sol_1 <-lp.transport(cost.mat = cost_mat_1,
                     direction = "max",
                     row.signs = row_constr_sings_1,
                     row.rhs = row_rhs_1,
                     col.signs = col_constr_sings_1,
                     col.rhs = col_rhs_1,
                     presolve=0,
                     compute.sens=0)

sol_1$solution

#     [,1] [,2] [,3] [,4]
# [1,]    0 1200    0  300
# [2,]  800    0    0  700
# [3,]    0    0 1500    0
# [4,]  200    0    0    0

# c) Interprete los resultados óptimos obtenidos.
#
# Cantidad de produccion de Planta A1 al cliente 1
#  x12= 1200
#
# Cantidad de produccion de Planta A1 al cliente 4
#  x14= 300
#
# Cantidad de produccion de Planta A2 al cliente 1
#  x21= 800
#
# Cantidad de produccion de Planta A2 al cliente 4
#  x24= 700
#
# Cantidad de produccion de Planta A3 al cliente 3
#  x33= 1500
#
# Cantidad de produccion de Planta ficticia al cliente 1
#  x41= 200
#


sol_1

# Success: the objective function is 435500 

# El valor optimo de transporte descrito anterioremente,  
# tiene un costo asociado de 435500  U/M