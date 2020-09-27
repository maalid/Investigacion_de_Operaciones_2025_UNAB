library(lpSolve)
#                                          Solemne 2
#                                         Lilian Mora


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$    
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$             Ejercicios 1       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

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

# *El costo esta expresado en millones de dólares.


# El gerente de producción quiere desarrollar la programación del número de turbinas
# que se deben fabricar en cada uno de los cuatro meses, de manera que se minimicen 
# los costos totales de producción y almacenamiento.

# a) Formule este problema como uno de transporte.
# b) Obtenga una solución óptima.
# c) Interprete los resultados óptimos obtenidos.

# Desarrollo.

# a)Formule este problema como uno de transporte.

# Se presenta la tabla modificada con los costos para el problema de transporte a resolver,
# donde se agrego un quinto nodo mes (ficticio) porque la capacidad total(oferta) excedia la 
# produccion total(demanda), para balancear la tabla. (nodo ficticio, 30 (demanda)).


#  ________________________________________________________________________________
# |           |                DESTINO  (Demanda)                      |          |
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

# El costo está expresado en millones de dólares.
# Los costos unitarios de produccion y de almacenaje se deben de sumar para obtener el costo total por unidad.
# se obtienen de la siguiente forma:

# Costo de producción (mes 1) + Costo de almacenaje (mes 1) = 1.08 + 0 = 1.08 
# Costo de producción (mes 1) + Costo de almacenaje (mes 2) = 1.08 + 0.015 = 1.095
# Costo de producción (mes 1) + Costo de almacenaje (mes 3) = 1.08 + (2*0.015) = 1.11
# Costo de producción (mes 1) + Costo de almacenaje (mes 4) = 1.08 + (3*0.015) = 1.125
# Costo de producción (mes 1) + Costo de almacenaje (mes 5) = 0 , porque es un nodo ficticio.

# Costo de producción (mes 2) + Costo de almacenaje (mes 1) = Se ocupara una gran M porque su condicion es imposible de realizar
# Costo de producción (mes 2) + Costo de almacenaje (mes 2) = 1.11 +  0 = 1.11
# Costo de producción (mes 2) + Costo de almacenaje (mes 3) = 1.11 +  0.015 = 1.125
# Costo de producción (mes 2) + Costo de almacenaje (mes 4) = 1.11 + (2*0.015) = 1.14
# Costo de producción (mes 2) + Costo de almacenaje (mes 5) = 0 , porque es un nodo ficticio.

# Costo de producción (mes 3) + Costo de almacenaje (mes 1) = Se ocupara una gran M porque su condicion es imposible de realizar
# Costo de producción (mes 3) + Costo de almacenaje (mes 2) = Se ocupara una gran M porque su condicion es imposible de realizar
# Costo de producción (mes 3) + Costo de almacenaje (mes 3) = 1.10 +  0 = 1.10
# Costo de producción (mes 3) + Costo de almacenaje (mes 4) = 1.10 +  0.015 = 1.115
# Costo de producción (mes 3) + Costo de almacenaje (mes 5) = 0 , porque es un nodo ficticio.

# Costo de producción (mes 4) + Costo de almacenaje (mes 1) = Se ocupara una gran M porque su condicion es imposible de realizare.
# Costo de producción (mes 4) + Costo de almacenaje (mes 2) = Se ocupara una gran M porque su condicion es imposible de realizar
# Costo de producción (mes 4) + Costo de almacenaje (mes 3) = Se ocupara una gran M porque su condicion es imposible de realizar
# Costo de producción (mes 4) + Costo de almacenaje (mes 4) = 1.13 + 0 = 1.13
# Costo de producción (mes 4) + Costo de almacenaje (mes 5) = 0 , porque es un nodo ficticio.


# Definicion de las variables de decision.Sean las siguientes las variables de decisión del problema:

# x11 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 1.
# x12 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 2.
# x13 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 3.
# x14 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 4.
# x15 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 5.(Ficticio)
# x21 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 1.(Imposible que se pueda realizar)
# x22 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 2.
# x23 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 3.
# x24 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 4.
# x25 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 5.(Ficticio)
# x31 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 1.(Imposible que se pueda realizar)
# x32 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 2.(Imposible que se pueda realizar)
# x33 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 3.
# x34 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 4.
# x35 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 5.(Ficticio)
# x41 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 1.(Imposible que se pueda realizar)
# x42 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 2.(Imposible que se pueda realizar)
# x43 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 3.(Imposible que se pueda realizar)
# x44 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 4.
# x45 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 5.(Ficticio)

