# Solemne 2 Inv. Operaciones
# Gonzalo Venegas C.

############################################################################

#Ejercicio nº 1                                                          
                                                               
#  Mes     Ins Prog.| Prod. Maxima | C. Unitario Prod.| Costo Almacenaje |
#         |--------------------------------------------------------------|  
#   1     |   10    |    25        |     1.08         |    0.015
#   2     |   15    |    35        |     1.11         |    0.015
#   3     |   25    |    30        |     1.10         |    0.015
#   4     |   20    |    10        |     1.13         |


# Los costos unitarios de producción sumados al almacenaje se presentan en la siguiente tabla
#
#
#
#      Inst.    Mes 1    Mes 2   Mes 3   Mes 4     Ficticio     Prod. Max
#  Prod.                                                   |
#   Mes 1    | 1.080     1.095   1.110   1.125       0     |     25
#   Mes 2    |  M        1.110   1.125   1.140       0     |     35
#   Mes 3    |  M          M     1.100   1.115       0     |     30
#   Mes 4    |  M          M      M      1.130       0     |     10
#            ----------------------------------------------| -------------
#              10         15      25      20         30    |     90
#
#  A los costos de producción asignados, deben ser sumados los costos de almacenajes correspondientes
# al pasar desde un mes de producción a un mes siguiente.

# Debido a que deben ser igualadas las cantidades de producción y demanda acumulada es que se crea un nodo fictioso

# a) Formulación matematica

#   X11 Cantidad de turbinas producidas en mes 1 e instaladas en  mes 1
#   X12 Cantidad de turbinas producidas en mes 1 e instaladas en  mes 2
#   X13 Cantidad de turbinas producidas en mes 1 e instaladas en  mes 3
#   X14 Cantidad de turbinas producidas en mes 1 e instaladas en  mes 4
#   X15 Cantidad de turbinas producidas en mes 1 y destinadas al nodo ficticio
#   X21 Cantidad de turbinas producidas en mes 2 e instaladas en  mes 1
#   X22 Cantidad de turbinas producidas en mes 2 e instaladas en  mes 2
#   X23 Cantidad de turbinas producidas en mes 2 e instaladas en  mes 3
#   X24 Cantidad de turbinas producidas en mes 2 e instaladas en  mes 4
#   X25 Cantidad de turbinas producidas en mes 2 y destinadas al nodo ficticio
#   X31 Cantidad de turbinas producidas en mes 3 e instaladas en  mes 1
#   X32 Cantidad de turbinas producidas en mes 3 e instaladas en  mes 2
#   X33 Cantidad de turbinas producidas en mes 3 e instaladas en  mes 3
#   X34 Cantidad de turbinas producidas en mes 3 e instaladas en  mes 4
#   X35 Cantidad de turbinas producidas en mes 3 y destinadas al nodo ficticio
#   X41 Cantidad de turbinas producidas en mes 4 e instaladas en  mes 1
#   X42 Cantidad de turbinas producidas en mes 4 e instaladas en  mes 2
#   X43 Cantidad de turbinas producidas en mes 4 e instaladas en  mes 3
#   X44 Cantidad de turbinas producidas en mes 4 e instaladas en  mes 4
#   X45 Cantidad de turbinas producidas en mes 4 y destinadas al nodo ficticio
#   X51 Cantidad de turbinas producidas en mes 5 e instaladas en  mes 1
#   X52 Cantidad de turbinas producidas en mes 5 e instaladas en  mes 2
#   X53 Cantidad de turbinas producidas en mes 5 e instaladas en  mes 3
#   X54 Cantidad de turbinas producidas en mes 5 e instaladas en  mes 4
#   X55 Cantidad de turbinas producidas en mes 5 y destinadas al nodo ficticio
#
#
#   Función Objetivo
#
#   Min Z =  1.08X11 + 1.095X12 + 1.110X13 + 1.125X14 + 0X15
#          + 1000X21 + 1.110X22 + 1.125X23 + 1.140X24 + 0X25
#          + 1000X31 + 1000X32  + 1.100X33 + 1.115X34 + 0X35
#          + 1000X41 + 1000X42  + 1000X43  + 1.130X44 + 0X45
#
#   Restriciones de producción
#
#  Restricción Producción mes 1   x11 + x12 + x13 + x14 + x15  <= 25 
#  Restricción Producción mes 2   x21 + x22 + x23 + x24 + x25  <= 35 
#  Restricción Producción mes 3   x31 + x32 + x33 + x34 + x35  <= 30 
#  Restricción Producción mes 4   x41 + x42 + x43 + x44 + x45  <= 10 

