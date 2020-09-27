#                                       Solemne 2 Investigacion de Operaciones 2020




#                     Ejercicio 1                                                                        Rodrigo Charpentier Brevis
#                                                               
#                                                               
#   Mes         Costo por unidad Distribuida        Recursos
#                    Destino
#         |---------------------------------------|  
#  Origen |    1       2       3       4       5  |        
#         |                                       |
#    1    | 1.080     1.095   1.110   1.125    0  |     25
#    2    |  M        1.110   1.125   1.140    0  |     35
#    3    |  M          M     1.100   1.115    0  |     30
#    4    |  M          M       M     1.130    0  |     10
#         |---------------------------------------|
# Demanda |    10      15      25      20     30  | 
#
#
# Nueva Matriz con los valores agregados 
#
#
##   Mes         Costo por unidad Distribuida        Produccion Maxima
#                    Destino
#         |---------------------------------------|  
#  Origen |   x1        x2     x3      x4     x5  |        
#         |                                       |
#    1    | 1.080     1.095   1.110   1.125    0  |     25
#    2    |  1000     1.110   1.125   1.140    0  |     35
#    3    |  1000      1000   1.100   1.115    0  |     30
#    4    |  1000      1000    1000   1.130    0  |     10
#         |---------------------------------------|
# instala |    10      15      25      20     30  | 
#ciones programadas
#
# a) Formule matemáticamente este problema de Transporte, definiendo las variables de decisión, la función objetivo y las restricciones
#
#   x11 Cantidad de turbinas producidas en el mes 1 para instalarlas en el mes 1
#   x12 Cantidad de turbinas producidas en el mes 1 para instalarlas en el mes 2
#   x13 Cantidad de turbinas producidas en el mes 1 para instalarlas en el mes 3
#   x14 Cantidad de turbinas producidas en el mes 1 para instalarlas en el mes 4
#   x15 Cantidad de turbinas producidas en el mes 1 para instalarlas en el mes 5
#   x21 Cantidad de turbinas producidas en el mes 2 para instalarlas en el mes 1
#   x22 Cantidad de turbinas producidas en el mes 2 para instalarlas en el mes 2
#   x23 Cantidad de turbinas producidas en el mes 2 para instalarlas en el mes 3
#   x24 Cantidad de turbinas producidas en el mes 2 para instalarlas en el mes 4
#   x25 Cantidad de turbinas producidas en el mes 2 para instalarlas en el mes 5
#   x31 Cantidad de turbinas producidas en el mes 3 para instalarlas en el mes 1
#   x32 Cantidad de turbinas producidas en el mes 3 para instalarlas en el mes 2
#   x33 Cantidad de turbinas producidas en el mes 3 para instalarlas en el mes 3
#   x34 Cantidad de turbinas producidas en el mes 3 para instalarlas en el mes 4
#   x35 Cantidad de turbinas producidas en el mes 3 para instalarlas en el mes 5
#   x41 Cantidad de turbinas producidas en el mes 4 para instalarlas en el mes 1
#   x42 Cantidad de turbinas producidas en el mes 4 para instalarlas en el mes 2
#   x43 Cantidad de turbinas producidas en el mes 4 para instalarlas en el mes 3
#   x44 Cantidad de turbinas producidas en el mes 4 para instalarlas en el mes 4
#   x45 Cantidad de turbinas producidas en el mes 4 para instalarlas en el mes 5
#   x51 Cantidad de turbinas producidas en el mes 5 para instalarlas en el mes 1
#   x52 Cantidad de turbinas producidas en el mes 5 para instalarlas en el mes 2
#   x53 Cantidad de turbinas producidas en el mes 5 para instalarlas en el mes 3
#   x54 Cantidad de turbinas producidas en el mes 5 para instalarlas en el mes 4
#   x55 Cantidad de turbinas producidas en el mes 5 para instalarlas en el mes 5
#
#
#
#
#   Modelo Matematico completo :
#
#   Min Z =  1.08x11 + 1.095x12 + 1.110x13 + 1.125x14 + 0x15
#          + 1000x21 + 1.110x22 + 1.125x23 + 1.140x24 + 0x25
#          + 1000x31 + 1000x32  + 1.100x33 + 1.115x34 + 0x35
#          + 1000x41 + 1000x42  + 1000x43  + 1.130x44 + 0x45
#
#     Sujero a :
#
#     x11 + x12 + x13 + x14 + x15  = 25 (Restricción de poducción máxima mes 1).
#     x21 + x22 + x23 + x24 + x25  = 35 (Restricción de poducción máxima mes 2).
#     x31 + x32 + x33 + x34 + x35  = 30 (Restricción de poducción máxima mes 3).
#     x41 + x42 + x43 + x44 + x45  = 10 (Restricción de poducción máxima mes 4).
#     x11 + x21 + x31 + x41        = 10 (Restricción de instalaciones programadas mes 1).
#     x12 + x22 + x32 + x42        = 15 (Restricción de instalaciones programadas mes 2).
#     x13 + x23 + x33 + x43        = 25 (Restricción de instalaciones programadas mes 3).
#     x14 + x24 + x34 + x44        = 20 (Restricción de instalaciones programadas mes 4).
#     x15 + x25 + x35 + x45        = 30 (Restricción de instalaciones programadas mes 5).
#
#
#     Matriz de Costos


