

#                                            Solemne #2 

#Alumno:   Sebastián Venegas Carrasco
#Fecha:    09.09.2020
#Profesor: Marcelo Alid

#====================================================================================================================

#                    Ejercicio N°1
#                                                              
#                                                               
#             Costo por unidad Distribuida        Recursos
#                    Destino
# 
# Definiendo;
#
# Origen  = Mes de Fabricación
# Destino = Mes de Instalación
#
#                                      DESTINO
#                    ----------------------------------------------- 
#                    | Mes 1 | Mes 2   | Mes 3  | Mes 4  | "Mes 5"   | Prod. Max        
#         |=================================================================         |
#         | Mes 1    | 1.080 |  1.095  | 1.110  | 1.125  | 0         | 25
#         |================================================================
# Origen  | Mes 2    | M     |  1.110  | 1.125  | 1.140  | 0         | 35
#         |=================================================================
#         | Mes 3    | M     |  M      | 1.100  | 1.115  | 0         | 30
#         |=================================================================
#         | Mes 4    | M     |  M      | M      | 1.130  | 0         | 10
#         |=================================================================
#         | Demanda  | 10    |  15     | 25     | 20     | 30        | 
#
#
# Generando una M suficientemente grande obtenemos la siguiente matriz;
#
#         |   x1        x2     x3      x4     x5  | Prod. Máxima       
# --------|-------------------------------------- |----
#    1    | 1.080     1.095   1.110   1.125    0  | 25
#    2    |  1000     1.110   1.125   1.140    0  | 35
#    3    |  1000      1000   1.100   1.115    0  | 30
#    4    |  1000      1000    1000   1.130    0  | 10
# --------|---------------------------------------|-----
# Demanda |    10      15      25      20     30  | 
#
#
# A.- Formule este problema como uno de transporte.
#
# Definiendo;
#
#   Origen  = Mes de Fabricación
#   Destino = Mes de Instalación
#
#   X11 = Cant. de Motores de Turbinas a producir en el mes 1 para instalarlas en el mes 1
#   X12 = Cant. de Motores de Turbinas a producir en el mes 1 para instalarlas en el mes 2
#   X13 = Cant. de Motores de Turbinas a producir en el mes 1 para instalarlas en el mes 3
#   X14 = Cant. de Motores de Turbinas a producir en el mes 1 para instalarlas en el mes 4
#   X15 = Cant. de Motores de Turbinas a producir en el mes 1 para instalarlas en el mes 5
#   X21 = Cant. de Motores de Turbinas a producir en el mes 2 para instalarlas en el mes 1
#   X22 = Cant. de Motores de Turbinas a producir en el mes 2 para instalarlas en el mes 2
#   X23 = Cant. de Motores de Turbinas a producir en el mes 2 para instalarlas en el mes 3
#   X24 = Cant. de Motores de Turbinas a producir en el mes 2 para instalarlas en el mes 4
#   X25 = Cant. de Motores de Turbinas a producir en el mes 2 para instalarlas en el mes 5
#   X31 = Cant. de Motores de Turbinas a producir en el mes 3 para instalarlas en el mes 1
#   X32 = Cant. de Motores de Turbinas a producir en el mes 3 para instalarlas en el mes 2
#   X33 = Cant. de Motores de Turbinas a producir en el mes 3 para instalarlas en el mes 3
#   X34 = Cant. de Motores de Turbinas a producir en el mes 3 para instalarlas en el mes 4
#   X35 = Cant. de Motores de Turbinas a producir en el mes 3 para instalarlas en el mes 5
#   X41 = Cant. de Motores de Turbinas a producir en el mes 4 para instalarlas en el mes 1
#   X42 = Cant. de Motores de Turbinas a producir en el mes 4 para instalarlas en el mes 2
#   X43 = Cant. de Motores de Turbinas a producir en el mes 4 para instalarlas en el mes 3
#   X44 = Cant. de Motores de Turbinas a producir en el mes 4 para instalarlas en el mes 4
#   X45 = Cant. de Motores de Turbinas a producir en el mes 4 para instalarlas en el mes 5
#   X51 = Cant. de Motores de Turbinas a producir en el mes 5 para instalarlas en el mes 1
#   X52 = Cant. de Motores de Turbinas a producir en el mes 5 para instalarlas en el mes 2
#   X53 = Cant. de Motores de Turbinas a producir en el mes 5 para instalarlas en el mes 3
#   X54 = Cant. de Motores de Turbinas a producir en el mes 5 para instalarlas en el mes 4
#   X55 = Cant. de Motores de Turbinas a producir en el mes 5 para instalarlas en el mes 5
#
#
#
#   Min Z =  1.08 X11 + 1.095 X12 + 1.110 X13 + 1.125 X14 + 0 X15
#          + 1000 X21 + 1.110 X22 + 1.125 X23 + 1.140 X24 + 0 X25
#          + 1000 X31 + 1000  X32 + 1.100 X33 + 1.115 X34 + 0 X35
#          + 1000 X41 + 1000  X42 + 1000  X43 + 1.130 X44 + 0 X45
#
#   Restricciones:
#
#     x11 + x12 + x13 + x14 + x15  = 25 (Producción máxima mes 1).
#     x21 + x22 + x23 + x24 + x25  = 35 (Producción máxima mes 2).
#     x31 + x32 + x33 + x34 + x35  = 30 (Producción máxima mes 3).
#     x41 + x42 + x43 + x44 + x45  = 10 (Prducción máxima mes 4).
#     x11 + x21 + x31 + x41        = 10 (Instalaciones programadas mes 1).
#     x12 + x22 + x32 + x42        = 15 (Instalaciones programadas mes 2).
#     x13 + x23 + x33 + x43        = 25 (Instalaciones programadas mes 3).
#     x14 + x24 + x34 + x44        = 20 (Instalaciones programadas mes 4).
#     x15 + x25 + x35 + x45        = 30 (Instalaciones programadas mes 5).
#
#
# B.- Obtenga una solución óptima.


