#         SOLEMNE 2 INVESTIGACION DE OPERACIONES
#
#ALFREDO ANDRES SILVA BURGOS
#18.291.662-5
#
#############EJERCICIO 1###########################
#
#
#  ____________________________________________________________________
# |     |             |             |                |                |
# | MES |INTALACIONES | PRODUCCION  | COSTO UNITARIO | COSTO UNITARIO |    
# |     |PROGRAMADAS  | MAXIMA      | DE PRODUCCION* | DE ALMACENAJE* |  
# |_____|_____________|_____________|________________|________________|
# |     |             |             |                |                |
# |  1  |      10     |     25      |      1.08      |     0.015      |
# |_____|_____________|_____________|________________|________________|
# |     |             |             |                |                |
# |  2  |      15     |     35      |      1.11      |     0.015      | 
# |_____|_____________|_____________|________________|________________|
# |     |             |             |                |                |
# |  3  |      25     |     30      |      1.10      |     0.015      |
# |_____|_____________|_____________|________________|________________|
# |     |             |             |                |                |
# |  4  |      20     |     10      |      1.13      |                |
# |_____|_____________|_____________|________________|________________|
#
#
# a) Formule este problema como uno de transporte.
# b) Obtenga una solución óptima.
# c) Interprete los resultados óptimos obtenidos.

# DESARROLLO:

# a) Formule este problema como uno de transporte.

# Para poder resolver este problema de transporte, debemos acomodar la tabla
# con los costos correspondientes, nuestra tabla queda de la siguiente forma:

#  ________________________________________________________________________________
# |           |                D   E   S   T   I   N   O               |          |
# |      MES  |________________________________________________________|  OFERTA  |   
# |           |    1    |      2      |     3      |    4     |    5   |          |
# |___________|_________|_____________|____________|__________|________|__________|
# |     |     |         |             |            |          |        |          |
# |  O  |  1  |  1.08   |    1.095    |    1.11    |   1.125  |    0   |    25    |
# |     |_____|_________|_____________|____________|__________|________|__________|
# |  R  |     |         |             |            |          |        |          |
# |     |  2  |    M    |    1.11     |    1.125   |   1.14   |    0   |    35    | 
# |  I  |_____|_________|_____________|____________|__________|________|__________|
# |     |     |         |             |            |          |        |          |
# |  G  |  3  |    M    |      M      |     1.1    |   1.115  |    0   |    30    |
# |     |_____|_________|_____________|____________|__________|________|__________|
# |  E  |     |         |             |            |          |        |          |
# |     |  4  |    M    |      M      |      M     |   1.13   |    O   |    10    |
# |  N  |     |         |             |            |          |        |          |
# |_____|_____|_________|_____________|____________|__________|________|__________|
# |           |         |             |            |          |        |          |
# | DEMANDA   |    10   |      15     |      25    |    20    |   30   |    100   | 
# |___________|_________|_____________|____________|__________|________|__________|

# Se genera un nodo destino "mes 5", con una demanda de 30 instalaciones programadas.
# Los costos se deducen de la siguiente forma (en millones de dólares):

# Producción Mes 1 y ocupada mes 1: Costo de producción + Costo de almacenaje= 1.08 +         0 = 1.08
# Producción Mes 1 y ocupada mes 2: Costo de producción + Costo de almacenaje= 1.08 +     0.015 = 1.095
# Producción Mes 1 y ocupada mes 3: Costo de producción + Costo de almacenaje= 1.08 + (2*0.015) = 1.11
# Producción Mes 1 y ocupada mes 4: Costo de producción + Costo de almacenaje= 1.08 + (3*0.015) = 1.125
# Producción Mes 1 y ocupada mes 5: 0 , ya que es un nodo ficticio.

