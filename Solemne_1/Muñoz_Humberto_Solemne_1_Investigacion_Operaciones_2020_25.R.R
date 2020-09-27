#########################Solemne N°1########################


#                 INVESTIGACION DE OPERACIONES



#                 HUMBERTO MUÑOZ VALENZUELA



#_________________EJERCICIO 1__________________________________________________

library(lpSolve)
library(tibble)

#    a) Defina correctamente todas las variables de decisión.

#                          V1 = Toneladas producidad de aleación A
#                          V2 = Toneladas producidad de aleación B

#                          X3 = Toneladas de mineral utilizada en la aleación A
#                          X4 = Toneladas de mineral utilizada en la aleación A
#                          X5 = Toneladas de mineral utilizada en la aleación A

#                          X6 = Toneladas de mineral utilizada en la aleación B
#                          X7 = Toneladas de mineral utilizada en la aleación B
#                          X8 = Toneladas de mineral utilizada en la aleación B
#

#    b)	Escriba la funcion objetivo que optimiza la utilidad para la elaboración de las aleaciones.
#
#                          Max Z = 200V1 + 300V2 - 30(X1+X4) - 40(X2+X5) - 50(X3+X6)

#    c)	Escriba las restricciones asociadas al problema.



# 			-0.8V1 + 0.2X1 + 0.1X2 + 0.05X3 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )
# 			-0.3V1 + 0.1X1 + 0.2X2 + 0.05X3 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )
# 			-0.5V1 + 0.3X1 + 0.3X2 +  0.2X3 >= 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )

# 			-0.4V2 + 0.1X4 + 0.2X5 + 0.05X6 >= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 			-0.6V2 + 0.1X4 + 0.2X5 + 0.05X6 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 			-0.3V2 + 0.3X4 + 0.3X5 +  0.7X6 >= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 			-0.7V2 + 0.3X4 + 0.3X5 +  0.2X6 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )

#                         x1 + X2 <= 1000(Total de mineral 1 usado para la aleación A Y B)
#                         x2 + X5 <= 2000(Total de mineral 2 usado para la aleación A Y B)
#                         x3 + X6 <= 3000(Total de mineral 3 usado para la aleación A Y B)
#
#
#			 
#        			X1 , X2 ,X3, X4 , X5 ,X6 >= 0   (no negatividad) 
                          


#    d)	Plantee matemáticamente el modelo completo asociado al problema.
# 
#			Max Z = 200V1 + 300V2 - 30(X1+X4) - 40(X2+X5) - 50(X3+X6) 
#                      S.T
#                           -0.8V1 + 0.2X1 + 0.1X2 + 0.05X3 <= 0 
#                           -0.3V1 + 0.1X1 + 0.2X2 + 0.05X3 <= 0  
#                           -0.5V1 + 0.3X1 + 0.3X2 + 0.2X3  >= 0  
#                           -0.4V2 + 0.1X4 + 0.2X5 + 0.05X6 >= 0  
#                           -0.6V2 + 0.1X4 + 0.2X5 + 0.05X6 <= 0  
#                           -0.3V2 + 0.3X4 + 0.3X5 + 0.7X6  >= 0  
#                           -0.7V2 + 0.3X4 + 0.3X5 + 0.2X6  <= 0  
#                                                   x1 + X4 <= 1000                   
#                                                   x2 + X5 <= 2000              
#                                                   x3 + X6 <= 3000                     
#                                  X1 , X2 ,X3, X4 , X5 ,X6 >= 0                
#
#    e)	Encuentre el plan óptimo de producción e interprete los resultados.
#
#       Transcribimos el modelo anterior a R.

#	Coeficientes de la función objetivo:

C1 <- c(200,300,-30,-40,-50,-30,-40,-50)

#	Matriz de coeficientes de las restricciones:


A1 <- matrix(c(-0.8,     0,  0.2,  0.1,  0.05,    0,    0,     0,  
               -0.3,     0,  0.1,  0.2,  0.05,    0,    0,     0,  
               -0.5,     0,  0.3,  0.3,   0.2,    0,    0,     0,  
                  0,  -0.4,    0,    0,     0,  0.1,  0.2,  0.05,  
                  0,  -0.6,    0,    0,     0,  0.1,  0.2,  0.05, 
                  0,  -0.3,    0,    0,     0,  0.3,  0.3,   0.7, 
                  0,  -0.7,    0,    0,     0,  0.3,  0.3,   0.2,   
                  0,     0,    1,    0,     0,    1,    0,     0,  
                  0,     0,    0,    1,     0,    0,    1,     0,  
                  0,     0,    0,    0,     1,    0,    0,    1),  
                  ncol = 8, byrow = TRUE)

