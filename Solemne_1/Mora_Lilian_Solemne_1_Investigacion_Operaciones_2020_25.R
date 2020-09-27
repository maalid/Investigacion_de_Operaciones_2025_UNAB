
#                                              Solemne 1
#                                             Lilian Mora


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$    
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$             Ejercicios 1       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&



# a) Defina correctamente todas las variables de decision.
#  Sugerencia: 
#  Xik :las toneladas del mineral i asignadas a la aleacion k. 
#  Wk : las toneladas producidas de la aleacion k.

# Definiciones:
#
#   X1A = Toneladas del mineral 1 asignadas a la aleacion A.
#   X2A = Toneladas del mineral 2 asignadas a la aleacion A.
#   X3A = Toneladas del mineral 3 asignadas a la aleacion A.
#   X1B = Toneladas del material 1 asignadas a la aleacion B.
#   X2B= Toneladas del material 2 asignadas a la aleacion B.
#   X3B = Toneladas del material 3 asignadas a la aleacion B.
#   WA = Toneladas producidas por la aleacion A.
#   WB = Toneladas producidas por la aleacion B.


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#________________________________________________________________________________________________________________


# b) Escriba la funcion objetivo que optimiza la utilidad para la elaboracion de las aleaciones.

#   Funcion Objetivo

#   Max Z = 200WA + 300WB - 30(X1A + X1B) - 40(X2A + X2B) - 50(X3A + X3B)


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#________________________________________________________________________________________________________________


# c) Escriba las restricciones asociadas al problema.

#   Restricciones.

#   0.2X1A + 0.1X2A + 0.05X3A <= 0.8WA  (Toneladas del mineral 1 , 2, 3 asignadas a la aleacion A )
#   0.1X1A + 0.2X2A + 0.05X3A <= 0.3WA  (Toneladas del mineral 1 , 2, 3 asignadas a la aleacion A )
#   0.3X1A + 0.3X2A + 0.2X3A  >= 0.5WA  (Toneladas del mineral 1 , 2, 3 asignadas a la aleacion A )
#   0.1X1B + 0.2X2B + 0.05X3B >= 0.4WB  (Toneladas del mineral 1 , 2, 3 asignadas a la aleacion B )
#   0.1X1B + 0.2X2B + 0.05X3B <= 0.6WB  (Toneladas del mineral 1 , 2, 3 asignadas a la aleacion B )
#   0.3X1B + 0.3X2B + 0.7X3B  >= 0.3WB  (Toneladas del mineral 1 , 2, 3 asignadas a la aleacion B )
#   0.3X1B + 0.3X2B + 0.2X3B  <= 0.7WB  (Toneladas del mineral 1 , 2, 3 asignadas a la aleacion B )
#   X1A + X1B <= 1000 (Total de mineral 1 utilizado para la aleacion A Y B)
#   X2A + X2B <= 2000 (Total de mineral 2 utilizado para la aleacion A Y B)
#   X3A + X3B <= 3000 (Total de mineral 3 utilizado para la aleacion A Y B)
#   X1A, X2A, X3A, X1B, X2B, X3B >= 0 (no negatividad) 


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#________________________________________________________________________________________________________________


# d) Plantee matetaticamente el modelo completo asociado al problema.

# Modelo matematico.

# Max Z = 200WA + 300WB - 30(X1A+X1B) - 40(X2A+X2B) - 50(X3A+X3B) 
# S.T
#  0.2X1A + 0.1X2A + 0.05X3A <= 0.8WA  
#  0.1X1A + 0.2X2A + 0.05X3A <= 0.3WA  
#  0.3X1A + 0.3X2A + 0.2X3A  >= 0.5WA 
#  0.1X1B + 0.2X2B + 0.05X3B >= 0.4WB  
#  0.1X1B + 0.2X2B + 0.05X3B <= 0.6WB  
#  0.3X1B + 0.3X2B + 0.7X3B  >= 0.3WB 
#  0.3X1B + 0.3X2B + 0.2X3B  <= 0.7WB 
#  X1A + X1B <= 1000 
#  X2A + X2B <= 2000 
#  X3A + X3B <= 3000 
#  X1A, X2A, X3A, X1B, X2B, X3B >= 0 


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#________________________________________________________________________________________________________________


# e) Encuentre el plan optimo de produccion e interprete los resultados.

# Para encontrar el plan optimo se deben ingresar los datos en el programa.


C <- c(200,300,-30,-40,-50,-30,-40,-50)

# Restricciones

# WA, WB, X1A,X2A,XA3,X1B, X2B, X3B

A <- matrix(c(-0.8,    0,  0.2,  0.1,  0.05,    0,    0,     0,  #restriccion 1 
              -0.3,    0,  0.1,  0.2,  0.05,    0,    0,     0,  #restriccion 2  
              -0.5,    0,  0.3,  0.3,   0.2,    0,    0,     0,  #restriccion 3 
               0,   -0.4,    0,    0,     0,  0.1,  0.2,  0.05,  #restriccion 4  
               0,   -0.6,    0,    0,     0,  0.1,  0.2,  0.05,  #restriccion 5 
               0,   -0.3,    0,    0,     0,  0.3,  0.3,   0.7,  #restriccion 6  
               0,   -0.7,    0,    0,     0,  0.3,  0.3,   0.2,  #restriccion 7  
               0,      0,    1,    0,     0,    1,    0,     0,  #restriccion 8  
               0,      0,    0,    1,     0,    0,    1,     0,  #restriccion 9 
               0,      0,    0,    0,     1,    0,    0,    1),  #restriccion 10 
            ncol = 8,
            byrow = TRUE)


