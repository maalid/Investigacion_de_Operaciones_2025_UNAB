# Solemne 2 
# Ricardo Riveros

# Ejercicio 1

# La NORTHERN AIRPLANE COMPANY construye aviones comerciales para varias líneas aéreas de todo el
# mundo. La última etapa del proceso de producción consiste en fabricar las turbinas de jet e instalarlas
# -una operación muy rápida- en la estructura del avión terminado. La compañía tiene varios
# contratos de trabajo que la obligan a entregar un número considerable de aviones en un futuro
# cercano y en este momento debe programar la producción de motores de turbina para los próximos
# cuatro meses.

# En la segunda columna de la tabla se indica la cantidad de motores que debe estar lista para su
# instalación a fin de cumplir con las fechas de entrega contratadas. De ella se desprende que el número
# acumulado de motores que deben producirse al final de los meses 1, 2, 3 y 4 debe ser por lo menos de
# 10, 25, 50 y 70 unidades, respectivamente.

# Las instalaciones disponibles para producir las turbinas varían de acuerdo con otros programas de
# producción, mantenimiento y renovación durante el periodo. Las diferencias mensuales debidas al
# número máximo que se puede producir y el costo unitario de producción (en millones de dólares) se
# presentan en la tercera y cuarta columnas de la tabla.

# Dadas las variaciones de los costos de producción, podría valer la pena fabricar algunas turbinas uno
# o más meses antes de su fecha de instalación; en la actualidad se estudia esta posibilidad. El
# inconveniente es que esas turbinas deberán almacenarse hasta que sean instaladas, pues la
# estructura de los aviones no estará lista antes. El costo de almacenamiento de cada turbina es de 15
# mil dólares por mes, como se muestra en la última columna de la tabla.

# Tabla
#                            
#                     | Instalaciones | Produccion   | Costo unitario  | Costo unitarios |
#                     | Programadas   | Maxima       | de produccion   | de almacenaje   |   
#         MES        _____________________________________________________________________ 
#         1           | 10            | 25           | 1.08            | 0.015           |
#         2           | 15            | 35           | 1.10            | 0.015           |
#         3           | 25            | 30           | 1.10            | 0.015           |
#         4           | 20            | 10           | 1.13            |                 |
#                    _____________________________________________________________________

# El costo está expresado en millones de dolares.

# El gerente de producción quiere desarrollar la programación del número de turbinas que se deben
# fabricar en cada uno de los cuatro meses, de manera que se minimicen los costos totales de
# producción y almacenamiento.

# a. Formule este problema como uno de transporte.
# b. Obtenga una solución óptima.
# c. Interprete los resultados óptimos obtenidos.

# Solucion

# a. Formule este problema como uno de transporte.

# Para comenza se debe de definir la instalalcion programada que en total es 10+15+25+20 = 70
# y a su vez definir la Produccion maxima que en total es 25+35+30+10 = 100
# esto nos obliga a generar una instalacion programada ficticia de 30 para equilibrar el problema.
# Ademas segun lo solicitado en el problema, el planeamiento debe de indicar cual es la mejor 
# forma de produccion minimizando los costos, por eso indicaremos cual es el costo de produccion
# por cada mes y su capacidad, incluimos en esta nueva tabla valores de 1000, en los puntos en donde 
# NO es por esto que llegamos a la siguiente tabla:

# Tabla ajustada
#                            
#                                          | Instalaciones | Instalaciones | Instalaciones | Instalaciones | Instalaciones | Produccion |
#                                          | Programadas   | Programadas   | Programadas   | Programadas   | Programadas   | Maxima     |
#                                          | Mes 1         | Mes 2         | Mes 3         | Mes 4         | Mes 5 ficticio|            |
#                                          ______________________________________________________________________________________________ 
# Costos de produccion y almacenaje mes 1  | 1.080         | 1.095         | 1.110         | 1.125         | 0             | 25         |
# Costos de produccion y almacenaje mes 2  | M             | 1.110	       | 1.125	       | 1.140	       | 0             | 35         |  
# Costos de produccion y almacenaje mes 3  | M             | M             | 1.100	       | 1.115	       | 0             | 30         |
# Costos de produccion y almacenaje mes 4  | M             | M             | M             | 1.130	       | 0             | 10         |
#                                          ______________________________________________________________________________________________
# Instalaciones programadas                | 10            | 15            | 25            | 20            | 30            |