#	Dirección de las desigualdades de las restricciones

D1 <- c("<=","<=",">=",">=","<=",">=","<=","<=","<=","<=")

#	Coeficientes lado derecho de las restricciones

B1 <- c(0,0,0,0,0,0,0,1000,2000,3000)

solucion <- lp(direction = "max",
               objective.in = C1,
               const.mat = A1,
               const.dir = D1,
               const.rhs = B1)


solucion$sol
#[1] 1800  1000  1000    0  3000     0  2000     0

#El plan óptimo de producción de las aleaciones es la siguiente:
#Se deben producir:
#1800 Toneladas producidad de aleación A     (V1)
#1000 Toneladas producidad de aleación B     (V2)

#Holgura primera restricción
-0.8*solucion$solution[1] + 0*solucion$solution[2] + 0.2*solucion$solution[3] + 0.1*solucion$solution[4] + 0.05*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#|-1090|=1090
#Sé cumple con la restricción de que sea =< 0 con una holgura S1= 1090.

#Holgura segunda restricción
-0.3*solucion$solution[1] + 0*solucion$solution[2] + 0.1*solucion$solution[3] + 0.2*solucion$solution[4] + 0.05*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#|-290|=290
#Sé cumple con la restricción de que sea =< 0 con una holgura S2= 290.

#Holgura tercera restricción
-0.5*solucion$solution[1] + 0*solucion$solution[2] + 0.3*solucion$solution[3] + 0.3*solucion$solution[4] + 0.2*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#0
#Sé cumple con la restricción de que sea => 0 con una holgura S3= 0.

#Holgura cuarta restricción
0*solucion$solution[1] + -0.4*solucion$solution[2] + 0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.1*solucion$solution[6] + 0.2*solucion$solution[7] + 0.05*solucion$solution[8]
#5.684342e-14
#Sé cumple con la restricción de que sea => 0 con una holgura "prácticamente" S4= 0.

#Holgura quinta restricción
0*solucion$solution[1] + -0.6*solucion$solution[2] + 0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.1*solucion$solution[6] + 0.2*solucion$solution[7] + 0.05*solucion$solution[8]
#-200
#Sé cumple con la restricción de que sea =< 0 con una holgura S5= 200.

#Holgura sexta restricción
0*solucion$solution[1] + -0.3*solucion$solution[2] + 0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.3*solucion$solution[6] + 0.3*solucion$solution[7] + 0.7*solucion$solution[8]
#300
#Sé cumple con la restricción de que sea => 0 con una holgura S6= -300.

#Holgura septima restricción
0*solucion$solution[1] + -0.7*solucion$solution[2] + 0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.3*solucion$solution[6] + 0.3*solucion$solution[7] + 0.2*solucion$solution[8]
#-100
#Sé cumple con la restricción de que sea =< 0 con una holgura S7= 100.

#Holgura octava restricción
0*solucion$solution[1] + 0*solucion$solution[2] + 1*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 1*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#1000
#Se utilizan las 1000 toneladas de mineral 1 usado para las aleaciones A y B, por lo tanto la holgura es: S8=0.

#Holgura novena restricción
0*solucion$solution[1] + 0*solucion$solution[2] + 0*solucion$solution[3] + 1*solucion$solution[4] + 0*solucion$solution[5] + 0*solucion$solution[6] + 1*solucion$solution[7] + 0*solucion$solution[8]
#2000
#Se utilizan las 2000 toneladas de mineral 2 usado para las aleaciones A y B, por lo tanto la holgura es: S9=0.

#Holgura decima restricción
0*solucion$solution[1] + 0*solucion$solution[2] + 0*solucion$solution[3] + 0*solucion$solution[4] + 1*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 1*solucion$solution[8]
#3000
#Se utilizan las 3000 toneladas de mineral 3 usados para las aleaciones A y B, por lo tanto la holgura es: S10=0.

#	f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.
solucion
#Success: the objective function is 4e+05 = 400.000

