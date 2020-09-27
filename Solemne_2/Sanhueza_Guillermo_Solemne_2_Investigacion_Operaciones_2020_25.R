#Guillermo Sanhueza


library(lpSolve)

########### Ejercicio 1 ###############


# 
#                                                               
#  Mes   Intalaciones    Produc. max      Costo unitario    Costo unitario     
#         Programadas                      (produccion)       (Almacenaje) 
#                                                  
#   1         10            25                 1.08               0.015      
#   2         15            35                 1.11               0.015       
#   3         25            30                 1.10               0.015      
#   4         20            10                 1.13                     




# Para poder resolver este problema, se deben dar valores muy altos (gran M = 1000) de tal forma
# que la tabla sera modificada con los costos correspondientes, ademas se incluyo un mes 5 el cual 
#sera ficticio y nos servira para dar balance a nuestro problema. nuestra tabla queda de la siguiente forma:

# X11: Costo de producción + Costo de almacenaje= 1.08 +         0 = 1.08
# X12: Costo de producción + Costo de almacenaje= 1.08 +     0.015 = 1.095
# X13: Costo de producción + Costo de almacenaje= 1.08 + (2*0.015) = 1.11
# X14: Costo de producción + Costo de almacenaje= 1.08 + (3*0.015) = 1.125
# X15: 0 ,nodo ficticio.

# X21: M ya que por lógica está condición es imposible.
# X22: Costo de producción + Costo de almacenaje= 1.11 +         0 = 1.11
# X23: Costo de producción + Costo de almacenaje= 1.11 +     0.015 = 1.125
# X24: Costo de producción + Costo de almacenaje= 1.11 + (2*0.015) = 1.14
# X25: 0 ,nodo ficticio.

# X31: M ya que por lógica está condición es imposible.
# X32: M ya que por lógica está condición es imposible.
# X33: Costo de producción + Costo de almacenaje= 1.10 +         0 = 1.10
# X34: Costo de producción + Costo de almacenaje= 1.10 +     0.015 = 1.115
# X35: 0 ,nodo ficticio.

# X41: M ya que por lógica está condición es imposible.
# X42: M ya que por lógica está condición es imposible.
# X43: M ya que por lógica está condición es imposible.
# X44: Costo de producción + Costo de almacenaje= 1.13 +         0 = 1.13
# X45: 0 ,nodo ficticio.


#mes         1	      2	      3	      4	    FICTICIO  	Oferta
# 1        1,080  	1,095  	1,110	  1,125	     0	        25
# 2	       1000	    1,110	  1,125	  1,140      0	        35
# 3      	 1000   	1000   	1,100	  1,115	     0        	30
# 4      	 1000	    1000	  1000  	1,130      0	        10
#Demanda   	10       15      25	     20	      30	


#Definición de las variables de decisión

# x11 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 1.
# x12 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 2.
# x13 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 3.
# x14 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 4.
# x15 : Cantidad de motores de turbina producidos el mes 1, para instalar en el mes 5.

# x21 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 1.(Condición imposible, gran M)
# x22 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 2.
# x23 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 3.
# x24 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 4.
# x25 : Cantidad de motores de turbina producidos el mes 2, para instalar en el mes 5.

# x31 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 1.(Condición imposible, gran M)
# x32 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 2.(Condición imposible, gran M)
# x33 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 3.
# x34 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 4.
# x35 : Cantidad de motores de turbina producidos el mes 3, para instalar en el mes 5.

# x41 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 1.(Condición imposible, gran M)
# x42 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 2.(Condición imposible, gran M)
# x43 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 3.(Condición imposible, gran M)
# x44 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 4.
# x45 : Cantidad de motores de turbina producidos el mes 4, para instalar en el mes 5.

#	xij: cantidad de motores de turbinas producidos en el mes i, que corresponde instalar en el mes j.
# i: 1,2,3,4 ; j:1,2,3,4,5.

#Modelo matematico completo.

# Funcion Objetivo.