# De manera resumida podemos definir las 20 variables anteriores mediante una sola expresión. 
#
# En efecto, para i=1,2,3,4 y j=1,2,3,4,5 sea: 

#	xij: cantidad de motores de turbinas producidos en el mes i, que corresponde instalar en el mes j.

# Funcion Objetivo. ( Como existen variables que jamas podran ser realizadas, entonces estas seran 
# reemplazadas por una gran M)

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

# Matriz de costos:

cost_mat <- matrix(c(  1.08,  1.095,  1.11, 1.125,0,
                        100,   1.11, 1.125,  1.14,0,
                        100,    100,   1.1, 1.115,0,
                        100,    100,   100,  1.13,0), 
                     ncol = 5, 
                     byrow = TRUE)

cost_mat

#> cost_mat
#      [,1]     [,2]     [,3]  [,4] [,5]
#[1,]    1.08    1.095    1.110 1.125    0
#[2,] 1000.00    1.110    1.125 1.140    0
#[3,] 1000.00 1000.000    1.100 1.115    0
#[4,] 1000.00 1000.000 1000.000 1.130    0


# Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs <- c("==", "==", "==", "==")

row_constr_signs

# > row_constr_signs
# [1] "==" "==" "==" "=="


# Coeficientes de las restricciones para las filas (oferta)

row_rhs <- c(25, 35, 30, 10)

row_rhs

# > row_rhs
# [1] 25 35 30 10


# Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs <- c("==", "==", "==", "==","==")

col_constr_signs

# > col_constr_signs
# [1] "==" "==" "==" "==" "="


# Coeficientes de las restricciones para las columnas (demanda)

col_rhs <- c(10, 15, 25, 20, 30)

col_rhs

# > col_rhs
# [1] 10 15 25 20 30

# Resolvemos


solucion <- lp.transport(cost.mat = cost_mat,
                           direction = "min",
                           row.signs = row_constr_signs,
                           row.rhs = row_rhs,
                           col.signs = col_constr_signs,
                           col.rhs = col_rhs, 
                           presolve = 0,
                           compute.sens = 0)

solucion$solution

# > solucion$solution
#    [,1] [,2] [,3] [,4] [,5]
#[1,]   10   10    0    5    0
#[2,]    0    5    0    0   30
#[3,]    0    0   25    5    0
#[4,]    0    0    0   10    0



#  b).- Obtenga una solución óptima.


# El plan óptimo de transporte que minimiza los costos de fabricación y almacenamiento es el siguiente:
 

# En el mes 1 se fabricaran 10 motores de turbina y seran instalados en el mes 1. 

#           X11 = 10
#
# En el mes 1 se fabricaran 10 motores de turbina y seran almacenados e instalados en el mes 2.

#           X12 = 10
#
# En el mes 1 se fabricaran 5 motores de turbina y seran almacenados e instalados en el mes 4.

#           X14 = 5
#
# En el mes 2 se fabricaran 5 motores de turbina y seran almacenados e instalados en el mes 2.


#           X22 = 5
#
# En el mes 2 se fabricaran 30 motores de turbina y seran almacenados e instalados en el mes 5.
# (Estos motores de turbinason de un nodo ficticio, por lo tanto, no se fabrican).
#  
#           X25 = 30
#
# En el mes 3 se fabricaran 25 motores de turbina y seran almacenados e instalados en el mes 3.

#           X33 = 25
#
# En el mes 3 se fabricaran 5 motores de turbina y seran almacenados e instalados en el mes 4.

#           X34 = 5
#
# En el mes 4 se fabricaran 10 motores de turbina y seran almacenados e instalados en el mes 4.

#           X44 = 10
#


solucion

# > solucion
# Success: the objective function is $ 77.3 

# El tiempo costo mínimo asociado a este plan de transporte es de  77,3 millones de dólares:

#               Z* =  77,3 millones de dólares.




#  c).- Interprete los resultados.

# Para obtener la mejor programacion de el numero de turbinas a fabricar y minimizando los costos de
# produccion y almacenamiento, se deberia seguir el siguiente plan:
#
#
#       - En el mes 1, se deben producir 10 motores de turbina e instalarlos dentro del mismo mes 1.
#         Esta producción es por un costo total de = 10.8 millones de dólares.

#       - En el mes 1, se deben producir 10 motores de turbina, almacenarlos e instalarlos dentro del
#         mes 2. Esta producción y almacenamiento es por un costo total de = 10.95 millones de dólares.