# El máximo de utilidad a obtener del ejercicio es de 400.000 unidades monetarias, siempre y cuando el plan de producción se mantenga al pie de la letra, producciendo=
# 1800 Toneladas de aleación A    y
# 1000 Toneladas de aleación B    



######################################################################################################################



#_________________EJERCICIO 2__________________________________________________

#
#

#	a) Defina correctamente todas las variables de decisión.

#                          X1 = Cantidad de pupitres unipersonales a producir semanalmente.
#                          X2 = Cantidad de pupitres bipersonales a producir semanalmente.
#                          X3 = Cantidad de mesas a producir semanalmente.

#	b) Escriba la función objetivo que optimiza la utilidad para la elaboración de los productos.

#                          Max Z = 30X1 + 20X2 + 50X3

#       c) Escriba las restricciones asociadas al problema.

#                           X1 + 2X2 +  X3 <= 4300 (Metros de madera disponibles)
#                          3X1 +     + 2X3 <= 4600 (Metros de tubo disponibles)
#                           X1 + 4X2 +     <= 4200 (Metros de formica disponibles)
#                               X1, X2, X3 >= 0    (No negatividad)

#       d) Plantee matemáticamente el modelo completo asociado al problema.

#                          Max Z = 30X1 + 20X2 + 50X3 
#                      S.T
#                           X1 + 2X2 +  X3 <= 4300 
#                          3X1 +     + 2X3 <= 4600 
#                           X1 + 4X2 +     <= 4200 
#                               X1, X2, X3 >= 0 

#       e) Encuentre el plan óptimo de producción e interprete los resultados.

#       Transcribimos el modelo anterior a R.

#	Coeficientes de la función objetivo:

	C <- c(30,20,50)

#	Matriz de coeficientes de las restricciones:

A <- matrix(c(1, 2, 1,
              3, 0, 2,
              1, 4, 0), 
             ncol = 3, byrow = TRUE)

#	Dirección de las desigualdades de las restricciones

D <- c("<=","<=","<=")


#	Coeficientes lado derecho de las restricciones

B <- c(4300, 4600, 4200)

solucion <- lp(direction = "max",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B,
               compute.sens = 1)


solucion$sol
#[1]    0 1000 2300

#Nuestro plan optimo de producción semanal queda dado por
#0 pupitres unipersonales a producir 
#1000 pupitres bipersonales a producir
#2300 mesas a producir

#Calculo de Holguras del problema.

#Holgura primera restricción
1*solucion$solution[1] + 2*solucion$solution[2] + 1*solucion$solution[3]
#Se utilizan los 4300 metros de madera disponible, por lo tanto S1=0.

#Holgura segunda restricción
3*solucion$solution[1] + 0*solucion$solution[2] + 2*solucion$solution[3]
#Se utilizan los 4600 metros de tubo disponible, por lo tanto S2=0.

#Holgura tercera restricción
1*solucion$solution[1] + 4*solucion$solution[2] + 0*solucion$solution[3]
#Se utilizaron 4000 metros de formica, dejando un remanente de 200 metros de formica,
#por lo tanto S3=200.

#	f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.

solucion
#Success: the objective function is 135.000.
#Con la elaboración de 0 pupitres unipersonal, 1000 pupitres bipersonales y 2300 mesas
#se obtiene una utilidad de 135.000 unidades monetarias.

#	g) Realice un análisis de sensibilidad completo.

#       (g.1) Análisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi).

solucion$duals[1:3]

#Resultado = [1] 10 20  0

#Comentarios de los resultados=
# Y1 = 10. Aumento/decremento de Z si b1 aumenta/decrece en una unidad.
# Y2 = 20. Aumento/decremento de Z si b2 aumenta/decrece en una unidad.
# Y3 = 0.  Aumento/decremento de Z si b3 aumenta/decrece en una unidad.

#       (g.2) Análisis de sensibilidad para coeficientes de la función objetivo.

tibble(c = c("c1", "c2", "c3"),
       min = solucion$sens.coef.from,
       max = solucion$sens.coef.to)

#Resultado=
# c          min       max
#   <chr>    <dbl>     <dbl>
# 1 c1     -1.00e30   7.00e 1
# 2 c2      0.        1.00e 2
# 3 c3      2.33e1    1.00e30