# Los lados derechos de las restricciones (disponibilizacion de recursos)
# en nuestro caso 
# WA, WB, X1A, X2A, X3A, X1B, X2B, X3B, 1000,2000,3000

B <- c(0,0,0,0,0,0,0,1000,2000,3000)

# Los signos de las restricciones 

D <- c("<=","<=",">=",">=","<=",">=","<=","<=","<=","<=")

# ahora resolvemos

library (lpSolve) 
solucion <- lp(direction = "max",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B)


#el plan optimo de produccion

solucion$solution
#[1] 1800 1000 1000    0 3000    0 2000    0


#  1800 = Toneladas producidas por la aleacion A. (WA)
#  1000 = Toneladas producidas por la aleacion B. (WB)
#  1000 = Toneladas del mineral 1 asignadas a la aleacion A. (X1A)
#  0    = Toneladas del mineral 2 asignadas a la aleacion A. (X2A)
#  3000 = Toneladas del mineral 3 asignadas a la aleacion A. (X3A)
#  0    = Toneladas del mineral 1 asignadas a la aleacion B. (X1B)
#  2000 = Toneladas del mineral 2 asignadas a la aleacion B. (X2B)
#  0    = Toneladas del mineral 3 asignadas a la aleacion B. (X3B)


# Para determinar las holguras, se vuelve a la forma original de las restricciones,
# 
#  0.2X1A + 0.1X2A + 0.05X3A <= 0.8WA  
#  0.1X1A + 0.2X2A + 0.05X3A <= 0.3WA  
#  0.3X1A + 0.3X2A + 0.2X3A  >= 0.5WA 
#  0.1X1B + 0.2X2B + 0.05X3B >= 0.4WB  
#  0.1X1B + 0.2X2B + 0.05X3B <= 0.6WB  
#  0.3X1B + 0.3X2B + 0.7X3B  >= 0.3WB 
#  0.3X1B + 0.3X2B + 0.2X3B  <= 0.7WB 
#  X1A + X1B <= 1000 
#  X2A + X2B <= 2000 
#  X3A + X3B <= 3000 
#
# Holgura de la primera restriccion
# 

0.2*solucion$solution[3] + 0.1*solucion$solution[4] + 0.05*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8] 
#  [1] 350
# Se utilizan 1090 toneladas del mineral 1 , 2, 3 asignadas a la aleacion A, por lo tanto, la primera variable de holgura es: S1 =350

#Holgura de la segunda restriccion

0.1*solucion$solution[3] + 0.2*solucion$solution[4] + 0.05*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#  [1] 250
# Se utilizan 290 toneladas del mineral 1 , 2, 3 asignadas a la aleacion A, por lo tanto, la segunda variable de holgura es: S2 = 250

#Holgura de la tercera restriccion

 0.3*solucion$solution[3] + 0.3*solucion$solution[4] + 0.2*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#  [1] 900
# Se utilizan 0 toneladas del mineral 1 , 2, 3 asignadas a la aleacion A, por lo tanto, la tercera variable de holgura es: S3 = 900

#Holgura de la cuarta restriccion

0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.1*solucion$solution[6] + 0.2*solucion$solution[7] + 0.05*solucion$solution[8]
#  [1] 400
# Se utilizan 5.684342e-14 toneladas del mineral 1 , 2, 3 asignadas a la aleacion B, por lo tanto, la cuarta variable de holgura es: S4 = 400 

#Holgura de la quinta restriccion

0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.1*solucion$solution[6] + 0.2*solucion$solution[7] + 0.05*solucion$solution[8]
#  [1] 400
# Se utilizan 200 toneladas del mineral 1 , 2, 3 asignadas a la aleacion B, por lo tanto, la quinta variable de holgura es: S5 = 400

#Holgura de la sexta restriccion

0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.3*solucion$solution[6] + 0.3*solucion$solution[7] + 0.7*solucion$solution[8]
#  [1] 600
# Se utilizan 300 toneladas del mineral 1 , 2, 3 asignadas a la aleacion B, por lo tanto, la sexta variable de holgura es: S6 = 600

#Holgura de la septima restriccion

0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.3*solucion$solution[6] + 0.3*solucion$solution[7] + 0.2*solucion$solution[8]
#  [1] 600
# Se utilizan 100 toneladas del mineral 1 , 2, 3 asignadas a la aleacion B, por lo tanto, la septima variable de holgura es: S7 = 600


#Holgura de la octava restriccion

1*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 1*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#  [1] 1000
# Se utilizan 1000 toneladas total de mineral 1 utilizado para la aleacion A Y B, por lo tanto, la octava variable de holgura es: S8 = 1000 - 1000 =0