#       - En el mes 1,se deben producir 5 motores de turbina, almacenarlos e instalarlos dentro del
#         mes 4. Esta producción y almacenamiento es por un costo total de = 5.625 millones de dólares.

#       - En el mes 2, se deben producir 5 motores de turbina e instalarlos dentro del mismo mes 2.
#         Esta producción es por un costo total de = 5.55 millones de dólares.

#       - En el mes 3, se deben producir 25 motores de turbina e instalarlos dentro del mismo mes 3.
#         Esta producción es por un costo total de = 27.5 millones de dólares.

#       - En el mes 3, se deben producir 5 motores de turbina e instalarlos dentro del mismo mes 4.
#         Esta producción es por un costo total de = 5.575 millones de dólares.

#       - En el mes 4, se deben producir 10 motores de turbina e instalarlos dentro del mismo mes 4.
#         Esta producción es por un costo total de = 11.3 millones de dólares.

# En conclusion el costo total de producción y almacenamiento de: $ 77.3 millones de dólares. 
# Este es el costo minimo asociado al plan de transporte. 


# Se puede observar, que dentro de el mes 2 se estan fabricando motores de turbinas ficticios. 
# El nodo origen, esta satisfaciendo algo que no existe, por lo tanto, se deben tomar decisiones 
# y evaluar si el nodo ficticio destino deba ser implementado o no.
 



#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$    
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$             Ejercicios 2       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

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


# Desarrollo.

# Al ser un problema de transbordo , se debe de traspasar a un problema de transporte de la siguiente forma:  


# Paso 1 = Establecer la cantidad de reserva. La suma de demandas es 1.500 + 1.700 + 1.800 = 5.000, mientras que la 
# suma de ofertas es 2.000 + 3.000 = 5.000. Por lo tanto, la cantidad de reserva es R =max{5.000; 5.000} = 5.000.

# PASO 2. A la oferta de cada origen y la demanda de cada destino se le suma la cantidad de reserva R = 5.000. Las
# ofertas quedan asi: A con 7.000 y B queda con 8.000; mientras que las demandas se convierten en: C con 6.500, 
# D con 6.700 y E con 6.800.

# PASO 3. Colocar todos los destinos como orígenes asignándole una oferta igual a la cantidad de reserva R. Al colocar 
# los destinos (distribuidores), C, D, E como origenes(plantas), quedan con una oferta de 5.000 unidades.

# PASO 4. Colocar todos los orígenes como destinos asignándole una demanda igual a la cantidad de reserva R. Cuando se 
# colocan los origenes(plantas), A y B como destinos(distribuidores), se les asigna una demanda de 5.000 unidades.

# PASO 5. Establecer las condiciones de equilibrio entre oferta y demanda tal como se hace en el modelo del transporte.


# En la siguiente tabla aparece el problema transformado en codiciones de equilibrio; ademas de aparecer los costos
# unitarios de transporte.

#                                        TABLA
#  _______________________________________________________________________________
# |           |                DISTRIBUIDOR ( DESTINO)                |          |
# | PLANTA    |_______________________________________________________|  OFERTA  |   
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