#   Restricción de demanda turbinas instaladas.

#   Restricción mes 1  x11 + x21 + x31 + x41        >= 10 
#   Restricción mes 2  x12 + x22 + x32 + x42        >= 15 
#   Restricción mes 3  x13 + x23 + x33 + x43        >= 25 
#   Restricción mes 4  x14 + x24 + x34 + x44        >= 20 
#   Restricción mes 5  x15 + x25 + x35 + x45        >= 30  (Nodo ficticio)
#
#
#     Matriz de Costos


Costos <- matrix(c( 1.08, 1.095, 1.110, 1.125, 0,
                        1000, 1.110, 1.125, 1.140, 0,
                        1000, 1000, 1.100, 1.115, 0,
                        1000,  1000, 1000, 1.130, 0), ncol = 5, byrow = TRUE)

Costos

# Direccion de las desigualdades de las restricciones para las filas (oferta)

Signos.filas <- c(">=", ">=", ">=", ">=")

Signos.filas

# Coeficientes de las restricciones para las filas (oferta)

Coeficientes.F <- c(25, 35, 30, 10)

Coeficientes.F

# Direccion de las desigualdades de las restricciones para las columnas (demanda)

Signos.col <- c("<=", "<=", "<=", "<=", "<=")

Signos.col

# Coeficientes de las restricciones para las columnas (demanda)

Coeficientes.col <- c(10, 15, 25, 20, 30)

Coeficientes.col

solucion_Ej1 <- lpSolve::lp.transport(cost.mat = Costos,
                           direction = "min",
                           row.signs = Signos.filas,
                           row.rhs = Coeficientes.F,
                           col.signs = Signos.col,
                           col.rhs = Coeficientes.col, 
                           presolve = 1)

solucion_Ej1$solution

solucion_Ej1

# b) Solución Optima

#> solucion_5$solution

#        [,1]  [,2] [,3] [,4] [,5]
#   [1,]   10   10    0    5    0
#   [2,]    0    5    0    0   30
#   [3,]    0    0   25    5    0
#   [4,]    0    0    0   10    0

# C) Interpretación de resultados

#   Mes 1

#   En el Mes 1, se producen un total de 25 turbinas de las cuales, serán 10 instaladas en el mes 
#  correspondiente (mes 1) obteniendo un costo total de 10,8 millones de dolares; otras 10 serán
#  instaladas en el mes 2, en el cual se sumará al costo de producción el costo por concepto de almacenaje
#  de un mes teniendo un costo total de 10.95 millones de dolares, por último las 5 restantes serán
#  destinadas a instalar en el mes 4 por ende se debe sumar al costo de producción el costo de 3 meses de almacenamiento
#  5.625 millones de dolares.
#

# Mes 2 

#  En el mes 2, se producen un total de 35 turbinas, las cuales 5 serán destinadas a instalar en el mes 2
# cumpliendo de esta manera con la demanda total de turbinas instaladas para este mes (15), debido a las que se produjeron en el 
# mes anterior, el costo de estas es de 5,55 millones de dolares. Las 30 restantes se destinan a un nodo ficticio
# debido a que la capacidad de producción es mayor estas no tienen un costo de almacenaje asociado.
# desde el punto de vista economico, esta podria ser un nuevo cliente a quien se puede vender esta producción extra.

# Mes 3