#Holgura de la novena restriccion

 0*solucion$solution[3] + 1*solucion$solution[4] + 0*solucion$solution[5] + 0*solucion$solution[6] + 1*solucion$solution[7] + 0*solucion$solution[8]
#  [1] 2000
# Se utilizan 2000 toneladas total de mineral 2 utilizado para la aleacion A Y B, por lo tanto, la novena variable de holgura es: S9 = 2000 - 2000 =0


#Holgura de la decima restriccion

 0*solucion$solution[3] + 0*solucion$solution[4] + 1*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 1*solucion$solution[8]
#  [1] 3000
# Se utilizan 3000 toneladas total de mineral 3 utilizado para la aleacion A Y B, por lo tanto, la decima variable de holgura es: S10 = 3000 - 3000 =0


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_______________________________________________________________________________________________________________

# f) Encuentre el valor optimo de la funcion objetivo de acuerdo al plan optimo de produccion obtenido e
#    interprete los resultados



# el valor optimo de la funcion objetivo

solucion$objval
#[1] 4e+05
# 4e+05 = 400000

solucion
#  Success: the objective function is 400000 

#  Es decir, se obtienen Z* = 400000 ( esto sera la utilidad optima)











#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$    
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$             Ejercicios 2       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&



# a) Defina correctamente todas la variables de decision.

#  X1:Cantidad de pupitres unipersonal a producir por semana. 
#  X2:Cantidad de pupitres bipersonales a producir por semana. 
#  X3:Cantidad de mesas a producir por semana. 

#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


# b) Escriba la funcion objetivo que optimiza la utilidad para la elaboracion de los productos.

# Funcion Objetivo

# Max Z :30X1 + 20X2 + 50X3  


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

# c) Escriba las restricciones asociadas al problema.

# Restricciones

# X1 + 2x2 + x3 <= 4300 (Disponibilidad de metros de madera) 
# 3x1 + 2x3     <= 4600 (Disponibilidad de metros de tubo)
# x1 + 4x2      <= 4200 (Disponibilidad de  metros de formica)
# X1,X2,X3      >= 0       (NO negatividad) 


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_______________________________________________________________________________________________________________


# d) Plantee matematicamente el modelo completo asociado al problema.

# Modelo matematico

# Max Z :30X1 + 20X2 + 50X3
# S.T
# X1 + 2X2 + X3 <= 4300 
# 3X1 + 2X3     <= 4600 
# 1X1 + 4X2     <= 4200 
# X1, X2, X3    >= 0     


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_______________________________________________________________________________________________________________


# e) Encuentre el plan optimo de produccion e interprete los resultados.

# Para encontrar el plan optimo se deben ingresar los datos en el programa.

C <- c(30,20,50)

# Restricciones

# X1, X2, X3


A <- matrix(c(1, 2, 1,   #restriccion 1
              3, 0, 2,   #restriccion 2
              1, 4, 0),  #restriccion 3
                        ncol = 3, 
                        byrow = TRUE)

# Los lados derechos de las restricciones (disponibilizacion de recursos)
# en nuestro caso

B <- c(4300, 4600, 4200)

# Los signos de las restricciones 

D <- c("<=","<=","<=")

# ahora resolvemos

solucion <- lp(direction = "max",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B,
               compute.sens = 1)


#el plan optimo de produccion

solucion$solution
#  [1] 0 1000 2300

#  0    = Cantidad de pupitres unipersonal a producir por semana. (X1)
#  1000 = Cantidad de pupitres bipersonales a producir por semana. (X2)
#  2300 = Cantidad de mesas a producir por semana. (X3)


#  Holgura primera restriccion:

1*solucion$solution[1] + 2*solucion$solution[2] + 1*solucion$solution[3]
#  [1] 4300
#  Se utilizan los 4300 metros de madera, por lo tanto, la primera variable de holgura es: S1 = 0


#  Holgura segunda restriccion:
3*solucion$solution[1] + 0*solucion$solution[2] + 2*solucion$solution[3]
#  [1] 4600
#  Se utilizan los 4600 metros de tubo, por lo tanto, la segunda variable de holgura es: S2 = 0


#  Holgura tercera restriccion:
1*solucion$solution[1] + 4*solucion$solution[2] + 0*solucion$solution[3]
#  [1] 4000
#  Se utilizan 4000 metros de formica, por lo tanto, la tercera variable de holgura es: S3 = 4200 - 4000 =200
#  Esto significa que sobran 200 metros de formica semanales.


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#____________________________________________________________________________________________________________


# f) Encuentre el valor óptimo de la función objetivo de acuerdo al 
#   plan óptimo de producción obtenido e interprete los resultados.

# el valor optimo de la funcion objetivo

solucion
#  Success: the objective function is 135000

#  Es decir, se obtienen Z* = 135000 ( esto sera la utilidad optima semanal)


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#___________________________________________________________________________________________________________


# g) Realice un análisis de sensibilidad completo.

#         (g.1)  Analisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi)

solucion$duals[1:3]
#  [1] 10 20  0


#  madera:
#  Aumento/decremento de Z* si b1 aumenta/decrece en una unidad Y1 = 10
#  tubo:   
#  Aumento/decremento de Z* si b2 aumenta/decrece en una unidad Y2 = 20
#  Formica:
#  Aumento/decremento de Z* si b3 aumenta/decrece en una unidad Y3 = 0


