#         SOLEMNE 2
#         INVESTIGACION DE OPERACIONES



#         HUMBERTO MUÑOZ

# EJERCICIO 1

# La NORTHERN AIRPLANE COMPANY construye aviones comerciales para varias líneas aéreas 
# de todo el mundo. La última etapa del proceso de producción consiste en fabricar las 
# turbinas de jet e instalarlas (una operación muy rápida) en la estructura del avión 
# terminado. La compañía tiene varios contratos de trabajo que la obligan a entregar un 
# número considerable de aviones en un futuro cercano y en este momento debe programar 
# la producción de motores de turbina para los próximos cuatro meses.

# En la segunda columna de la tabla se indica la cantidad de motores que debe estar lista 
# para su instalación a fin de cumplir con las fechas de entrega contratadas. De ella se 
# desprende que el número acumulado de motores que deben producirse al final de los meses 
# 1, 2, 3 y 4 debe ser por lo menos de 10, 25, 50 y 70 unidades, respectivamente.

# Las instalaciones disponibles para producir las turbinas varían de acuerdo con otros 
# programas de producción, mantenimiento y renovación durante el periodo. Las diferencias 
# mensuales debidas al número máximo que se puede producir y el costo unitario de producción
# (en millones de dólares) se presentan en la tercera y cuarta columnas de la tabla.

# Dadas las variaciones de los costos de producción, podría valer la pena fabricar algunas
# turbinas uno o más meses antes de su fecha de instalación; en la actualidad se estudia
# esta posibilidad. El inconveniente es que esas turbinas deberán almacenarse hasta que
# sean instaladas, pues la estructura de los aviones no estará lista antes. El costo de
# almacenamiento de cada turbina es de 15 mil dólares por mes, como se muestra en la última
# columna de la tabla. 

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

# *El costo está expresado en millones de dólares.

# El gerente de producción quiere desarrollar la programación del número de turbinas
# que se deben fabricar en cada uno de los cuatro meses, de manera que se minimicen 
# los costos totales de producción y almacenamiento.

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

# Producción Mes 1 y ocupada mes 1: Costo de producción 		                        = 1.08
# Producción Mes 1 y ocupada mes 2: Costo de producción + Costo de almacenaje= 1.08 +     0.015 = 1.095
# Producción Mes 1 y ocupada mes 3: Costo de producción + Costo de almacenaje= 1.08 + (2*0.015) = 1.11
# Producción Mes 1 y ocupada mes 4: Costo de producción + Costo de almacenaje= 1.08 + (3*0.015) = 1.125
# Producción Mes 1 y ocupada mes 5: 0 , ya que es un nodo ficticio.

# Producción Mes 2 y ocupada mes 1: M ya que por lógica está condición es imposible.
# Producción Mes 2 y ocupada mes 2: Costo de producción + Costo de almacenaje= 1.11             = 1.11
# Producción Mes 2 y ocupada mes 3: Costo de producción + Costo de almacenaje= 1.11 +     0.015 = 1.125
# Producción Mes 2 y ocupada mes 4: Costo de producción + Costo de almacenaje= 1.11 + (2*0.015) = 1.14
# Producción Mes 2 y ocupada mes 5: 0 , ya que es un nodo ficticio.

# Producción Mes 3 y ocupada mes 1: M ya que por lógica está condición es imposible.
# Producción Mes 3 y ocupada mes 2: M ya que por lógica está condición es imposible.
# Producción Mes 3 y ocupada mes 3: Costo de producción + Costo de almacenaje= 1.10             = 1.10
# Producción Mes 3 y ocupada mes 4: Costo de producción + Costo de almacenaje= 1.10 +     0.015 = 1.115
# Producción Mes 3 y ocupada mes 5: 0 , ya que es un nodo ficticio.

# Producción Mes 4 y ocupada mes 1: M ya que por lógica está condición es imposible.
# Producción Mes 4 y ocupada mes 2: M ya que por lógica está condición es imposible.
# Producción Mes 4 y ocupada mes 3: M ya que por lógica está condición es imposible.
# Producción Mes 4 y ocupada mes 4: Costo de producción + Costo de almacenaje= 1.13             = 1.13
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

#                    MIN Z = 1,08x11 + 1,095x12  +  1,11x13 +  1,125x14  + 0x15 +
#                               Mx21 +  1,11x22  + 1,125x23 +   1,14x24  + 0x25 +
#                               Mx31 +     Mx32  +   1,1x33 +  1,115x34  + 0x35 +
#                               Mx41 +     Mx42  +     Mx43 +   1,13x44  + 0x45
#                               
# Modelo matemático completo. En base a la definición anterior para las variables de decisión,
# y a la información entregada, matemáticamente el modelo de Programación Lineal a resolver es
# el siguiente:

#                    MIN Z = 1,08x11 + 1,095x12  +  1,11x13 +  1,125x14  + 0x15 +
#                               Mx21 +  1,11x22  + 1,125x23 +   1,14x24  + 0x25 +
#                               Mx31 +     Mx32  +   1,1x33 +  1,115x34  + 0x35 +
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


# El plan óptimo de producción que minimiza los costos de fabricación y,
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

# El tiempo costo mínimo asociado a este plan de producción es de  77,3 millones de dólares:

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

#================================================================================================================================================================
#================================================================================================================================================================
#================================================================================================================================================================
#================================================================================================================================================================


# EJERCICIO 2

# Electromaquinas Ltda. produce máquinas de coser en dos plantas ubicadas en A y B; en las cuales
# hay una capacidad de producción semanal de 2.000 y 3.000 máquinas respectivamente. El producto 
# es comercializado por tres distribuidores ubicados en C, D y E; en los cuales se ha establecido 
# una demanda de 1.500, 1.700 y 1.800 máquinas de coser por semana. Además, se sabe que para llevar
# el producto a los distribuidores, se debe enviar a través de dos almacenes temporales ubicados
# en F y G, y que no se puede enviar producto directamente desde las plantas a los distribuidores.
# El costo de transporte de cada máquina se ha evaluado de la siguiente forma: de A a F $5, de A a G $8,
# de B a F $3, de B a G $11, de F a G y viceversa $4,de F a C $14, de F a D $11, de F a E $12, 
# de G a C $13, de G a D $13 y de G a E $10.

# ¿Cuál es el plan óptimo de envíos que minimiza los costos de la operación? No olvide definir,
# formular matemáticamente, resolver e interpretar.

# Tenga en consideración que: como no se puede enviar producto directamente desde las plantas
# a los distribuidores, los nodos destinos no pueden ser origenes, y los nodos orígenes no 
# pueden ser destino.

# DESARROLLO:

# Como es un problema de transbordo, se debe traspasar a un problema de transporte de la 
# siguiente manera:

# Paso 1=Establecer la cantidad de reserva.
# Suma de ofertas= Oferta A + Oferta B = 2.000 + 3.000 = 5.000.
# Suma de Demandas= Demanda C + Demanda D + Demanda E = 1.500 + 1.700 + 1.800= 5.000.
# Por lo tanto la cantidad de reserva es: R = 5.000.

# PASO 2. A la oferta de cada origen y la demanda de cada destino se le suma la cantidad
# de reserva R = 5.000.
# Las ofertas quedan así: A = 7.000 y B = 8.000.
# Las demandas quedan así: C = 6.500 , D = 6.700 , E = 6.800.

# PASO 3. Colocar todos los destinos como orígenes asignándole una oferta igual a
# la cantidad de reserva R. Quedan con una oferta de 5.000 unidades.

# PASO 4. Colocar todos los orígenes como destinos asignándole una demanda igual 
# a la cantidad de reserva R. Quedan con una demanda de 5.000 unidades.

# PASO 5. Establecer las condiciones de equilibrio entre oferta y demanda tal 
# como se hace en el modelo del transporte.

# Nuestra tabla de ofertas, demandas y costos queda de la siguiente manera:

#  _______________________________________________________________________________
# |           |       D   I   T   R   I   B   U   I   D   O   R       |          |
# | PLANTAS   |_______________________________________________________|  OFERTA  |   
# |           |   A   |   B   |   C   |   D   |   E   |   F   |   G   |          |
# |___________|_______|_______|_______|_______|_______|_______|_______|__________|   
# |     |     |       |       |       |       |       |       |       |          |
# |  O  |  A  |   0   |   M   |   M   |   M   |   M   |   5   |   8   |   7000   |
# |     |_____|_______|_______|_______|_______|_______|_______|_______|__________|
# |  R  |     |       |       |       |       |       |       |       |          |
# |     |  B  |   M   |   0   |   M   |   M   |   M   |   3   |   11  |   8000   |
# |  I  |_____|_______|_______|_______|_______|_______|_______|_______|__________|
# |     |     |       |       |       |       |       |       |       |          |
# |  G  |  C  |   M   |   M   |   0   |   M   |   M   |   M   |   M   |   5000   |
# |     |_____|_______|_______|_______|_______|_______|_______|_______|__________|
# |  E  |     |       |       |       |       |       |       |       |          |
# |     |  D  |   M   |   M   |   M   |   0   |   M   |   M   |   M   |   5000   | 
# |  N  |_____|_______|_______|_______|_______|_______|_______|_______|__________|
# |     |     |       |       |       |       |       |       |       |          |
# |  E  |  E  |   M   |   M   |   M   |   M   |   0   |   M   |   M   |   5000   |
# |     |_____|_______|_______|_______|_______|_______|_______|_______|__________|
# |  S  |     |       |       |       |       |       |       |       |          |     
# |     |  F  |   M   |   M   |   14  |   11  |   12  |   0   |   4   |   5000   |
# |     |_____|_______|_______|_______|_______|_______|_______|_______|__________|
# |     |     |       |       |       |       |       |       |       |          |
# |     |  G  |   M   |   M   |   13  |   13  |   10  |   4   |   0   |   5000   |
# |_____|_____|_______|_______|_______|_______|_______|_______|_______|__________|
# |           |       |       |       |       |       |       |       |          |
# | DEMANDA   |  5000 | 5000  | 6500  | 6700  | 6800  | 5000  | 5000  |   40000  | 
# |___________|_______|_______|_______|_______|_______|_______|_______|__________|


# Definición de las variables de decisión. Sean las siguientes las variables de decisión 
# del problema transformado: 

# x11 : Cantidad de maquinas coser producidas semanalmente por origen A enviadas al destino A.  
# x12 : Cantidad de maquinas coser producidas semanalmente por origen A enviadas al destino B.
# x13 : Cantidad de maquinas coser producidas semanalmente por origen A enviadas al destino C.
# x14 : Cantidad de maquinas coser producidas semanalmente por origen A enviadas al destino D.
# x15 : Cantidad de maquinas coser producidas semanalmente por origen A enviadas al destino E.
# x16 : Cantidad de maquinas coser producidas semanalmente por origen A enviadas al destino F.
# x17 : Cantidad de maquinas coser producidas semanalmente por origen A enviadas al destino G.

# x21 : Cantidad de maquinas coser producidas semanalmente por origen B enviadas al destino A.  
# x22 : Cantidad de maquinas coser producidas semanalmente por origen B enviadas al destino B.
# x23 : Cantidad de maquinas coser producidas semanalmente por origen B enviadas al destino C.
# x24 : Cantidad de maquinas coser producidas semanalmente por origen B enviadas al destino D.
# x25 : Cantidad de maquinas coser producidas semanalmente por origen B enviadas al destino E.
# x26 : Cantidad de maquinas coser producidas semanalmente por origen B enviadas al destino F.
# x27 : Cantidad de maquinas coser producidas semanalmente por origen B enviadas al destino G.

# x31 : Cantidad de maquinas coser producidas semanalmente por origen C enviadas al destino A.  
# x32 : Cantidad de maquinas coser producidas semanalmente por origen C enviadas al destino B.
# x33 : Cantidad de maquinas coser producidas semanalmente por origen C enviadas al destino C.
# x34 : Cantidad de maquinas coser producidas semanalmente por origen C enviadas al destino D.
# x35 : Cantidad de maquinas coser producidas semanalmente por origen C enviadas al destino E.
# x36 : Cantidad de maquinas coser producidas semanalmente por origen C enviadas al destino F.
# x37 : Cantidad de maquinas coser producidas semanalmente por origen C enviadas al destino G.

# x41 : Cantidad de maquinas coser producidas semanalmente por origen D enviadas al destino A.  
# x42 : Cantidad de maquinas coser producidas semanalmente por origen D enviadas al destino B.
# x43 : Cantidad de maquinas coser producidas semanalmente por origen D enviadas al destino C.
# x44 : Cantidad de maquinas coser producidas semanalmente por origen D enviadas al destino D.
# x45 : Cantidad de maquinas coser producidas semanalmente por origen D enviadas al destino E.
# x46 : Cantidad de maquinas coser producidas semanalmente por origen D enviadas al destino F.
# x47 : Cantidad de maquinas coser producidas semanalmente por origen D enviadas al destino G.