# En esta tabla se considera el costo por producción y costo por almacenaje, dando el total de gastos 
# con respecto a lo necesario a la producción y así poder programar de mejor forma, es necesario indicar 
# además que se han ingresado valores de M, con el fin de no permitir el calculo en esos puntos, ya que 
# no existen, como por ejemplo en el cruce entre el mes 2 y costos de producción y almacenaje del mes 1, 
# en este caso la producción del mes 2 solo puede tener el valor del costo desde el mes dos y no desde el 
# mes 1 porque ese mes ya a pasado.

# Definicion de las variables de decisión.

# x11: Costos de producción y almacenaje del mes 1 para las instalaciones programadas del mes 1 por mes.
# x12: Costos de producción y almacenaje del mes 1 para las instalaciones programadas del mes 2 por mes.
# x13: Costos de producción y almacenaje del mes 1 para las instalaciones programadas del mes 3 por mes.
# x14: Costos de producción y almacenaje del mes 1 para las instalaciones programadas del mes 4 por mes.
# x15: Costos de producción y almacenaje del mes 1 para las instalaciones programadas del mes 5 ficticio por mes.
# x21: Costos de producción y almacenaje del mes 2 para las instalaciones programadas del mes 1 por mes.
# x22: Costos de producción y almacenaje del mes 2 para las instalaciones programadas del mes 2 por mes.
# x23: Costos de producción y almacenaje del mes 2 para las instalaciones programadas del mes 3 por mes.
# x24: Costos de producción y almacenaje del mes 2 para las instalaciones programadas del mes 4 por mes.
# x25: Costos de producción y almacenaje del mes 2 para las instalaciones programadas del mes 5 ficticio por mes.
# x31: Costos de producción y almacenaje del mes 3 para las instalaciones programadas del mes 1 por mes.
# x32: Costos de producción y almacenaje del mes 3 para las instalaciones programadas del mes 2 por mes.
# x33: Costos de producción y almacenaje del mes 3 para las instalaciones programadas del mes 3 por mes.
# x34: Costos de producción y almacenaje del mes 3 para las instalaciones programadas del mes 4 por mes.
# x35: Costos de producción y almacenaje del mes 3 para las instalaciones programadas del mes 5 ficticio por mes.
# x41: Costos de producción y almacenaje del mes 4 para las instalaciones programadas del mes 1 por mes.
# x42: Costos de producción y almacenaje del mes 4 para las instalaciones programadas del mes 2 por mes.
# x43: Costos de producción y almacenaje del mes 4 para las instalaciones programadas del mes 3 por mes.
# x44: Costos de producción y almacenaje del mes 4 para las instalaciones programadas del mes 4 por mes.
# x45: Costos de producción y almacenaje del mes 4 para las instalaciones programadas del mes 5 ficticio por mes.

# i: 1, 2, 3, 4
# j: 1, 2, 3, 4, 5

# Xij: Costos de producción y almacenaje del mes i para las instalaciones programadas del mes j por mes.

# Modelo matemático completo.

# Función objetivo

#  MIN Z =   1.080X11 + 1.095X12 + 1.110X13 + 1.125X14 +     0X15
#                MX21 + 1.110X22 + 1.125X23 + 1.140X24 +     0X25
#                MX31 +     MX32 + 1.100X33 + 1.115X34 +     0X35
#                MX41 +     MX42 +     MX43 + 1.130X44 +     0X45

# X11 + X12 + X13 + X14 + X15 <= 25 (Costos de produccion y almacenaje mes 1)
# X21 + X22 + X23 + X24 + X25 <= 35 (Costos de produccion y almacenaje mes 2)
# X31 + X32 + X33 + X34 + X35 <= 30 (Costos de produccion y almacenaje mes 3)
# X41 + X42 + X43 + X44 + X45 <= 10 (Costos de produccion y almacenaje mes 4)
#       X11 + X21 + X31 + X41 >= 10 (Instalaciones programadas mes 1)
#       X12 + X22 + X32 + X42 >= 15 (Instalaciones programadas mes 2)
#       X13 + X23 + X33 + X43 >= 25 (Instalaciones programadas mes 3)
#       X14 + X24 + X34 + X44 >= 20 (Instalaciones programadas mes 4)
#       X15 + X25 + X35 + X45 >= 30 (Instalaciones programadas mes 5 ficticio)
#                        X ij >= 0  (No negatividad)

# b. Obtenga una solución óptima.

# Transcribimos del modelo matematico a R.