# Producción Mes 2 y ocupada mes 1: M ya que por lógica está condición es imposible.
# Producción Mes 2 y ocupada mes 2: Costo de producción + Costo de almacenaje= 1.11 +         0 = 1.11
# Producción Mes 2 y ocupada mes 3: Costo de producción + Costo de almacenaje= 1.11 +     0.015 = 1.125
# Producción Mes 2 y ocupada mes 4: Costo de producción + Costo de almacenaje= 1.11 + (2*0.015) = 1.14
# Producción Mes 2 y ocupada mes 5: 0 , ya que es un nodo ficticio.

# Producción Mes 3 y ocupada mes 1: M ya que por lógica está condición es imposible.
# Producción Mes 3 y ocupada mes 2: M ya que por lógica está condición es imposible.
# Producción Mes 3 y ocupada mes 3: Costo de producción + Costo de almacenaje= 1.10 +         0 = 1.10
# Producción Mes 3 y ocupada mes 4: Costo de producción + Costo de almacenaje= 1.10 +     0.015 = 1.115
# Producción Mes 3 y ocupada mes 5: 0 , ya que es un nodo ficticio.

# Producción Mes 4 y ocupada mes 1: M ya que por lógica está condición es imposible.
# Producción Mes 4 y ocupada mes 2: M ya que por lógica está condición es imposible.
# Producción Mes 4 y ocupada mes 3: M ya que por lógica está condición es imposible.
# Producción Mes 4 y ocupada mes 4: Costo de producción + Costo de almacenaje= 1.13 +         0 = 1.13
# Producción Mes 4 y ocupada mes 5: 0 , ya que es un nodo ficticio.

# Definición de las variables de decisión.

# x11 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 1.
# x12 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 2.
# x13 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 3.
# x14 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 4.
# x15 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 5.

# x21 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 1.(Condición imposible)
# x22 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 2.
# x23 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 3.
# x24 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 4.
# x25 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 5.

# x31 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 1.(Condición imposible)
# x32 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 2.(Condición imposible)
# x33 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 3.
# x34 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 4.
# x35 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 5.

# x41 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 1.(Condición imposible)
# x42 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 2.(Condición imposible)
# x43 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 3.(Condición imposible)
# x44 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 4.
# x45 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 5.

# De manera resumida podemos definir las 20 variables anteriores mediante una sola expresión. 
#
# En efecto, para i=1,2,3,4 y j=1,2,3,4,5 sea: 

#	xij: cantidad de motores de turbinas producidos en el mes i, que corresponde instalar en el mes j.

# Funcion Objetivo.(Se asigna el costo M a los escenarios imposibles de ocurrir).

#                    MIN Z = 1,08x11 + 1,095x12  +  1,11x13 +  1,125x14  + 0x15 
#                               Mx21 +  1,11x22  + 1,125x23 +   1,14x24  + 0x25
#                               Mx31 +     Mx32  +   1,1x33 +  1,115x34  + 0x35
#                               Mx41 +     Mx42  +     Mx43 +   1,13x44  + 0x45
#                               
# Modelo matemático completo. En base a la definición anterior para las variables de decisión,
# y a la información entregada, matemáticamente el modelo de Programación Lineal a resolver es
# el siguiente:

#                    MIN Z = 1,08x11 + 1,095x12  +  1,11x13 +  1,125x14  + 0x15 
#                               Mx21 +  1,11x22  + 1,125x23 +   1,14x24  + 0x25
#                               Mx31 +     Mx32  +   1,1x33 +  1,115x34  + 0x35
#                               Mx41 +     Mx42  +     Mx43 +   1,13x44  + 0x45

#                   S.A.

#                    x11 + x12 + x13 + x14 + x15  = 25 (Restricción de poducción máxima mes 1).
#                    x21 + x22 + x23 + x24 + x25  = 35 (Restricción de poducción máxima mes 2).
#                    x31 + x32 + x33 + x34 + x35  = 30 (Restricción de poducción máxima mes 3).
#                    x41 + x42 + x43 + x44 + x45  = 10 (Restricción de poducción máxima mes 4).
#                    x11 + x21 + x31 + x41        = 10 (Restricción de instalaciones programadas mes 1).
#                    x12 + x22 + x32 + x42        = 15 (Restricción de instalaciones programadas mes 2).
#                    x13 + x23 + x33 + x43        = 25 (Restricción de instalaciones programadas mes 3).
#                    x14 + x24 + x34 + x44        = 20 (Restricción de instalaciones programadas mes 4).
#                    x15 + x25 + x35 + x45        = 30 (Restricción de instalaciones programadas mes 5).
#                                             xij => 0 (No negatividad de las variables).

