# Solemne 1 Inv. Operaciones
# Gonzalo Venegas C.

############################################################################
#Ejercicio nº 1

#a. Definición de variables

#X1A : TON. Mineral 1 Aleación A
#X2A : TON. Mineral 2 Aleación A
#X3A : TON. Mineral 3 Aleación A
#X1B : TON. Mineral 1 Aleación B
#X2B : TON. Mineral 2 Aleación B
#X3B : TON. Mineral 3 Aleación B

#WA : TON. producidas Aleación A
#WB : TON. producidas Aleación B

#b. Función objetivo

# Max. Z: (200WA + 300WB) - (30X1A+40X2A+50X3A+30X1B+40X2B+50X2B)
#         PRECIO VENTA    -  COSTO DE COMPONENTES

#c. Definición Restricciones


# Restricciones de especificaciones

# 0.2X1A + 0.1X2A + 0.05X3A <=0.8WA Restricción Máximo 80% Comp I aleación A
# 0.1X1A + 0.2X2A + 0.05X3A <=0.3WA Restricción Máximo 30% Comp II aleación A
# 0.3X1A + 0.3X2A + 0.2X3A  <=0.5WA Restricción Máximo 50% Comp IV aleación A
# 0.1X1B + 0.2X2B + 0.05X3B <=0.6WB Restricción Máximo 60% Comp II aleación B
# 0.1X1B + 0.2X2B + 0.05X3B >=0.4WB Restricción Minimo 40% Comp II aleación B
# 0.3X1B + 0.3X2B + 0.7X3B  <=0.3WB Restricción Maximo 30% Comp III aleación B
# 0.3X1B + 0.3X2B + 0.2X3B <=0.7WB Restricción Maximo 70% Comp IV aleación B

# Restricciones de Cantidad Maxima mineral

#X1A + X1B <= 1000
#X2A + X2B <= 2000
#X3A + X3B <= 3000

# Restricciones No negatividad
# X1A, X2A, X3A, X1B, X2B, X3B >=0

#d. Planteamiento matematico.

# 0.2X1A + 0.1X2A + 0.05X3A - 0.8WA = 0   
# 0.1X1A + 0.2X2A + 0.05X3A - 0.3WA = 0   
# 0.3X1A + 0.3X2A + 0.2X3A  - 0.5WA = 0 
# 0.1X1B + 0.2X2B + 0.05X3B - 0.4WB = 0  
# 0.1X1B + 0.2X2B + 0.05X3B - 0.6WB = 0  
# 0.3X1B + 0.3X2B + 0.7X3B  - 0.3WB = 0  
# 0.3X1B + 0.3X2B + 0.2X3B  - 0.7WB = 0 
# X1A + X1B = 1000                     
# X2A + X2B = 2000                     
# X3A + X3B = 3000  

#e. Desarrollo plan Optimo

# Matriz de coeficientes

# wa   wb  x1a  x2a   x3a    x1b  x2b    x3b
A<- matrix(c( -0.8,   0, 0.2, 0.1, 0.05,    0,    0,    0,   
              -0.3,   0, 0.1, 0.2, 0.05,    0,    0,    0,   
              -0.5,   0, 0.3, 0.3,  0.2,    0,    0,    0,    
              0,-0.4,   0,   0,    0,  0.1,  0.2, 0.05,   
              0,-0.6,   0,   0,    0,  0.1,  0.2, 0.05,   
              0,-0.3,   0,   0,    0,  0.3,  0.3,  0.7,   
              0,-0.7,   0,   0,    0,  0.3,  0.3,  0.2,   
              0,   0,   1,   0,    0,    1,    0,    0,   
              0,   0,   0,   1,    0,    0,    1,    0,   
              0,   0,   0,   0,    1,    0,    0,    1)   
           ,     ncol = 8, byrow = TRUE)


# Dirección de las desigualdades
B <- c("<=","<=",">=",">=","<=",">=","<=","<=","<=","<=")