#        MIN Z = 1,08x11 + 1,095x12  +  1,11x13 +  1,125x14  + 0x15 + 
#                1000x21 +  1,11x22  + 1,125x23 +   1,14x24  + 0x25 +
#                1000x31 +  1000x32  +   1,1x33 +  1,115x34  + 0x35 +
#                1000x41 +  1000x42  +  1000x43 +   1,13x44  + 0x45.

#       S.A.
#             x11 + x12 + x13 + x14 + x15  = 25 (Restriccion de poducción maxima mes 1).
#             x21 + x22 + x23 + x24 + x25  = 35 (Restriccion de poducción maxima mes 2).
#             x31 + x32 + x33 + x34 + x35  = 30 (Restriccion de poducción maxima mes 3).
#             x41 + x42 + x43 + x44 + x45  = 10 (Restriccion de poducción maxima mes 4).
#             x11 + x21 + x31 + x41        = 10 (Restriccion de instalaciones programadas mes 1).
#             x12 + x22 + x32 + x42        = 15 (Restriccion de instalaciones programadas mes 2).
#             x13 + x23 + x33 + x43        = 25 (Restriccion de instalaciones programadas mes 3).
#             x14 + x24 + x34 + x44        = 20 (Restriccion de instalaciones programadas mes 4).
#             x15 + x25 + x35 + x45        = 30 (Restriccion de instalaciones programadas mes 5).
#                                      xij => 0 (No negatividad de las variables).

#Transcribimos el modelo anterior a R.

#Matriz de costos

cost_mat_ejer1 <- matrix(c(1.08, 1.095, 1.110, 1.125,  0,
                           1000, 1.110, 1.125, 1.140,  0,
                           1000,  1000, 1.100, 1.115,  0,
                           1000,  1000,  1000, 1.130, 0), ncol = 5, byrow = TRUE)

#Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs_ejer1 <- c("==", "==", "==", "==")

#Coeficientes de las restricciones para las filas (oferta)

row_rhs_ejer1 <- c(25, 35, 30, 10)

#Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs_ejer1 <- c("==", "==", "==", "==","==")

#Coeficientes de las restricciones para las columnas (demanda)

col_rhs_ejer1 <- c(10, 15, 25, 20, 30)

solucion_ejer1 <- lp.transport(cost.mat = cost_mat_ejer1,
                           direction = "min",
                           row.signs = row_constr_signs_ejer1,
                           row.rhs = row_rhs_ejer1,
                           col.signs = col_constr_signs_ejer1,
                           col.rhs = col_rhs_ejer1, 
                           presolve = 0,
                           compute.sens = 0)

###### Resolvemos ejercicio 1 ######

solucion_ejer1$solution

#      [,1] [,2] [,3] [,4] [,5]
#[1,]   10   10    0    5    0
#[2,]    0    5    0    0   30
#[3,]    0    0   25    5    0
#[4,]    0    0    0   10    0

#Valores óptimos para las variables de decisión.

# En el mes 1 producir 10 motores de turbina y que sean instalados en el mes 1.  X11 = 10
#     10 motores de turbina * 1,080 costo = 10.8.
#Esta producción es por un costo total de = 10.8 millones de dólares.

# En el mes 1 producir 10 motores de turbina, que sean almacenados e instalados en el mes 2.  X12 = 10
#     10 motores de turbina * 1,095 costo = 10.95.
#Esta producción es por un costo total de = 10.95 millones de dólares.

# En el mes 1 producir 5 motores de turbina, que sean almacenados e instalados en el mes 4.  X14 = 5
#     5 motores de turbina * 1.125 costo = 5.625
#Esta producción es por un costo total de = 5.625 millones de dólares.


# En el mes 2 producir 5 motores de turbina, que sean almacenados e instalados en el mes 2.  X22 = 5
#      5 motores de turbina * 1.11 costo = 5.55
#Esta producción es por un costo total de = 5.55 millones de dólares.

# En el mes 2 producir 30 motores de turbina, que sean almacenados e instalados en el mes 5. (ficticio, no es necesario realizarlo) X25 = 30