# Como ya hemos definido los puntos que por factor de tiempo no se pueden tomar o implementar dentro del modelo, 
# para su implementacion en R, se cambiara la M por 1000, de esta forma el valor sera demaciado alto respecto a los demas
# y quedara fuera del modelo como queremos que suceda.

library(lpSolve)

# Matriz de costos

costo_1 <- matrix(c( 1.080, 1.095, 1.110, 1.125,     0,
                      1000, 1.110, 1.125, 1.140,     0,
                      1000,  1000, 1.100, 1.115,     0,
                      1000,  1000,  1000, 1.130,     0), ncol = 5, byrow = TRUE)

costo_1

# Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs_1 <- c("==", "==", "==", "==")

row_constr_signs_1

# Coeficientes de las restricciones para las filas (oferta)

row_rhs_1 <- c(25, 35, 30, 10)

row_rhs_1

# Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs_1 <- c("==", "==", "==", "==", "==")

col_constr_signs_1

# Coeficientes de las restricciones para las columnas (demanda)

col_rhs_1 <- c(10, 15, 25, 20, 30)

col_rhs_1

# Resolvemos

solucion_1 <- lp.transport(cost.mat = costo_1,
                         direction = "min",
                         row.signs = row_constr_signs_1,
                         row.rhs = row_rhs_1,
                         col.signs = col_constr_signs_1,
                         col.rhs = col_rhs_1, 
                         presolve = 0)

solucion_1$solution

#       [,1] [,2] [,3] [,4] [,5]
# [1,]   10   10    0    5    0
# [2,]    0    5    0    0   30
# [3,]    0    0   25    5    0
# [4,]    0    0    0   10    0

# c. Interprete los resultados óptimos obtenidos.

# Valores óptimos para las variables de decisión. (Plan optimo de distribución)

# Costos de producción y almacenaje del mes 1 para las instalaciones programadas del mes 1 por mes.
# x11: 10

# Costos de producción y almacenaje del mes 1 para las instalaciones programadas del mes 2 por mes.
# x12: 10

# Costos de producción y almacenaje del mes 1 para las instalaciones programadas del mes 3 por mes.
# x13: 0

# Costos de producción y almacenaje del mes 1 para las instalaciones programadas del mes 4 por mes.
# x14: 5

# Costos de producción y almacenaje del mes 1 para las instalaciones programadas del mes 5 ficticio por mes.
# x15: 0

# Costos de producción y almacenaje del mes 2 para las instalaciones programadas del mes 1 por mes.
# x21: 0

# Costos de producción y almacenaje del mes 2 para las instalaciones programadas del mes 2 por mes.
# x22: 5

# Costos de producción y almacenaje del mes 2 para las instalaciones programadas del mes 3 por mes.
# x23: 0

# Costos de producción y almacenaje del mes 2 para las instalaciones programadas del mes 4 por mes.
# x24: 0

# Costos de producción y almacenaje del mes 2 para las instalaciones programadas del mes 5 ficticio por mes.
# x25: 30

# Costos de producción y almacenaje del mes 3 para las instalaciones programadas del mes 1 por mes.
# x31: 0

# Costos de producción y almacenaje del mes 3 para las instalaciones programadas del mes 2 por mes.
# x32: 0

# Costos de producción y almacenaje del mes 3 para las instalaciones programadas del mes 3 por mes.
# x33: 25

# Costos de producción y almacenaje del mes 3 para las instalaciones programadas del mes 4 por mes.
# x34: 5

# Costos de producción y almacenaje del mes 3 para las instalaciones programadas del mes 5 ficticio por mes.
# x35: 0

# Costos de producción y almacenaje del mes 4 para las instalaciones programadas del mes 1 por mes.
# x41: 0

# Costos de producción y almacenaje del mes 4 para las instalaciones programadas del mes 2 por mes.
# x42: 0

# Costos de producción y almacenaje del mes 4 para las instalaciones programadas del mes 3 por mes.
# x43: 0

# Costos de producción y almacenaje del mes 4 para las instalaciones programadas del mes 4 por mes.
# x44: 10

# Costos de producción y almacenaje del mes 4 para las instalaciones programadas del mes 5 ficticio por mes.
# x45: 0

# Analisis plan optimo

# Las instalaciones programadas para el primer mes seran cubiertas en su 100% por la produccion del mes 1

# las instalaciones programadas para el segundo mes seran cubieras por un 67% de la produccion del mes 1 y un 33% de la produccion del mes 2

