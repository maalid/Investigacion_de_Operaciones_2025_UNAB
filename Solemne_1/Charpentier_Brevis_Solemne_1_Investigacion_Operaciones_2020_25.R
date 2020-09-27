#Solemne 1 Investigacion de Operaciones

#Ejercicio 1                                                                        #Rodrigo Charpentier Brevis

#(a)Definicion de las variables de decision:
# xik: toneladas  de mineral asignadas a la aleacion k
# wk: toneladas producidas de la aleación k

#WA:toneladas producidas de la aleación A
#WB:toneladas producidas de la aleación B
#X1A: toneladas  de mineral asignadas a la aleacion A 
#X2A: toneladas  de mineral asignadas a la aleacion A
#X3A: toneladas  de mineral asignadas a la aleacion A
#XIB: toneladas  de mineral asignadas a la aleacion B
#X2B: toneladas  de mineral asignadas a la aleacion B
#X3B: toneladas  de mineral asignadas a la aleacion B

#(b)Escriba la funcion objetivo que optimiza la utilidad para la elaboración de las aleaciones:

#funcio Objetivo

#Zmax:200WA + 300WB -30(X1A+X1B)-40(X2A+X2B)-50(X3A+X3B)

#(c) Escriba las restricciones asociadas al problema:

#restricciones:
# -0.8WA + 0.2X1A + 0.1X2A + 0.05X3A <= 0  (TONELADAS DE MINERAL (I),(II),(III) asignadas a LA ALEACION A )
# -0.3WA + 0.1X1A + 0.2X2A + 0.05X3A <= 0  (TONELADAS DE MINERAL (I),(II),(III) asignadas a LA ALEACION A )
# -0.5WA + 0.3X1A + 0.3X2A + 0.2X3A  >= 0  (TONELADAS DE MINERAL (I),(II),(III) asignadas a LA ALEACION A )
# -0.4WB + 0.1X1B + 0.2X2B + 0.05X3B >= 0  (TONELADAS DE MINERAL (I),(II),(III) asignadas a LA ALEACION B )
# -0.6WB + 0.1X1B + 0.2X2B + 0.05X3B <= 0  (TONELADAS DE MINERAL (I),(II),(III) asignadas a LA ALEACION B )
# -0.3WB + 0.3X1B + 0.3X2B + 0.7X3B  >= 0  (TONELADAS DE MINERAL (I),(II),(III) asignadas a LA ALEACION B )
# -0.7WB + 0.3X1B + 0.3X2B + 0.2X3B  <= 0  (TONELADAS DE MINERAL (I),(II),(III) asignadas a LA ALEACION B )

#xIA + XIB <= 1000                     ( TOTAL DE MINERAL 1 UTILIZADO PRA LA ALEACION A Y B )
#x2A + XAB <= 2000                     ( TOTAL DE MINERAL 2 UTILIZADO PRA LA ALEACION A Y B )
#x3A + X3B <= 3000                     ( TOTAL DE MINERAL 3 UTILIZADO PRA LA ALEACION A Y B )
#XIA , X2A ,X3A, XIB , X2B ,X3B >= 0   (restrcicion de no negatividad de las variabless)

#(d) Plantee matemáticamente el modelo completo asociado al problema:
#modelo a resolver

#Zmax: 200WA + 300WB -30(XIA+XIB)-40(X2A+X2B)-50(X3A+X3B)

#S.T

# -0.8WA + 0.2X1A + 0.1X2A + 0.05X3A <= 0  
# -0.3WA + 0.1X1A + 0.2X2A + 0.05X3A <= 0  
# -0.5WA + 0.3X1A + 0.3X2A + 0.2X3A  >= 0  
# -0.4WB + 0.1X1B + 0.2X2B + 0.05X3B >= 0  
# -0.6WB + 0.1X1B + 0.2X2B + 0.05X3B <= 0  
# -0.3WB + 0.3X1B + 0.3X2B + 0.7X3B  >= 0  
# -0.7WB + 0.3X1B + 0.3X2B + 0.2X3B  <= 0   

#xIA + XIB <= 1000                  
#x2A + X2B <= 2000                  
#x3A + X3B <= 3000

#transcribimos el medelo anterior a R

#matriz de coeficientes de las restricciones

     #wa, wb,x1a x2a x3a x1b x2b x3b
C<-c(200,300,-30,-40,-50,-30,-40,-50)

#matriz de coeficientes de las restricciones
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