# x51 : Cantidad de maquinas coser producidas semanalmente por origen E enviadas al destino A.  
# x52 : Cantidad de maquinas coser producidas semanalmente por origen E enviadas al destino B.
# x53 : Cantidad de maquinas coser producidas semanalmente por origen E enviadas al destino C.
# x54 : Cantidad de maquinas coser producidas semanalmente por origen E enviadas al destino D.
# x55 : Cantidad de maquinas coser producidas semanalmente por origen E enviadas al destino E.
# x56 : Cantidad de maquinas coser producidas semanalmente por origen E enviadas al destino F.
# x57 : Cantidad de maquinas coser producidas semanalmente por origen E enviadas al destino G.

# x61 : Cantidad de maquinas coser producidas semanalmente por origen F enviadas al destino A.  
# x62 : Cantidad de maquinas coser producidas semanalmente por origen F enviadas al destino B.
# x63 : Cantidad de maquinas coser producidas semanalmente por origen F enviadas al destino C.
# x64 : Cantidad de maquinas coser producidas semanalmente por origen F enviadas al destino D.
# x65 : Cantidad de maquinas coser producidas semanalmente por origen F enviadas al destino E.
# x66 : Cantidad de maquinas coser producidas semanalmente por origen F enviadas al destino F.
# x67 : Cantidad de maquinas coser producidas semanalmente por origen F enviadas al destino G.

# x71 : Cantidad de maquinas coser producidas semanalmente por origen G enviadas al destino A.  
# x72 : Cantidad de maquinas coser producidas semanalmente por origen G enviadas al destino B.
# x73 : Cantidad de maquinas coser producidas semanalmente por origen G enviadas al destino C.
# x74 : Cantidad de maquinas coser producidas semanalmente por origen G enviadas al destino D.
# x75 : Cantidad de maquinas coser producidas semanalmente por origen G enviadas al destino E.
# x76 : Cantidad de maquinas coser producidas semanalmente por origen G enviadas al destino F.
# x77 : Cantidad de maquinas coser producidas semanalmente por origen G enviadas al destino G.

# De manera resumida podemos definir las 49 variables anteriores mediante una sola expresión. 
#
# En efecto, para i=1,2,3,4,5,6,7 y j=1,2,3,4,5,6,7 sea: 

#	xij: cantidad producidas semanalmente en el destino i, que son enviadas al destino j.

# Funcion Objetivo.

#             MIN Z =    0x11 +    Mx12  +    Mx13 +    Mx14  +    Mx15  +    5x16  +     8x17 + 
#                        Mx21 +    0x22  +    Mx23 +    Mx24  +    Mx25  +    3x26  +    11x27 +
#                        Mx31 +    Mx32  +    0x33 +    Mx34  +    Mx35  +    Mx36  +     Mx37 +
#                        Mx41 +    Mx42  +    Mx43 +    0x44  +    Mx45  +    Mx46  +     Mx47 +
#                        Mx51 +    Mx52  +    Mx53 +    Mx54  +    0x55  +    Mx56  +     Mx57 +
#                        Mx61 +    Mx62  +   14x63 +   11x64  +   12x65  +    0x66  +     4x67 +
#                        Mx81 +    Mx72  +   13x73 +   13x74  +   10x75  +    4x76  +     0x77

# Modelo matemático completo. En base a la definición anterior para las variables de decisión,
# y a la información entregada, matemáticamente el modelo de Programación Lineal a resolver es
# el siguiente:

#             MIN Z =    0x11 +    Mx12  +    Mx13 +    Mx14  +    Mx15  +    5x16  +     8x17 + 
#                        Mx21 +    0x22  +    Mx23 +    Mx24  +    Mx25  +    3x26  +    11x27 +
#                        Mx31 +    Mx32  +    0x33 +    Mx34  +    Mx35  +    Mx36  +     Mx37 +
#                        Mx41 +    Mx42  +    Mx43 +    0x44  +    Mx45  +    Mx46  +     Mx47 +
#                        Mx51 +    Mx52  +    Mx53 +    Mx54  +    0x55  +    Mx56  +     Mx57 +
#                        Mx61 +    Mx62  +   14x63 +   11x64  +   12x65  +    0x66  +     4x67 +
#                        Mx81 +    Mx72  +   13x73 +   13x74  +   10x75  +    4x76  +     0x77

#                   S.A.

#                    x11 + x12 + x13 + x14 + x15 + X16 + X17  = 7.000 (Restricción de oferta planta A).
#                    x21 + x22 + x23 + x24 + x25 + x26 + x27  = 8.000 (Restricción de oferta planta B).
#                    x31 + x32 + x33 + x34 + x35 + x36 + x37  = 5.000 (Restricción de oferta planta C).
#                    x41 + x42 + x43 + x44 + x45 + x46 + x47  = 5.000 (Restricción de oferta planta D).
#                    x51 + x52 + x53 + x54 + x55 + x56 + x57  = 5.000 (Restricción de oferta planta E).
#                    x61 + x62 + x63 + x64 + x65 + x66 + x67  = 5.000 (Restricción de oferta planta F).
#                    x71 + x72 + x73 + x74 + x75 + x76 + x77  = 5.000 (Restricción de oferta planta E).

