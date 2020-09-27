# SOLEMNE 1 INVESTIGACION DE OPERACIONES
# ALFREDO ANDRES SILVA BURGOS
# 18.291.662-5

#Libreria LPSOLVE y TIBBLE
library(lpSolve)
library(tibble)
#######################

#---------------------------------------------##-----------------------------------------------------------------------#
#                                       EJERCICIO 1  
#
#
#    a) Defina correctamente todas las variables de decisión.

#                          W1 = Toneladas producidad de aleación A
#                          W2 = Toneladas producidad de aleación B

#                          X3 = Toneladas de mineral utilizada en la aleación A
#                          X4 = Toneladas de mineral utilizada en la aleación A
#                          X5 = Toneladas de mineral utilizada en la aleación A

#                          X6 = Toneladas de mineral utilizada en la aleación B
#                          X7 = Toneladas de mineral utilizada en la aleación B
#                          X8 = Toneladas de mineral utilizada en la aleación B
#

#    b)	Escriba la funcion objetivo que optimiza la utilidad para la elaboración de las aleaciones.
#
#                          Max Z = 200W1 + 300W2 - 30(X1+X4) - 40(X2+X5) - 50(X3+X6)

#    c)	Escriba las restricciones asociadas al problema.



# 			-0.8W1 + 0.2X1 + 0.1X2 + 0.05X3 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )
# 			-0.3W1 + 0.1X1 + 0.2X2 + 0.05X3 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )
# 			-0.5W1 + 0.3X1 + 0.3X2 +  0.2X3 >= 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )

# 			-0.4W2 + 0.1X4 + 0.2X5 + 0.05X6 >= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 			-0.6W2 + 0.1X4 + 0.2X5 + 0.05X6 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 			-0.3W2 + 0.3X4 + 0.3X5 +  0.7X6 >= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 			-0.7W2 + 0.3X4 + 0.3X5 +  0.2X6 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )

#                         x1 + X2 <= 1000(Total de mineral 1 usado para la aleación A Y B)
#                         x2 + X5 <= 2000(Total de mineral 2 usado para la aleación A Y B)
#                         x3 + X6 <= 3000(Total de mineral 3 usado para la aleación A Y B)
#
#
#			 
#        			X1 , X2 ,X3, X4 , X5 ,X6 >= 0   (no negatividad) 



#    d)	Plantee matemáticamente el modelo completo asociado al problema.
# 
#			Max Z = 200W1 + 300W2 - 30(X1+X4) - 40(X2+X5) - 50(X3+X6) 
#                      S.T
#                           -0.8W1 + 0.2X1 + 0.1X2 + 0.05X3 <= 0 
#                           -0.3W1 + 0.1X1 + 0.2X2 + 0.05X3 <= 0  
#                           -0.5W1 + 0.3X1 + 0.3X2 + 0.2X3  >= 0  
#                           -0.4W2 + 0.1X4 + 0.2X5 + 0.05X6 >= 0  
#                           -0.6W2 + 0.1X4 + 0.2X5 + 0.05X6 <= 0  
#                           -0.3W2 + 0.3X4 + 0.3X5 + 0.7X6  >= 0  
#                           -0.7W2 + 0.3X4 + 0.3X5 + 0.2X6  <= 0  
#                                                   x1 + X4 <= 1000                   
#                                                   x2 + X5 <= 2000              
#                                                   x3 + X6 <= 3000                     
#                                  X1 , X2 ,X3, X4 , X5 ,X6 >= 0                
#
#    e)	Encuentre el plan óptimo de producción e interprete los resultados.
#
#      Utilizando R para encontar la solucion optima

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
#1800 Toneladas producidad de aleación A     (W1)
#1000 Toneladas producidad de aleación B     (W2)

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

# EL plan optimo de produccion y que permite maximizar la utilidad del ejercicio es de 400.000 U.M., si y solo si se mantiene la siguiente, 
# Produccion =
# 1800 Toneladas de aleación A   
# 1000 Toneladas de aleación B    


#--------------------------------------------##-----------------------------------------------------------------------#


#                                        Ejercicio 2
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

# Analizando la solucion, el plan optimo de produccion es:
#0 Pupitres unipersonales a producir 
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
#Con la elabaración de 0 pupitres unipersonal, 1000 pupitres bipersonales y 2300 mesas
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
#ver modificado su valor unitario, no afectando el plan optimo de produccion del a solucion;
# Pero si se veria afectada el resusltado de la funcion objetivo Z.

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

# Respuesta = Los coeficientes de las restricciones pueden variar de acuerdo al siguientes intervalos
# Pero esto no afectará los valores de los precios sombra Y*.