# Transcribimos el modelo anterior a R, para encontrar el plan óptimo.

# MATRIZ DE COSTOS:

cost_mat_1 <- matrix(c( 1.08,  1.095,  1.11, 1.125,0,
                        100,   1.11, 1.125,  1.14,0,
                        100,    100,   1.1, 1.115,0,
                        100,    100,   100,  1.13,0), 
                     ncol = 5, 
                     byrow = TRUE)

cost_mat_1

#> cost_mat_1
#         [,1]     [,2]     [,3]  [,4] [,5]
#[1,]    1.08    1.095    1.110 1.125    0
#[2,] 1000.00    1.110    1.125 1.140    0
#[3,] 1000.00 1000.000    1.100 1.115    0
#[4,] 1000.00 1000.000 1000.000 1.130    0

# Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs_1 <- c("==", "==", "==", "==")

row_constr_signs_1

# > row_constr_signs_1
# [1] "==" "==" "==" "=="

# Coeficientes de las restricciones para las filas (oferta)

row_rhs_1 <- c(25, 35, 30, 10)

row_rhs_1

# > row_rhs_1
# [1] 25 35 30 10

# Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs_1 <- c("==", "==", "==", "==","==")

col_constr_signs_1

# > col_constr_signs_1
# [1] "==" "==" "==" "==" "="

# Coeficientes de las restricciones para las columnas (demanda)

col_rhs_1 <- c(10, 15, 25, 20, 30)

col_rhs_1

# > col_rhs_1
# [1] 10 15 25 20 30

#install.packages("lpSolve")
library(lpSolve)

solucion_1 <- lp.transport(cost.mat = cost_mat_1,
                           direction = "min",
                           row.signs = row_constr_signs_1,
                           row.rhs = row_rhs_1,
                           col.signs = col_constr_signs_1,
                           col.rhs = col_rhs_1, 
                           presolve = 0,
                           compute.sens = 0)

solucion_1$solution

# > solucion_1$solution
#    [,1] [,2] [,3] [,4] [,5]
#[1,]   10   10    0    5    0
#[2,]    0    5    0    0   30
#[3,]    0    0   25    5    0
#[4,]    0    0    0   10    0

#  b).- Obtenga una solución óptima.


# El plan óptimo de transporte que minimiza los costos de fabricación y,
# almacenamiento es el siguiente:


# Fabricar 10 motores de turbina en el mes 1 y que sean instalados en el mes 1.

#           X11 = 10
#
# Fabricar 10 motores de turbina en el mes 1, que sean almacenados e instalados en el mes 2.

#           X12 = 10
#
# Fabricar 5 motores de turbina en el mes 1, que sean almacenados e instalados en el mes 4.

#           X14 = 5
#
# Fabricar 5 motores de turbina en el mes 2, que sean almacenados e instalados en el mes 2.

#           X22 = 5
#
# Fabricar 30 motores de turbina en el mes 2, que sean almacenados e instalados en el mes 5.
# (Estos motores de turbina va a un nodo ficticio, por lo tanto no es necesario fabricarlos,
#  ya que no se ocuparán).

#           X25 = 30
#
# Fabricar 25 motores de turbina en el mes 3, que sean almacenados e instalados en el mes 3.

#           X33 = 25
#
# Fabricar 5 motores de turbina en el mes 3, que sean almacenados e instalados en el mes 4.

#           X34 = 5
#
# Fabricar 10 motores de turbina en el mes 4, que sean almacenados e instalados en el mes 4.

#           X44 = 10
#

# El costo mínimo asociado a este plan de transporte es de  77,3 millones de dólares:

#               Z* =  77,3 millones de dólares.
solucion_1

# > solucion_1
# Success: the objective function is 77.3

#  c).- Interprete los resultados.

# Para que el gerente de producción obtenga la mejor programación del número de
# de turbinas y que minimice los costos de producción y almacenamiento,
# debe seguir el siguiente plan:
#
#
#       - En el mes 1, debe producir 10 motores de turbina e instalarlos dentro del mismo mes 1.
#         Esta producción es por un costo total de = 10.8 millones de dólares.

#       - En el mes 1, debe producir 10 motores de turbina, almacenarlos e instalarlos dentro del
#         mes 2. Esta producción y almacenamiento es por un costo total de = 10.95 millones de dólares.

#       - En el mes 1, debe producir 5 motores de turbina, almacenarlos e instalarlos dentro del
#         mes 4. Esta producción y almacenamiento es por un costo total de = 5.625 millones de dólares.

#       - En el mes 2, debe producir 5 motores de turbina e instalarlos dentro del mismo mes 2.
#         Esta producción es por un costo total de = 5.55 millones de dólares.

#       - En el mes 3, debe producir 25 motores de turbina e instalarlos dentro del mismo mes 3.
#         Esta producción es por un costo total de = 27.5 millones de dólares.

#       - En el mes 3, debe producir 5 motores de turbina e instalarlos dentro del mismo mes 4.
#         Esta producción es por un costo total de = 5.575 millones de dólares.

#       - En el mes 4, debe producir 10 motores de turbina e instalarlos dentro del mismo mes 4.
#         Esta producción es por un costo total de = 11.3 millones de dólares.

# Lo que nos lleva a costo total de producción y almacenamiento de:  77.3 millones de dólares. 
# Que es el mínimo costo asociado al plan de transporte mencionado. 

# Cabe mencionar que dentro del mes 2, existen 30 motores de turbinas que no son fabricados,
# porque no existe demanda para dichos motores. Se debe evaluar en un futuro si se pueden
# vender esos motores o aumentar la demanda de motores.

##############EJERCICIO 2##############################

#
#                   F    G     C      D      E    | Oferta
#                                                 |
#           A      5     8   1000   1000    1000  | 2000  
#           B      3    11   1000   1000    1000  | 3000   
#           F   1000     4     14     11      12  | 5000  
#           G      4  1000     13     13      10  | 5000  
#             ------------------------------------------       
#     Demanda   5000  5000   1500   1700   1800   15000

# a) Formule matemáticamente este problema de Asignación, definiendo las variables de decisión, la función objetivo y las restricciones
#                          
# xAF : costo de transporte de maquinas de coser enviadas desde la planta  A al almacen F semanalmente .
# xAG : costo de transporte de maquinas de coser enviadas desde la planta  A al almacen G semanalmente.
# xBF : costo de transporte de maquinas de coser enviadas desde la planta  B al almacen F semanalmente.
# xBG : costo de transporte de maquinas de coser enviadas desde la planta  B al almacen G semanalmente.
# 
# xFG : costo de transporte de maquinas de coser enviadas del almacen F al almacen G semanalmente.
# xGF : costo de transporte de maquinas de coser enviadas del almacen G al almacen F semanalmente.
#
# xFC : costo de transporte de maquinas de coser enviadas del almacen F al distribuidor C semanalmente.
# xFD : costo de transporte de maquinas de coser enviadas del almacen F al distribuidor D semanalmente.
# xFE : costo de transporte de maquinas de coser enviadas del almacen F al distribuidor E semanalmente.
#
# xGC : costo de transporte de maquinas de coser enviadas del almacen G al distribuidor C semanalmente.
# xGD : costo de transporte de maquinas de coser enviadas del almacen G al distribuidor D semanalmente.
# xGE : costo de transporte de maquinas de coser enviadas del almacen G al distribuidor E semanalmente.
#
#   Modelo Matematico completo :
#
# FUNCIÓN OBJETIVO      