#                    x11 + x21 + x31 + x41 + x51 + x61 + x71  = 5.000 (Restricción de demandas destino A).
#                    x12 + x22 + x32 + x42 + x52 + x62 + x72  = 5.000 (Restricción de demandas destino B).
#                    x13 + x23 + x33 + x43 + x53 + x63 + x73  = 6.500 (Restricción de demandas destino C).
#                    x14 + x24 + x34 + x44 + x54 + x64 + x74  = 6.700 (Restricción de demandas destino D).
#                    x15 + x25 + x35 + x45 + x55 + x65 + x75  = 6.800 (Restricción de demandas destino E).
#                    x16 + x26 + x36 + x46 + x56 + x66 + x76  = 5.000 (Restricción de demandas destino F).
#                    x17 + x27 + x37 + x47 + x57 + x67 + x77  = 5.000 (Restricción de demandas destino G).
#                                             xij => 0 (No negatividad de las variables).

# Transcribimos el modelo anterior a R, para encontrar el plan óptimo.

# MATRIZ DE COSTOS:

cost_mat_2 <- matrix(c(   0,   1000,  1000,  1000, 1000,     5,    8,
                       1000,      0,  1000,  1000, 1000,     3,   11,
                       1000,   1000,     0,  1000, 1000,  1000, 1000,
                       1000,   1000,  1000,     0, 1000,  1000, 1000,
                       1000,   1000,  1000,  1000,    0,  1000, 1000,                       
                       1000,   1000,    14,    11,   12,     0,    4,                        
                       1000,   1000,    13,    13,   10,     4,    0), 
                     ncol = 7, 
                     byrow = TRUE)

cost_mat_2

#> cost_mat_2
#    [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#[1,]    0 1000 1000 1000 1000    5    8
#[2,] 1000    0 1000 1000 1000    3   11
#[3,] 1000 1000    0 1000 1000 1000 1000
#[4,] 1000 1000 1000    0 1000 1000 1000
#[5,] 1000 1000 1000 1000    0 1000 1000
#[6,] 1000 1000   14   11   12    0    4
#[7,] 1000 1000   13   13   10    4    0

# Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs_2 <- c("==", "==", "==", "==", "==","==", "==")

row_constr_signs_2

#   > row_constr_signs_2
# [1] "==" "==" "==" "==" "==" "==" "=="

# Coeficientes de las restricciones para las filas (oferta)

row_rhs_2 <- c(7000, 8000, 5000, 5000, 5000, 5000, 5000)

row_rhs_2

# > row_rhs_2
# [1] 7000 8000 5000 5000 5000 5000 5000

# Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs_2 <- c("==", "==", "==", "==","==", "==", "==")

col_constr_signs_2

# > col_constr_signs_2
# [1] "==" "==" "==" "==" "==" "==" "=="

# Coeficientes de las restricciones para las columnas (demanda)

col_rhs_2 <- c(5000, 5000, 6500, 6700, 6800, 5000, 5000)

col_rhs_2

# > col_rhs_2
# [1] 5000 5000 6500 6700 6800 5000 5000

#install.packages("lpSolve")
library(lpSolve)

solucion_2 <- lp.transport(cost.mat = cost_mat_2,
                           direction = "min",
                           row.signs = row_constr_signs_2,
                           row.rhs = row_rhs_2,
                           col.signs = col_constr_signs_2,
                           col.rhs = col_rhs_2, 
                           presolve = 0,
                           compute.sens = 0)

solucion_2$solution

# > solucion_2$solution
#    [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#[1,] 5000    0    0    0    0 2000    0
#[2,]    0 5000    0    0    0 3000    0
#[3,]    0    0 5000    0    0    0    0
#[4,]    0    0    0 5000    0    0    0
#[5,]    0    0    0    0 5000    0    0
#[6,]    0    0 1500 1700 1800    0    0
#[7,]    0    0    0    0    0    0 5000


#  b).- Obtenga una solución óptima.


# El plan óptimo de transporte que minimiza los costos, es el siguiente:


# Enviar las 2000 máquinas de coser producidas semanalmente por la planta A, al nodo de transbordo F.