# Coeficiente Función objetivo

C <- c (200,300,-30,-40,-50,-30,-40,-50)

#Coeficientes lado derecho de las restricciones
D <- c(0, 0, 0, 0, 0, 0, 0,1000,2000,3000)

#Solución mediante lpSolve

library(lpSolve)

sol <- lp(direction = "max",
          objective.in = C,
          const.mat = A,
          const.dir = B,
          const.rhs = D,
          compute.sens = 1)

sol

sol$solution

-0.8*sol$solution[1] + 0*sol$solution[2]    +0.2*sol$solution[3] + 0.1*sol$solution[4] + 0.05*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
-0.3*sol$solution[1] + 0*sol$solution[2]    + 0.1*sol$solution[3] + 0.2*sol$solution[4] + 0.05*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
-0.5*sol$solution[1] + 0*sol$solution[2]    + 0.3*sol$solution[3] + 0.3*sol$solution[4] + 0.2*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
0*sol$solution[1] + -0.4*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.1*sol$solution[6] + 0.2*sol$solution[7] + 0.05*sol$solution[8]
0*sol$solution[1] + -0.6*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.1*sol$solution[6] + 0.2*sol$solution[7] + 0.05*sol$solution[8]
0*sol$solution[1] + -0.3*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.3*sol$solution[6] + 0.3*sol$solution[7] + 0.7*sol$solution[8]   
0*sol$solution[1] + -0.7*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.3*sol$solution[6] + 0.3*sol$solution[7] + 0.2*sol$solution[8]
0*sol$solution[1] + 0*sol$solution[2]    + 1*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 1*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
0*sol$solution[1] + 0*sol$solution[2]    + 0*sol$solution[3] + 1*sol$solution[4] + 0*sol$solution[5] + 0*sol$solution[6] + 1*sol$solution[7] + 0*sol$solution[8]
0*sol$solution[1] + 0*sol$solution[2]    + 0*sol$solution[3] + 0*sol$solution[4] + 1*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 1*sol$solution[8]


#f. Valor optimo e interpretación resultados.

#Success: the objective function is 4e+05 
#> sol$solution
#[1] 1800 1000 1000    0 3000    0 2000    0
#> -0.8*sol$solution[1] + 0*sol$solution[2]    +0.2*sol$solution[3] + 0.1*sol$solution[4] + 0.05*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
#[1] -1090
#> -0.3*sol$solution[1] + 0*sol$solution[2]    + 0.1*sol$solution[3] + 0.2*sol$solution[4] + 0.05*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
#[1] -290
#> -0.5*sol$solution[1] + 0*sol$solution[2]    + 0.3*sol$solution[3] + 0.3*sol$solution[4] + 0.2*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
#[1] 0
#> 0*sol$solution[1] + -0.4*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.1*sol$solution[6] + 0.2*sol$solution[7] + 0.05*sol$solution[8]
#[1] 5.684342e-14
#> 0*sol$solution[1] + -0.6*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.1*sol$solution[6] + 0.2*sol$solution[7] + 0.05*sol$solution[8]
#[1] -200
#> 0*sol$solution[1] + -0.3*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.3*sol$solution[6] + 0.3*sol$solution[7] + 0.7*sol$solution[8]   
#[1] 300
#> 0*sol$solution[1] + -0.7*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.3*sol$solution[6] + 0.3*sol$solution[7] + 0.2*sol$solution[8]
#[1] -100
#> 0*sol$solution[1] + 0*sol$solution[2]    + 1*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 1*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
#[1] 1000
#> 0*sol$solution[1] + 0*sol$solution[2]    + 0*sol$solution[3] + 1*sol$solution[4] + 0*sol$solution[5] + 0*sol$solution[6] + 1*sol$solution[7] + 0*sol$solution[8]
#[1] 2000
#> 0*sol$solution[1] + 0*sol$solution[2]    + 0*sol$solution[3] + 0*sol$solution[4] + 1*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 1*sol$solution[8]
#[1] 3000