#   2300 <= b1 <= 4400  
#                        
#   4400 <= b2 <= 8600  
#
#   4000 <= b3 <= +inf  
#                        


#h. Si la empresa pudiese incrementar la cantidad de materia prima a usar, ¿cuál tendrá la prioridad? Explique 
#fundamentadamente.

#  De acuerdo a los precios sombra para las materias primas (madera,tubo,formica), cada metro adicional de madera aumenta
#  el ingreso en 10 U.M., mientras que el metro de tubo aumenta 20 U.M. y el metro de formica no aumenta en nada cada metro
#  extra. Por lo tanto la prioridad la tendria el tubo ya que aumenta mas por cada metro.

#i. Se sugiere aumentar la cantidad de madera y tubo al costo adicional de 15/m para cada una. ¿Es esto 
#aconsejable? Explique fundamentadamente.

#  En el caso de la madera el ingreso adicional quedaria en negativo ($10 - $15 = $-5), en comparacion a los tubos que 
#  es ($20 - $15 = $5), es por ello que lo aconsajable seria considerar los tubos para el aumento de disponibilidad de 
#  recurso.

#j.Si la cantidad de fórmica se reduce en 100 metros, ¿cómo impactará este incremento al ingreso óptimo? 
#Explique fundamentadamente.

#  En primer lugar para la formica se tiene s3=200, esto se traduce a que sobran 200 metros de formica en el proceso,
#  por lo que una reduccion de 100 metros no cambiaria en nada. por otro lado el precio sombra para la disponibilidad 
#  de formica es $0 y el coeficiente de su intervalo de es 4000 a +inf, entocnes la disminucion del material queda 
#  dentro de ese rango por lo que no afectaria al ingreso optimo.

#k.Suponga que la disponibilidad de madera se incrementa en 200 metros, ¿cómo afectará este incremento al 
#ingreso óptimo? Explique fundamentadamente.

#  Se sabe que el incremento permitido es de 100 metros ya que el rango de factibilidad para que no se modifique el 
#  precio sombra es de 2300 a 4400 metros, por lo que si se aumenta la disponibilidad de madera quedaria pasado en 
#  100 metros. Por lo tanto se tendria que volver a realizar calculos para determinar cuanto es lo que aumenta y si 
#  combiene o no tener mas madera.

#l. Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a 60 y 30 unidades 
#monetarias respectivamente, y de manera independiente. ¿Permanecerá igual el óptimo actual? Explique 
#fundamentadamente y calcule el valor de la función objetivo en este nuevo escenario.

#   60*(0) + 20*(1000) + 50*(2300) = $135000.
#   30*(0) + 30*(1000) + 50*(2300) = $145000.
#   Por lo tanto, la solucion permanecera optima, porque los nuevos precios unitarios, permanecen dentro de los 
#   intevalos permitidos.



#----------------------------------------------##----------------------------------------------------------------------#



#                                            ejercicio 3
#
#

#a.  Variables de decisión.
#                          X1 = Unidad del producto UNO
#                          X2 = Unidad del producto DOS
#                          

#b. Función objetivo
#                          Max Z = 60x1 + 40x2

#c. Restricciones.
#                         4x1 + 2x2 <= 16 (Horas disponibles en la maquina A)
#                         2x1 + 6x2 <= 16 (Horas disponibles en la maquina B)
#                          x1 ,  x2 >= 0  (no negatividad)


#d. Modelo matematico.
#                          Max Z = 60x1 + 40x2 
#                      S.T
#                          4x1 + 2x2 <= 16 
#                          2x1 + 6x2 <= 16 
#                           x1 ,  x2 >= 0  

#e. Utilizando R para obtener la solucion optima

#FO.
C <- c(60,40)

#Restriscciones a trabajar.
A <- matrix(c(4,2,
              2,6), ncol = 2 , byrow = TRUE)

#Disponibilidad de recursos.
B <- c(16,16)

#Simbologia de desigualdades.
D <- c("<=","<=")

solucion <- lp(direction = "max",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B,
               compute.sens = 1)


solucion$sol
#[1] 3.2  1.6
# 3.2 unidades de producto UNO a producir.
# 1.6 unidades de producto DOS a producir.

#Holgura primera restriccion

4*solucion$solution[1] + 2*solucion$solution[2]
# Se utilizan las 16 horas. S1 = 0

#Holgura segunda restriccion
2*solucion$solution[1] + 6*solucion$solution[2] 
# Se utilizan las 16 horas. S2 = 0


#f. Valor optimo de la funcion objetivo.
solucion
#Success: the objective function is 256 

#g. Analisis de sensibilidad

#g.1.Analisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi).

solucion$duals[1:2]