#   En el mes 3 se producen un total de 30 turbinas, de estas, 25 serán instaladas en el mes 3 por ende el costo total
# corresponde solo al de produccion de este mes,siendo un total de 27.5 millones de dolares. Las 5 restantes seran almacenadas
# hasta el mes 4 donde seran instaladas, sumando un total por concepto de producción y almacenaje de 5.575 millones de dolares.

# Mes 4

#  En el mes 4 se producen un total de 10 turbinas, las cuales serán instaladas durante este mismo mes
# el costo total por esta producción de 11.3 millones de dolares

#solucion_Ej1
#
#Success: the objective function is 77.3 Millones de Dolares
#
# De acuerdo a los resultados obtenidos, podemos concluir que el costo minimo de producción de las turbinas
# es de 77.3 millones de dolares respondiendo al modelo de transporte asignado.En el cual adicionalmente
# como se ha mencionado en el mes 2, tenemos una sobreproducción donde es posible evaluar un nuevo cliente a quien 
# destinar dichas turbinas.







############################################################################

#Ejercicio nº 2     



#                 ALMACENES  |   DISTRIBUIDORES
#                   F    G     C      D      E    | 
#                                                 |
#           A      5     8     M      M      M    | 7000  
#           B      3    11     M      M      M    | 8000   
#           F      M     4     14     11     12   | 5000  
#           G      4     M     13     13     10   | 5000  
#             ------------------------------------------       
#     Demanda   5000  5000   6500   6700   6800     25000

# Definicion de Reserva = 5000

# a) Formulación matematica
#                          
# xAF : costo de transporte desde planta  A hasta almacen F semanalmente .
# xAG : costo de transporte desde planta  A hasta almacen G semanalmente.
# xBF : costo de transporte desde planta  B hasta almacen F semanalmente.
# xBG : costo de transporte desde planta  B hasta almacen G semanalmente.
# xFG : costo de transporte desde almacen F al almacen G semanalmente.
# xGF : costo de transporte desde almacen G al almacen F semanalmente.
#
# xFC : costo de transporte desde almacen F al distribuidor C semanalmente.
# xFD : costo de transporte desde almacen F al distribuidor D semanalmente.
# xFE : costo de transporte desde almacen F al distribuidor E semanalmente.
#
# xGC : costo de transporte desde almacen G al distribuidor C semanalmente.
# xGD : costo de transporte desde almacen G al distribuidor D semanalmente.
# xGE : costo de transporte desde almacen G al distribuidor E semanalmente.
#
#   Modelo Matematico completo :
#
#   Función Objetivo

# Min Z =   5xAF + 8xAG  + MXAC  + MXAD  + MXAE   
#         + 3xBF + 11xBG + MXBC  + MXBD  + MXBE  
#         + 0xFF + 4xFG  + 14xFC + 11xFD + 12xFE 
#         + 4XGF + 0XGG  + 13xGC + 13xGD + 10xGE
# 

# Sujeto a 
#
# Restricciones de capacidad de producción

# Capacidad producción planta A : xAF + xAG = 2000
# Capacidad producción planta B : xBF + xBG = 3000  

# Restricciones de Balanceo demanda
# 
# Almacen xAF + xBF = 5000
# Almacen xAG + xBG = 5000

# Debido a que los almacenes temporales deben ser capaces de recibir de forma independiente la produccion total

# Restricciones de Balanceo oferta
#
# Cantidad de maquinas entregadas desde almacen F : xFC  + xFD  + xFE = 5000 
# Cantidad de maquinas entregadas desde almacen G : xGC  + xGD  + xGE = 5000  

# Restriccion demanda distruibuidores 

# Demanda semanal distribuidor c : xFC + xGC = 1500 
# Demanda semanal distribuidor D : xFD + xGD = 1700 
# Demanda semanal distribuidor E : xFE + xGE = 1800 
#                

# Matriz de Costos


Costos_2 <- matrix(c( 5,  8, 1000, 1000, 1000,
                        3, 11, 1000, 1000, 1000,
                     1000,  4,   14,   11,   12,
                        4, 1000, 13,   13,   10 ), ncol = 5, byrow = TRUE)

Costos_2