#         (g.2)  Analisis de sensibilidad para coeficientes de la funcion objetivo.

library (tibble)


tibble(c = c("c1", "c2", "c3"),
       min = solucion$sens.coef.from,
       max = solucion$sens.coef.to)

#  c          min     max
#  <chr>     <dbl>     <dbl>
#  c1       -1.00e30  7.00e1
#  c2        0.0      1.00e2
#  c3        2.33e1   1.00e30

# Los intervalos para los coeficientes cj son:
#
# -infinito  <= c1 <= 70        (el costo unitario de los pupitres unipersonal puede cambiar en este intervalo sin que 
#                                se modifique el plan optimo de produccion)
#    0.0     <= c2 <= 100       (el costo unitario de los pupitres bipersonal puede cambiar en este intervalo sin que se 
#                                modifique el plan optimo de produccion)
#    23.3    <= c3 <= infinito (el costo unitario de las mesas puede cambiar en este intervalo sin que se modifique el 
#                                plan optimo de produccion)


#      (g.3)  Analisis de sensibilidad para los coeficientes bi.
#             Para calcular estos intervalos es necesario resolver el problema dual:

A_dual <- t(A)

B_dual <- C

C_dual <- B

D_dual <- c(">=", ">=", ">=")

solucion_dual <- lp(direction = "min", 
                    const.mat = A_dual,
                    const.rhs = B_dual,
                    objective.in = C_dual, 
                    const.dir = D_dual,
                    compute.sens = 1)

#Ademas se debe extraer el intervalo de sensibilidad para los coeficientes c'j del problema dual.
#Dado que estos corresponden a los coeficientes bi en el problema primal,
#tendremos entonces los intervalos buscados. En efecto:

tibble(b = c("b1", "b2", "b3"), 
       min = solucion_dual$sens.coef.from,
       max = solucion_dual$sens.coef.to)


#  b        min     max
#  <chr>   <dbl>   <dbl> 
#  b1      2300   4.40e3
#  b2      4400   8.60e3
#  b3      4000   1.00e30

# Así, finalmente los intervalos bi,min <= bi <= bi,max
# para los coeficientes bi quedan como se presentan a continuación:
#
#   2300 <= b1 <= 4400  (el coeficiente de la primera restriccion puede cambiar en este 
#                        intervalo sin que se modifique el precio sombra Y1)
#   4400 <= b2 <= 8600  (el coeficiente de la segunda restriccion puede cambiar en este 
#                        intervalo sin que se modifique el precio sombra Y2)
#   4000 <= b3 <= infinito  (el coeficiente de la tercera restriccion puede cambiar en este 
#                        intervalo sin que se modifique el precio sombra Y3)


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#___________________________________________________________________________________________________________


# h) Si la empresa pudiese incrementar la cantidad de materia 
#   prima a usar, ¿cuál tendrá la prioridad? Explique fundamentadamente.

#  Segun los precios sombra para 

#  Dado los intervalos 
#                     2300 <= b1 <= 4400  
#                     4400 <= b2 <= 8600  
#                     4000 <= b3 <= infinito  
#  y dado los precios sombra Y1 = $10 , Y2= $20, Y3=$0 las materias primas 1, 2 y 3 (madera, tubo, formica), cada metro adicional  
#  de tubo aumenta el ingreso en $ 20, en comparación con $ 10 para la madera y $ 0 para formica. Por lo tanto, 
#  la prioridad deberia de ser formica.
#  Ya que ésta sera la que  NO genera perdida,debido a que el precio sombra es cero.
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_______________________________________________________________________________________________________________

#__________________________________________________________
# i) Se sugiere aumentar la cantidad de madera y tubo al costo adicional 
#    de 15/m para cada una. ¿Es esto aconsejable? Explique fundamentadamente.

#  Para la madera, el ingreso adicional por metro es de $10 - $15 = -$5, para los tubos sera de  $20 - $15 = $5,
#  es por ello que se aconsaja considerar los tubos,  para que exista un aumento de disponibilidad de recursos.
#  Por lo tanto, es aconsejable aumentar la cantidad de tubo, ya que se estaria ganado $5 por semana.

#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#____________________________________________________________________________________________________________


# j) Si la cantidad de fórmica se reduce en 100 metros, ¿cómo impactará este
#    incremento al ingreso óptimo? Explique fundamentadamente.

#  El precio sombra para la disponibilidad de formica es $0 y es válido en el intervalo (4000, infinito) metros.
#  La reduccion propuesta de 100 metros queda dentro del intervalo optimo. 
#  Entonces, la disminucion del ingreso es $0 * 100 = $0, lo que significa que el ingreso total 
#  se no incrementara quedando en $135000 (=$135000 - $0) semanales. 


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_____________________________________________________________________________________________________________


# k) Suponga que la disponibilidad de madera se incrementa en 200 metros, 
#    ¿cómo afectará este incremento al ingreso óptimo? Explique fundamentadamente.