# las instalaciones programadas para el tercer mes seran cubieras en su 100% por la produccion del mes 3

# las instalaciones programadas para el cuarto mes seran cubieras por un 25% de la produccion del mes 1, un 25% de la produccion del mes 3 y un 50% de la produccion del mes 4

# Las instalaciones programadas para el quinto mes ficticio seran cubiertas en su 100% por la produccion del mes 2

# Costo mínimo asociado al plan de transporte.

solucion_1

# Z MIN = 77.3

# El costo minimo asociado para este plan es de $77.3 millones de dolares.

#___________________________________________________________________________________________________________________________________________________________________________

# Ejercicio 2

# Electromaquinas Ltda. produce máquinas de coser en dos plantas ubicadas en A y B ; en las cuales
# hay una capacidad de producción semanal de 2.000 y 3.000 máquinas respectivamente. El producto
# es comercializado por tres distribuidores ubicados en C, D y E; en los cuales se ha establecido una
# demanda de 1.500, 1.700 y 1.800 máquinas de coser por semana. Además, se sabe que para llevar el
# producto a los distribuidores, se debe enviar a través de dos almacenes temporales ubicados en F y
# G, y que no se puede enviar producto directamente desde las plantas a los distribuidores. El costo de
# transporte de cada máquina se ha evaluado de la siguiente forma: de A a F $5, de A a G $8, de B a 
# F $3, de B a G $11, de F a G y viceversa $4, de F a C $14, de F a D $11, de F a E $12, de G a C
# $13, de G a D $13 y de G a E $10.

# ¿Cuál es el plan óptimo de envíos que minimiza los costos de la operación? No olvide definir, formular
# matemáticamente, resolver e interpretar.
# Tenga en consideración que: como no se puede enviar producto directamente desde las plantas a
# los distribuidores, los nodos destinos no pueden ser origenes, y los nodos orígenes no pueden
# ser destino.

# Solucion

# Como este es un problema de transbordo, se debe de implementar la solución de los 5 pasos.
# Paso 1: se debe de establecer la cantidad de reserva.
# La suma de las demandas es: 1500 + 1700 + 1800 = 5000
# La suma de las ofertas es: 2000 + 3000 = 5000
# R = Max {5.000; 5.000} = 5000
# Paso 2: A la oferta de cada origen y la demanda de cada destino se le suma la cantidad de reserva R = 5000.
# Las ofertas quedan así:
# Planta A = 7000
# Planta B = 8000
# Las demandas quedan así:
# Distribuidor ubicado en C = 6500
# Distribuidor ubicado en D = 6700
# Distribuidor ubicado en E = 6800
# Paso 3: Colocar todos los destinos como orígenes asignándole una oferta igual a la cantidad de reserva R. 
# Paso 4: Colocar todos los orígenes como destinos asignándole una demanda igual a la cantidad de reserva R
# Paso 5: Establecer las condiciones de equilibrio entre oferta y demanda tal como se hace en el modelo del transporte.
# En esta tabla se agrega M para los valores que están fuera del problema y no se deben de utilizar, ya que no hay transito en esas direcciones.


# Tabla

#             |   A   |   B   |   C   |   D   |   E   |   F   |   G   | DISP. |   
#             _________________________________________________________________ 
#         A   |   0   |   M   |   M   |   M   |   M   |   5   |   8   | 7000  | 
#         B   |   M   |   0   |   M   |   M   |   M   |   3   |   11  | 8000  | 
#         C   |   M   |   M   |   0   |   M   |   M   |   M   |   M   | 5000  | 
#         D   |   M   |   M   |   M   |   0   |   M   |   M   |   M   | 5000  | 
#         E   |   M   |   M   |   M   |   M   |   0   |   M   |   M   | 5000  | 
#         F   |   M   |   M   |   14  |   11  |   12  |   0   |   4   | 5000  | 
#         G   |   M   |   M   |   13  |   13  |   10  |   4   |   0   | 5000  | 
#             _________________________________________________________________ 
#   DEMANDA   | 5000  | 5000  | 6500  | 6700  | 6800  | 5000  | 5000  |
 
# Definicion de las variables de decisión.