Coeficientes.F_2 <- c(2000, 3000, 5000, 5000)

Signos.filas_2 <- c("==", "==", "==", "==")

Coeficientes.col_2 <- c(5000,5000,1500 ,1700,1800)

Signos.col_2 <- c("==", "==", "==", "==", "==")


solucion_Ej2 <- lpSolve::lp.transport (cost.mat = Costos_2,
                            direction = "min",
                            row.signs = Signos.filas_2,
                            row.rhs = Coeficientes.F_2,
                            col.signs = Signos.col_2,
                            col.rhs = Coeficientes.col_2, 
                            presolve = 0,
                            compute.sens = 0 )


solucion_Ej2["solution"]
solucion_Ej2

#  > solucion_Ej2["solution"]
#$solution
#    [,1]     [,2]  [,3]   [,4]  [,5]
# [1,] 2000    0      0     0     0
# [2,] 3000    0      0     0     0
# [3,]    0   5000    0     0     0
# [4,]    0    0    1500  1700  1800

# El plan optimo de trasbordo, propone que se efectue de la siguiente manera:
# Planta A realizara el despacho de 2000 maquinas hacia el almacen F, con un costo total de $10000
# Desde la planta B se realizara el despacho de 3000 maquinas hacia planta F con un costo total de $9000
# Posterior a esto seran despachadas las 5000 unidades desde el almacen F hasta el almacen G costo total de $20000
# Desde el almacen G se realiza el despacho de la demanda de cada uno de los distribuidores, 1500 hasta C, costo total de $19500
# adicional a esto se despachan desde G hasta D 1700 unidades con un costo total de $22100 y desde G hasta E 1800 maquinas con un costo
# total de $18000.

# 

#> solucion_Ej2
#Success: the objective function is 98600 

# El costo minimo generado con el modelo de transbordo entregado, genera un costo total de $98600
# siendo esta la mejor opción para el transporte de las maquinas de cocer producidas.


############################################################################

#Ejercicio nº 3    



#              Tabla nadadores y estilos     
#                 
#              | Carl Chris David Tony  Ken
#              |-------------------------------
#    Dorso     |37.7  32.9  33.8  37.0  35.4
#    Pecho     |43.4  33.1  42.2  34.7  41.8
#    Mariposa  |33.3  28.5  38.9  30.4  33.6
#    Libre     |29.2  26.4  29.6  28.5  31.1
#    Ficticio  |  0     0    0      0     0

# Se debe generar un estilo ficticio que determinara el nadador que no participara en la competicion

# a) Formulación matematica

# x11 Carl asignado al estilo de nado Dorso
# x12 Carl asignado al estilo de nado Pecho
# x13 Carl asignado al estilo de nado Mariposa
# x14 Carl asignado al estilo de nado Libre
# x15 Carl fuera de competición ( Ficticio )
#
# x21 Nadador Chris asignado al estilo de nado Dorso
# x22 Nadador Chris asignado al estilo de nado Pecho
# x23 Nadador Chris asignado al estilo de nado Mariposa
# x24 Nadador Chris asignado al estilo de nado Libre
# x25 Nadador Chris fuera de competición ( Ficticio )
#
# x31 Nadador David asignado al estilo de nado Dorso
# x32 Nadador David asignado al estilo de nado Pecho
# x33 Nadador David asignado al estilo de nado Mariposa
# x34 Nadador David asignado al estilo de nado Libre
# x35 Nadador David fuera de competición ( Ficticio )
#
# x41 Nadador Tony asignado al estilo de nado Dorso
# x42 Nadador Tony asignado al estilo de nado Pecho
# x43 Nadador Tony asignado al estilo de nado Mariposa
# x44 Nadador Tony asignado al estilo de nado Libre
# x45 Nadador Tony fuera de competición ( Ficticio )
#
# x51 Nadador Ken asignado al estilo de nado Dorso
# x52 Nadador Ken asignado al estilo de nado Pecho
# x53 Nadador Ken asignado al estilo de nado Mariposa
# x54 Nadador Ken asignado al estilo de nado Libre
# x55 Nadador Ken fuera de competición ( Ficticio )