A <- matrix(c( 1.08, 1.095, 1.110, 1.125, 0,
                        1000, 1.110, 1.125, 1.140, 0,
                        1000, 1000, 1.100, 1.115, 0,
                        1000,  1000, 1000, 1.130, 0), ncol = 5, byrow = TRUE)

A

# Direccion de las desigualdades de Producción Máxima 

B <- c(">=", ">=", ">=", ">=")

B

# Coeficientes de las restricciones de Producción Máxima

C <- c(25, 35, 30, 10)

C

# Direccion de las desigualdades Instalaciones programadas

D <- c("<=", "<=", "<=", "<=", "<=")

D

# Coeficientes de las restricciones de Instalaciones programadas

E <- c(10, 15, 25, 20, 30)

E

solucion_1 <- lpSolve::lp.transport (cost.mat = A,
                           direction = "min",
                           row.signs = B,
                           row.rhs = C,
                           col.signs = D,
                           col.rhs = E, 
                           presolve = 1)

solucion_1$solution

solucion_1

# b) Obtenga una solución óptima.

#> solucion_1$solution
#     [,1] [,2] [,3] [,4] [,5]
#[1,]   10   10    0    5    0
#[2,]    0    5    0    0   30
#[3,]    0    0   25    5    0
#[4,]    0    0    0   10    0

# c) Interprete los resultados óptimos obtenidos.