#  El aumento propuesto de 200 metros de madera, implica 4500 metros de madera no es válido dentro del intervalo de factibilidad (2300, 4400)metros, 
#  por lo que, los precios sombra cambian. Esto significa que con la información disponible no es posible dar 
#  una respuesta de como cambia el ingreso óptimo con este cambio de escenario, por lo que, habría que
#  resolver desde cero el nuevo problema. En efecto:

#  Nuevo escenario donde se tienen 200 metros de tubo disponible.


B_k <- c(4500, 4600, 4200)

solucion_k <- lp(direction = "max", 
                 const.mat = A,
                 const.rhs = B_k,
                 objective.in = C, 
                 const.dir = D,
                 compute.sens = 1)


#  el plan optimo de produccion

# Utilidad Optima
solucion_k
#  Success: the objective function is 136000  
#  Es decir, se obtienen Z* = 136000 ( esto sera la utilidad optima semanal)

#  Plan productivo óptimo.
solucion$solution
#  [1]    0 1000 2300

#  0    = Cantidad de pupitres unipersonal a producir por semana. (X1)
#  1000 = Cantidad de pupitres biperosonales a producir por semana. (X2)
#  2300 = Cantidad de mesas a producir por semana. (X3)


#  Precios sombra.

solucion_k$duals[1:3]
#  [1]  0 25  5

#  madera:
#  Aumento/decremento de Z* si b1 aumenta/decrece en una unidad Y1 = 0
#  tubo:   
#  Aumento/decremento de Z* si b2 aumenta/decrece en una unidad Y2 = 25
#  Formica:
#  Aumento/decremento de Z* si b3 aumenta/decrece en una unidad Y3 = 5


#  Intervalo para coeficientes c'j.

tibble(c = c("c'1", "c'2", "c'3"), 
       min = solucion_k$sens.coef.from, 
       max = solucion_k$sens.coef.to)

#  c           min     max
#  <chr>     <dbl>    <dbl>
#  c'1     -1.00e+30   8.00e1
#  c'2      3.55e-15   1.00e30
#  c'3      1.67e+1    1.00e30

#  de donde se obtiene:
#  -infinito <= c'1 <= 80        (el costo unitario de los pupitres unipersonal pueden cambiar en estos intervalos sin que 
#                                  se modifique el plan optimo de produccion)
#                                 
#  -infinito <= c'2 <= infinito  (el costo unitario de los pupitres bipersonal pueden cambiar en estos intervalos sin que se 
#                                  modifique el plan optimo de produccion)

#   16.7     <= c'3 <= infinito  (el costo unitario de las mesas pueden cambiar en estos intervalos sin que se modifique el 
#                                  plan optimo de produccion)

# Intervalo para coeficientes b'i (hay que resolver el problema dual).

A_k_dual <- t(A)

B_k_dual <- C

C_k_dual <- B_k

D_k_dual <- c(">=", ">=", ">=")

solucion_k_dual <- lp(direction = "min", 
                      const.mat = A_k_dual,
                      const.rhs = B_k_dual,
                      objective.in = C_k_dual, 
                      const.dir = D_k_dual,
                      compute.sens = 1)



tibble(b = c("b'1", "b'2", "b'3"), 
       min = solucion_k_dual$sens.coef.from, 
       max = solucion_k_dual$sens.coef.to)

#    b      min     max
#  <chr>   <dbl>   <dbl>
#   b'1    2200    1.00e30
#   b'2     0      4.40e 3
#   b'3     0      8.40e 3

# por lo tanto, se obtiene:
#
#   2200 <= b'1 <= infinito  (el coeficiente de la primera restriccion puede cambiar en este 
#                            intervalo sin que se modifique el precio sombra Y1)
#     0  <= b'2 <= 4400       (el coeficiente de la segunda restriccion puede cambiar en este 
#                            intervalo sin que se modifique el precio sombra Y2)
#     0  <= b'3 <= 8400       (el coeficiente de la tercera restriccion puede cambiar en este 
#                            intervalo sin que se modifique el precio sombra Y3)


#  Asi, de los resultados anteriores podemos concluir que bajo este nuevo escenario el
#  plan productivo no sufre cambios. 
#  En cambio en el caso de la utilidad optima, ésta si sufre cambio donde la utilidad 
#  aumenta $1000 por semana, es decir, la nueva utilidad optima es de $136000 por semana. 
#  Por ultimo, la utilizacion de recursos no cambia, sin embargo los precio sombra y
#  los intervalos para los coeficientes unitarios de utilidad (Cj) y disponibilidad de recursos (b'i) si cambian.


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&


# l) Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian 
#    a 60 y 30 unidades monetarias respectivamente, y de manera independiente. 
#    ¿Permanecerá igual el óptimo actual? Explique fundamentadamente y calcule el valor 
#    de la función objetivo en este nuevo escenario.

#   Max Z :30X1 + 20X2 + 50X3 ----> c1*X1 + c2*X2 + c3X3 implica 60*X1 + 20*X2 + 50*X3
#                                                 implica 30*X1 + 30*X2 + 50*X3 = $145000
#   
#   60*(0) + 20*(1000) + 50*(2300) = $135000.
#   30*(0) + 30*(1000) + 50*(2300) = $145000.