# Función objetivo
#
# Min Z =  37.7x11 + 32.9x12 + 33.8x13 + 37.0x14 + 35.4x15
#        + 43.4x21 + 33.1x22 + 42.2x23 + 34.7x24 + 41.8x25
#        + 33.3x31 + 28.5x32 + 38.9x33 + 30.4x34 + 33.6x35
#        + 29.2x41 + 26.4x42 + 29.6x43 + 28.5x44 + 31.1x45
#        +    0x51 +    0x52 +    0x53 +    0x54 +    0x55
#
#
#
# Restricciones de asignación de nadadores, 1 nadador a cada estilo
#
#   x11 + x12 + x13 + x14 + x15 = 1 Carl debe ser asignado a un estilo
#   x21 + x22 + x23 + x24 + x25 = 1 Chris debe ser asignado a un estilo
#   x31 + x32 + x33 + x34 + x35 = 1 David debe ser asignado a un estilo
#   x41 + x42 + x43 + x44 + x45 = 1 Tony debe ser asignado a un estilo
#   x51 + x52 + x53 + x54 + x55 = 1 Ken debe ser asignado a un estilo
#
#   x11 + x21 + x31 + x41 + x51 = 1 Estilo nado Dorso debe tener un nadador
#   x12 + x22 + x32 + x42 + x52 = 1 Estilo nado Pecho debe tener un nadador
#   x13 + x23 + x33 + x43 + x53 = 1 Estilo nado Mariposa debe tener un nadador
#   x14 + x24 + x34 + x44 + x54 = 1 Estilo nado Nado libre debe tener un nadador
#   x15 + x25 + x35 + x45 + x55 = 1 Estilo ficticio (fuera competicion) debe tener un nadador



Costos_3 <- matrix(c( 37.7, 32.9, 33.8,  37.0, 35.4,
                        43.4, 33.1, 42.2, 34.7, 41.8,
                        33.3, 28.5, 38.9, 30.4, 33.6,
                        29.2,  26.4, 29.6, 28.5, 31.1,
                        0, 0, 0, 0, 0 ), ncol = 5, byrow = TRUE)

Costos_3

Signos.filas_3 <- c("==", "==", "==", "==", "==")

Signos.filas_3

Coeficientes.F_3 <- c(1, 1, 1, 1, 1)

Coeficientes.F_3

Signos.col_3 <- c("==", "==", "==", "==", "==")

Signos.col_3

Coeficientes.col_3 <- c(1, 1, 1, 1, 1)

Coeficientes.col_3

solucion_Ej3 <- lpSolve::lp.transport(cost.mat = Costos_3,
                           direction = "min",
                           row.signs = Signos.filas_3,
                           row.rhs = Coeficientes.F_3,
                           col.signs = Signos.col_3,
                           col.rhs = Coeficientes.col_3, 
                           presolve = 1)

solucion_Ej3$solution

solucion_Ej3

# b) Solución optima
#
#> solucion_Ej3$solution
#        [,1] [,2] [,3] [,4] [,5]
# [1,]    0    0    1    0    0
# [2,]    0    0    0    1    0
# [3,]    0    1    0    0    0
# [4,]    1    0    0    0    0
# [5,]    0    0    0    0    1

# c) Interpretación de resultados

# El estilo Dorso es asignado a David con un tiempo de 33.8 segundos
# El estilo Pecho es asignado a Tony con un tiempo de 34.7 segundos
# El estilo Mariposa es asignado a Chris con un tiempo de 28.5 segundos
# El estilo Libre es asignado a Carl con un tiempo de 29.2 segundos
# El estilo Ficticio (no compite) es asignado a Ken

 
# > solucion_Ej3
# Success: the objective function is 126.2 

# De esta manera es que se consigue el entrenador asigne a los mejores nadadores para cada uno de los estilos
# logrando obtener una marca total de 126.2 segundos minimizando al maximo los tiempos para ser mas competitivos como equipo.