# x11: Cantidad de maquinas de coser producidas semanalmente en origen A y enviadas al destino A
# x12: Cantidad de maquinas de coser producidas semanalmente en origen A y enviadas al destino B
# x13: Cantidad de maquinas de coser producidas semanalmente en origen A y enviadas al destino C
# x14: Cantidad de maquinas de coser producidas semanalmente en origen A y enviadas al destino D
# x15: Cantidad de maquinas de coser producidas semanalmente en origen A y enviadas al destino E
# x16: Cantidad de maquinas de coser producidas semanalmente en origen A y enviadas al destino F
# x17: Cantidad de maquinas de coser producidas semanalmente en origen A y enviadas al destino G
# x21: Cantidad de maquinas de coser producidas semanalmente en origen B y enviadas al destino A
# x22: Cantidad de maquinas de coser producidas semanalmente en origen B y enviadas al destino B
# x23: Cantidad de maquinas de coser producidas semanalmente en origen B y enviadas al destino C
# x24: Cantidad de maquinas de coser producidas semanalmente en origen B y enviadas al destino D
# x25: Cantidad de maquinas de coser producidas semanalmente en origen B y enviadas al destino E
# x26: Cantidad de maquinas de coser producidas semanalmente en origen B y enviadas al destino F
# x27: Cantidad de maquinas de coser producidas semanalmente en origen B y enviadas al destino G
# x31: Cantidad de maquinas de coser producidas semanalmente en origen C y enviadas al destino A
# x32: Cantidad de maquinas de coser producidas semanalmente en origen C y enviadas al destino B
# x33: Cantidad de maquinas de coser producidas semanalmente en origen C y enviadas al destino C
# x34: Cantidad de maquinas de coser producidas semanalmente en origen C y enviadas al destino D
# x35: Cantidad de maquinas de coser producidas semanalmente en origen C y enviadas al destino E
# x36: Cantidad de maquinas de coser producidas semanalmente en origen C y enviadas al destino F
# x37: Cantidad de maquinas de coser producidas semanalmente en origen C y enviadas al destino G
# x41: Cantidad de maquinas de coser producidas semanalmente en origen D y enviadas al destino A
# x42: Cantidad de maquinas de coser producidas semanalmente en origen D y enviadas al destino B
# x43: Cantidad de maquinas de coser producidas semanalmente en origen D y enviadas al destino C
# x44: Cantidad de maquinas de coser producidas semanalmente en origen D y enviadas al destino D
# x45: Cantidad de maquinas de coser producidas semanalmente en origen D y enviadas al destino E
# x46: Cantidad de maquinas de coser producidas semanalmente en origen D y enviadas al destino F
# x47: Cantidad de maquinas de coser producidas semanalmente en origen D y enviadas al destino G
# x51: Cantidad de maquinas de coser producidas semanalmente en origen E y enviadas al destino A
# x52: Cantidad de maquinas de coser producidas semanalmente en origen E y enviadas al destino B
# x53: Cantidad de maquinas de coser producidas semanalmente en origen E y enviadas al destino C
# x54: Cantidad de maquinas de coser producidas semanalmente en origen E y enviadas al destino D
# x55: Cantidad de maquinas de coser producidas semanalmente en origen E y enviadas al destino E
# x56: Cantidad de maquinas de coser producidas semanalmente en origen E y enviadas al destino F
# x57: Cantidad de maquinas de coser producidas semanalmente en origen E y enviadas al destino G
# x61: Cantidad de maquinas de coser producidas semanalmente en origen F y enviadas al destino A
# x62: Cantidad de maquinas de coser producidas semanalmente en origen F y enviadas al destino B
# x63: Cantidad de maquinas de coser producidas semanalmente en origen F y enviadas al destino C
# x64: Cantidad de maquinas de coser producidas semanalmente en origen F y enviadas al destino D
# x65: Cantidad de maquinas de coser producidas semanalmente en origen F y enviadas al destino E
# x66: Cantidad de maquinas de coser producidas semanalmente en origen F y enviadas al destino F
# x67: Cantidad de maquinas de coser producidas semanalmente en origen F y enviadas al destino G
# x71: Cantidad de maquinas de coser producidas semanalmente en origen G y enviadas al destino A
# x72: Cantidad de maquinas de coser producidas semanalmente en origen G y enviadas al destino B
# x73: Cantidad de maquinas de coser producidas semanalmente en origen G y enviadas al destino C
# x74: Cantidad de maquinas de coser producidas semanalmente en origen G y enviadas al destino D
# x75: Cantidad de maquinas de coser producidas semanalmente en origen G y enviadas al destino E
# x76: Cantidad de maquinas de coser producidas semanalmente en origen G y enviadas al destino F
# x77: Cantidad de maquinas de coser producidas semanalmente en origen G y enviadas al destino G