# x11 : Cantidad semanal de maquinas de coser producidas por origen A, enviadas al destino A.  
# x12 : Cantidad semanal de maquinas de coser producidas por origen A, enviadas al destino B.
# x13 : Cantidad semanal de maquinas de coser producidas por origen A, enviadas al destino C.
# x14 : Cantidad semanal de maquinas de coser producidas por origen A, enviadas al destino D.
# x15 : Cantidad semanal de maquinas de coser producidas por origen A, enviadas al destino E.
# x16 : Cantidad semanal de maquinas de coser producidas por origen A, enviadas al destino F.
# x17 : Cantidad semanal de maquinas de coser producidas por origen A, enviadas al destino G.
# x21 : Cantidad semanal de maquinas de coser producidas por origen B, enviadas al destino A.  
# x22 : Cantidad semanal de maquinas de coser producidas por origen B, enviadas al destino B.
# x23 : Cantidad semanal de maquinas de coser producidas por origen B, enviadas al destino C.
# x24 : Cantidad semanal de maquinas de coser producidas por origen B, enviadas al destino D.
# x25 : Cantidad semanal de maquinas de coser producidas por origen B, enviadas al destino E.
# x26 : Cantidad semanal de maquinas de coser producidas por origen B, enviadas al destino F.
# x27 : Cantidad semanal de maquinas de coser producidas por origen B, enviadas al destino G.
# x31 : Cantidad semanal de maquinas de coser producidas por origen C, enviadas al destino A.  
# x32 : Cantidad semanal de maquinas de coser producidas por origen C, enviadas al destino B.
# x33 : Cantidad semanal de maquinas de coser producidas por origen C, enviadas al destino C.
# x34 : Cantidad semanal de maquinas de coser producidas por origen C, enviadas al destino D.
# x35 : Cantidad semanal de maquinas de coser producidas por origen C, enviadas al destino E.
# x36 : Cantidad semanal de maquinas de coser producidas por origen C, enviadas al destino F.
# x37 : Cantidad semanal de maquinas de coser producidas por origen C, enviadas al destino G.
# x41 : Cantidad semanal de maquinas de coser producidas por origen D, enviadas al destino A.  
# x42 : Cantidad semanal de maquinas de coser producidas por origen D, enviadas al destino B.
# x43 : Cantidad semanal de maquinas de coser producidas por origen D, enviadas al destino C.
# x44 : Cantidad semanal de maquinas de coser producidas por origen D, enviadas al destino D.
# x45 : Cantidad semanal de maquinas de coser producidas por origen D, enviadas al destino E.
# x46 : Cantidad semanal de maquinas de coser producidas por origen D, enviadas al destino F.
# x47 : Cantidad semanal de maquinas de coser producidas por origen D, enviadas al destino G.
# x51 : Cantidad semanal de maquinas de coser producidas por origen E, enviadas al destino A.  
# x52 : Cantidad semanal de maquinas de coser producidas por origen E, enviadas al destino B.
# x53 : Cantidad semanal de maquinas de coser producidas por origen E, enviadas al destino C.
# x54 : Cantidad semanal de maquinas de coser producidas por origen E, enviadas al destino D.
# x55 : Cantidad semanal de maquinas de coser producidas por origen E, enviadas al destino E.
# x56 : Cantidad semanal de maquinas de coser producidas por origen E, enviadas al destino F.
# x57 : Cantidad semanal de maquinas de coser producidas por origen E, enviadas al destino G.
# x61 : Cantidad semanal de maquinas de coser producidas por origen F, enviadas al destino A.  
# x62 : Cantidad semanal de maquinas de coser producidas por origen F, enviadas al destino B.
# x63 : Cantidad semanal de maquinas de coser producidas por origen F, enviadas al destino C.
# x64 : Cantidad semanal de maquinas de coser producidas por origen F, enviadas al destino D.
# x65 : Cantidad semanal de maquinas de coser producidas por origen F, enviadas al destino E.
# x66 : Cantidad semanal de maquinas de coser producidas por origen F, enviadas al destino F.
# x67 : Cantidad semanal de maquinas de coser producidas por origen F, enviadas al destino G.
# x71 : Cantidad semanal de maquinas de coser producidas por origen G, enviadas al destino A.  
# x72 : Cantidad semanal de maquinas de coser producidas por origen G, enviadas al destino B.
# x73 : Cantidad semanal de maquinas de coser producidas por origen G, enviadas al destino C.
# x74 : Cantidad semanal de maquinas de coser producidas por origen G, enviadas al destino D.
# x75 : Cantidad semanal de maquinas de coser producidas por origen G, enviadas al destino E.
# x76 : Cantidad semanal de maquinas de coser producidas por origen G, enviadas al destino F.
# x77 : Cantidad semanal de maquinas de coser producidas por origen G, enviadas al destino G.

# De manera resumida podemos definir las 49 variables anteriores mediante una sola expresión. 
#
# En efecto, para i=1,2,3,4,5,6,7 y j=1,2,3,4,5,6,7 sea: 

#	xij: cantidad semanal de maquinas de coser producidas por el origen i, enviadas al destino j.

# Funcion Objetivo.

#             MIN Z =    0x11 +    Mx12  +    Mx13 +    Mx14  +    Mx15  +    5x16  +    8x17  +
#                        Mx21 +    0x22  +    Mx23 +    Mx24  +    Mx25  +    3x26  +    11x27 +
#                        Mx31 +    Mx32  +    0x33 +    Mx34  +    Mx35  +    Mx36  +     Mx37 +
#                        Mx41 +    Mx42  +    Mx43 +    0x44  +    Mx45  +    Mx46  +     Mx47 +
#                        Mx51 +    Mx52  +    Mx53 +    Mx54  +    0x55  +    Mx56  +     Mx57 +
#                        Mx61 +    Mx62  +   14x63 +   11x64  +   12x65  +    0x66  +     4x67 +
#                        Mx81 +    Mx72  +   13x73 +   13x74  +   10x75  +    4x76  +     0x77 