#direccion de las desigualdades de las restricciones
B <- c("<=","<=",">=",">=","<=",">=","<=","<=","<=","<=")

#coeficientes lado derecho de las restricciones
D <- c(0, 0, 0, 0, 0, 0, 0,1000,2000,3000)

library(lpSolve)

sol <- lp(direction = "max",
               objective.in = C,
               const.mat = A,
               const.dir = B,
               const.rhs = D,
              compute.sens = 1)


#Results of Linear Programming / Linear Optimization


#Objective function (Maximum): 4e+05 
sol

#Plan optimo de solucion
sol$solution
#(e) Encuentre el plan óptimo de producción e interprete los resultados:
#1800 1000 1000    0 3000    0 2000    0

#1    1800  #wa: 1800   cantidad de toneladas de aleacion A  a producir.  
#2    1000  #wb: 1000   cantidad de toneladas de aleacion  B  a producir.  
#3    1000  #x1a: 1000  cantidad de toneladas de mineral 1 para la aleacion A . 
#4       0  #x2a: 0     asociada a Cantidad de toneladas de mineral 2 para la aleacion A  SE UTILIZA TODO.   
#5    3000  #x3a: 3000  cantidad de toneladas de mineral 3 para la aleacion A.  
#6       0  #x1b: 0     asociada a Cantidad de toneladas de mineral 1 para la aleacion B  SE UTILIZA TODO. 
#7    2000  #x2b: 2000  cantidad de toneladas de mineral 2 para la aleacion B. 
#8       0  #x3b: 0     asociada a Cantidad de toneladas de mineral 3 para la aleacion B  SE UTILIZA TODO. 
#S 1  1090  #S1: 1090   Holgura asociada a primera restriccion. 
#S 2   290  #S2: 290    Holgura asociada a segunda restriccion. 
#S 3     0  #S3: 0      Holgura asociada a tercera restriccion. 
#S 4 5.684342e-14  #S4: 5.684342e-14      Holgura asociada a cuarta restriccion.  
#S 5   200  #S5: 200    Holgura asociada a quinta restriccion.  
#S 6   300  #S6: 300    Holgura asociada a sexta restriccion.   
#S 7   100  #S7: 100    Holgura asociada a septima restriccion. 
#S 8     0  #S8: 0      Holgura asociada a octava restriccion.
#S 9     0  #S9: 0      Holgura asociada a novena restriccion.  
#S 10    0  #S10:0      Holgura asociada a decima restriccion.   

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

#(f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados:


# z= 400.000  ( pesos en las aleaciones A y B)

#SE DEBE PRODUCIR 1800 TONELADAS DE ALEACION A Y 1000 TONELADAS DE ALEACION B PARA
#TENER UNA UTILIDAD MAXIMA DE $400.000




#Ejercicio 2

#(a) Defina correctamente todas las variables de decisión.
#(b) Escriba la función objetivo que optimiza la utilidad para la elaboración de los productos.
#(c) Escriba las restricciones asociadas al problema.
#(d) Plantee matemáticamente el modelo completo asociado al problema.
#(e) Encuentre el plan óptimo de producción e interprete los resultados.
#(f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.
#(g) Realice un análisis de sensibilidad completo.
#(h) Si la empresa pudiese incrementar la cantidad de materia prima a usar, ¿cuál tendrá la prioridad? Explique fundamentadamente.
#(i) Se sugiere aumentar la cantidad de madera y tubo al costo adicional de 15/m para cada una. ¿Es esto aconsejable? Explique fundamentadamente.
#(j) Si la cantidad de fórmica se reduce en 100 metros, ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente.
#(k) Suponga que la disponibilidad de madera se incrementa en 200 metros, ¿cómo afectará este incremento al ingreso óptimo? Explique fundamentadamente.
#(l) Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a 60 y 30 unidades monetarias respectivamente, 
#y de manera independiente. ¿Permanecerá igual el óptimo actual? Explique fundamentadamente y calcule el valor de la función objetivo en este nuevo escenario.

#(a) Defina correctamente todas las variables de decisión:

#X1:cantidad de pupitres unipersonal a producir por semana 
#X2:cantidad de pupitres biperosonales a producir por semana 
#X3:cantidad de mesas a producir por semana 

#(b) Escriba la función objetivo que optimiza la utilidad para la elaboración de los productos:

#funcion Objetivo
#Zmax:30*x1+20*x2+50*x3  

#(c) Escriba las restricciones asociadas al problema:

#1x1+2x2+1x3<=4300
#3x1+0x2+2x3<=4600
#1x1+4x2+0x3<=4200
#x1,x2,x3>=0        

#(d) Plantee matemáticamente el modelo completo asociado al problema:
#modelo a resolver 

#Zmax:30x1+20x2+50x3

#S.T

#1*x1+2*x2+1*x3<=4300 (restricción para los metros de madera) 
#3*x1+0*x2+2*x3<=4600 (restricción para los metros de tubo)
#1*x1+4*x2+0*x3<=4200 (restricción para los metros de formica)
#X1,X2,X3>=0          (restrcicion de no negatividad de las variabless)

#transcribimos el medelo anterior a R
#coeficientes de la funcion objetivo
C<-c(30,20,50)

#matriz de coeficientes de las restricciones

              # x1    x2   x3
A <- matrix(c( 1,     2,   1,    #r1: restricción para los metros de madera 
               3,     0,   2,    #r2: restricción para los metros de tubo
               1,     4 ,  0),   #r3: restricción para los metros de formica  
               ncol = 3, byrow = TRUE)


#direccion de las desigualdades de las restricciones
D <- c("<=","<=","<=")

#coeficientes lado derecho de las restricciones
B <- c(4300,4600,4200)

#planteamiento de produccion
library(lpSolve)

sol <- lp(direction = "max",
          const.mat = A,
          const.dir = D, 
          objective.in = C,
          const.rhs = B,
          compute.sens = 1)
#Results of Linear Programming / Linear Optimization


#the objective function is 135000
sol$objval

# (e) Plan optimo de solucion
sol$solution
#Solution
#opt
#1    0  X1: 0 cantidad de pupitres unipersonal a producir por semana 
#2 1000  X2: 1000 cantidad de pupitres biperosonales a producir por semana 
#3 2300  x3: 2300 cantidad de mesas a producir por semana 
# S1: 0 Holgura asociada a primera restricciOn: se utilizan los 4300 metros  de madera disponibles 
# S2: 0 Holgura asociada a segunda restriccion: se utilizan los 4600 metros de tubo disponibles
# S3: 200 Holgura asociada a tercera restricciOn: se utilizan 4000 metros de formica disponible
1*sol$solution[1] + 2*sol$solution[2] + 1*sol$solution[3]
3*sol$solution[1] + 0*sol$solution[2] + 2*sol$solution[3]
1*sol$solution[1] + 4*sol$solution[2] + 0*sol$solution[3]

#(f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados:

#zmax= 135000 UNIDADES MONETARIA DE LA UTILIDADES


#(g) Realice un análisis de sensibilidad completo

#(g.1)Analisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi)

#Y1: = 10 si yo aumento de 4300 a 4301  mi funcion ob. va a aumentar en 135010 , y  si yo disminuyo de 4300 a 4293  mi funcion ob. va a  disminuir en 134990
#Y2: = 20 si yo aumento de 4600 a 4601  mi funcion ob. va a aumentar en 135020 , y si yo disminuyo de 4600 a 4599   mi funcion ob. va a  disminuir en 134980
#Y3: = 0  si yo cambio de 4000 a 4001  mi funcion ob. va a ser 135000
sol$duals[1:3]

#(g.2) Analisis de sensibilidad para coeficientes de la funcion objetivo