#   En el mes 1 se deben fabricar e instalar 10 motores de turbinas. 
#   En el mes 1 se deben fabricar 10 motores de turbinas las cuales serán instaladas el mes 2.
#   En el mes 1 No se deben Fabricar motores de turbinas que deban ser instaladas el mes 3.
#   En el mes 1 se deben fabricar 5 motores de Turbinas las cuales serán instaladas el mes 4 
#   En el mes 1 NO se deben Fabricar motores de Turbinas que deban ser instaladas en el "mes 5".  
#
#   En el mes 2 NO se deben Fabricar motores de Turbinas que deban ser instaladas en el mes 1.
#   En el mes 2 se deben fabricar 5 motores de turbinas las cuales serán instaladas el mes 2
#   En el mes 2 No se deben Fabricar motores de turbinas que deban ser instaladas el mes 3.
#   En el mes 2 No se deben Fabricar motores de turbinas que deban ser instaladas el mes 4.
#   En el mes 2 Se deben fabricar 30 motores de turbinas y deben ser almacenadas sin fecha por ser nodo ficticio
#
#   En el mes 3 NO se deben Fabricar motores de Turbinas que deban ser instaladas en el mes 1.
#   En el mes 3 NO se deben Fabricar motores de Turbinas que deban ser instaladas en el mes 2.
#   En el mes 3 se deben fabricar 25 motores de turbinas las cuales serán instaladas el mes 3.
#   En el mes 3 se deben fabricar 5 motores de turbinas las cuales serán instaladas el mes 4
#   En el mes 3 No se deben Fabricar motores de turbinas que deban ser instaladas el "mes 5".
#
#   En el mes 4 NO se deben Fabricar motores de Turbinas que deban ser instaladas en el mes 1.
#   En el mes 4 NO se deben Fabricar motores de Turbinas que deban ser instaladas en el mes 2.
#   En el mes 4 NO se deben Fabricar motores de Turbinas que deban ser instaladas en el mes 3.
#   En el mes 4 se deben fabricar 10 motores de turbinas las cuales serán instaladas el mes 4
#   En el mes 4 NO se deben Fabricar motores de Turbinas que deban ser instaladas en el "mes 5".

#solucion_1
#
#Success: the objective function is 77.3 Millones de Dolares
#
#




#====================================================================================================================

#                             Ejercicio N°2

#
#                   F     G      C      D       E  |  Oferta
#          ----------------------------------------|
#           A       5     8   1000   1000    1000  |  2000  
#           B       3    11   1000   1000    1000  |  3000   
#           F    1000     4     14     11      12  |  5000  
#           G       4  1000     13     13      10  |  5000  
#         -------------------------------------------------       
#     Demanda    5000  5000   1500   1700    1800  | 15000

# 
#                          
# XAF : Costo semanal de transportar maquinas de coser desde la planta  A al almacen F.
# XAG : Costo semanal de transportar maquinas de coser desde la planta  A al almacen G.
# XBF : Costo semanal de transportar maquinas de coser desde la planta  B al almacen F.
# XBG : Costo semanal de transportar maquinas de coser desde la planta  B al almacen G.
# 
# XFG : Costo semanal de transportar maquinas de coser del almacen F al almacen G.
# XGF : Costo semanal de transportar maquinas de coser del almacen G al almacen F.
#
# XFC : Costo semanal de transportar maquinas de coser del almacen F al distribuidor C.
# XFD : Costo semanal de transportar maquinas de coser del almacen F al distribuidor D.
# XFE : Costo semanal de transportar maquinas de coser del almacen F al distribuidor E.
#
# XGC : Costo semanal de transportar maquinas de coser del almacen G al distribuidor C.
# XGD : Costo semanal de transportar maquinas de coser del almacen G al distribuidor D.
# XGE : Costo semanal de transportar maquinas de coser del almacen G al distribuidor E.
#
#
# FUNCIÓN OBJETIVO      

# Min Z =   5xAF + 8xAG  + MXAC  + MXAD  + MXAE   
#         + 3xBF + 11xBG + MXBC  + MXBD  + MXBE  
#         + 0xFF + 4xFG  + 14xFC + 11xFD + 12xFE 
#         + 4XGF + 0XGG  + 13xGC + 13xGD + 10xGE
# 
#
# Restricciones de Oferta