#   El optimo actual permanece igual , porque los nuevos precios unitarios, permanecen dentro de los 
#   intevalos permitidos.
#
# El valor optimo primal es $135000 semanal y con las condiciones del nuevo escenario el ingreso unitario aumenta (cj).
# Se obtiene lo siguiente: para el aumento unitario del producto 1 en  $60, 
# implica 60*X1 + 20*X2 + 50*X3 = 60*(0) + 20*(1000) + 50*(2300) donde el resultado final es de $135000 por semana. 
# Mientras que el aumento unitario para el producto 2 en $30, 
# implica 30*X1 + 30*X2 + 50*X3 = 30*(0) + 30*(1000) + 50*(2300) donde el resultado final es de $145000 semanal.
# En conclusion para el nuevo escenario, que es un aumento de los ingresos unitarios,
# el optimo actual NO cambia para el caso del producto uno, en cambio para el producto 2 este aumenta a $145000 por semana.


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$    
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$             Ejercicios 3       $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$     
#&$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$                                $$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&

# NOTA: para que no se sobre escriban las variables ci, bj del ejercicio 2, se re-definen como qi, rj respectivamente.


# a) Defina correctamente todas las variables de decision.


# X1 = Unidad del producto 1 diario
# X2 = Unidad del producto 2 diario


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_______________________________________________________________________________________________________________


# b) Escriba la funcion objetivo que optimiza la utilidad para la elaboracion de los productos.

# Funcion Objetivo

# Max Z = 60X1 + 40X2
 

#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#______________________________________________________________________________________________________________

 
# c) Escriba las restricciones asociadas al problema.

# Restricciones

# 4X1 + 2X2 <= 16 (Horas disponibles en la maquina A por dia)
# 2X1 + 6X2 <= 16 (Horas disponibles en la maquina B por dia)
# X1 ,  X2 >= 0   (no negatividad)


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#______________________________________________________________________________________________________________


# d) Plantee matematicamente el modelo completo asociado al problema.

# Modelo matematico

#  Max Z = 60X1 + 40X2 
#  S.T
#  4X1 + 2X2 <= 16 
#  2X1 + 6X2 <= 16 
#  X1 ,  X2 >= 0  


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_______________________________________________________________________________________________________________


# e) Encuentre el plan optimo de produccion e interprete los resultados.

# Para encontrar el plan optimo se deben ingresar los datos en el programa.

C <- c(60,40)

# Matriz de coeficientes de las restricciones

A <- matrix(c(4,2,  #restriccion 1
              2,6), #restriccion 2
                     ncol = 2 , 
                     byrow = TRUE)

# Los coeficientes del lado derecho de las restricciones (disponibilizacion de recursos)
# en nuestro caso.

B <- c(16,16)

# La direccion de las desigualdades de las restricciones.

D <- c("<=","<=")

solucion <- lp(direction = "max",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B,
               compute.sens = 1)



#  Los valores optimos para las variables de decision 

solucion$solution
#  [1] 3.2  1.6

#  3.2 = Unidad del producto 1 (CONSIDERAR NUMEROS ENTEROS A LA HORA DE PRODUCIR ---> 3 UNIDADES DEL PRODUCTO 1).
#  1.6 = Unidad del producto 2 (CONSIDERAR NUMEROS ENTEROS A LA HORA DE PRODUCIR ---> 1 UNIDAD DEL PRODUCTO 2).


#  Holgura primera restriccion

4*solucion$solution[1] + 2*solucion$solution[2]
#  [1] 16
#  Se utilizan las 16 horas, por lo tanto, la primera variable de holgura es: S1 = 0

#  Holgura segunda restriccion
2*solucion$solution[1] + 6*solucion$solution[2]
#  [1] 16
#  Se utilizan las 16 horas, por lo tanto, la segunda variable de holgura es: S1 = 0


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#______________________________________________________________________________________________________________


# f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo
#    de producción obtenido e interprete los resultados.


# El valor optimo de la funcion objetivo. 
# La utilidad óptima que obtendrá la empresa al producir según el 
# plan óptimo de producción encontrado es:

solucion

#  Success: the objective function is 256 

#  Es decir, se obtienen Z* = 256 ( esto sera la utilidad optima por dia)


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#______________________________________________________________________________________________________________


# g) Realice un análisis de sensibilidad completo.

#            (g.1)  Analisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi)

solucion$duals[1:2]

#  [1] 14  2

#  Aumento/decremento de Z* si b1 aumenta/decrece en una unidad. Y1 = 14
#  Aumento/decremento de Z* si b2 aumenta/decrece en una unidad. Y2 = 2 


#            (g.2)  Analisis de sensibilidad para coeficientes de la funcion objetivo.

tibble(q = c("q1","q2"),
       min = solucion$sens.coef.from,
       max = solucion$sens.coef.to)

#   q      min   max
#  <chr>  <dbl>  <dbl>
#   q1    13.3   80
#   q2    30    180

# Los intervalos para los coeficientes qj son:
#   13.3 <= q1 <= 80   (el coeficiente de la primera restriccion puede cambiar en este 
#                      intervalo sin que se modifique el el precio sombra Y1)
#     30 <= q2 <= 180  (el coeficiente de la segunda restriccion puede cambiar en este 
#                      intervalo sin que se modifique el el precio sombra Y2)


