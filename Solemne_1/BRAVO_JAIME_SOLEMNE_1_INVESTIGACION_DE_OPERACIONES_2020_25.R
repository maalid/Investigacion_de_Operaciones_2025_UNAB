#
#
#
#-----------------------PROBLEMA 1
#                                    Jaime Bravo.
#
#


#a) Varibale de decision

# A1 = Ton producidas de aleación A
# A2 = Ton producidas de aleación B
# X3 = Ton de mineral utilizada en la aleación A
# X4 = Ton de mineral utilizada en la aleación A
# X5 = Ton de mineral utilizada en la aleación A
# X6 = Ton de mineral utilizada en la aleación B
# X7 = Ton de mineral utilizada en la aleación B
# X8 = Ton de mineral utilizada en la aleación B
#
#b)	Funcion Obejtiva
#
# Max Z = 200x1 + 300x2 - 30(X1+X4) - 40(X2+X5) - 50(X3+X6)

# c) Restricciones.

# x1 + X2 <= 1000Total de mineral 1 para la aleación a y b
# x2 + X5 <= 2000Total de mineral 2 para la aleación a y b
# x3 + X6 <= 3000Total de mineral 3 para la aleación a y b

# -0.8A1 + 0.2X1 + 0.1X2 + 0.05X3 <= 0   Ton de mineral I,II,III para en la aleacion A 
# -0.3A1 + 0.1X1 + 0.2X2 + 0.05X3 <= 0   Ton de mineral I,II,III para en la aleacion A 
# -0.5A1 + 0.3X1 + 0.3X2 +  0.2X3 >= 0   Ton de mineral I,II,III para en la aleacion A 
# -0.4B2 + 0.1X4 + 0.2X5 + 0.05X6 >= 0 Ton de mineral I,II,III para en la aleacion B
# -0.6B2 + 0.1X4 + 0.2X5 + 0.05X6 <= 0   Ton de mineral I,II,III para en la aleacion B 
# -0.3B2 + 0.3X4 + 0.3X5 +  0.7X6 >= 0   Ton de mineral I,II,III para en la aleacion B 
# -0.7B2 + 0.3X4 + 0.3X5 +  0.2X6 <= 0   Ton de mineral I,II,III para en la aleacion B 
# X1 , X2 ,X3, X4 , X5 ,X6 >= 0  No negatividad	
#
#
#			 
#        			
#    D)	Modelo matematico
# 
#			Max Z = 200A1 + 300B2 - 30(X1+X4) - 40(X2+X5) - 50(X3+X6) 
#                     
#  -0.8A1 + 0.2X1 + 0.1X2 + 0.05X3 <= 0 
#  -0.3A1 + 0.1X1 + 0.2X2 + 0.05X3 <= 0  
#  -0.5A1 + 0.3X1 + 0.3X2 + 0.2X3  >= 0  
#  -0.4B2 + 0.1X4 + 0.2X5 + 0.05X6 >= 0  
#  -0.6B2 + 0.1X4 + 0.2X5 + 0.05X6 <= 0  
#  -0.3B2 + 0.3X4 + 0.3X5 + 0.7X6  >= 0  
#  -0.7B2 + 0.3X4 + 0.3X5 + 0.2X6  <= 0  
# x1 + X4 <= 1000                   
# x2 + X5 <= 2000              
# x3 + X6 <= 3000                     
# X1 , X2 ,X3, X4 , X5 ,X6 >= 0                
#
# E)	
#
#       
#	
c <- c(200,300,-30,-40,-50,-30,-40,-50)


a <- matrix(c(-0.8,0,0.2,0.1,0.05,0,0,0,  
               -0.3,0,0.1,0.2,0.05,0,0,0,  
               -0.5,0,0.3,0.3,0.2,0,0,0,  
               0,-0.4,0,0,0,0.1,0.2,0.05,  
               0,-0.6,0,0,0,0.1,0.2,0.05, 
               0,-0.3,0,0,0,0.3,0.3,0.7, 
               0,-0.7,0,0, 0,0.3,0.3,0.2,   
               0,0,1,0,0,1,0,0,  
               0,0,0,1,0,0,1,0,  
               0,0,0,0,1,0,0,1),  
             ncol = 8, byrow = TRUE)


d <- c("<=","<=",">=",">=","<=",">=","<=","<=","<=","<=")


b <- c(0,0,0,0,0,0,0,1000,2000,3000)

sol <- lp(direction = "max",
               objective.in = c,
               const.mat = a,
               const.dir = d,
               const.rhs = b)


sol$solution
#[1] 1800  1000  1000    0  3000     0  2000     0
#Se deben producir: 1800 toneladas de aleacion A y 1000 toneladas de aleacion B