# Y1 = 14 Aumento/decremento de Z si b1 aumenta/decrece en una unidad.
# Y2 =  2 Aumento/decremento de Z si b2 aumenta/decrece en una unidad.


#g.2. Analisis de sensibilidad para coeficientes de la funcion objetivo.

tibble(c = c("c1","c2"),
       min = solucion$sens.coef.from,
       max = solucion$sens.coef.to)

#  c        min        max
# <chr>    <dbl>      <dbl>
#1 c1       13.3       80
#2 c2       30         180

# 13.3 <= c1 <= 80  (el costo unitario del productO UNO puede cambiar en este intervalo sin que 
#                   se modifique el plan optimo de produccion)
#   30 <= c2 <= 180 (el costo unitario del producto DOS puede cambiar en este intervalo sin que se 
#                   modifique el plan optimo de produccion)


#g.3. Analisis de sensibilidad para los coeficientes bi.
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

#   5.33 <= b1 <= 32  (el coeficiente de la primera restriccion puede cambiar en este 
#                                     intervalo sin que se modifique el el precio sombra Y1)
#      8 <= b2 <= 48  (el coeficiente de la segunda restriccion puede cambiar en este 
#                                     intervalo sin que se modifique el el precio sombra Y2)



#h.Si la empresa puede incrementar la capacidad de ambas máquinas, ¿cuál máquina tendrá la prioridad? Explique 
#fundamentadamente.

#  Segun los precios sombra la maquina 1 aumenta en $14 cada hora adicional, mientras que la maquina 2 aumenta en $2
#cada hora adicional, por lo tanto habria que darle la prioridad de la maquina 1.

#i. Se sugiere incrementar las capacidades de las máquinas 1 y 2 al costo adicional de $20/h para cada máquina. 
#¿Es esto aconsejable? Explique fundamentadamente.

#  para la maquina 1 es ingreso adicional por hora seria $14 - $20 = $-6, y el ingreso adicional por hora para la 
#  maquina 2 seia $2 - $20 = $-18. Esto significa que para ambas maquinas darian resultados negativos, por lo que no
#  seria aconsejable las capacidades de ambas maquinas.

#j. Si la capacidad de la máquina 1 se incrementa de 16 a 26 horas, ¿cómo impactará este incremento al ingreso óptimo? 
#Explique fundamentadamente.

#  El intervalo de factibilidad es de 5.33 a 32 horas, por lo que el aumento a 26 horas quedaria dentro de ese rango, 
#  ademas el precio sobra de la maquina 1 es de $14 entonces el incremento al ingreso sera $14(26-16)= $140, por lo 
#  tanto el ingreso total aumentara ($140+$396) de  $256 a $396.

#k.Suponga que la capacidad de la máquina 1 se incrementa a 40 horas, ¿cómo afectará este incremento al ingreso 
# óptimo? Explique fundamentadamente.

#  En este caso las 40 horas quedarian fuera del rango de factibilidad que es como maximo 32 horas, por lo que se 
#  recomienda volver a calcular para saber si es conveniente incrementar la capacidad de funcionamiento de la maquina 1.

#l. Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a $70 y $50, respectivamente, y 
#de manera independiente. ¿Permanecerá igual el óptimo actual? Explique fundamentadamente y calcule el valor de la 
#función objetivo en este nuevo escenario.

# 70*3.2 + 40*1.6 = 288
# 60*3.2 + 50*1.6 = 272

#El actual valor optimo actual es $256 y con las suposiciones en cuanto al aumento de ingreso unitario tenemos lo
#siguiente: para el aumento unitario del producto 1= $70, por lo que el nuevo ingreso total sera de $288. Mientras que 
#el aumento unitario para el producto 2 = $50 y daria un nuevo ingreso total de $272.
#En conclusion, con ambos cambios aumentaria el ingreso total, siendo mas conveniente el aumento unitario del producto 1, y analizando
# En la globalidad de la optimizacion obtenida por R, me indica que el valor optimo de produccion es para el producto UNO es de 3.2
#Unidades y del producto DOS es de 1.6 unidades para maximizar la utilidad, pero si analizamos la produccion, no se puede producir
#3.2 unidades de uno producto, ya que ese producto se debe fabricar entero, y de igual forma se puede vender solo el producto terminado, 
#Por lo que el valor obtenido en la optimización de R se debe aproximar a un valor entero para obtener el valor real de Z
# 3 unidades de producto UNO a producir.
# 1 unidad de producto DOS a producir.
# 70*3 + 40*1 = 250
# 60*3 + 50*1= 230
#
# Max Z = 60x1 + 40x2 (De acuerdo a optimización de R)
# Max Z = 60*3 + 40*1 = 220 (Utilidad optima)