# Min Z =   5xAF + 8xAG  + MXAC  + MXAD  + MXAE   
#         + 3xBF + 11xBG + MXBC  + MXBD  + MXBE  
#         + 0xFF + 4xFG  + 14xFC + 11xFD + 12xFE 
#         + 4XGF + 0XGG  + 13xGC + 13xGD + 10xGE
# 

# Sujeto a 
#
# Restricciones de Oferta

# xAF + xAG  + XAC  + XAD  + XAE <= 2000  (Restriccion de capacidad de producion de maquinas de coser que entrega la planta A)
# xBF + xBG  + XBC  + XBD  + XBE <= 3000  (Restriccion de capacidad de producion de maquinas de coser que entrega la planta b)
# xFF + xFG  + xFC  + xFD  + xFE  <= 5000 (Restriccion de capacidad de almacenamiento  de maquinas de coser del almacen f  a la distribuidores C, D,E Y ALMACEN G )
# XGF + XGG  + xGC  + xGD  + xGE  <= 5000 (Restriccion de capacidad de almacenamiento  de maquinas de coser del almacen G  a la distribuidores C, D,E Y ALMACEN F )
#
# Restricciones de Demanda
#
# xAF  + xBF  + xFF + XGF >= 5000 ( Restriccion de demanda semanal del  almacen F) 
# xAG  + xBG  + xFG + XGG >= 5000 ( Restriccion de demanda semanal del  almacen G) 
# XAC  + XBC  + xFC + xGC >= 1500 ( Restriccion de demanda semanal que se le entrega al distribuidor c) 
# XAD  + XBD  + xFD + xGD >= 1700 ( Restriccion de demanda semanal que se le entrega al distribuidor D)
# XAE  + XBE  + xFE + xGE >= 1800 ( Restriccion de demanda semanal que se le entrega al distribuidor E)
#                     

# Matriz de Costos


cost_mat_1 <- matrix(c( 5,  8, 1000, 1000, 1000,
                        3, 11, 1000, 1000, 1000,
                        1000,  4,   14,   11,   12,
                        4, 1000, 13,   13,   10 ), ncol = 5, byrow = TRUE)

cost_mat_1

row_rhs_2 <- c(2000, 3000,5000,5000)

row_constr_signs_2 <- c("<=", "<=", "<=", "<=")

col_rhs_2 <- c(5000,5000,1500 ,1700,1800)

col_constr_signs_2 <- c(">=", ">=", ">=", ">=", ">=")


solucion_2 <- lp.transport (cost.mat = cost_mat_1,
                            direction = "min",
                            row.signs = row_constr_signs_2,
                            row.rhs = row_rhs_2,
                            col.signs = col_constr_signs_2,
                            col.rhs = col_rhs_2, 
                            presolve = 0,
                            compute.sens = 0 )


solucion_2["solution"]
solucion_2


#> solucion_2["solution"]
#$solution

#Valores optimos para las variables de decision. (Plan óptimo de asignación)

#[,1] [,2] [,3] [,4] [,5]
#[1,] 2000    0    0    0    0  Cantidad total de productos de la Planta A hacia el Almacen F Semanalmente
#[2,] 3000    0    0    0    0  Cantidad total de Productos de la Planta B hacia el Almacen F Semanalmente
#[3,]    0 5000    0    0    0  Cantidad total de Productos del Almacen F hacia el Almacen G Semanalmente 
#[4,]    0    0 1500 1700 1800  Cantidad de productos del almacen G a los distribuidores C = 1500 maquinas de coser ,D = 1700 maquinas de coser , E = 1800 maquinas de coser semanalmente .