#             (g.3)  Analisis de sensibilidad para los coeficientes bi.
#                Para calcular estos intervalos es necesario resolver el problema dual:

A_dual <- t(A)

B_dual <- C

C_dual <- B

D_dual <- c(">=", ">=")

solucion_dual <- lp(direction = "min", 
                    const.mat = A_dual,
                    const.rhs = B_dual,
                    objective.in = C_dual, 
                    const.dir = D_dual,
                    compute.sens = 1)

#Ademas se debe extraer el intervalo de sensibilidad para los coeficientes q'j del problema dual.
#Dado que estos corresponden a los coeficientes ri en el problema primal,
#tendremos entonces los intervalos buscados. En efecto:

tibble(r = c("r1", "r2"), 
       min = solucion_dual$sens.coef.from,
       max = solucion_dual$sens.coef.to)

#    r     min   max
# <chr>   <dbl> <dbl>
#  r1      5.33   32 
#  r2       8    48
# 
# Así, finalmente los intervalos ri,min <= ri <= ri,max
# para los coeficientes bi quedan como se presentan a continuación:
#
#   5.33 <= r1 <= 32  (el coeficiente de la primera restriccion puede cambiar en este 
#                     intervalo sin que se modifique el precio sombra Y1)
#    8   <= r2 <= 48  (el coeficiente de la segunda restriccion puede cambiar en este 
#                     intervalo sin que se modifique el precio sombra Y2



#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_______________________________________________________________________________________________________


# h) Si la empresa puede incrementar la capacidad de ambas máquinas, ¿cuál máquina 
#    tendrá la prioridad? Explique fundamentadamente.

#  Dado los intervalos  5.33 <= r1 <= 32  
#                       8   <= r2 <= 48  
# y dado los precios sombra Y1 = $14 , Y2= $2, la maquina 1 aumenta en $ 14 por hora diaria adicional, en cambio la maquina 2 aumenta 
#  $ 2 por hora diaria adicional, por lo tanto, la maquina 2 deberia de ser prioridad, ya que ésta sera la 
#  que genera menos perdida. Como sugerencia,debido a que el precio sombra es distinto de cero, siempre habra perdida
#  entonces la prioridad no deberia aumentar la capacidad de las maquinas.


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_______________________________________________________________________________________________________


# i ) Se sugiere incrementar las capacidades de las máquinas 1 y 2 al costo adicional 
#     de $20/h para cada máquina. ¿Es esto aconsejable? Explique fundamentadamente.

#  para la maquina 1 es ingreso adicional por hora diaria seria $14 - $20 = $-6, y el ingreso adicional por hora diaria para la 
#  maquina 2 seria $2 - $20 = $-18. Esto significa que para ambas maquinas darian resultados negativos, por lo que
#  se sugiere no hacer ningun cambio, no modificar sus recursos, porque solo estaria perdiendo dinero.

#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_______________________________________________________________________________________________________


# j) Si la capacidad de la máquina 1 se incrementa de 16 a 26 horas, ¿cómo impactará este
#   incremento al ingreso óptimo? Explique fundamentadamente.

#  El intervalo de factibilidad es de 5.33 a 32 horas, por lo que el aumenta en 10 horas, es decir, 
#  de 16 horas pasamos a 26 horas, lo que estaria dentro de el rango permitido. 
#  Ademas el precio sombra de la maquina 1 es de $14 entonces el incremento al ingreso sera $14*(26-16)= $140, por lo 
#  tanto, el ingreso total aumentara en $140+$256 = $396 por dia. Entonces, pasamos de $256 a $396.


#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_______________________________________________________________________________________________________


# k) Suponga que la capacidad de la máquina 1 se incrementa a 40 horas, ¿cómo afectará 
#    este incremento al ingreso óptimo? Explique fundamentadamente.
#
#  En este caso las 40 horas quedarian fuera del rango de factibilidad que es como maximo 32 horas, por lo que se 
#  por lo tanto, se vuelve a re-calcular todo  para saber si es conveniente incrementar la capacidad de 
#  funcionamiento de la maquina 1.


B_p <- c(40,16)

solucion_p <- lp(direction = "max", 
                 const.mat = A,
                 const.rhs = B_p,
                 objective.in = C, 
                 const.dir = D,
                 compute.sens = 1)


#  el plan optimo de produccion

# Utilidad Optima
solucion_p
#Success: the objective function is  480  
#  Es decir, se obtienen Z* =  480 ( esto sera la utilidad optima por dia)

#  Plan productivo óptimo.
solucion$solution
#  [1] 3.2 1.6

#  3.2 = Unidad del producto 1 por dia (CONSIDERAR NUMEROS ENTEROS A LA HORA DE PRODUCIR ---> 3 UNIDADES DEL PRODUCTO 1).
#  1.6 = Unidad del producto 2 por dia (CONSIDERAR NUMEROS ENTEROS A LA HORA DE PRODUCIR ---> 1 UNIDAD DEL PRODUCTO 2).
#  


#  Precios sombra.

solucion_p$duals[1:2]
#  [1]  0 30