# xAF + xAG  + XAC  + XAD  + XAE <= 2000  (Restriccion de capacidad de producion planta A)
# xBF + xBG  + XBC  + XBD  + XBE <= 3000  (Restriccion de capacidad de producion planta B)
# xFF + xFG  + xFC  + xFD  + xFE  <= 5000 (Restriccion de capacidad de almacenamiento almacen F)
# XGF + XGG  + xGC  + xGD  + xGE  <= 5000 (Restriccion de capacidad de almacenamiento almacen G)
#
# Restricciones de Demanda
#
# xAF  + xBF  + xFF + XGF >= 5000 ( Restriccion de demanda semanal del  almacen F) 
# xAG  + xBG  + xFG + XGG >= 5000 ( Restriccion de demanda semanal del  almacen G) 
# XAC  + XBC  + xFC + xGC >= 1500 ( Restriccion de demanda semanal que se le entrega al distribuidor c) 
# XAD  + XBD  + xFD + xGD >= 1700 ( Restriccion de demanda semanal que se le entrega al distribuidor D)
# XAE  + XBE  + xFE + xGE >= 1800 ( Restriccion de demanda semanal que se le entrega al distribuidor E)
# 
# B.- Obtenga una solución óptima.

# Matriz de Costos


A <- matrix(c( 5,  8, 1000, 1000, 1000,
                        3, 11, 1000, 1000, 1000,
                        1000,  4,   14,   11,   12,
                        4, 1000, 13,   13,   10 ), ncol = 5, byrow = TRUE)

A

B <- c(2000, 3000,5000,5000)

C <- c("<=", "<=", "<=", "<=")

E <- c(5000,5000,1500 ,1700,1800)

D <- c(">=", ">=", ">=", ">=", ">=")


solucion_2 <- lpSolve::lp.transport(cost.mat = A,
                            direction = "min",
                            row.signs = C,
                            row.rhs = B,
                            col.signs = D,
                            col.rhs = E, 
                            presolve = 0,
                            compute.sens = 0 )


solucion_2["solution"]
solucion_2


#> solucion_2["solution"]
#$solution

#Valores optimos para las variables de decision. (Plan óptimo de asignación)

#[,1] [,2] [,3] [,4] [,5]
#[1,] 2000    0    0    0    0  Total de productos de la Planta A hacia el Almacen F.
#[2,] 3000    0    0    0    0  Total de Productos de la Planta B hacia el Almacen F.
#[3,]    0 5000    0    0    0  Total de Productos del Almacen F hacia el Almacen G. 
#[4,]    0    0 1500 1700 1800  Total de productos del almacen G a los distribuidores C = 1500, D = 1700, E = 1800.

#> solucion_2
#Success: the objective function is 98600, Costo minimo asociado al transporte de las máquinas de coser es de $98600 semanalmente.  



#====================================================================================================================

#                                       Ejercicio N°3
#                                         
#                                 
#                            | Carl Chris David Tony  Ken
#                            |  X1    X2   X3    X4    X5
#             ---------------|-------------------------------
#                 Dorso      |37.7  32.9  33.8  37.0  35.4
#             ---------------|------------------------------- 
#                 Pecho      |43.4  33.1  42.2  34.7  41.8
#             ---------------|-------------------------------
#                 Mariposa   |33.3  28.5  38.9  30.4  33.6
#             ---------------|-------------------------------
#                 Libre      |29.2  26.4  29.6  28.5  31.1
#             ---------------|-------------------------------
#                 Ficticio   |  0     0    0      0     0
#
#  A.- Formule este problema como uno de Asignación.

# Se genera un estilo de nado como ficticio para que corresponda la asignación del nadador vacante.
#
# x11 = Carl  asignado al estilo Dorso
# x12 = Carl  asignado al estilo Pecho
# x13 = Carl  asignado al estilo Mariposa
# x14 = Carl  asignado al estilo Libre
# x15 = Carl  asignado al estilo Ficticio
#
# x21 = Chris asignado al estilo Dorso
# x22 = Chris asignado al estilo Pecho
# x23 = Chris asignado al estilo Mariposa
# x24 = Chris asignado al estilo Libre
# x25 = Chris asignado al estilo Ficticio
#
# x31 = David asignado al estilo Dorso
# x32 = David asignado al estilo Pecho
# x33 = David asignado al estilo Mariposa
# x34 = David asignado al estilo Libre
# x35 = David asignado al estilo Ficticio
#
# x41 = Tony asignado al estilo Dorso
# x42 = Tony asignado al estilo Pecho
# x43 = Tony asignado al estilo Mariposa
# x44 = Tony asignado al estilo Libre
# x45 = Tony asignado al estilo Ficticio
#
# x51 = Ken asignado al estilo Dorso
# x52 = Ken asignado al estilo Pecho
# x53 = Ken asignado al estilo Mariposa
# x54 = Ken asignado al estilo Libre
# x55 = Ken asignado al estilo Ficticio
#
# Min Z =  37.7x11 + 32.9x12 + 33.8x13 + 37.0x14 + 35.4x15
#        + 43.4x21 + 33.1x22 + 42.2x23 + 34.7x24 + 41.8x25
#        + 33.3x31 + 28.5x32 + 38.9x33 + 30.4x34 + 33.6x35
#        + 29.2x41 + 26.4x42 + 29.6x43 + 28.5x44 + 31.1x45
#        +    0x51 +    0x52 +    0x53 +    0x54 +    0x55
#
#
#
#   Restricciones de Asignación 
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