#> solucion_2
#Success: the objective function is 98600, el costo minimo asociado al transporte de los productos es de $98600 semanalmente.  
#
#
###########EJRRCICIO 3###################################
#
#
#  _______________________________________________________
# |               |           NADADORES                  |
# |   TIPO DE     |______________________________________|           
# |     NADO      | CARL  | CHRIS | DAVID | TONY  | KEN  |  
# |_______________|_______|_______|_______|_______|______|
# |               |       |       |       |       |      |
# |     DORSO     | 37,7  | 32,9  | 33,8  | 37,0  | 35,4 |
# |_______________|_______|_______|_______|_______|______|
# |               |       |       |       |       |      |
# |     PECHO     | 43,4  | 33,1  | 42,2  | 34,7  | 41,8 |
# |_______________|_______|_______|_______|_______|______|
# |               |       |       |       |       |      |
# |   MARIPOSA    | 33,3  | 28,5  | 38,9  | 30,4  | 33,6 |
# |_______________|_______|_______|_______|_______|______|
# |               |       |       |       |       |      |
# |    LIBRE      | 29,2  | 26,4  | 29,6  | 28,5  | 31,1 |
# |_______________|_______|_______|_______|_______|______|
#
#
# DESARROLLO:

# Como es un problema de asignación, debe estar equilibrado,
# por lo tanto se debe crear un nodo ficticio de un quinto estilo
# de nado (oferta), para satisfacer los 5 nadadores disponibles (demanda)

# Nuestro problema quedaría de la sigueinte manera:

#  _______________________________________________________
# |               |           NADADORES                  |
# |   TIPO DE     |______________________________________|           
# |     NADO      | CARL  | CHRIS | DAVID | TONY  | KEN  |  
# |_______________|_______|_______|_______|_______|______|
# |               |       |       |       |       |      |
# |     DORSO     | 37,7  | 32,9  | 33,8  | 37,0  | 35,4 |
# |_______________|_______|_______|_______|_______|______|
# |               |       |       |       |       |      |
# |     PECHO     | 43,4  | 33,1  | 42,2  | 34,7  | 41,8 |
# |_______________|_______|_______|_______|_______|______|
# |               |       |       |       |       |      |
# |   MARIPOSA    | 33,3  | 28,5  | 38,9  | 30,4  | 33,6 |
# |_______________|_______|_______|_______|_______|______|
# |               |       |       |       |       |      |
# |    LIBRE      | 29,2  | 26,4  | 29,6  | 28,5  | 31,1 |
# |_______________|_______|_______|_______|_______|______|
# |               |       |       |       |       |      |
# |    FICTICIO   |   0   |   0   |   0   |   0   |   0  |
# |_______________|_______|_______|_______|_______|______|

#  a).- Formule este problema como uno de asignación.
#       


# Definición de las variables de decisión. 


# x11 : Estilo de nado DORSO asignado a nadador CARL.
# x12 : Estilo de nado DORSO asignado a nadador CHRIS.
# x13 : Estilo de nado DORSO asignado a nadador DAVID.
# x14 : Estilo de nado DORSO asignado a nadador TONY.
# x15 : Estilo de nado DORSO asignado a nadador KEN.

# x21 : Estilo de nado PECHO asignado a nadador CARL.
# x22 : Estilo de nado PECHO asignado a nadador CHRIS. 
# x23 : Estilo de nado PECHO asignado a nadador DAVID.
# x24 : Estilo de nado PECHO asignado a nadador TONY.
# x25 : Estilo de nado PECHO asignado a nadador KEN.

# x31 : Estilo de nado MARIPOSA asignado a nadador CARL.
# x32 : Estilo de nado MARIPOSA asignado a nadador CHRIS.
# x33 : Estilo de nado MARIPOSA asignado a nadador DAVID.
# x34 : Estilo de nado MARIPOSA asignado a nadador TONY.
# x35 : Estilo de nado MARIPOSA asignado a nadador KEN.

# x41 : Estilo de nado LIBRE asignado a nadador CARL.
# x42 : Estilo de nado LIBRE asignado a nadador CHRIS.
# x43 : Estilo de nado LIBRE asignado a nadador DAVID.
# x44 : Estilo de nado LIBRE asignado a nadador TONY.
# x45 : Estilo de nado LIBRE asignado a nadador KEN.