#Comentarios del análisis=los costos unitario de las actividades pueden cambiar 
#en estos intervalo sin que se modifique el plan optimo de producción, es decir,
#los valores de las actividades: pupitres unipersonal, bipersonales y mesas, pueden
#ver modificado su valor unitario, pero eso no afecta nuestro plan óptimo pero si
#modificaría el Z.

# -inf <= c1 <= 70                      
#                                       
#  0.0 <= c2 <= 100                      
#                                       
# 23.3 <= c3 <= +inf                              
#                    


#       (g.3) Analisis de sensibilidad para los coeficientes bi.

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

tibble(b = c("b1", "b2", "b3"), 
       min = solucion_dual$sens.coef.from,
       max = solucion_dual$sens.coef.to)

#b         min       max
#<chr>   <dbl>     <dbl>
#1 b1      2300    4.40e 3
#2 b2      4400    8.60e 3
#3 b3      4000.   1.00e30

#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo al siguientes intervalos
#y esto no afectará los precios sombra Y*.

#   2300 <= b1 <= 4400  
#                        
#   4400 <= b2 <= 8600  
#
#   4000 <= b3 <= +inf  
#                        


#       h) Si la empresa pudiese incrementar la cantidad de materia prima a usar, 
#          ¿cuál tendrá la prioridad? Explique fundamentadamente.

#       De acuerdo a los precios sombra de los elementos involucrados en la producción
#       madera, tubo y formica, por cada metro adicional estos entregarán un incremento de
#       [10,20,0], respectivamente, por lo tanto la empresa debe considerar como prioridad
#       incrementar la cantidad de tubo disponible.


#       i) Se sugiere aumentar la cantidad de madera y tubo al costo adicional de 15/m para cada una.
#          ¿Es esto aconsejable? Explique fundamentadamente.

#       Considerando los datos de los precios sombra de las materias primas, podemos establecer lo 
#       siguiente:
#               - Madera: Cada unidad nos genera una utilidad de 10, si cada unidad la compramos a 15,
#                         nuestra ganancia sería -5, por lo tanto generaría una perdida este ejercicio.
#               - Tubo  : En el caso del tubo, cada unidad adicional nos genera un beneficio de 20,
#                         si cada una de estas unidades se adquiere a 15, nuestra ejercicio nos entregaría
#                         una utilidad de 5.
#       Por lo tanto, se aconseja la comprar de tubo.

#       j) Si la cantidad de fórmica se reduce en 100 metros, 
#       ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente.

#       Como se explicó en la pregunta "h", el precio sombra de fórmica es 0 y es válido en
#       los intervalos de 4000 a +inf, considerando que se tendrían 4100 unidades, aun estaría 
#       dentro de los intervalos que no mmodifican el plan óptim, manteniendo nuestro Z en el
#       punto de mayor utilidad.

#       k) Suponga que la disponibilidad de madera se incrementa en 200 metros, ¿cómo afectará este 
#       incremento al ingreso óptimo? Explique fundamentadamente.

#       Haciendo referencia nuevamente a los precios sombra expuestos en la pregunta "h", podemos
#       conluir que si bien el aumento de 200 metros nos provoca un aumento de 10*100= 1000 unidades
#       monetarias en nuestro plan óptimo, esto no es totalmente cierto, ya que sólo se concidera el 
#       precio sombra, ahora debemos evaluar si este aumento nos deja dentro del rango permitido en el
#       el precio sombra no cambia.Nuestros valores aceptables para b1 es hasta 4400 unidades de madera
#       Por lo tanto esto nos deja fuera del rango aceptable, así que sería necesario volver a calcular
#       para ver si realmente esto no afecta nuestro plan óptimo.

#       Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a 60 y 30 unidades
#       monetarias respectivamente, y de manera independiente. ¿Permanecerá igual el óptimo actual? 
#       Explique fundamentadamente y calcule el valor de la función objetivo en este nuevo escenario.

#       Calculo de función onjetivo con producto 1=60 UM.

#       F.O = 60*(0) + 20*(1000) + 50*(2300) = 135.000 UM.

#       Calculo de función onjetivo con producto 2=30 UM.

#       F.O = 30*(0) + 30*(1000) + 50*(2300) = 145.000 UM.

#       Se puede concluir que para los nuevos valores de los productos 1 y 2, el plan óptimo se mantiene,
#       ya que en ambos casos se los valores se encuentran dentro de los límites admisibles que no 
#       modifican el plan óptimo.


######################################################################################################################