#primera restricción
-0.8*sol$solution[1] + 0*sol$solution[2] + 0.2*sol$solution[3] + 0.1*sol$solution[4] + 0.05*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
#Cumple con la restriccion de que sea <=0 S1=1090

#segunda restricción
-0.3*sol$solution[1] + 0*sol$solution[2] + 0.1*sol$solution[3] + 0.2*sol$solution[4] + 0.05*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
#Cumple con la restriccion de que sea <=0 S2= 290.

#tercera restricción
-0.5*sol$solution[1] + 0*sol$solution[2] + 0.3*sol$solution[3] + 0.3*sol$solution[4] + 0.2*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
#Cumple con la restriccion de que sea >=0  S3= 0.

#cuarta restricción
0*sol$solution[1] + -0.4*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.1*sol$solution[6] + 0.2*sol$solution[7] + 0.05*sol$solution[8]
#Cumple con la restriccion de que sea <= 0  S4= 0.

#quinta restricción
0*sol$solution[1] + -0.6*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.1*sol$solution[6] + 0.2*sol$solution[7] + 0.05*sol$solution[8]
#Cumple con la restriccion de que sea <=0 S5= 200.

#sexta restricción
0*sol$solution[1] + -0.3*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.3*sol$solution[6] + 0.3*sol$solution[7] + 0.7*sol$solution[8]
#Cumple con la restriccion de que sea => 0 S6= -300.

#septima restricción
0*sol$solution[1] + -0.7*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.3*sol$solution[6] + 0.3*sol$solution[7] + 0.2*sol$solution[8]
#Cumple con la restriccion de que sea <= 0 S7= 100.

#octava restricción
0*sol$solution[1] + 0*sol$solution[2] + 1*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 1*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
#Se utilizan 1000 ton de mineral 1 para aleacion a y b, S8=0.

#novena restricción
0*sol$solution[1] + 0*sol$solution[2] + 0*sol$solution[3] + 1*sol$solution[4] + 0*sol$solution[5] + 0*sol$solution[6] + 1*sol$solution[7] + 0*sol$solution[8]
#Se utilizan 2000 ton de mineral 2 para aleacion a y b, S9=0.

#decima restricción
0*sol$solution[1] + 0*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 1*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 1*sol$solution[8]
#Se utilizan 3000 ton de mineral 3 para aleacion a y b, S10=0.

#	f) 
sol
#4e+05 = 400.000

# La utilidad maxima es de 400.000 unidades monetarias, produciendo 1800 ton de Aleacion A y 1000 de aleacion B







# 
#----------------------------------PROBLEMA 2
#
#
#




#A) Variables de Decision		
#X1:	Cantidad de Pupitres a fabricar
#X2:	Cantidad de Bipersonales a fabricar
#X3:	Cantidad de Mesas a fabricar

#B) Funcion Objetiva		
# MaxZ:	30X1 + 20X2 + 50X3

#C) Restricciones		

# X1 + 2X2 + X3??? 4300	Metros de madera Disponibles
# 3X1 + 2X3 ??? 4600	Metros de tubo Disponibles
# X1 + 4X2 ??? 4200	Metros de formica Disponibles
# X1 , X2 , X3 ??? 0	No negatividad

#D) Modelo Matematico				
#El modelo programatico lineal queda de la siguiente forma :			

# MaxZ:	30X1 + 20X2 + 50X3		
# X1 + 2X2 + X3??? 4300	Metros de madera Disponibles		
# 3X1 + 2X3 ??? 4600	Metros de tubo Disponibles		
# X1 + 4X2 ??? 4200	Metros de formica Disponibles		
# X1 , X2 , X3 ??? 0	No negatividad		



#E)

#FO
# MaxZ:	30X1 + 20X2 + 50X3

C <- c(30,20,50)

#restricciones

A <- matrix(c(1,2,1,
           3,0,2,
           1,4,0),
  ncol = 3,
  byrow=TRUE
)

#direccion de ls desigualdades

D <- c("<=","<=","<=")
#Coeficientes lado de las restricciones

B <- c(4300,4600,4200)

#install.packages("lpSolve")
library(lpSolve)

sol <- lp(direction = "max", 
          const.mat = A,
          const.rhs = B,
          objective.in = C, 
          const.dir = D,
          compute.sens = 1)


sol$solution

sol$objval

#Cantidad de pupitres a Fabricar: 0
#Cantidad de bipersonales a Fabricar: 1000
#Cantidad de mesas a Fabricar: 2300

#Holguras:

#Primera Restriccion:

1*sol$solution[1] + 2*sol$solution[2] + 1*sol$solution[3]