# x51 : Estilo de nado FICTICIO asignado a nadador CARL.
# x52 : Estilo de nado FICTICIO asignado a nadador CHRIS.
# x53 : Estilo de nado FICTICIO asignado a nadador DAVID.
# x54 : Estilo de nado FICTICIO asignado a nadador TONY.
# x55 : Estilo de nado FICTICIO asignado a nadador KEN.

# De manera resumida podemos definir las 25 variables anteriores mediante una sola expresión. 
#
# En efecto, para i=1,2,3,4,5 y j=1,2,3,4,5 sea: 

#	xij: estilo de nado i, que corresponde al nadador j.


# Funcion Objetivo.

#                    MIN Z = 37,7x11 + 32,9x12  + 33,8x13 + 37,0x14  + 35,4x15 
#                            43,4x21 + 33,1x22  + 42,2x23 + 34,7x24  + 41,8x25
#                            33,3x31 + 28,5x32  + 38,9x33 + 30,4x34  + 33,6x35
#                            29,2x41 + 26,4x42  + 29,6x43 + 28,5x44  + 31,1x45
#                               0x51 +    0x52  +    0x53 +    0x54  +    0x55


# Modelo matemático completo. En base a la definición anterior para las variables de decisión,
# y a la información entregada, matemáticamente el modelo de Programación Lineal a resolver es
# el siguiente:

#                    MIN Z = 37,7x11 + 32,9x12  + 33,8x13 + 37,0x14  + 35,4x15 
#                            43,4x21 + 33,1x22  + 42,2x23 + 34,7x24  + 41,8x25
#                            33,3x31 + 28,5x32  + 38,9x33 + 30,4x34  + 33,6x35
#                            29,2x41 + 26,4x42  + 29,6x43 + 28,5x44  + 31,1x45
#                               0x51 +    0x52  +    0x53 +    0x54  +    0x55


#                   S.A.

#                    x11 + x12 + x13 + x14 + x15  = 1 (Restricción del estilo de nado DORSO).
#                    x21 + x22 + x23 + x24 + x25  = 1 (Restricción del estilo de nado PECHO).
#                    x31 + x32 + x33 + x34 + x35  = 1 (Restricción del estilo de nado MARIPOSA).
#                    x41 + x42 + x43 + x44 + x45  = 1 (Restricción del estilo de nado LIBRE).
#                    x51 + x52 + x53 + x54 + x55  = 1 (Restricción del estilo de nadp FICTICIO).
#                    x11 + x21 + x31 + x41 + x51  = 1 (Restricción del nadador CARL).
#                    x12 + x22 + x32 + x42 + x52  = 1 (Restricción del nadador CHRIS).
#                    x13 + x23 + x33 + x43 + x53  = 1 (Restricción del nadador DAVID).
#                    x14 + x24 + x34 + x44 + x54  = 1 (Restricción del nadador TONY).
#                    x15 + x25 + x35 + x45 + x55  = 1 (Restricción del nadador KEN).
#                             xij = 0 o xij = 1 (Posibles valores de las varriables).

# Transcribimos el modelo anterior a R, para encontrar el plan óptimo.

# MATRIZ DE TIEMPOS:


cost_mat_3 <- matrix(c(   37.7,  32.9, 33.8,  37.0, 35.4,
                          43.4,  33.1, 42.2,  34.7, 41.8,
                          33.3,  28.5, 38.9,  30.4, 33.6,
                          29.2,  26.4, 29.6,  28.5, 31.1,
                          0,     0,    0,     0,    0), 
                     ncol = 5, 
                     byrow = TRUE)

cost_mat_3

#> cost_mat_3
#     [,1] [,2] [,3] [,4] [,5]
#[1,] 37.7 32.9 33.8 37.0 35.4
#[2,] 43.4 33.1 42.2 34.7 41.8
#[3,] 33.3 28.5 38.9 30.4 33.6
#[4,] 29.2 26.4 29.6 28.5 31.1
#[5,]  0.0  0.0  0.0  0.0  0.0


#install.packages("lpSolve")
library(lpSolve)