#_________________EJERCICIO 3__________________________________________________

#

#	a) Defina correctamente todas las variables de decisión.

#                          X1 = Unidad del producto 1
#                          X2 = Unidad del producto 2
#                          

#	b) Escriba la función objetivo que optimiza la utilidad para la elaboración de los productos.

#                          Max Z = 60X1 + 40X2

#       c) Escriba las restricciones asociadas al problema.

#                         4x1 + 2x2 <= 16 (Disponibilidad de Horas máquina A)
#                         2x1 + 6x2 <= 16 (Disponibilidad de Horas máquina B)
#                          x1 ,  x2 >= 0  (no negatividad)
                               

#       d) Plantee matemáticamente el modelo completo asociado al problema.

#                          Max Z = 60x1 + 40x2 
#                      S.T
#                          4x1 + 2x2 <= 16 
#                          2x1 + 6x2 <= 16 
#                           x1 ,  x2 >= 0  

#       e) Encuentre el plan óptimo de producción e interprete los resultados.

#       Transcribimos el modelo anterior a R.

#	Coeficientes de la función objetivo:

C <- c(60,40)

#	Matriz de coeficientes de las restricciones:

A <- matrix(c(4,2,
              2,6), 
             ncol = 2 , 
            byrow = TRUE)

#	Dirección de las desigualdades de las restricciones

D <- c("<=","<=")

#	Coeficientes lado derecho de las restricciones

B <- c(16,16)



solucion <- lp(direction = "max",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B,
               compute.sens = 1)


solucion$sol
#[1] 3.2  1.6

# Nuestro plan óptimo de producción,considerando las horas disponibles
# de cada una de nuestras máquinas es de:
# 3.2 unidades de producto 1.
# 1.6 unidades de producto 2.
# Desde un punto de vista de calculo, esto es posible, pero si lo llevamos a
# la práctica, no es posible fabricar 3,2 unidades o 1,6 unidades, por lo tanto
# nuestro plan óptimo será 3 unidades del producto 1 y 1 del producto 2.

#Holgura primera restricción

4*solucion$solution[1] + 2*solucion$solution[2]
# [1] 16
# Se utilizan las 16 horas de la máquina 1, por lo tanto,
# S1=0.

#Holgura segunda restricción
#[1] 16
2*solucion$solution[1] + 6*solucion$solution[2] 
# Se utilizan las 16 horas de la máquina 2, por lo tanto,
# S2=0.


#	f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.

solucion
#Success: the objective function is 256 
# Con la elaboración de 3,2 unidades del producto 1 y 1,6 unidades del producto 2 se puede obtener una utilidad de $ 256.
# pero como ya mencionamos, no es posible fabricar esas cantidades, por lo tanto nuestro valor óptimo a obtener queda
# expresado de la siguiente manera=

# Z = 60*3 + 40*1 = $ 220. 

#	g) Realice un análisis de sensibilidad completo.

#       (g.1) Análisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi).

solucion$duals[1:2]
#[1] 14  2
#Comentarios de los resultados=

# Y1 = $ 14 Aumento/decremento de Z si b1 aumenta/decrece en una unidad.
# Y2 = $ 2 Aumento/decremento de Z si b2 aumenta/decrece en una unidad.


#       (g.2) Análisis de sensibilidad para coeficientes de la función objetivo.

tibble(c = c("c1","c2"),
       min = solucion$sens.coef.from,
       max = solucion$sens.coef.to)

#  c        min        max
# <chr>    <dbl>      <dbl>
#1 c1       13.3       80
#2 c2       30         180

#Comentarios del análisis=los costos unitario de las actividades pueden cambiar 
#en estos intervalo sin que se modifique el plan optimo de producción, es decir,
#los valores de las actividades: producto 1 y producto 2, pueden
#ver modificado su valor unitario, pero eso no afecta nuestro plan óptimo pero si
#modificaría el Z.

# $ 13.3 <= c1 <= $ 80   
#                   
#   $ 30 <= c2 <= $ 180 
#                   


#       (g.3) Análisis de sensibilidad para los coeficientes bi.

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

tibble(b = c("b1", "b2"), 
       min = solucion_dual$sens.coef.from,
       max = solucion_dual$sens.coef.to)

#b         min     max
# <chr>   <dbl>   <dbl>
#1 b1     5.33     32 
#2 b2     8        48.