# El Valor optimo obtenido corresponde a $400.000
# al fabricar 1800 unidades de aleacion A y 1000 unidades aleacion B

############################################################################

#Ejercicio nº 2

#a. Definición de variables

#X1 : Cantidad de pupitres unipersonales
#X2 : Cantidad de pupitres bipersonales
#X3 : Cantidad de mesas

#b. Función objetivo

# Max. Z: 30X1 + 20X2 + 50X3

#c. Definición Restricciones

# Restricciones de Disponibilidad de madera

# X1 + 2X2 + X3 <= 4300 Metros de madera

# Restricciones de Disponibilidad de tubo

# 3X1 + 2X3 <= 4600 Metros de tubo

# Restricciones de Disponibilidad de formica

# X1 + 4X2 <= 4200 Metros de formica

# Restricciones No negatividad
# X1, X2, X3 >=0

#d. Planteamiento matematico.

# X1 + 2X2 + X3 = 4300
# 3X1 + 2X3 = 4600
# X1 + 4X2 = 4200 

#e. Desarrollo plan Optimo

# Matriz de coeficientes


#               X1  X2   X3   
A<- matrix(c(   1,  2,   1,    
                3,  0,   2,    
                1,  4,   0),    
                
           ncol = 3, 
           byrow = TRUE)

# Dirección de las desigualdades
B <- c("<=","<=","<=")

# Coeficiente Función objetivo

C <- c (30,20,50)

#Coeficientes lado derecho de las restricciones
D <- c(4300, 4600, 4200)

#Solución mediante lpSolve

library(lpSolve)

sol <- lp(direction = "max",
          objective.in = C,
          const.mat = A,
          const.dir = B,
          const.rhs = D,
          compute.sens = 1)

sol
sol$solution
1*sol$solution[1] + 2*sol$solution[2] + 1*sol$solution[3]
3*sol$solution[1] + 0*sol$solution[2] + 2*sol$solution[3]
1*sol$solution[1] + 4*sol$solution[2] + 0*sol$solution[3]

#f. Valor optimo e interpretación resultados.

#Success: the objective function is 135000 
#> sol$solution
#[1]    0 1000 2300
#> 1*sol$solution[1] + 2*sol$solution[2] + 1*sol$solution[3]
#[1] 4300 no existe holgura
#> 3*sol$solution[1] + 0*sol$solution[2] + 2*sol$solution[3]
#[1] 4600 no existe holgura
#> 1*sol$solution[1] + 4*sol$solution[2] + 0*sol$solution[3]
#[1] 4000 existe una holgura de 200 unidades.

# El Valor optimo obtenido corresponde a 135.000 unidades monetarias, fabricando las siguientes cantidades

# 0 : Cantidad de pupitres unipersonales
# 1000 : Cantidad de pupitres bipersonales
# 2300 : Cantidad de mesas

#g. Analisis de sensibilidad

sol$duals[1:3]
# Los precios sombra obtenidos corresponden a la variacion en una unidad de disponibilidad, cuanto se vera aumentado nuestro
# Función objetivo se presentan los siguientes valores.

      
#[1] 10 : Al aumentar en una unidad la disponibilidad de madera aumenta en $10 mi F.O
#    20 : Al aumentar en una unidad la disponibilidad de tubo auemnto en $20 mi F.O
#    0  : Al aumentar en una unidad la disponibilidad de formica, mi F.O no se verà afectada.