# i: 1, 2, 3, 4, 5, 6, 7
# j: 1, 2, 3, 4, 5, 6, 7

# Xij: Cantidad de maquinas de coser producidas semanalmente en origen i y enviadas al destino j.

# Modelo matemático completo.

# Función objetivo

#  MIN Z =    0X11 +  MX12 +  MX13 +  MX14 +  MX15 +  5X16 +  8X17
#             MX21 +  0X22 +  MX23 +  MX24 +  MX25 +  3X26 + 11X27
#             MX31 +  MX32 +  0X33 +  MX34 +  MX35 +  MX36 +  MX37
#             MX41 +  MX42 +  MX43 +  0X44 +  MX45 +  MX46 +  MX47
#             MX51 +  MX52 +  MX53 +  MX54 +  0X55 +  MX56 +  MX57
#             MX61 +  MX62 + 14X63 + 11X64 + 12X65 +  0X66 +  4X67
#             MX71 +  MX72 + 13X73 + 13X74 + 10X75 +  4X76 +  0X77

# X11 + X12 + X13 + X14 + X15 + X16 + X17 = 7000 Restriccion de oferta planta A
# X21 + X22 + X23 + X24 + X25 + X26 + X27 = 8000 Restriccion de oferta planta B 
# X31 + X32 + X33 + X34 + X35 + X36 + X37 = 5000 Restriccion de oferta planta C
# X41 + X42 + X43 + X44 + X45 + X46 + X47 = 5000 Restriccion de oferta planta D
# X51 + X52 + X53 + X54 + X55 + X56 + X57 = 5000 Restriccion de oferta planta E
# X61 + X62 + X63 + X64 + X65 + X66 + X67 = 5000 Restriccion de oferta planta F
# X71 + X72 + X73 + X74 + X75 + X76 + X77 = 5000 Restriccion de oferta planta G
# X11 + X21 + X31 + X41 + X51 + X61 + X71 = 5000 Restriccion de demanda planta A
# X12 + X22 + X32 + X42 + X52 + X62 + X72 = 5000 Restriccion de demanda planta B
# X13 + X23 + X33 + X43 + X53 + X63 + X73 = 6500 Restriccion de demanda planta C
# X14 + X24 + X34 + X44 + X54 + X64 + X74 = 6700 Restriccion de demanda planta D 
# X15 + X25 + X35 + X45 + X55 + X65 + X75 = 6800 Restriccion de demanda planta E
# X16 + X26 + X36 + X46 + X56 + X66 + X76 = 5000 Restriccion de demanda planta F
# X17 + X27 + X37 + X47 + X57 + X67 + X77 = 5000 Restriccion de demanda planta G
#                        X ij >= 0  (No negatividad)

# b. Obtenga una solución óptima.

# Transcribimos del modelo matematico a R.

# Para implementar el modelo en R debemos cambiar M por un valor mayor a los demas para que asi 
# no sean considerados como solucion al problema

# Matriz de costos

costo_2 <- matrix(c(         0,   100000,  100000,  100000, 100000,       5,      8,
                        100000,        0,  100000,  100000, 100000,       3,     11,
                        100000,   100000,       0,  100000, 100000,  100000, 100000,
                        100000,   100000,  100000,       0, 100000,  100000, 100000,
                        100000,   100000,  100000,  100000,      0,  100000, 100000,                       
                        100000,   100000,      14,      11,     12,       0,      4,                        
                        100000,   100000,      13,      13,     10,       4,      0), ncol = 7, byrow = TRUE)
  
costo_2

# Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs_2 <- c("==", "==", "==", "==", "==","==", "==")

row_constr_signs_2

# Coeficientes de las restricciones para las filas (oferta)

row_rhs_2 <- c(7000, 8000, 5000, 5000, 5000, 5000, 5000)

row_rhs_2

# Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs_2 <- c("==", "==", "==", "==","==", "==", "==")

col_constr_signs_2

# Coeficientes de las restricciones para las columnas (demanda)

col_rhs_2 <- c(5000, 5000, 6500, 6700, 6800, 5000, 5000)

col_rhs_2

# Resolvemos

solucion_2 <- lp.transport(cost.mat = costo_2,
                           direction = "min",
                           row.signs = row_constr_signs_2,
                           row.rhs = row_rhs_2,
                           col.signs = col_constr_signs_2,
                           col.rhs = col_rhs_2, 
                           presolve = 0)