# En el mes 3 producir 25 motores de turbina, que sean almacenados e instalados en el mes 3. X33 = 25
#      25 motores de turbina * 1.1 costo = 27.5
#Esta producción es por un costo total de = 27.5 millones de dólares.

# En el mes 3 producir 5 motores de turbina, que sean almacenados e instalados en el mes 4.  X34 = 5
#      5 motores de turbina * 1.115 costo = 5.575
#Esta producción es por un costo total de = 5.575 millones de dólares.

# En el mes 4 producir 10 motores de turbina, que sean almacenados e instalados en el mes 4. X44 = 10
#      10 motores de turbina * 1.13 costo = 11.3
#Esta producción es por un costo total de = 11.3 millones de dólares..



#Costo minimo asociado al plan de transporte.

solucion_ejer1
#Success: the objective function is 77.3 

#El costo minimo asociado a este plan de transporte es de  77,3 millones de dolares: Z =  77,3 millones de dolares.


########## Ejercicio 2 ###############

#            C	    D	    E	     F	     G	   Oferta
#  A       	1000	1000	1000       5	    8	  2000
#  B       	1000	1000	1000	     3	   11	  3000
#  F     	    14	  11	  12	  1000      4	  5000
#  G     	    13	  13	  10	     4	 1000	  5000
#Demanda    1500	1700	1800	  5000 	 5000	

#Definición de las variables de decisión.

# XAF : costo de transporte de maquinas de coser enviadas desde la planta  A al almacen F semanalmente.
# XAG : costo de transporte de maquinas de coser enviadas desde la planta  A al almacen G semanalmente.
# XBF : costo de transporte de maquinas de coser enviadas desde la planta  B al almacen F semanalmente.
# XBG : costo de transporte de maquinas de coser enviadas desde la planta  B al almacen G semanalmente.

# XFG : costo de transporte de maquinas de coser enviadas del almacen F al almacen G semanalmente.
# XGF : costo de transporte de maquinas de coser enviadas del almacen G al almacen F semanalmente.

# XFC : costo de transporte de maquinas de coser enviadas del almacen F al distribuidor C semanalmente.
# XFD : costo de transporte de maquinas de coser enviadas del almacen F al distribuidor D semanalmente.
# XFE : costo de transporte de maquinas de coser enviadas del almacen F al distribuidor E semanalmente.

# XGC : costo de transporte de maquinas de coser enviadas del almacen G al distribuidor C semanalmente.
# XGD : costo de transporte de maquinas de coser enviadas del almacen G al distribuidor D semanalmente.
# XGE : costo de transporte de maquinas de coser enviadas del almacen G al distribuidor E semanalmente.

#Modelo matemático completo.

#       Min z =  1000XAC + 1000XAD + 1000XAE +    5XAF +   8 XAG +
#                1000XBC + 1000XBD + 1000XBE +    3CBF +   11XBG +
#                  14XFC +   11XFD +   12XFE + 1000XFF +    4XFG +
#                  13XGC +   13XGD +   10XGE +    4XGF + 1000XGG.

#         S.A


# Restricciones de Oferta

# xAF + xAG  + XAC  + XAD  + XAE <= 2000  (Capacidad de prod. de maquinas de coser que entrega la planta A)
# xBF + xBG  + XBC  + XBD  + XBE <= 3000  (Capacidad de prod. de maquinas de coser que entrega la planta b)
# xFF + xFG  + xFC  + xFD  + xFE  <= 5000 (Capacidad de almacenamiento  de maquinas de coser del almacen f  a la distribuidores C, D,E Y ALMACEN G )
# XGF + XGG  + xGC  + xGD  + xGE  <= 5000 (Capacidad de almacenamiento  de maquinas de coser del almacen G  a la distribuidores C, D,E Y ALMACEN F )

# Restricciones de Demanda

# XAC  + XBC  + xFC + xGC >= 1500 (Demanda semanal que se le entrega al distribuidor c) 
# XAD  + XBD  + xFD + xGD >= 1700 (Demanda semanal que se le entrega al distribuidor D)
# XAE  + XBE  + xFE + xGE >= 1800 (Demanda semanal que se le entrega al distribuidor E)
# xAF  + xBF  + xFF + XGF >= 5000 (Demanda semanal del  almacen F) 
# xAG  + xBG  + xFG + XGG >= 5000 (Demanda semanal del  almacen G) 