solucion3 <- lp.assign (cost.mat = cost_mat_3, 
                        direction = "min", 
                        presolve = 0, 
                        compute.sens = 0)

solucion3$solution

#> solucion3$solution
#      [,1] [,2] [,3] [,4] [,5]
#[1,]    0    0    1    0    0
#[2,]    0    0    0    1    0
#[3,]    0    1    0    0    0
#[4,]    1    0    0    0    0
#[5,]    0    0    0    0    1

#  b).- Obtenga una solución óptima.


# El plan óptimo de asignación que minimiza la suma de los tiempos de los nadadores,
# es el siguiente:


#       - El estilo de nada DORSO NO es asignado al nadador CARL.
#
#               X11 = 0
#
#       - El estilo de nada DORSO NO es asignado al nadador CHRIS.
#
#               X12 = 0
#
#       - El estilo de nada DORSO SI es asignado al nadador DAVID.
#
#               X13 = 1
#
#       - El estilo de nada DORSO NO es asignado al nadador TONY.
#
#               X14 = 0
#
#       - El estilo de nada DORSO NO es asignado al nadador KEN.
#
#               X15 = 0
#
#       - El estilo de nada PECHO NO es asignado al nadador CARL.
#
#               X21 = 0
#
#       - El estilo de nada PECHO NO es asignado al nadador CHRIS.
#
#               X22 = 0
#
#       - El estilo de nada PECHO NO es asignado al nadador DAVID.
#
#               X23 = 0
#
#       - El estilo de nada PECHO SI es asignado al nadador TONY.
#
#               X24 = 1
#
#       - El estilo de nada PECHO NO es asignado al nadador KEN.
#
#               X25 = 0
#
#       - El estilo de nada MARIPOSA NO es asignado al nadador CARL.
#
#               X31 = 0
#
#       - El estilo de nada MARIPOSA SI es asignado al nadador CHRIS.
#
#               X32 = 1
#
#       - El estilo de nada MARIPOSA NO es asignado al nadador DAVID.
#
#               X33 = 0
#
#       - El estilo de nada MARIPOSA NO es asignado al nadador TONY.
#
#               X34 = 0
#
#       - El estilo de nada MARIPOSA NO es asignado al nadador KEN.
#
#               X35 = 0
#
#       - El estilo de nada LIBRE SI es asignado al nadador CARL.
#
#               X41 = 1
#
#       - El estilo de nada LIBRE NO es asignado al nadador CHRIS.
#
#               X42 = 0
#
#       - El estilo de nada LIBRE NO es asignado al nadador DAVID.
#
#               X43 = 0
#
#       - El estilo de nada LIBRE NO es asignado al nadador TONY.
#
#               X44 = 0
#
#       - El estilo de nada LIBRE NO es asignado al nadador KEN.
#
#               X55 = 0
#
# El tiempo mínimo asociado a este plan de asignación es de  126,2 segundos:

#               Z* =  126,2 segundos.

solucion3 

#Success: the objective function is 126.2 

#  c).- Interprete los resultados.

# Para que el entrenador del equipo de natación pueda minimizar los tiempos
# y asignar de la mejor manera los competidores en la prueba de 200 metros
# de relevo combinado, debe seguir el siguiente plan:
#
#   Para garantizar que los tiempos de los nadadores Carl, Chris, David, Tony y sin contar a Ken sea 126.2 segundos en total se deben asignar de la siguiente forma a sus tipos de nado:      
#
#   El nadador Carl es asignado al tipo de nado Libre con un tiempo de 29.2 segundos.
#   El nadador Chris es asignado al tipo de nado Mariposa con un tiempo de 28.5 segundos.
#   El nadador David es asignado al tipo de nado Dorso con un tiempo de 33.8 segundos.
#   El nadado Tony es asignado al tipo de nado Pecho con un tiempo de 34.7 segundos.
#
#   Lo que al sumar los tiempos de los Nadadores con sus respectivos tipos de nado son 126.2 segundos en total.
#