#Se utilizaran 4300 metros de maderas, por lo tanto H1=0

#Segunda Restriccion:

3*sol$solution[1] + 0*sol$solution[2] + 2*sol$solution[3]

#Se utilizaran 4300 metros de tubo, por lo tanto H2=0

#Tercera Restriccion:

1*sol$solution[1] + 4*sol$solution[2] + 0*sol$solution[3]

#Se utilizaran 4000 metros de formica, por lo tanto 
# H3 = 4200 - 4000
# H3 = 200

#F)
#La utilidad optima que tendria la fabrica al producir, segun el planta optimo de produccion es:

sol

#Se obtienen Z= 135000 Unidades Monetarias

#G) Analisis de Sensibilidad

sol$duals[1:3]

#Si b1 aumenta o disminuye en una unidad, Z* va aumentar en Y1 = 10 
#Si b2 aumenta o disminuye en una unidad, Z* va aumentar en Y1 = 20
#Si b3 aumenta o disminuye en una unidad, Z* va aumentar/disminuir en Y1 = 0

#G2)

library(tibble)

tibble(c = c("c1", "c2", "c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.to)

# c          min       max
#   <chr>    <dbl>     <dbl>
# 1 c1     -1.00e30   7.00e 1
# 2 c2      0.        1.00e 2
# 3 c3      2.33e1    1.00e30


#G3


A_dual <- t(A)
B_dual <- C
C_dual <- B
D_dual <- c(">=",">=",">=")

sol_dual <- lp(direction = "min", 
          const.mat = A_dual,
          const.rhs = B_dual,
          objective.in = C_dual, 
          const.dir = D_dual,
          compute.sens = 1)

#install.packages("tibble")
library(tibble)


tibble(b = c("b1", "b2", "b3"),
       min = sol_dual$sens.coef.from, max = sol_dual$sens.coef.to)

#Los coeficientes pueden variar de acuerdo al siguientes intervalos sin afectar los precios sombras

#   2300 <= b1 <= 4400  
#   4400 <= b2 <= 8600  
#   4000 <= b3 <= inf  


# h) Si la empresa pudiese incrementar la cantidad de materia prima a usar,  ¿cuál tendrá la prioridad? Explique fundamentadamente.


# En base a los precios sombras de la produccion, de todos los elementos involucrados en el proceso de fabricacion 
# la empresara debe aumentar la cantidad de tubo, ya que es el elemento mas usado en la produccion.


# i) Se sugiere aumentar la cantidad de madera y tubo al costo adicional de 15/m para cada una.¿Es esto aconsejable? Explique fundamentadamente.

# En base al precio sombra, se puede deducir lo siguiente: Para el caso de la madera, esta genera una utilidad de 10 unidades monetarias, por lo tanto
# si se quiere adquirir a un precio de 15 u/m, nos generaria una perdida de 5 unidades. En cuanto al tubo, en este caso si seria sustentable comprar a un costo de 15 u/m
# ya que la utilidad generada por el tubo es de 20.

# j) Si la cantidad de fórmica se reduce en 100 metros, ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente.

# Estaria dentro de los intervalos, ya que serian 4100 unidades y el intervalo es de 4000 a inf, en pocas palabras no impactaria el punto maximo de utilidad.


# k) Suponga que la disponibilidad de madera se incrementa en 200 metros, ¿cómo afectará este incremento al ingreso óptimo? Explique fundamentadamente.

#       Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a 60 y 30 unidades
#       monetarias respectivamente, y de manera independiente. ¿Permanecerá igual el óptimo actual? 
#       Explique fundamentadamente y calcule el valor de la función objetivo en este nuevo escenario.


# FO con 1=60 .
# FO = 60*(0) + 20*(1000) + 50*(2300) = 135.000 u/m.

# FO con 2=30 .
# FO = 30*(0) + 30*(1000) + 50*(2300) = 145.000 u/m.


# Ambos valores se encuentran dentro del rangos permitidos, por lo tanto, el plan optimo se mantiene, ya que no modifica el plan optimo.



#
#
#------------------------------------------------------PROBLEMA 3
#
#
#


#	A) Variables de Decision	
# X1 = Unidad del producto 1
# X2 = Unidad del producto 2
#                          
#	b) Funcion Obejtiva

# Max Z = 60X1 + 40X2

# c) Restricciones

# 4x1 + 2x2 <= 16 horas disponibles maquina A
# 2x1 + 6x2 <= 16 horas disponibles maquina B
# x1 ,  x2 >= 0  no negatividad

# D) Modelo Matematico				
# El modelo programatico lineal queda de la siguiente forma :	

# Max Z = 60x1 + 40x2 
#                   
# 4x1 + 2x2 <= 16 
# 2x1 + 6x2 <= 16 
# x1,x2 >= 0  
# E)

C <- c(60,40)


A <- matrix(c(4,2,
              2,6), 
            ncol = 2 , 
            byrow = TRUE)

D <- c("<=","<=")


B <- c(16,16)



sol <- lp(direction = "max", 
          const.mat = A,
          const.rhs = B,
          objective.in = C, 
          const.dir = D,
          compute.sens = 1)

sol$solution

sol$objval
# 3.2  1.6

#Cantidad de productos 1 Fabricar: 3.2
#Cantidad de productos 2 Fabricar: 1.6

# primera restricción

4*sol$solution[1] + 2*sol$solution[2]
# se utilizan 16 hrs de maquina uno, es decir H1=0

# segunda restricción
2*sol$solution[1] + 6*sol$solution[2] 
# Se utilizan las 16 horas de la máquina 2, es decir H2=0


#	f) 

sol

#Se obtienen Z= 256 Unidades Monetarias
#Para que sea un problema real, ya que no es posible fabricar 3.2 de un producto ni 1.6 de otro producto,entonces podemos decir lo siguiente:
# z= 60*3+40*1= 220 unidades monetarias

#	G)

#G1

sol$duals[1:2]
# 14  2

#Si b1 aumenta o disminuye en una unidad, Z* va aumentar en Y1 = 14
#Si b2 aumenta o disminuye en una unidad, Z* va aumentar en Y1 = 2

#G2

tibble(c = c("c1","c2"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.to)

#  c        min        max
#1 c1       13.3       80
#2 c2       30         180

#Los costos unitarios pueden cambiar en los intervalos, sin que se modique el plan optimo.

# 13.3 <= c1 <= $ 80   
# 30 <= c2 <= $ 180 
#                   

# G3

A_dual <- t(A)
B_dual <- C
C_dual <- B
D_dual <- c(">=", ">=")
sol_dual <- lp(direction = "min", 
                    const.mat = A_dual,
                    const.rhs = B_dual,
                    objective.in = C_dual, 
                    const.dir = D_dual,
                    compute.sens = 1)

tibble(b = c("b1", "b2"), 
       min = sol_dual$sens.coef.from,
       max = sol_dual$sens.coef.to)

#b         min     max
#1 b1     5.33     32 
#2 b2     8        48.

#Los coeficientes de las restricciones pueden variar en los intervalos sin afectar los precios sombra.

# 5.33 h <= b1 <= 32hrs    
# 8 h <= b2 <= 48hrs  
#


# h) Si la empresa puede incrementar la capacidad de ambas máquinas, ¿cuál máquina tendrá la prioridad? Explique fundamentadamente.

# De acuerdo a los precios sombras obtenidos en el analisis de sensibilidad,  al aumentar una hora la disponibiidad de la maquina 1, generara una utilidad de 14 u/m
# por otro lado, al aumentar la disponibilidad de la maquina 2, nos generara utlidad po 2 u/m, es decir que conviene aumentar la disposicion de la maquina 1

#
# i) Se sugiere incrementar las capacidades de las máquinas 1 y 2 al costo adicional de $20/h para cada máquina. ¿Es esto aconsejable? Explique fundamentadamente.
#
# Considerando que la maquina 1 y 2, nos generan una utilidad de 14 y 2 u/m respectivamente, hacer un aumento adicional, no es recomendable, ya que no se
# estaria generando nada de utilidad, de hecho pasa el efecto contrario, se generaria mas perdidas que ganancias (-6 y -18 u/m)

# j) Si la capacidad de la máquina 1 se incrementa de 16 a 26 horas, ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente.
#
# En base a los resultados obtenidos en el analasis de sensibilidad, al aumentar la capacidad de la maquina, no afectaria el plan optimo, ya que esta dentro del intervalo.
# Por lo tanto quedaria de la siguiente forma:
# 14*10= 140
# z= 396

# k) Suponga que la capacidad de la máquina 1 se incrementa a 40 horas, ¿cómo afectará este incremento al ingreso óptimo? Explique fundamentadamente.

# De acuerdo al analisis, en este caso se debe volver calcular, ya que las 40 hrs, se encutran fuera del intervalo
#

# l) Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a $70 y $50, respectivamente, y de manera independiente. ¿Permanecerá igual el óptimo actual? Explique fundamentadamente y calcule el valor de la
# función objetivo en este nuevo escenario.

# considerando el plan óptimo calculado tenemos lo siguiente:
#
# 70*3,2 + 40*1,6 = $288
# 60*3,2 + 50*1,6 = $272.  