#           X16 = 2.000
#
# Enviar las 3000 máquinas de coser producidas semanalmente por la planta B, al nodo de transbordo F.

#           X26 = 3.000
#
# Enviar desde el nodo de transbordo F, 1.500 máquinas de coser al distribuidor C.

#           X63 = 1.500
#
# Enviar desde el nodo de transbordo F, 1.700 máquinas de coser al distribuidor D.

#           X64 = 1.700
#
# Enviar desde el nodo de transbordo F, 1.800 máquinas de coser al distribuidor E.

#           X25 = 1.800
#

# El costo mínimo asociado a este plan de tranporte es de  80.300 unidades monetarias.

#               Z* =  80.300 unidades monetarias..

solucion_2

# > solucion_2
# Success: the objective function is 80300 

#  c).- Interprete los resultados.

# Para que Electromaquinas Ltda. reduzca al mínimo sus costos semanales asociados
# a la distribución de sus m´quinas de coser, debe seguir el siguiente plan:
#
#
#       - Desde la planta A, envíar su producción semanal de 2.000 máquinas de coser al almacen
#	  temporal F.
#       - Desde la planta B, envíar su producción semanal de 3.000 máquinas de coser al almacen
#	  temporal F.
#       - Desde el almacen temporal, distribuir a los centros de distribución de la siguiente forma:
#         a) Enviar 1.500 máquinas de coser al centro de distribución C.
#         b) Enviar 1.700 máquinas de coser al centro de distribución D.
#         c) Enviar 1.800 máquinas de coser al centro de distribución E.

# Lo que nos lleva a un costo total de tranporte de 80.300 unidades monetarias. Que es el mínimo costo 
# asociado a este plan de transporte.

#================================================================================================================================================================
#================================================================================================================================================================
#================================================================================================================================================================
#================================================================================================================================================================

# EJERCICIO 3

# El entrenador de un equipo de natación debe asignar competidores para la prueba 
# de 200 metros de relevo combinado que irá a las Olimpiadas Juveniles. 
# Como muchos de sus mejores nadadores son rápidos en más de un estilo, no es fácil
# decidir cuál de ellos asignar a cada uno de los cuatro estilos.Los cinco mejores 
# nadadores y sus mejores tiempos (en segundos) en cada estilo son los siguientes:
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

# El entrenador quiere determinar cómo asignar cuatro nadadores a los cuatro estilos
# de nado para minimizar la suma de los mejores tiempos correspondientes.

#  a).- Formule este problema como uno de asignación.
#       
#  b).- Obtenga una solución óptima.
#
#  c).- Interprete los resultados óptimos obtenidos.
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

#                    MIN Z = 37,7x11 + 32,9x12  + 33,8x13 + 37,0x14  + 35,4x15 + 
#                            43,4x21 + 33,1x22  + 42,2x23 + 34,7x24  + 41,8x25 +
#                            33,3x31 + 28,5x32  + 38,9x33 + 30,4x34  + 33,6x35 +
#                            29,2x41 + 26,4x42  + 29,6x43 + 28,5x44  + 31,1x45 +
#                               0x51 +    0x52  +    0x53 +    0x54  +    0x55 


# Modelo matemático completo. En base a la definición anterior para las variables de decisión,
# y a la información entregada, matemáticamente el modelo de Programación Lineal a resolver es
# el siguiente:

#                    MIN Z = 37,7x11 + 32,9x12  + 33,8x13 + 37,0x14  + 35,4x15 +
#                            43,4x21 + 33,1x22  + 42,2x23 + 34,7x24  + 41,8x25 +
#                            33,3x31 + 28,5x32  + 38,9x33 + 30,4x34  + 33,6x35 +
#                            29,2x41 + 26,4x42  + 29,6x43 + 28,5x44  + 31,1x45 +
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
#
#       - Asignar a CARL en la prueba de nado estilo LIBRE con su tiempo de 29.2 segundos.
#       - Asignar a CHRIS en la prueba de nado estilo MARIPOSA con su tiempo de 28.5 segundos.
#       - Asignar a DAVID en la prueba de nado estilo DORSO con su tiempo de 33.8 segundos.
#       - Asignar a TONY en la prueba de nado estilo PECHO con su tiempo de 34.7 segundos.
#       - No asignar a KEN a ninguna de las pruebas de nado.

# Lo que nos lleva a un tiempo total de la prueba de:  126.2 segundos. Que es el mínimo tiempo 
# que se puede demorar en la prueba de nado, los nadadores actuales.