solucion_2$solution

#       [,1] [,2] [,3] [,4] [,5] [,6] [,7]
# [1,] 5000    0    0    0    0 2000    0
# [2,]    0 5000    0    0    0 3000    0
# [3,]    0    0 5000    0    0    0    0
# [4,]    0    0    0 5000    0    0    0
# [5,]    0    0    0    0 5000    0    0
# [6,]    0    0 1500 1700 1800    0    0
# [7,]    0    0    0    0    0    0 5000

# Valores optimos para las variables de decision. (Plan optimo de transporte)

# Origen A envia al almacen temporal F
# X16: 2000, Esta asignacion es la que genera el trasbordo.

# Origen B envia al almacen temporal F
# X26: 3000, Esta es la asignacion que genera el trasbordo

# Desde almacen temporal F a el distribuidor C 
# X63: 1500

# Desde almacen temporal F a el distribuidor D 
# X64: 1700

# Desde almacen temporal F a el distribuidor E 
# X65: 1800

# Costo mínimo asociado al plan de transporte.

solucion_2

# Z MIN = 80300

# El costo minimo del plan es de 80300 unidades monetarias.

#___________________________________________________________________________________________________________________________________________________________________________

# Ejercicio 3.

# El entrenador de un equipo de natación debe asignar competidores para la prueba de 200 metros de
# relevo combinado que irá a las Olimpiadas Juveniles. Como muchos de sus mejores nadadores son
# rápidos en más de un estilo, no es fácil decidir cuál de ellos asignar a cada uno de los cuatro estilos.
# Los cinco mejores nadadores y sus mejores tiempos (en segundos) en cada estilo son los siguientes:

# Tabla
#                            
#                       | Carl   | Chris  | David   | Tony   | Ken   | 
#         Tipo de nado  ______________________________________________ 
#         Dorso         | 37.7   | 32.9   | 33.8    | 37.0   | 35.4  |
#         Pecho         | 43.4   | 33.1   | 42.2    | 34.7   | 41.8  |
#         Mariposa      | 33.3   | 28.5   | 38.9    | 30.4   | 33.6  |
#         Libre         | 29.2   | 26.4   | 29.6    | 28.5   | 31.1  |
#                       ______________________________________________

# El entrenador quiere determinar cómo asignar cuatro nadadores a los cuatro estilos de nado para
# minimizar la suma de los mejores tiempos correspondientes.
# a. Formule este problema como uno de asignación.
# b. Obtenga una solución óptima.
# c. Interprete los resultados óptimos obtenidos.

# Solucion

# Para la solucion se agregara un tipo de nado ficticio, ya que hay mas nadadores que tipos de nado.

# Tabla
#                       _____________________________________________     
#                       | Carl   | Chris  | David  | Tony   | Ken   | 
#         Tipo de nado  |________|________|________|________|_______| 
#         Dorso         | 37.7   | 32.9   | 33.8   | 37.0   | 35.4  |
#         Pecho         | 43.4   | 33.1   | 42.2   | 34.7   | 41.8  |
#         Mariposa      | 33.3   | 28.5   | 38.9   | 30.4   | 33.6  |
#         Libre         | 29.2   | 26.4   | 29.6   | 28.5   | 31.1  |
#         Ficticio      |  0.0   |  0.0   |  0.0   |  0.0   |  0.0  | 
#                       |________|________|________|________|_______|

# a. Formule este problema como uno de asignación.

# Definición de variables de decisión

# x11: Tipo de nado Dorso asignado a nadador Carl.
# x12: Tipo de nado Dorso asignado a nadador Chris.
# x13: Tipo de nado Dorso asignado a nadador David.
# x14: Tipo de nado Dorso asignado a nadador Tony.
# x15: Tipo de nado Dorso asignado a nadador Ken.
# x21: Tipo de nado Pecho asignado a nadador Carl.
# x22: Tipo de nado Pecho asignado a nadador Chris.
# x23: Tipo de nado Pecho asignado a nadador David.
# x24: Tipo de nado Pecho asignado a nadador Tony.
# x25: Tipo de nado Pecho asignado a nadador Ken.
# x31: Tipo de nado Mariposa asignado a nadador Carl.
# x32: Tipo de nado Mariposa asignado a nadador Chris.
# x33: Tipo de nado Mariposa asignado a nadador David.
# x34: Tipo de nado Mariposa asignado a nadador Tony.
# x35: Tipo de nado Mariposa asignado a nadador Ken.
# x41: Tipo de nado Libre asignado a nadador Carl.
# x42: Tipo de nado Libre asignado a nadador Chris.
# x43: Tipo de nado Libre asignado a nadador David.
# x44: Tipo de nado Libre asignado a nadador Tony.
# x45: Tipo de nado Libre asignado a nadador Ken.
# x51: Tipo de nado Ficticio asignado a nadador Carl.
# x52: Tipo de nado Ficticio asignado a nadador Chris.
# x53: Tipo de nado Ficticio asignado a nadador David.
# x54: Tipo de nado Ficticio asignado a nadador Tony.
# x55: Tipo de nado Ficticio asignado a nadador Ken.