cost_mat_1 <- matrix(c( 1.08, 1.095, 1.110, 1.125, 0,
                        1000, 1.110, 1.125, 1.140, 0,
                        1000, 1000, 1.100, 1.115, 0,
                        1000,  1000, 1000, 1.130, 0), ncol = 5, byrow = TRUE)

cost_mat_1

# Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs_5 <- c(">=", ">=", ">=", ">=")

row_constr_signs_5

# Coeficientes de las restricciones para las filas (oferta)

row_rhs_5 <- c(25, 35, 30, 10)

row_rhs_5

# Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs_5 <- c("<=", "<=", "<=", "<=", "<=")

col_constr_signs_5

# Coeficientes de las restricciones para las columnas (demanda)

col_rhs_5 <- c(10, 15, 25, 20, 30)

col_rhs_5

solucion_5 <- lp.transport(cost.mat = cost_mat_1,
                           direction = "min",
                           row.signs = row_constr_signs_5,
                           row.rhs = row_rhs_5,
                           col.signs = col_constr_signs_5,
                           col.rhs = col_rhs_5, 
                           presolve = 1)

solucion_5$solution

solucion_5

# b) Obtenga una solución óptima.

#> solucion_5$solution
#     [,1] [,2] [,3] [,4] [,5]
#[1,]   10   10    0    5    0
#[2,]    0    5    0    0   30
#[3,]    0    0   25    5    0
#[4,]    0    0    0   10    0


#   En el mes 1 se deben fabricar 10 turbinas y deben ser instaladas en el mes 1 
#   En el mes 1 se deben fabricar 10 turbinas y deben ser almacenadas hasta el mes 2 para ser instaladas en el mes 2
#   En el mes 1 No se deben Fabricar Turbinas  para ser almacenadas e instaladas en el mes 3
#   En el mes 1 se deben fabricar 5 Turbinas y deben ser almacenadas hasta el mes 4 e instaladas en el mes 4 
#   En el mes 1 NO se deben Fabricar Turbinas  para ser almacenadas e instaladas en el mes 5 
#
#   En el mes 2 No se deben Fabricar Turbinas  para ser almacenadas e instaladas en el mes 1
#   En el mes 2 Se deben fabricar 5 turbinas y deben ser instaladas en el mes 2
#   En el mes 2 No se deben Fabricar Turbinas  para ser almacenadas e instaladas en el mes 3
#   En el mes 2 No se deben Fabricar Turbinas  para ser almacenadas e instaladas en el mes 4
#   En el mes 2 Se deben fabricar 30 turbinas y deben ser almacenadas en el mes 5 para una futura venta debido a que es un nodo ficticio
#
#   En el mes 3 No se deben Fabricar Turbinas  para ser almacenadas e instaladas en el mes 1
#   En el mes 3 No se deben Fabricar Turbinas  para ser almacenadas e instaladas en el mes 2
#   En el mes 3 Se deben fabricar 25 turbinas y deben ser instaladas en el mes 3
#   En el mes 2 Se deben fabricar 5 turbinas y deben ser almacenadas hasta el mes 4 e instaladas en el mes 4
#   En el mes 3 No se deben Fabricar Turbinas  para ser almacenadas e instaladas en el mes 5
#
#   En el mes 4 No se deben Fabricar Turbinas  para ser almacenadas e instaladas en el mes 1
#   En el mes 4 No se deben Fabricar Turbinas  para ser almacenadas e instaladas en el mes 2
#   En el mes 4 No se deben Fabricar Turbinas por lo tanto NO hay turbinas para ser almacenadas e instaladas en el mes 3
#   En el mes 4 Se deben fabricar 10 turbinas y deben ser instaladas en el mes 4
#   En el mes 4 No se deben Fabricar Turbinas  para ser almacenadas e instaladas en el mes 5