#Comentario= Los coeficientes de las restricciones (horas), pueden variar de acuerdo al siguientes intervalos
#y esto no afectará los precios sombra Y*.

#   5.33 h <= b1 <= 32 h   
#                                     
#      8 h <= b2 <= 48 h  
#


#       h) Si la empresa puede incrementar la capacidad de ambas máquinas, ¿cuál máquina tendrá la prioridad?
#          Explique fundamentadamente.
#
#          Considerando los precios sombra obtenidos en el Análisis de sensibilidad para los coeficientes de recursos  [Y1= $14,Y2= #2],
#          podemos decir que al aumentar en 1 hora la disponibilidad de la máquina 1 nos generaría una utilidad de $14,
#          mientras que aumentar en 1 hora en la máquina 2, nos genera sólo una utilidad de $2. Por lo tanto, la máquina que
#          tiene prioridad ante un eventual aumento, debería ser la máquina 1.
#
#       i) Se sugiere incrementar las capacidades de las máquinas 1 y 2 al costo adicional de $20/h para cada máquina.
#          ¿Es esto aconsejable? Explique fundamentadamente.
#
#       Considerando los datos de los precios sombra de las horas máquina, podemos establecer lo 
#       siguiente:
#               - Máquina 1: Cada hora más de funcionamiento de la máquina 1 nos genera una utilidad de $14, si cada hora adicional tiene
#                            un costo de $20, nuestra ganancia sería -6, por lo tanto generaría una perdida este ejercicio.
#               - Máquina 2: Cada hora más de funcionamiento de la máquina 2 nos genera una utilidad de $2, si cada hora adicional tiene
#                            un costo de $20, nuestra ganancia sería -18, por lo tanto generaría una perdida este ejercicio.
#                         
#       En conclusión, yo no recomiendo el aumento de la producción mientras el costo por hora adicional se de $20/h.

#       j) Si la capacidad de la máquina 1 se incrementa de 16 a 26 horas, ¿cómo impactará este incremento al ingreso óptimo?
#          Explique fundamentadamente.

#       Teniendo en cuenta los resultados obetinos en nuestro Análisis de sensibilidad para los coeficientes bi, podemos indicar
#       que al aumentar la disponibilidad de horas de la máquina 1, no afectaría nuestro plan óptimo de producción,
#       ya que el intervalo de factibilidad es de: [5.33h y 32h], por lo tanto este incremento de disponibilidad nos 
#       produciría un aumento de: $14 * (26-16) = $140, si esto se lo agregamos a nuestro Z, el nuevo Z obtenido sería de
#       Z = $396.

#       k) Suponga que la capacidad de la máquina 1 se incrementa a 40 horas, ¿cómo afectará este incremento al ingreso
#          óptimo? Explique fundamentadamente.

#          Nuevamente tenemos que recurrir a nuestro Análisis de sensibilidad para los coeficientes bi, de acuerdo a estos 
#          resultados se puede decir que, si bien el precio sombra aumenta $14 por hora más de disponibilidad sobre las 16h
#          ya consideradas originalmente, en este caso se debe volver a realizar los calculos, ya que las 40 horas se encuentran
#          fuera de los intervalos factives de: [5.33h y 32h].

#       l) Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a $70 y $50, respectivamente, y
#          de manera independiente. ¿Permanecerá igual el óptimo actual? Explique fundamentadamente y calcule el valor de la
#          función objetivo en este nuevo escenario.

#          Primero, considerando el plan óptimo calculado tenemos lo siguiente:
#
#                               70*3,2 + 40*1,6 = $288; Para el aumento del producto 1.
#                               60*3,2 + 60*1,6 = $272; Para el aumento del producto 2.

#          Ahora consideraremos nuestro plan óptimo planteado, considerando sólo unidades acabadas:
#
#                               70*3 + 40*1 = $250; Para el aumento del producto 1.
#                               60*3 + 60*1 = $240; Para el aumento del producto 2.

#Si consideramos el plan óptimo entregado por el calculo realizado, podemos concluir que nos convendría aumentar el valor del producto 1
# el cual nos sube nuestro Z de $256 a $288.Por otro lado, considerando nuestro plan óptimo planteado nuestro Z incremente de 
# $220 a $250. En conclusión para ambos planes óptimos el ideal sería aumentar el valor unitario del producto 1.
#
#
#