# i: 1, 2, 3, 4, 5
# j: 1, 2, 3, 4, 5

# Xij: Tipo de nado i asignado a nadador j.

# Modelo matemático completo.

# Función objetivo

#  MIN Z =    37.7X11 +  32.9X12 +  33.8X13 +  37.0X14 +  35.4X15
#             43.4X21 +  33.1X22 +  42.2X23 +  34.7X24 +  41.8X25
#             33.3X31 +  28.5X32 +  38.9X33 +  30.4X34 +  33.6X35
#             29.2X41 +  26.4X42 +  29.6X43 +  28.5X44 +  31.1X45
#              0.0X51 +   0.0X52 +   0.0X53 +   0.0X54 +   0.0X55


# X11 + X12 + X13 + X14 + X15 = 1
# X21 + X22 + X23 + X24 + X25 = 1
# X31 + X32 + X33 + X34 + X35 = 1
# X41 + X42 + X43 + X44 + X45 = 1
# X51 + X52 + X53 + X54 + X55 = 1
# X11 + X21 + X31 + X41 + X51 = 1
# X12 + X22 + X32 + X42 + X52 = 1
# X13 + X23 + X33 + X43 + X53 = 1
# X14 + X24 + X34 + X44 + X54 = 1
# X15 + X25 + X35 + X45 + X55 = 1
#                       X ij >= 0  (No negatividad)

# b. Obtenga una solución óptima.

# Transcribimos del modelo matematico a R.

# Matriz de tiempos

costo_3 <- matrix(c(         37.7,  32.9,  33.8,  37.0,  35.4,
                             43.4,  33.1,  42.2,  34.7,  41.8,
                             33.3,  28.5,  38.9,  30.4,  33.6,
                             29.2,  26.4,  29.6,  28.5,  31.1,
                              0.0,   0.0,   0.0,   0.0,   0.0), ncol = 5, byrow = TRUE)

costo_3

# Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs_3 <- c("==", "==", "==", "==", "==")

row_constr_signs_3

# Coeficientes de las restricciones para las filas (oferta)

row_rhs_3 <- c( 1, 1, 1, 1, 1)

row_rhs_3

# Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs_3 <- c("==", "==","==", "==", "==")

col_constr_signs_3

# Coeficientes de las restricciones para las columnas (demanda)

col_rhs_3 <- c(1, 1, 1, 1, 1)

col_rhs_3

# Resolvemos

solucion_3 <- lp.transport(cost.mat = costo_3,
                           direction = "min",
                           row.signs = row_constr_signs_3,
                           row.rhs = row_rhs_3,
                           col.signs = col_constr_signs_3,
                           col.rhs = col_rhs_3, 
                           presolve = 0)

solucion_3$solution

#       [,1] [,2] [,3] [,4] [,5]
# [1,]    0    0    1    0    0
# [2,]    0    0    0    1    0
# [3,]    0    1    0    0    0
# [4,]    1    0    0    0    0
# [5,]    0    0    0    0    1

# c. Interprete los resultados óptimos obtenidos.

# Valores optimos para las variables de decision.

# El nadador 1 (Carl) se asigna a Tipo de nado Libre
# X41 : 1

# El nadador 2 (Chris) se asigna a Tipo de nado Mariposa
# X32 : 1

# El nadador 3 (David) se asigna a Tipo de nado Dorso
# X13 : 1

# El nadador 4 (Tony) se asigna a Tipo de nado Pecho
# X24 : 1

# El nadador 5 (Ken) se asigna a Tipo de nado Ficticio
# X55 : 1

# Tiempo minimo del equipo de natacion

solucion_3

# Z MIN = 126.2

# El tiempo minimo total del equipo de nadadores es de 126.2.