A <- matrix(c( 37.7, 32.9, 33.8,  37.0, 35.4,
                        43.4, 33.1, 42.2, 34.7, 41.8,
                        33.3, 28.5, 38.9, 30.4, 33.6,
                        29.2,  26.4, 29.6, 28.5, 31.1,
                        0, 0, 0, 0, 0 ), ncol = 5, byrow = TRUE)

A

B <- c("==", "==", "==", "==", "==")

B

C <- c(1, 1, 1, 1, 1)

C

D <- c("<=", "<=", "<=", "<=", "<=")

D

E <- c(1, 1, 1, 1, 1)

E

solucion_3 <- lpSolve::lp.transport(cost.mat = A,
                           direction = "min",
                           row.signs = B,
                           row.rhs = C,
                           col.signs = D,
                           col.rhs = E, 
                           presolve = 1)

solucion_3$solution

solucion_3

#  b.- Obtenga una solución óptima.
#
# > solucion_3$solution
#      [,1] [,2] [,3] [,4] [,5]
#[1,]    0    0    1    0    0
#[2,]    0    0    0    1    0
#[3,]    0    1    0    0    0
#[4,]    1    0    0    0    0
#[5,]    0    0    0    0    1

#  c.- Interprete los resultados óptimos obtenidos.
#
#Valores optimos para las variables de decision. (Plan óptimo de asignación)
#
#  Carl NO competira en estilo de nado Dorso 
#  Carl NO competira en estilo de nado Pecho 
#  Carl NO competira en estilo de nado Mariposa 
#  Carl SI competira en estilo de nado Libre 
#  Carl NO competira en estilo de nado Ficticio 
#
#  Chris NO competira en estilo de nado Dorso 
#  Chris NO competira en estilo de nado Pecho 
#  Chris SI competira en estilo de nado Mariposa 
#  Chris NO competira en estilo de nado Libre 
#  Chris NO competira en estilo de nado Ficticio 
#
#  David SI competira en estilo de nado Dorso 
#  David NO competira en estilo de nado Pecho 
#  David NO competira en estilo de nado Mariposa 
#  David NO competira en estilo de nado Libre 
#  David NO competira en estilo de nado Ficticio 
#
#  Tony NO competira en estilo de nado Dorso 
#  Tony SI competira en estilo de nado Pecho 
#  Tony NO competira en estilo de nado Mariposa 
#  Tony NO competira en estilo de nado Libre 
#  Tony NO competira en estilo de nado Ficticio

#  Ken NO competira en estilo de nado Dorso 
#  Ken NO competira en estilo de nado Pecho 
#  Ken NO competira en estilo de nado Mariposa 
#  Ken NO competira en estilo de nado Libre 
#  Ken SI "competira" en estilo de nado Ficticio**
#
#  **El nadador Ken NO competira ya que el estilo ficticio solo se crea para una asignación "imaginaria".
#
# 
#   solucion_3
#
#   Success: the objective function is 126.2 
#   
#   La suma de los tiempos de los Nadadores asignados (Carl, Chris, David Tony) son 126.2 segundos en total.
#
#
#
#
#
#

