#Transcribimos el modelo anterior a R.

#Matriz de costos

cost_mat_ejer2 <- matrix(c(1000, 1000, 1000,    5,    8,
                           1000, 1000, 1000,    3,   11,
                             14,   11,   12, 1000,    4,
                             13,   13,   10,    4, 1000), ncol = 5, byrow = TRUE)


row_rhs_ejer2 <- c(2000, 3000,5000,5000)

row_constr_signs_ejer2 <- c("<=", "<=", "<=", "<=")

col_rhs_ejer2 <- c(1500 ,1700,1800, 5000,5000)

col_constr_signs_ejer2 <- c(">=", ">=", ">=", ">=", ">=")


solucion_ejer2 <- lp.transport (cost.mat = cost_mat_ejer2,
                            direction = "min",
                            row.signs = row_constr_signs_ejer2,
                            row.rhs = row_rhs_ejer2,
                            col.signs = col_constr_signs_ejer2,
                            col.rhs = col_rhs_ejer2, 
                            presolve = 0,
                            compute.sens = 0 )

###### Resolvemos ejercicio 2 ######

#Valores óptimos para las variables de decisión.

solucion_ejer2["solution"]
#           C    D    E    F    G
#         [,1] [,2] [,3] [,4] [,5]
#  A [1,]    0    0    0 2000    0
#  B [2,]    0    0    0 3000    0
#  F [3,]    0    0    0    0 5000
#  G [4,] 1500 1700 1800    0    0

# Cantidad total de productos de la Planta A hacia el Almacen F Semanalmente. X14 O XAF = 2000 Semanalmente.

# Cantidad total de Productos de la Planta B hacia el Almacen F Semanalmente. X24 O XBF = 3000 Semanalmente.

#Cantidad total de Productos del Almacen F hacia el Almacen G Semanalmente.   X35 O XFG = 5000 Semanalmente.

#Cantidad de productos del almacen G a los distribuidores: C = 1500 maquinas de coser semanalmente.  X41 O XGC 
#                                                          D = 1700 maquinas de coser semanalmente.  X42 O XGD 
#                                                          E = 1800 maquinas de coser semanalmente.  X43 O XGE 

solucion_ejer2
#Success: the objective function is 98600

######### Ejercicio 3 ###############

#                 Tabla.

#               Carl  Chris  David  Tony   Ken
#Tipo de nado   [,1]  [,2]   [,3]   [,4]  [,5]
#    Dorso[1,]  37.5  32.9   33.8   37.0  35.4  
#    Pecho[2,]  43.4  33.1   42.2   34.7  41.8  
# Mariposa[3,]  33.3  28.5   38.9   30.4  33.6  
#    Libre[4,]  29.2  26.4   29.6   28.5  31.1  
# Ficticio[5,]   0     0      0      0     0

#Definición de variables de decisión

# X11 : nado de tipo dorso asignado al nadador Carl
# X12 : nado de tipo dorso asignado al nadador Chris
# X13 : nado de tipo dorso asignado al nadador David
# X14 : nado de tipo dorso asignado al nadador Tony
# X15 : nado de tipo dorso asignado al nadador Ken

# X21 : nado de tipo Pecho asignado al nadador Carl
# X22 : nado de tipo pecho asignado al nadador Chris
# X23 : nado de tipo pecho asignado al nadador David
# X24 : nado de tipo pecho asignado al nadador Tony
# X25 : nado de tipo pecho asignado al nadador Ken

# X31 : nado de tipo mariposa asignado al nadador Carl
# X32 : nado de tipo mariposa asignado al nadador Chris
# X33 : nado de tipo mariposa asignado al nadador David
# X34 : nado de tipo mariposa asignado al nadador Tony
# X35 : nado de tipo mariposa asignado al nadador Ken