#solucion_5
#
#Success: the objective function is 77.3 Millones de Dolares
#
#
# c) Interprete los resultados óptimos obtenidos.

#   En el mes 1 se Fabrican 10 Turbinas y se instalan en el mes 1, teniendo un costo en el mes de 10.8 Millones de Dolares.
#   En el mes 1 se Fabrican 10 Turbinas y se almacenan hasta el mes 2 e instalan en el mes 2, teniendo un costo total de 10.95 Millones de Dolares.
#   En el mes 1 se Fabrican 5  Turbinas y se almacenan hasta el mes 4 e instalan en el mes 4, teniendo un costo total de 5.625 Millones de Dolares.
#   
#   En el mes 2 se Fabrican 5 Turbinas y se a instalan en el mes 2, teniendo un costo en el mes de 5.55 Millones de Dolares.
#   En el mes 2 se Fabrican 30 Turbinas y se almacenan hasta el  mes 5, teniendo un costo total de 0 Millones de Dolares por que es imaginario el mes 5 de instalacion y almacenamiento.
#
#   En el mes 3 se Fabrican 25 Turbinas y se instalan en el mes 3 , teniendo un costo en el mes de 27.5 Millones de Dolares.
#   En el mes 3 se Fabrican 5 Turbinas y se almacenan hasta el mes 4 e instalan en el mes 4, teniendo un costo total de 5.575 Millones de Dolares.
#   
#   En el mes 4 se Fabrican 10 Turbinas y se instalan en el mes 4, teniendo un costo en el mes de 11.3 Millones de Dolares.
#
#   
#   Lo que al sumar todos los costos asociados a la produccion y almacenamiento da un total de 77.3 Millones de Dolares que es el costo minimo asociado al problema de transporte.                                                
#   Se debe comentar que en el mes 2 no hay fabricacion de 30 turbinas como lo señala el modelo por que es ficticia la demanda de estos y se debe evaluar si en un futuro se pueden vender estas turbinas.
#
#
#
#
#
#
#
#








#                             Ejercicio 2

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
#[1,] 2000    0    0    0    0  
#[2,] 3000    0    0    0    0  
#[3,]    0 5000    0    0    0  
#[4,]    0    0 1500 1700 1800  , , 
#
# Cantidad total de productos de la Planta A hacia el Almacen F Semanalmente 2000
# Cantidad total de Productos de la Planta B hacia el Almacen F Semanalmente 3000
# Cantidad total de Productos del Almacen F hacia el Almacen G Semanalmente  5000
# Cantidad de productos del almacen G a los distribuidores C = 1500 maquinas de coser Semanalmente 
# Cantidad de productos del almacen G a los distribuidores D = 1700 maquinas de coser semanalmente
# Cantidad de productos del almacen G a los distribuidores E = 1800 maquinas de coser semanalmente .

# c) Interprete los resultados óptimos obtenidos.