# Modelo matemático completo. En base a la definición anterior para las variables de decisión, y a la información
# entregada, matemáticamente el modelo de Programación Lineal a resolver es el siguiente:
# 

#             MIN Z =    0x11 +    Mx12  +    Mx13 +    Mx14  +    Mx15  +    5x16  +    8x17  +
#                        Mx21 +    0x22  +    Mx23 +    Mx24  +    Mx25  +    3x26  +    11x27 +
#                        Mx31 +    Mx32  +    0x33 +    Mx34  +    Mx35  +    Mx36  +     Mx37 +
#                        Mx41 +    Mx42  +    Mx43 +    0x44  +    Mx45  +    Mx46  +     Mx47 +
#                        Mx51 +    Mx52  +    Mx53 +    Mx54  +    0x55  +    Mx56  +     Mx57 +
#                        Mx61 +    Mx62  +   14x63 +   11x64  +   12x65  +    0x66  +     4x67 +
#                        Mx81 +    Mx72  +   13x73 +   13x74  +   10x75  +    4x76  +     0x77

#                   S.A.

#                    x11 + x12 + x13 + x14 + x15 + X16 + X17  = 7.000 (Restricción de oferta origen planta A).
#                    x21 + x22 + x23 + x24 + x25 + x26 + x27  = 8.000 (Restricción de oferta origen planta B).
#                    x31 + x32 + x33 + x34 + x35 + x36 + x37  = 5.000 (Restricción de oferta origen planta C).
#                    x41 + x42 + x43 + x44 + x45 + x46 + x47  = 5.000 (Restricción de oferta origen planta D).
#                    x51 + x52 + x53 + x54 + x55 + x56 + x57  = 5.000 (Restricción de oferta origen planta E).
#                    x61 + x62 + x63 + x64 + x65 + x66 + x67  = 5.000 (Restricción de oferta origen planta F).
#                    x71 + x72 + x73 + x74 + x75 + x76 + x77  = 5.000 (Restricción de oferta origen planta E).
#                    x11 + x21 + x31 + x41 + x51 + x61 + x71  = 5.000 (Restricción de demanda destino A).
#                    x12 + x22 + x32 + x42 + x52 + x62 + x72  = 5.000 (Restricción de demanda destino B).
#                    x13 + x23 + x33 + x43 + x53 + x63 + x73  = 6.500 (Restricción de demanda destino C).
#                    x14 + x24 + x34 + x44 + x54 + x64 + x74  = 6.700 (Restricción de demanda destino D).
#                    x15 + x25 + x35 + x45 + x55 + x65 + x75  = 6.800 (Restricción de demanda destino E).
#                    x16 + x26 + x36 + x46 + x56 + x66 + x76  = 5.000 (Restricción de demanda destino F).
#                    x17 + x27 + x37 + x47 + x57 + x67 + x77  = 5.000 (Restricción de demanda destino G).
#                                                         xij => 0 (No negatividad de las variables).

# Transcribimos el modelo anterior a R, para encontrar el plan óptimo.

# Matriz de costos

cost_mat1 <- matrix(c(       0,   1000,  1000,  1000, 1000,     5,    8,
                          1000,      0,  1000,  1000, 1000,     3,   11,
                          1000,   1000,     0,  1000, 1000,  1000, 1000,
                          1000,   1000,  1000,     0, 1000,  1000, 1000,
                          1000,   1000,  1000,  1000,    0,  1000, 1000,                       
                          1000,   1000,    14,    11,   12,     0,    4,                        
                          1000,   1000,    13,    13,   10,     4,    0), 
                     ncol = 7, 
                     byrow = TRUE)

cost_mat1

#> cost_mat1
#    [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#[1,]    0 1000 1000 1000 1000    5    8
#[2,] 1000    0 1000 1000 1000    3   11
#[3,] 1000 1000    0 1000 1000 1000 1000
#[4,] 1000 1000 1000    0 1000 1000 1000
#[5,] 1000 1000 1000 1000    0 1000 1000
#[6,] 1000 1000   14   11   12    0    4
#[7,] 1000 1000   13   13   10    4    0


# Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs1 <- c("==", "==", "==", "==", "==","==", "==")

row_constr_signs1

# > row_constr_signs1
# [1] "==" "==" "==" "==" "==" "==" "=="


# Coeficientes de las restricciones para las filas (oferta)

row_rhs1 <- c(7000, 8000, 5000, 5000, 5000, 5000, 5000)

row_rhs1

# > row_rhs1
# [1] 7000 8000 5000 5000 5000 5000 5000


# Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs1 <- c("==", "==", "==", "==","==", "==", "==")

col_constr_signs1

# > col_constr_signs1
# [1] "==" "==" "==" "==" "==" "==" "=="


# Coeficientes de las restricciones para las columnas (demanda)

col_rhs1 <- c(5000, 5000, 6500, 6700, 6800, 5000, 5000)

col_rhs1

# > col_rhs1
# [1] 5000 5000 6500 6700 6800 5000 5000


# Resolvemos


solucion1 <- lp.transport(cost.mat = cost_mat1,
                           direction = "min",
                           row.signs = row_constr_signs1,
                           row.rhs = row_rhs1,
                           col.signs = col_constr_signs1,
                           col.rhs = col_rhs1, 
                           presolve = 0,
                           compute.sens = 0)

solucion1$solution

# > solucion1$solution
#    [,1] [,2] [,3] [,4] [,5] [,6] [,7]
#[1,] 5000    0    0    0    0 2000    0
#[2,]    0 5000    0    0    0 3000    0
#[3,]    0    0 5000    0    0    0    0
#[4,]    0    0    0 5000    0    0    0
#[5,]    0    0    0    0 5000    0    0
#[6,]    0    0 1500 1700 1800    0    0
#[7,]    0    0    0    0    0    0 5000


# ¿Cuál es el plan óptimo de envíos que minimiza los costos de la operación?

# La solucion encontrada se interpreta de la siguiente manera: al observar la 
# diagonal(mismo origen y mismo destino) que todas sus casillas absorbieron la 
# reserva de 5.000 unidades, excepto la celda que corresponde a uno de los almacenes
# temporales (F).

# La planta A envia 2000 unidades al almacen temporal (F).Esta asignacion es la que genera el trasbordo

#                              x16 = 2.000 unidades

# La planta B envia 3.000 unidades al almacen temporal (f).Esta asignacion es la que genera el trasbordo


#                              x26 = 3.000 unidades

# La planta F (almacen temporal), envia directamente 1.500 unidades al distribuidor C.

#                              x63 = 1.500 unidades

# La planta F (almacen temporal), envia directamente 1.700 unidades al distribuidor D.

#                              x64 = 1.700 unidades


# La planta F (almacen temporal), envia directamente 1.800 unidades al distribuidor E.

#                              x65 = 1.800 unidades



solucion1

# > solucion1
# Success: the objective function is 80300 

# El costo mínimo asociado a este plan de transporte es de  80.300 unidades monetarias.

#               Z* =  80.300 unidades monetarias.



# De acuerdo a los resultados obtenidos, se puede expresar lo siguiente:

# - La planta A produce 2.000 maquinas de coser por semana, las que son enviadas al almacen temporal F.
# - La planta B produce 3.000 maquinas de coser por semana, las que son enviadas al almacen temporal F.
# - La planta F (almacen temporal) envia 1.500 maquinas de coser por semana al distribuidor C.
# - La planta F (almacen temporal) envia 1.700 maquinas de coser por semana al distribuidor D.
# - La planta F (almacen temporal) envia 1.800 maquinas de coser por semana al distribuidor E.

# El costo minimo asociado al plan de transporte, es de $80.300 unidades monetarias.

# Esto quiere decir, que se necesitan $80.300 unidades monetarias para poder producir,
# trasladar y almacenar por semana las maquinas de coser. 
#



#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$    
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$             Ejercicios 3       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

# El entrenador de un equipo de natación debe asignar competidores para la prueba de 200 metros de relevo combinado
# que irá a las Olimpiadas Juveniles. Como muchos de sus mejores nadadores son rápidos en más de un estilo, no es fácil
# decidir cuál de ellos asignar a cada uno de los cuatro estilos.Los cinco mejores nadadores y sus mejores tiempos
# (en segundos) en cada estilo son los siguientes:
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

#  a)Formule este problema como uno de asignación.
#       
#  b)Obtenga una solución óptima.
#
#  c)Interprete los resultados óptimos obtenidos.
#
# Desarrollo.

# Al ser un  problema de asignación, éste se debe de encontrar equilibrado.En este problema no esta equilibrado, por lo 
# que se debera crear un nodo ficticio, el que sera de un quinto tipo de nado(oferta), para poder satisfacer la 
# disponibilidad de nadadores(demanda).
 