#  Aumento/decremento de Z* si r1 aumenta/decrece en una unidad. Y1 = 0
#  Aumento/decremento de Z* si r2 aumenta/decrece en una unidad. Y2 = 30


#  Intervalo para coeficientes q'j.

tibble(q = c("q'1", "q'2"), 
       min = solucion_p$sens.coef.from, 
       max = solucion_p$sens.coef.to)

#   q       min      max
# <chr>    <dbl>    <dbl>
#  q'1    1.33e1   1.00e30
#  q'2   -1.00e30  1.80e2

#  de donde se obtiene:
#   13.3    <= q'1 <= infinito (el coeficiente de la primera restriccion puede cambiar en este 
#                               intervalo sin que se modifique el el precio sombra Y1)
# -infinito <= q'2 <= 180      (el coeficiente de la segunda restriccion puede cambiar en este 
#                               intervalo sin que se modifique el el precio sombra Y2)

# Intervalo para coeficientes r'i (hay que resolver el problema dual).

A_p_dual <- t(A)

B_p_dual <- C

C_p_dual <- B_p

D_p_dual <- c(">=", ">=")

solucion_p_dual <- lp(direction = "min", 
                      const.mat = A_p_dual,
                      const.rhs = B_p_dual,
                      objective.in = C_p_dual, 
                      const.dir = D_p_dual,
                      compute.sens = 1)



tibble(r = c("r'1", "r'2"), 
       min = solucion_p_dual$sens.coef.from, 
       max = solucion_p_dual$sens.coef.to)

#   r       min     max
# <chr>    <dbl>   <dbl>
#  r'1      32   1.00e30
#  r'2      0    2.00e 1


# por lo tanto, se obtiene:
#
#   32 <= r'1 <= infinito  (el coeficiente de la primera restriccion puede cambiar en este 
#                          intervalo sin que se modifique el precio sombra Y1)
#   0  <= r'2 <= 20        (el coeficiente de la segunda restriccion puede cambiar en este 
#                          intervalo sin que se modifique el precio sombra Y2)
#    


#  Asi, de los resultados anteriores podemos concluir que bajo este nuevo escenario el
#  plan productivo no sufre cambios. 
#  En cambio en el caso de la utilidad optima, ésta si sufre cambio donde la utilidad 
#  aumenta en $224 diario, es decir, la nueva utilidad optima es de $480 por dia. 
#  Por ultimo, la utilizacion de recursos no cambia, sin embargo los precio sombra a (Y1= 0, Y2=30) y
#  los intervalos para los coeficientes unitarios de utilidad (qj) y disponibilidad de recursos (r'i) si cambian.

#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
#------------------------------------------------------------------------------------------------------------
#&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&#_______________________________________________________________________________________________________


# l) Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian
#    a $70 y $50, respectivamente, y de manera independiente. ¿Permanecerá igual el 
#    óptimo actual? Explique fundamentadamente y calcule el valor de la función objetivo 
#    en este nuevo escenario.

#  Max Z = 60X1 + 40X2 ----> q1*X1 + q2*X2 implica 70*X1 + 40*X2 = 70*3.2+40*1.6
#                                          implica 60*X1 + 50*X2 = 60*3.2+50*1.6
# 70*3.2 + 40*1.6 = 288  
# 60*3.2 + 50*1.6 = 272

# El valor optimo primal es $256 por dia y con las condiciones del nuevo escenario el ingreso unitario aumenta (qj).
# Se obtiene lo siguiente: para el aumento unitario del producto 1 en  $70, 
# implica 70*X1 + 40*X2 = 70*3.2+40*1.6 donde el resultado final es de $288 por dia. 
# Mientras que el aumento unitario para el producto 2 en $50, 
# implica 60*X1 + 50*X2 = 60*3.2+50*1.6 donde el resultado final es de $272 diario.
# En conclusion para el nuevo escenario, que es un aumento de los ingresos unitarios,
# el optimo actual cambia, este aumenta en ambos casos, el original era de $256 y al aumentar
# los ingresos unitarios se aumenta a $288 y $272.


# SI CONSIDERAMOS NUMEROS ENTEROS AL MOMENTO DE PRODUCIR
#
#  Max Z = 60X1 + 40X2 ----> q1*X1 + q2*X2 implica 70*X1 + 40*X2 = 70*3+40*1
#                                          implica 60*X1 + 50*X2 = 60*3+50*1
# 70*3 + 40*1 = 250 
# 60*3 + 50*1 = 230

# El valor optimo primal es $256 por dia y con las condiciones del nuevo escenario el ingreso unitario aumenta (qj).
# Se obtiene lo siguiente: para el aumento unitario del producto 1 en  $70, 
# implica 70*X1 + 40*X2 = 70*3+40*1 donde el resultado final es de $250 por dia. 
# Mientras que el aumento unitario para el producto 2 en $50, 
# implica 60*X1 + 50*X2 = 60*3+50*1 donde el resultado final es de $230 diario.
# En conclusion para el nuevo escenario, que es un aumento de los ingresos unitarios,
# el optimo actual cambia, este DISMINUYE en ambos casos, el original era de $256 y al aumentar
# los ingresos unitarios ESTOS DISMINUYEN a $250 y $230.