# x41 : nado de tipo libre asignado al nadador Carl
# x42 : nado de tipo libre asignado al nadador Chris
# x43 : nado de tipo libre asignado al nadador David
# x44 : nado de tipo libre asignado al nadador Tony
# X45 : nado de tipo libre asignado al nadador Ken

# x51 : nado de tipo ficticio asignado al nadador Carl
# x52 : nado de tipo ficticio asignado al nadador Chris
# x53 : nado de tipo ficticio asignado al nadador David
# x54 : nado de tipo ficticio asignado al nadador Tony
# X55 : nado de tipo ficticio asignado al nadador Ken

#Función objetivo

# MIN Z :   37.5 X11 + 32.9 X12 + 33.8 X13 + 37.0 X14 + 35.4 X15 +
#           43.4 X21 + 33.1 X22 + 42.2 X23 + 34.7 X24 + 41.8 X25 +
#           33.3 X31 + 28.5 X32 + 38.9 X33 + 30.4 X34 + 33.6 X35 +
#           29.2 X41 + 26.4 X42 + 29.6 X43 + 28.5 X44 + 31.1 X45 +
#              0 X51 +    0 X52 +    0 X53 +    0 X54 +    0 X55.

# S.A.

# X11 + X12 + X13 + X14 + X15 = 1 (restriccion tipo de nado dorso)
# X21 + X22 + X23 + X24 + X25 = 1 (restriccion tipo de nado pecho)
# X31 + X32 + X33 + X34 + X35 = 1 (restriccion tipo de nado mariposa)
# X41 + X42 + X43 + X44 + X45 = 1 (restriccion tipo de nado libre)
# X51 + X52 + X53 + X54 + X55 = 1 (restriccion tipo de nado ficticio)

# X11 + X21 + X31 + X41 + X51 = 1 (restriccion nadador Carl)
# X12 + X22 + X32 + X42 + X52 = 1 (restriccion nadador Chris)
# X13 + X23 + X33 + X43 + X53 = 1 (restriccion nadador David)
# X14 + X24 + X34 + X44 + X54 = 1 (restriccion nadador Tony)
# X15 + X25 + X35 + X45 + X55 = 1 (restriccion nadador Ken)

#Matriz de costos

cost_mat_ejer3 <- matrix(c(37.7, 32.9, 33.8, 37.0, 35.4,
                          43.4, 33.1, 42.2, 34.7, 41.8,
                          33.3, 28.5, 38.9, 30.4, 33.6,
                          29.2, 26.4, 29.6, 28.5, 31.1,
                             0,    0,    0,    0,   0), ncol = 5, byrow = TRUE)

# Plan optimo. 

solucion_ejer3 <- lp.assign (cost.mat = cost_mat_ejer3,
                            direction = "min",
                            presolve = 0,
                            compute.sens = 0)

###### Resolvemos ejercicio 3 ######

solucion_ejer3[["solution"]]

#              Carl  Chris  David  Tony  Ken
#              [,1]  [,2]   [,3]   [,4] [,5]
#Dorso   [1,]    0     0      1      0    0
#Pecho   [2,]    0     0      0      1    0
#Mariposa[3,]    0     1      0      0    0
#Libre   [4,]    1     0      0      0    0
#Ficticio[5,]    0     0      0      0    1

#Valores optimos para las variables de decision
#Tipo de nado asignados:
 
#El nado de tipo Dorso es asignado al nadador David con un tiempo de 33.8 segundos:    X13

#El nado de tipo pecho es asignado al nadador Tony con un tiempo de 34.7 segundos:     X24

#El nado de tipo mariposa es asignado al nadador Chris con un tiempo de 28.5 segundos: X32

#El nado de tipo libre es asignado al nadador Carl con un tiempo de 29.2 segundos:     X41

#El tipo de nado ficticio queda asignado entonces al nadador Ken: X55. Esta posicion lo deja fuera de esta seleccion de nado.


solucion_ejer3

#Success: the objective function is 126.2 

# El tiempo minimo que puede rendir el equipo seleccionado para las olimpiadas de natacion es de 126.2 segundos.