#               Tabla de parametros para formular problema de asignacion
#               ________________________________________________________
#               |               |           Nadadores (demanda)        |
#               |   Tipo de     |______________________________________|           
#               | Nado (oferta) | Carl  | Chris | David | Tony  | Ken  |  
#               |_______________|_______|_______|_______|_______|______|
#               |               |       |       |       |       |      |
#               |     Dorso     | 37,7  | 32,9  | 33,8  | 37,0  | 35,4 |
#               |_______________|_______|_______|_______|_______|______|
#               |               |       |       |       |       |      |
#               |     Pecho     | 43,4  | 33,1  | 42,2  | 34,7  | 41,8 |
#               |_______________|_______|_______|_______|_______|______|
#               |               |       |       |       |       |      |
#               |   Mariposa    | 33,3  | 28,5  | 38,9  | 30,4  | 33,6 |
#               |_______________|_______|_______|_______|_______|______|
#               |               |       |       |       |       |      |
#               |    Libre      | 29,2  | 26,4  | 29,6  | 28,5  | 31,1 |
#               |_______________|_______|_______|_______|_______|______|
#               |               |       |       |       |       |      |
#               |    Ficticio   |   0   |   0   |   0   |   0   |   0  |
#               |_______________|_______|_______|_______|_______|______|



#  a).- Formule este problema como uno de asignación.
#       


# Definición de las variables de decisión. 


# x11 : Tipo de nado Dorso asignado a nadador Carl.
# x12 : Tipo de nado Dorso asignado a nadador Chris.
# x13 : Tipo de nado Dorso asignado a nadador David.
# x14 : Tipo de nado Dorso asignado a nadador Tony.
# x15 : Tipo de nado Dorso asignado a nadador Ken.
# x21 : Tipo de nado Pecho asignado a nadador Carl.
# x22 : Tipo de nado Pecho asignado a nadador Chris.
# x23 : Tipo de nado Pecho asignado a nadador David.
# x24 : Tipo de nado Pecho asignado a nadador Tony.
# x25 : Tipo de nado Pecho asignado a nadador Ken.
# x31 : Tipo de nado Mariposa asignado a nadador Carl.
# x32 : Tipo de nado Mariposa asignado a nadador Chris.
# x33 : Tipo de nado Mariposa asignado a nadador David.
# x34 : Tipo de nado Mariposa asignado a nadador Tony.
# x35 : Tipo de nado Mariposa asignado a nadador Ken.
# x41 : Tipo de nado Libre asignado a nadador Carl.
# x42 : Tipo de nado Libre asignado a nadador Chris.
# x43 : Tipo de nado Libre asignado a nadador David.
# x44 : Tipo de nado Libre asignado a nadador Tony.
# x45 : Tipo de nado Libre asignado a nadador Ken.
# x51 : Tipo de nado Ficticio asignado a nadador Carl.
# x52 : Tipo de nado Ficticio asignado a nadador Chris.
# x53 : Tipo de nado Ficticio asignado a nadador David.
# x54 : Tipo de nado Ficticio asignado a nadador Tony.
# x55 : Tipo de nado Ficticio asignado a nadador Ken.

# De manera resumida podemos definir las 25 variables anteriores mediante una sola expresión. 
#
# En efecto, para i=1,2,3,4,5 y j=1,2,3,4,5 sea: 

#	xij: Tipo de nado i, que corresponde al nadador j.


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

#                    x11 + x12 + x13 + x14 + x15  = 1 (Restricción del Tipo de nado Dorso).
#                    x21 + x22 + x23 + x24 + x25  = 1 (Restricción del Tipo de nado Pecho).
#                    x31 + x32 + x33 + x34 + x35  = 1 (Restricción del Tipo de nado Mariposa).
#                    x41 + x42 + x43 + x44 + x45  = 1 (Restricción del Tipo de nado Libre).
#                    x51 + x52 + x53 + x54 + x55  = 1 (Restricción del Tipo de nado Ficticio).
#                    x11 + x21 + x31 + x41 + x51  = 1 (Restricción del nadador Carl).
#                    x12 + x22 + x32 + x42 + x52  = 1 (Restricción del nadador Chris).
#                    x13 + x23 + x33 + x43 + x53  = 1 (Restricción del nadador David).
#                    x14 + x24 + x34 + x44 + x54  = 1 (Restricción del nadador Tony).
#                    x15 + x25 + x35 + x45 + x55  = 1 (Restricción del nadador Ken).
#                                   xij = 0 o xij = 1 (Posibles valores de las variables).

# Transcribimos el modelo anterior a R, para encontrar el plan óptimo.

# Matriz de Tiempo:


cost_mat2 <- matrix(c(   37.7,  32.9, 33.8,  37.0, 35.4,
                          43.4,  33.1, 42.2,  34.7, 41.8,
                          33.3,  28.5, 38.9,  30.4, 33.6,
                          29.2,  26.4, 29.6,  28.5, 31.1,
                          0,     0,    0,     0,    0), 
                     ncol = 5, 
                     byrow = TRUE)

cost_mat2

#> cost_mat2
#     [,1] [,2] [,3] [,4] [,5]
#[1,] 37.7 32.9 33.8 37.0 35.4
#[2,] 43.4 33.1 42.2 34.7 41.8
#[3,] 33.3 28.5 38.9 30.4 33.6
#[4,] 29.2 26.4 29.6 28.5 31.1
#[5,]  0.0  0.0  0.0  0.0  0.0



solucion2 <- lp.assign (cost.mat = cost_mat2, 
                        direction = "min", 
                        presolve = 0, 
                        compute.sens = 0)

solucion2$solution

#> solucion2$solution
#      [,1] [,2] [,3] [,4] [,5]
#[1,]    0    0    1    0    0
#[2,]    0    0    0    1    0
#[3,]    0    1    0    0    0
#[4,]    1    0    0    0    0
#[5,]    0    0    0    0    1



#  b).- Obtenga una solución óptima.


# El plan óptimo de asignación que minimiza los tiempos de los nadadores es el siguiente:


#       - El tipo de nado Dorso NO es asignado al nadador Carl.
#
#               X11 = 0
#
#       - El tipo de nado Dorso NO es asignado al nadador Chris.
#
#               X12 = 0
#
#       - El tipo de nado Dorso SI es asignado al nadador David.
#
#               X13 = 1
#
#       - El tipo de nado Dorso NO es asignado al nadador Tony.
#
#               X14 = 0
#
#       - El tipo de nado Dorso NO es asignado al nadador Ken.
#
#               X15 = 0
#
#       - El tipo de nado Pecho NO es asignado al nadador Carl.
#
#               X21 = 0
#
#       - El tipo de nado Pecho NO es asignado al nadador Chris.
#
#               X22 = 0
#
#       - El tipo de nado Pecho NO es asignado al nadador David.
#
#               X23 = 0
#
#       - El tipo de nado Pecho SI es asignado al nadador Tony.
#
#               X24 = 1
#
#       - El tipo de nado Pecho NO es asignado al nadador Ken.
#
#               X25 = 0
#
#       - El tipo de nado Mariposa NO es asignado al nadador Carl.
#
#               X31 = 0
#
#       - El tipo de nado Mariposa SI es asignado al nadador Chris.
#
#               X32 = 1
#
#       - El tipo de nado Mariposa NO es asignado al nadador David.
#
#               X33 = 0
#
#       - El tipo de nado Mariposa NO es asignado al nadador Tony.
#
#               X34 = 0
#
#       - El tipo de nado Mariposa NO es asignado al nadador Ken.
#
#               X35 = 0
#
#       - El tipo de nado Libre SI es asignado al nadador Carl.
#
#               X41 = 1
#
#       - El tipo de nado Libre NO es asignado al nadador Chris.
#
#               X42 = 0
#
#       - El tipo de nado Libre NO es asignado al nadador David.
#
#               X43 = 0
#
#       - El tipo de nado Libre NO es asignado al nadador Tony.
#
#               X44 = 0
#
#       - El tipo de nado Libre NO es asignado al nadador Ken.
#
#               X55 = 0
#


solucion2 

#Success: the objective function is 126.2 

# El tiempo mínimo asociado a este plan de asignación es de  126,2 segundos:

#               Z* =  126,2 segundos.



#  c).-Interprete los resultados óptimos obtenidos.

# Para poder minimizar los tiempos de los nadadores, el entrenador debera de asignar los tipos de nado de la 
# siguiente forma para lograr obtener los mejores resultados en la competencia de 200 metros de relevo combinado.

#       - Asignar el tipo de nado Libre a el nadador Carl con su tiempo de 29.2 segundos.
#       - Asignar el tipo de nado Mariposa a el nadador Chris con su tiempo de 28.5 segundos.
#       - Asignar el tipo de nado Dorso a el nadador David con su tiempo de 33.8 segundos.
#       - Asignar el tipo de nado Pecho a el nadador Tony con su tiempo de 34.7 segundos.
#       - No se podra asignar un tipo de nado a el nadador Ken en ninguna de las pruebas.

# Con estos resultados obtenidos, el tiempo total en realizar la prueba de 200 metros de relevo combinado es de 
# 126,2 segundos. Este sera el tiempo minimo que los nadadores podran demorarse en realizar la prueba.