# El costo total de transportar productos de la planta A hacia el almacen F es de $10000
# El costo total de transportar productos de la planta B hacia el almacen F es de $ 9000
# EL csoto de total de transportar productos desde el Almacen F hacia el Almacen G es de $20000
# EL costo de transportar productos del almacen G al distribuidor C es de $19500
# EL costo de transportar productos del almacen G al distribuidor D es de $22100
# EL costo de transportar productos del almacen G al distribuidor E es de $18000

#
#> solucion_2
# Success: the objective function is 98600 
# 
# Lo que al sumar todos los costos de transporte de los productos es de $98600 para garantizar el costo minimo de transporte de los productos a sus destinos correspondientes 
#
#
#
#
#
#
#
#
#
#> solucion_2
#Success: the objective function is 98600, el costo minimo asociado al transporte de los productos es de $98600 semanalmente.  




#Ejercicio 3
#                             Nadador
#                   
#                 X1    X2   X3    X4    X5
# Tipo de Nado | Carl Chris David Tony  Ken
#              |-------------------------------
#    Dorso     |37.7  32.9  33.8  37.0  35.4
#    Pecho     |43.4  33.1  42.2  34.7  41.8
#    Mariposa  |33.3  28.5  38.9  30.4  33.6
#    Libre     |29.2  26.4  29.6  28.5  31.1
#    Ficticio  |  0     0    0      0     0
#
# a) Formule matemáticamente este problema de Asignación, definiendo las variables de decisión, la función objetivo y las restricciones.
#
# x11 Nadador Carl asignado al estilo de nado Dorso
# x12 Nadador Carl asignado al estilo de nado Pecho
# x13 Nadador Carl asignado al estilo de nado Mariposa
# x14 Nadador Carl asignado al estilo de nado Libre
# x15 Nadador Carl asignado al estilo de nado Ficticio
#
# x21 Nadador Chris asignado al estilo de nado Dorso
# x22 Nadador Chris asignado al estilo de nado Pecho
# x23 Nadador Chris asignado al estilo de nado Mariposa
# x24 Nadador Chris asignado al estilo de nado Libre
# x25 Nadador Chris asignado al estilo de nado Ficticio
#
# x31 Nadador David asignado al estilo de nado Dorso
# x32 Nadador David asignado al estilo de nado Pecho
# x33 Nadador David asignado al estilo de nado Mariposa
# x34 Nadador David asignado al estilo de nado Libre
# x35 Nadador David asignado al estilo de nado Ficticio
#
# x41 Nadador Tony asignado al estilo de nado Dorso
# x42 Nadador Tony asignado al estilo de nado Pecho
# x43 Nadador Tony asignado al estilo de nado Mariposa
# x44 Nadador Tony asignado al estilo de nado Libre
# x45 Nadador Tony asignado al estilo de nado Ficticio
#
# x51 Nadador Ken asignado al estilo de nado Dorso
# x52 Nadador Ken asignado al estilo de nado Pecho
# x53 Nadador Ken asignado al estilo de nado Mariposa
# x54 Nadador Ken asignado al estilo de nado Libre
# x55 Nadador Ken asignado al estilo de nado Ficticio

#     Modelo Matematico completo 
#
# Min Z =  37.7x11 + 32.9x12 + 33.8x13 + 37.0x14 + 35.4x15
#        + 43.4x21 + 33.1x22 + 42.2x23 + 34.7x24 + 41.8x25
#        + 33.3x31 + 28.5x32 + 38.9x33 + 30.4x34 + 33.6x35
#        + 29.2x41 + 26.4x42 + 29.6x43 + 28.5x44 + 31.1x45
#        +    0x51 +    0x52 +    0x53 +    0x54 +    0x55
#
#
#
#   Sujeto a :
#
#   x11 + x12 + x13 + x14 + x15 = 1 Restriccion de Nadador Carl
#   x21 + x22 + x23 + x24 + x25 = 1 Restriccion de Nadador Chris
#   x31 + x32 + x33 + x34 + x35 = 1 Restriccion de Nadador David
#   x41 + x42 + x43 + x44 + x45 = 1 Restriccion de Nadador Tony
#   x51 + x52 + x53 + x54 + x55 = 1 Restriccion de Nadador Ken 
#
#   x11 + x21 + x31 + x41 + x51 <= 1 Restriccion de tipo de Nado Dorso
#   x12 + x22 + x32 + x42 + x52 <= 1 Restriccion de tipo de Nado Pecho
#   x13 + x23 + x33 + x43 + x53 <= 1 Restriccion de tipo de Nado Mariposa
#   x14 + x24 + x34 + x44 + x54 <= 1 Restriccion de tipo de Nado Libre
#   x15 + x25 + x35 + x45 + x55 <= 1 Restriccion de tipo de Nado Ficticio