tibble(c = c("c1", "c2", "c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.to)
#  c          min     max
#1 c1    -1.00e30  7.00e 1
#2 c2     0.       1.00e 2
#3 c3     2.33e 1  1.00e30
#    -inf <= c1 <= 70    (el costo unitario de los pupitres unipersonal puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)
#       0 <= c2 <= 100   (el costo unitario de los pupitres bipersonales puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)
# 23.3333 <= c3 <= +inf  (el costo unitario de los mesas puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)


#(g.3) Analisis de sensibilidad para los coeficientes bi

A_dual <- t(A)

B_dual <- C

C_dual <- B

D_dual <- c(">=", ">=", ">=")

sol_dual <- lp(direction = "min",
          const.mat = A_dual,
          const.dir = D_dual, 
          objective.in = C_dual,
          const.rhs = B_dual,
          compute.sens = 1)

tibble(b = c("b1", "b2", "b3"), 
       min = sol_dual$sens.coef.from,
       max = sol_dual$sens.coef.to)

#(h) Si la empresa pudiese incrementar la cantidad de materia prima a usar, ¿cuál tendrá la prioridad? Explique fundamentadamente:

#segun los precios sombras la materia prima que tendra la prioridad es la Y2 debido a que que si aumento en 1  
#voy a estar ganado 20 mas, devido a que el precio sombra es mayor.

#Y1: = 10 si yo aumento de 4300 a 4301  mi funcion ob. va a aumentar en 135010 , y  si yo disminuyo de 4300 a 4293  mi funcion ob. va a  disminuir en 134990
#Y2: = 20 si yo aumento de 4600 a 4601  mi funcion ob. va a aumentar en 135020 , y si yo disminuyo de 4600 a 4599   mi funcion ob. va a  disminuir en 134980
#Y3: = 0  si yo cambio de 4000 a 4001  mi funcion ob. va a ser 135000

#(i) Se sugiere aumentar la cantidad de madera y tubo al costo adicional de 15/m para cada una. ¿Es esto aconsejable? Explique fundamentadamente:

#   Para y1 el ingreso neto adicional por m de madera es $10-$15=-$5 y para y2 es $20-$15=$5 por lo tanto tendria que 
#   aumentar la cantida  m de tubos para tener una ganancia de $5

#(j) Si la cantidad de fórmica se reduce en 100 metros, ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente

#   el precio sombra de la y3 es 0 y es valido debido a que si pertenece al  intervalo (4000 , +inf ) . la reduccion de 100 metros
#   de formica  pertenece al intervalo de factibilidad por consiguente la disminucion de 100 m de formica  dejaria en 4200-100=4100
#   lo que no afectaria al precio sombra.

#(k) Suponga que la disponibilidad de madera se incrementa en 200 metros, ¿cómo afectará este incremento al ingreso óptimo? Explique fundamentadamente:
#     4300+200:4500  nos salimos del intervalo (4400), resolviendo nuevamente el problema con los 4500 de madera  temdriamos una utilidad
#    de 136000 entonces estariamos ganando 1000 no mas 

B_k <- c(4500, 4600, 4200)
sol_k <- lp(direction = "max", 
            const.mat = A,
            const.rhs = B_k,
            objective.in = C, 
            const.dir = D,
            compute.sens = 1)
sol_k

#The objective function is 136000 

sol_k$solution

#solucion optima 
#x1 = 0, x2 = 1050, x3 = 2300

sol_k$duals[1:3]

#Precios sombra
# Y1 = 0, Y2 = 25, Y = 5

tibble(c = c("c'1", "c'2", "c'3"), 
       min = sol_k$sens.coef.from, 
       max = sol_k$sens.coef.to)
#intervalos para coeficientes C
# A tibble: 3 x 3
#c           min     max
#<chr>     <dbl>   <dbl>
#1 c'1   -1.00e+30 8.00e 1
#2 c'2    3.55e-15 1.00e30
#3 c'3    1.67e+ 1 1.00e30

A_k_dual <- t(A)

B_k_dual <- C

C_k_dual <- B_k

D_k_dual <- c(">=", ">=", ">=")

sol_k_dual <- lp(direction = "min", 
                 const.mat = A_k_dual,
                 const.rhs = B_k_dual,
                 objective.in = C_k_dual, 
                 const.dir = D_k_dual,
                 compute.sens = 1)

#Intervalo para coeficientes b
tibble(b = c("b'1", "b'2", "b'3"), 
       min = sol_k_dual$sens.coef.from, 
       max = sol_k_dual$sens.coef.to)
# A tibble: 3 x 3
#b       min     max
#<chr>  <dbl>   <dbl>
#1 b'1    4400 1.00e30
#2 b'2       0  4.80e 3
#3 b'3       0  4.40e 3

#l)Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a 60 y 30 unidades monetarias respectivamente, y de manera independiente. 
#¿Permanecerá igual el óptimo actual? Explique fundamentadamente y calcule el valor de la función objetivo en este nuevo escenario.

#    ya que los nuevos valores de $60 para el producto 1 y 30 para el producto 2 se encuentran dentro del intervalo 
#    se puede concluir que el plan productivo se mantendra igual pero lo unico que se va a cambiar es el z , que no cambiara la
#    utilidada al cambiar de $30 a $60 lo pupitres unipersonal se mantendra en  $135000  pero al cambiar el valor de los pupitres
#    bipersonales de $20 a $30 nos cambira la utilidad llegando a un valor de $145000

#   60*(0)+20*(1000)+50*(2300)=$135000
#   30*(0)+30*(1000)+50*(2300)=$145000





#ejercicio 3
#(a) Defina correctamente todas las variables de decisión.
#(b) Escriba la funcion objetivo que optimiza la utilidad para la elaboración de los productos.
#(c) Escriba las restricciones asociadas al problema.
#(d) Plantee matemáticamente el modelo completo asociado al problema.
#(e) Encuentre el plan óptimo de producción e interprete los resultados.
#(f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.
#(g) Realice un análisis de sensibilidad completo.
#(h) Si la empresa puede incrementar la capacidad de ambas máquinas, ¿cuál máquina tendrá la prioridad? Explique fundamentadamente.
#(i) Se sugiere incrementar las capacidades de las máquinas 1 y 2 al costo adicional de $20/h para cada máquina. ¿Es esto aconsejable? Explique fundamentadamente.
#(j) Si la capacidad de la máquina 1 se incrementa de 16 a 26 horas, ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente.
#(k) Suponga que la capacidad de la máquina 1 se incrementa a 40 horas, ¿cómo afectará este incremento al ingreso óptimo? Explique fundamentadamente.
#(l) Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a $70 y $50, respectivamente, y de manera independiente.
#¿Permanecerá igual el óptimo actual? Explique fundamentadamente y calcule el valor de la función objetivo en este nuevo escenario.


#(a) Defina correctamente todas las variables de decisión:

#X1: numero de unidades del producto 1 que se podra fabricar 
#X2: numero de unidades del producto 2 que se podran fabricar 


#(b) Escriba la funcion objetivo que optimiza la utilidad para la elaboración de los productos:
#funcio Objetivo

#Zmax:60*X1 + 40*X2

#(c) Escriba las restricciones asociadas al problema:

#restricciones:

#4X1+2X2>=16  ( horas diponibles para la produccion del producto 1) 
#2X1+6X2>=16  ( horas diponibles para la produccion del producto 2)
#x1,x2>=0     (restrcicion de no negatividad de las variables)

#(d) Plantee matemáticamente el modelo completo asociado al problema:
#modelo a resolver 

#Zmax:60X1 + 40X2

#S.T

#4X1+2X2>=16
#2X1+6X2>=16

#transcribimos el medelo anterior a R
#coeficientes de la funcion objetivo

C <-c(60,40)

#matriz de coeficientes de las resistencias
           # x1,x2
A <- matrix(c(4, 2,    
              2, 6),  
              ncol = 2, byrow = TRUE)

#direccion de las desigualdades de las restricciones

D <- c("<=","<=")

#coeficientes lado derecho de las restricciones

B <- c(16, 16)

#planteamiento de produccion

library(lpSolve)

sol <- lp(direction = "max",
          const.mat = A,
          const.dir = D, 
          objective.in = C,
          const.rhs = B,
          compute.sens = 1)

#Results of Linear Programming / Linear Optimization


#Objective function (Maximum): 256
sol$objval

#(e) Plan optimo de solucion

sol$solution
#1 3.2 (X1: 3.2 cantidad de productos 1 a producir por dia.  
#2 1.6 (X2: 1.6 cantidad de productos 2 a producir por dia.  
# (S1: 0 Holgura asociada a primera restricciOn: se utilizan las 16 horas.  
# (S2: 0 Holgura asociada a segunda restriccion: se utilizan las 16 horas.  

4*sol$solution[1] + 2*sol$solution[2] 
2*sol$solution[1] + 6*sol$solution[2] 

#(f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados:

#z= 256 ingresos por unidad de los productos 

#(g) Realice un análisis de sensibilidad completo

#(g.1)Analisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi)

sol$duals[1:2]

#Y1: = 14 si yo aumento de 16 a 17  mi funcion ob. va a aumentar en 270 , y  si yo disminuyo de 16 a 15  mi funcion ob. va a  disminuir a 242
#Y2: = 2 si yo aumento de 16 a 17  mi funcion ob. va a aumentar en 258 , y si yo disminuyo de 16 a 15   mi funcion ob. va a  disminuir a 254

#(g.2) Analisis de sensibilidad para coeficientes de la funcion objetivo

tibble(c = c("c1", "c2"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.to)

#(g.3) Analisis de sensibilidad para los coeficientes bi

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


# A tibble: 2 x 3
#b       min   max
# <chr> <dbl> <dbl>
# 1 b1   5.33   32 
# 2 b2     8      48.

#(h) Si la empresa puede incrementar la capacidad de ambas máquinas, ¿cuál máquina tendrá la prioridad? Explique fundamentadamente.
#segun los precios sombras la capacidad que tendra la prioridad es la Y1 devido a que que si aumento en 1  
#se ganará 14 mas devido a que el presio sombra es mayor.
#Y1: = 14 si yo aumento de 16 a 17  mi funcion ob. va a aumentar en 270 , y  si yo disminuyo de 16 a 15  mi funcion ob. va a  disminuir a 242
#Y2: = 2 si yo aumento de 16 a 17  mi funcion ob. va a aumentar en 258 , y si yo disminuyo de 16 a 15   mi funcion ob. va a  disminuir a 254

#(i) Se sugiere incrementar las capacidades de las máquinas 1 y 2 al costo adicional de $20/h para cada máquina. ¿Es esto aconsejable? Explique fundamentadamente:

#para la maquina 1 que se desea incrementar la capacidad 14-20 =-6 y para la maquina 2 que se desea incrementar 
# la capacidad 2-20 =-18 esto no es aconsejable devido a que en las 2 maquinas estaria perdiendo (maquina 1 = -6 , maquina 2 = -18)
#devido a que el costo adicional es muy alto 

#(j) Si la capacidad de la máquina 1 se incrementa de 16 a 26 horas, ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente:

#el precio sombra de la maquina 1 es de 14 y esto impactaria de forma pocitiva  devido a que se encuentra entre el intervalo 
#(5.3333  <= b1 <= 32), el incremento es de 16 a 26 por lo tanto 14*26=224 lo que significa que es ingreso totan aumentaria 
#de 256 a 480  (256+224=480).

#(k) Suponga que la capacidad de la máquina 1 se incrementa a 40 horas, ¿cómo afectará este incremento al ingreso óptimo? Explique fundamentadamente:

# Con la información obtenida al solucionar el problema original, dado este nuevo escenario, no se puede concluir
#(5.3333  <= b1 <= 32) nos salimos del intervalo (32), resolviendo nuevamente el problema con los 40 horas tendriamos una utilidad 
#de 480 entonces estariamos ganando  224.

B_k <- c(40, 16)

sol_k <- lp(direction = "max", 
            const.mat = A,
            const.rhs = B_k,
            objective.in = C, 
            const.dir = D,
            compute.sens = 1)

sol_k
#the objective function is 480

sol_k$solution
#Plan productivo óptimo.
#x1 = 8,  x2 = 0

sol_k$duals[1:2]
#Precios sombra
#Y1 = 0,  Y2 = 30

tibble(c = c("c'1", "c'2"), 
       min = sol_k$sens.coef.from, 
       max = sol_k$sens.coef.to)
#intervalo para los coeficientes Ci
# A tibble: 2 x 3
#c          min     max
#<chr>    <dbl>   <dbl>
#1 c'1    1.33e 1 1.00e30
#2 c'2   -1.00e30 1.80e 2

#Intervalo para coeficientes Bi

A_k_dual <- t(A)

B_k_dual <- C

C_k_dual <- B_k

D_k_dual <- c(">=", ">=")

sol_k_dual <- lp(direction = "min", 
                 const.mat = A_k_dual,
                 const.rhs = B_k_dual,
                 objective.in = C_k_dual, 
                 const.dir = D_k_dual,
                 compute.sens = 1)

tibble(b = c("b'1", "b'2"), 
       min = sol_k_dual$sens.coef.from, 
       max = sol_k_dual$sens.coef.to)

# A tibble: 2 x 3
#b       min     max
#<chr> <dbl>   <dbl>
#1 b'1  32   1.00e30
#2 b'2   0   2.00e 1

#(l) Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a $70 y $50, respectivamente, y de manera independiente. ¿Permanecerá igual el óptimo actual? Explique fundamentadamente y calcule el valor de la función objetivo en este nuevo escenario:

# ya que los nuevos valores de $70 para el producto 1 y $50 para la producto 2 se encuentran dentro del intervalo se puede concluir que el plan
# productivo se mantendra igual pero lo unico que se va a cambiar es el z , que nos cambiara la utilidad al cambiar de $60 a $70 los productos 1
# nos entregara una utilidad de $288 mientras tanto que el producto 2 al cambiar de $40 a $50 nos cambiara la utilidad a un valor de $272
#    70*(3.2)+40*(1.6) =$288
#    60*(3.2)+50*(1.6) =$272
















