tibble(c = c("c1", "c2", "c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.to)

# A tibble: 3 x 3
#c          min     max
#<chr>    <dbl>   <dbl>
#1 c1    -1.00e30 7.00e 1  Los siguientes intervalor permiten la variacion del costo unitario de Pupitres unipersonales sin afectar 
#2 c2     0.      1.00e 2  Los siguientes intervalor permiten la variacion del costo unitario de Pupitres bipersonales sin afectar 
#3 c3     2.33e 1 1.00e30  Los siguientes intervalor permiten la variacion del costo unitario de mesas sin afectar

#h. Si la empresa pudiese incrementar la unidad de materia prima, la opcion a utilizar corresponde
# a aquella que posee un precio sombra mayor, es decir la cantidad de unidades de fierro ya que genera un aumento
# de mi función objetivo en 20 por cada unidad adicional.

#i. Se sugiere aumentar la cantidad de madera y tubo al costo adicional de 15/m para cada una.
# No es aconsjable, realizar esta operación debido a que según los analisis de precio sombra
# por cada unidad adicional de madera aumento en $10 mi Funcion Objetivo, sin embargo me esta
# costando $15, por tanto estoy perdiendo -$5 por cada unidad. En el caso del fierro el precio
# sombra al aumentar en una unidad aumenta mi función objetivo en $20 y un costo de $15 es decir 
# solo estaria recuperando lo perdido por cada unidad de madera.

# Si la cantidad de formica se reduce en 100 m:




############################################################################

#Ejercicio nº 3

#a. Definición de variables

#X1 : Unidades del producto 1
#X2 : Unidades del producto 2

#b. Función objetivo

# Max. Z: 60X1 + 40X2

#c. Definición Restricciones

# Restricciones de Requerimientos por unidad Maquinas 1 y 2

# 4X1 + 2X2  <= 16 Horas disponibles Maquina 1
# 2X1 + 6X2  <= 16 Horas disponibles Maquina 2

# Restricciones No negatividad
# X1, X2 >=0

#d. Planteamiento matematico.

# 4X1 + 2X2  = 16
# 2X1 + 6X2  = 16

#e. Desarrollo plan Optimo

# Matriz de coeficientes

#               X1  X2  
A<- matrix(c(   4,  2,   
                2,  6),
      
           ncol = 2, 
           byrow = TRUE)

# Dirección de las desigualdades
B <- c("<=","<=")

# Coeficiente Función objetivo

C <- c (60,40)

#Coeficientes lado derecho de las restricciones
D <- c(16, 16)

#Solución mediante lpSolve

library(lpSolve)

sol <- lp(direction = "max",
          objective.in = C,
          const.mat = A,
          const.dir = B,
          const.rhs = D,
          compute.sens = 1)

sol
sol$solution

4*sol$solution[1] + 2*sol$solution[2] 
2*sol$solution[1] + 6*sol$solution[2] 
#f. Valor optimo e interpretación resultados.
# Success: the objective function is 256 
# El Valor optimo obtenido corresponde a 256, al fabricar 3.2 unidades del producto 1 y 1.6 unidades del producto 2

#> sol$solution
#[1] 3.2 1.6
#> 4*sol$solution[1] + 2*sol$solution[2] 
#[1] 16
#> 2*sol$solution[1] + 6*sol$solution[2] 
#[1] 16

#g. Analisis de sensibilidad

sol$duals

tibble(c = c("c1", "c2"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.to)
#> sol$duals
#[1] 14  2  0  0

# Por cada unidad que aumento del producto uno mi funcion objetivo aumenta en 14 
# mientras que por cada unidad que aumenta del producto 2 mi funcion objetivo aumenta en 2


# A tibble: 2 x 3
#c       min   max
#<chr> <dbl> <dbl>
#1 c1   13.3    80
#2 c2   30     180

#h. Si la empresa puede aumentar la cantidad de horas maquina, la maquina que tiene prioridad
# corresponde a la maquina 1 ya que su precio sombra es mayor logrando aumentar en mayor cantidad el valor de la
# función objetivo

#i. No es aconsable aumentar la cantidad de horas disponibles a los precios costos, debido a que en ambas maquinas 
# los ingresos generados son menores a los costos por cada hora adicional, generando asi una perdida de dinero.