cost_mat_1 <- matrix(c( 37.7, 32.9, 33.8,  37.0, 35.4,
                        43.4, 33.1, 42.2, 34.7, 41.8,
                        33.3, 28.5, 38.9, 30.4, 33.6,
                        29.2,  26.4, 29.6, 28.5, 31.1,
                        0, 0, 0, 0, 0 ), ncol = 5, byrow = TRUE)

cost_mat_1

row_constr_signs_5 <- c("==", "==", "==", "==", "==")

row_constr_signs_5

row_rhs_5 <- c(1, 1, 1, 1, 1)

row_rhs_5

col_constr_signs_5 <- c("<=", "<=", "<=", "<=", "<=")

col_constr_signs_5

col_rhs_5 <- c(1, 1, 1, 1, 1)

col_rhs_5

solucion_5 <- lp.transport(cost.mat = cost_mat_1,
                           direction = "min",
                           row.signs = row_constr_signs_5,
                           row.rhs = row_rhs_5,
                           col.signs = col_constr_signs_5,
                           col.rhs = col_rhs_5, 
                           presolve = 1)

solucion_5$solution
.
solucion_5

# b) Obtenga una solución óptima.
#
# > solucion_5$solution
#      [,1] [,2] [,3] [,4] [,5]
#[1,]    0    0    1    0    0
#[2,]    0    0    0    1    0
#[3,]    0    1    0    0    0
#[4,]    1    0    0    0    0
#[5,]    0    0    0    0    1

#
#Valores optimos para las variables de decision. (Plan óptimo de asignación)
#
#  El nadador Carl NO es asignado al Tipo de nado Dorso 
#  El nadador Carl NO es asignado al Tipo de nado Pecho 
#  El nadador Carl NO es asignado al Tipo de nado Mariposa 
#  El nadador Carl SI es asignado al Tipo de nado Libre 
#  El nadador Carl NO es asignado al Tipo de nado Ficticio 
#
#  El nadador Chris NO es asignado al Tipo de nado Dorso 
#  El nadador Chris NO es asignado al Tipo de nado Pecho 
#  El nadador Chris SI es asignado al Tipo de nado Mariposa 
#  El nadador Chris NO es asignado al Tipo de nado Libre 
#  El nadador Chris NO es asignado al Tipo de nado Ficticio 
#
#  El nadador David SI es asignado al Tipo de nado Dorso 
#  El nadador David NO es asignado al Tipo de nado Pecho 
#  El nadador David NO es asignado al Tipo de nado Mariposa 
#  El nadador David NO es asignado al Tipo de nado Libre 
#  El nadador David NO es asignado al Tipo de nado Ficticio 
#
#  El nadador Tony NO es asignado al Tipo de nado Dorso 
#  El nadador Tony SI es asignado al Tipo de nado Pecho 
#  El nadador Tony NO es asignado al Tipo de nado Mariposa 
#  El nadador Tony NO es asignado al Tipo de nado Libre 
#  El nadador Tony NO es asignado al Tipo de nado Ficticio
#
#  El nadador Ken NO competira en ningun tipo de nado debido a que no cumple con las exigencias del entrenador en relacion a los tiempos en segundos para minimizar los tiempos.
#
#  c)Interprete los resultados óptimos obtenidos.
#
# 
#   solucion_5
#
#   Success: the objective function is 126.2 segundos 
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
#
#
#
#
#

















