# Solemne 1. Inv. de operaciones
# Guillermo Sanhueza Briones.

############################librerias a usar###################################
library(lpSolve)
library(tibble)

#############################Ejercicio 1######################################

#a.  Variables de decisión.
#                          W1 = Cantidad (toneladas)producidad de aleacion A
#                          W2 = Cantidad (toneladas)producidad de aleacion B

#                          X3 = Cantidad (toneladas)de mineral utilizada en la aleacion A
#                          X4 = Cantidad (toneladas)de mineral utilizada en la aleacion A
#                          X5 = Cantidad (toneladas)de mineral utilizada en la aleacion A

#                          X6 = Cantidad (toneladas)de mineral utilizada en la aleacion B
#                          X7 = Cantidad (toneladas)de mineral utilizada en la aleacion B
#                          X8 = Cantidad (toneladas)de mineral utilizada en la aleacion B
#

#b. Función onjetivo
#                          Max Z = 200W1 + 300W2 - 30(X1+X4) - 40(X2+X5) - 50(X3+X6)

#c.

# Restricciones originales.

# 0.2X1 + 0.1X2 + 0.05X3 <= 0.8W1 + 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )
# 0.1X1 + 0.2X2 + 0.05X3 <= 0.3W1 + 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )
# 0.3X1 + 0.3X2 +  0.2X3 >= 0.5W1 + 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )

# 0.1X4 + 0.2X5 + 0.05X6 >= 0 + 0.4W2   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 0.1X4 + 0.2X5 + 0.05X6 <= 0 + 0.6W2   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 0.3X4 + 0.3X5 +  0.7X6 >= 0 + 0.3W2   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 0.3X4 + 0.3X5 +  0.2X6 <= 0 + 0.7W2   (Toneladas de mineral I,II,III utilizado en la aleacion B )

#                         x1 + X2 <= 1000(Total de mineral 1 usado para la aleacion A Y B)
#                         x2 + X5 <= 2000(Total de mineral 2 usado para la aleacion A Y B)
#                         x3 + X6 <= 3000(Total de mineral 3 usado para la aleacion A Y B)

#        X1 , X2 ,X3, X4 , X5 ,X6 >= 0   (no negatividad) 


# Restricciones para ingesar a R.
# -0.8W1 + 0 + 0.2X1 + 0.1X2 + 0.05X3 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )
# -0.3W1 + 0 + 0.1X1 + 0.2X2 + 0.05X3 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )
# -0.5W1 + 0 + 0.3X1 + 0.3X2 +  0.2X3 >= 0   (Toneladas de mineral I,II,III utilizado en la aleacion A )

# 0 + -0.4W2 + 0.1X4 + 0.2X5 + 0.05X6 >= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 0 + -0.6W2 + 0.1X4 + 0.2X5 + 0.05X6 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 0 + -0.3W2 + 0.3X4 + 0.3X5 +  0.7X6 >= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )
# 0 + -0.7W2 + 0.3X4 + 0.3X5 +  0.2X6 <= 0   (Toneladas de mineral I,II,III utilizado en la aleacion B )

#                         x1 + X2 <= 1000(Total de mineral 1 usado para la aleacion A Y B)
#                         x2 + X5 <= 2000(Total de mineral 2 usado para la aleacion A Y B)
#                         x3 + X6 <= 3000(Total de mineral 3 usado para la aleacion A Y B)

#        X1 , X2 ,X3, X4 , X5 ,X6 >= 0   (no negatividad) 
                          


#d. Modelo matematico.
#                            Max Z = 200W1 + 300W2 - 30(X1+X4) - 40(X2+X5) - 50(X3+X6) 
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

#e. Se traspasa el anterior modelo a R.

#FO.
C <- c(200,300,-30,-40,-50,-30,-40,-50)

#Restriscciones a trabajar.
#               W1     W2    X1    X2     X3    X4    X5      X6
A <- matrix(c(-0.8,     0,  0.2,  0.1,  0.05,    0,    0,     0,  #restriccion 1 
              -0.3,     0,  0.1,  0.2,  0.05,    0,    0,     0,  #restriccion 2  
              -0.5,     0,  0.3,  0.3,   0.2,    0,    0,     0,  #restriccion 3 
                 0,  -0.4,    0,    0,     0,  0.1,  0.2,  0.05,  #restriccion 4  
                 0,  -0.6,    0,    0,     0,  0.1,  0.2,  0.05,  #restriccion 5 
                 0,  -0.3,    0,    0,     0,  0.3,  0.3,   0.7,  #restriccion 6  
                 0,  -0.7,    0,    0,     0,  0.3,  0.3,   0.2,  #restriccion 7  
                 0,     0,    1,    0,     0,    1,    0,     0,  #restriccion 8  
                 0,     0,    0,    1,     0,    0,    1,     0,  #restriccion 9 
                 0,     0,    0,    0,     1,    0,    0,    1),  #restriccion 10 
                                                                  ncol = 8, byrow = TRUE)

#Disponibilidad de recursos.
B <- c(0,0,0,0,0,0,0,1000,2000,3000)

#Simbologia de desigualdades.
D <- c("<=","<=",">=",">=","<=",">=","<=","<=","<=","<=")

solucion <- lp(direction = "max",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B,
               compute.sens = 1)


solucion$sol
#[1] 1800  1000  1000    0  3000     0  2000     0

#1800 Cantidad en toneladas a producir de la aleacion A      (W1)
#1000 Cantidad en toneladas a producir de la aleacion B      (W2)
#1000 Cantidad de toneladas de mineral 1 utilizadas en la aleacion A (X3)
#0    Cantidad de toneladas de mineral 2 utilizado en la aleacion A  (X4)
#3000 Cantidad de toneladas de mineral 3 utilizadas en la aleacion A (X5)
#0    Cantidad de toneladas de mineral 1 utilizado en la aleacion B  (X6)
#2000 Cantidad de toneladas de mineral 2 utilizadas en la aleacion B (X7)
#0    Cantidad de toneladas de mineral 3 utilizado en la aleacion B  (X8)

#En el analisis de las holguras se tiene que volver al forma original, ya que las variables del lado derecho las pasamos a negativo, y 
#ahora las volvemos a positivo y cambiamos las variables del lado izquierdo a negativo para obtener los valores como corresponde.

### Holgura primera restriccion

0.8*solucion$solution[1] + 0*solucion$solution[2] + -0.2*solucion$solution[3] + -0.1*solucion$solution[4] + -0.05*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#1090

#Las toneladas de mineral I,II,III utilizado en la aleacion A resulta  S1=1090t

### Holgura segunda restriccion

0.3*solucion$solution[1] + 0*solucion$solution[2] + -0.1*solucion$solution[3] + -0.2*solucion$solution[4] + -0.05*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#290
#Las toneladas de mineral I,II,III utilizado en la aleacion A resulta  S2=290t

### Holgura tercera restriccion

0.5*solucion$solution[1] + 0*solucion$solution[2] + -0.3*solucion$solution[3] + -0.3*solucion$solution[4] + -0.2*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#0
#Se utiliza todo el material asociado a esta restriccion de S3=0

### Holgura cuarta restriccion

0*solucion$solution[1] + 0.4*solucion$solution[2] + 0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + -0.1*solucion$solution[6] + -0.2*solucion$solution[7] + -0.05*solucion$solution[8]
#5.684342e-14 = 0.00000000000005684342, esto se toma como 0
#Se utiliza todo el material asociado a esta restriccion de S4=0

#Holgura quinta restriccion

0*solucion$solution[1] + 0.6*solucion$solution[2] + 0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + -0.1*solucion$solution[6] + -0.2*solucion$solution[7] + -0.05*solucion$solution[8]
#200
#Las toneladas de mineral I,II,III utilizado en la aleacion B de S5=200t

### Holgura sexta restriccion

0*solucion$solution[1] + 0.3*solucion$solution[2] + 0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + -0.3*solucion$solution[6] + -0.3*solucion$solution[7] + -0.7*solucion$solution[8]
#300
#Las toneladas de mineral I,II,III utilizado en la aleacion B  de S6=300t

### Holgura septima restriccion

0*solucion$solution[1] + 0.7*solucion$solution[2] + 0*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + -0.3*solucion$solution[6] + -0.3*solucion$solution[7] + -0.2*solucion$solution[8]
#100
#Las toneladas de mineral I,II,III utilizado en la aleacion B  de S7=100t

### Holgura octava restriccion

0*solucion$solution[1] + 0*solucion$solution[2] + 1*solucion$solution[3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 1*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#
#Se utiliza todo el material asociado a esta restriccion de S8=1000-1000= 0

### Holgura novena restriccion

0*solucion$solution[1] + 0*solucion$solution[2] + 0*solucion$solution[3] + 1*solucion$solution[4] + 0*solucion$solution[5] + 0*solucion$solution[6] + 1*solucion$solution[7] + 0*solucion$solution[8]
#
#Se utiliza todo el material asociado a esta restriccion de S9=2000-2000= 0

#### Holgura decima restriccion

0*solucion$solution[1] + 0*solucion$solution[2] + 0*solucion$solution[3] + 0*solucion$solution[4] + 1*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 1*solucion$solution[8]
#
#Se utiliza todo el material asociado a esta restriccion de S10=3000-3000= 0


#f. Valor optimo de la funcion objetivo.
solucion
#Success: the objective function is 4e+05 = 400.000

# Se deben producir 1800 toneladas de aliacion A y 1000 toneladas de aliacion B para tener un
# maximo de utilidad de $400.000.

#############################Ejercicio 2######################################

#
#

#a.  Variables de decisión.
#                          X1 = Cantidad de pupitres unipersonales a producir por semana.
#                          X2 = Cantidad de pupitres bipersonales a producir por semana.
#                          X3 = Cantidad de mesas a producir por semana.

#b. Función onjetivo
#                          Max Z = 30X1 + 20X2 + 50X3

#c. Restricciones.
#                          1x1 + 2x2 + 1x3 <= 4300 (Metros de madera disponibles)
#                          3X1 + 0X2 + 2X3 <= 4600 (Metros de tubo disponibles)
#                          1X1 + 4X2 + 0X3 <= 4200 (Metros de formica disponibles)
#                               X1, X2, X3 >= 0    (No negatividad)

#d. Modelo matematico.
#                          Max Z = 30X1 + 20X2 + 50X3 
#                      S.T
#                          1x1 + 2x2 + 1x3 <= 4300 
#                          3X1 + 0X2 + 2X3 <= 4600 
#                          1X1 + 4X2 + 0X3 <= 4200 
#                               X1, X2, X3 >= 0 

#e. Se traspasa el anterior modelo a R.

#FO.
C <- c(30,20,50)

#Restriscciones a trabajar.
A <- matrix(c(1, 2, 1,
              3, 0, 2,
              1, 4, 0), ncol = 3, byrow = TRUE)

#Disponibilidad de recursos.
B <- c(4300, 4600, 4200)

#Simbologia de desigualdades.
D <- c("<=","<=","<=")

solucion <- lp(direction = "max",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B,
               compute.sens = 1)


solucion$sol
#[1]    0 1000 2300
#0 pupitres unipersonales a producir por semana
#1000 pupitres bipersonales a producir por semana
#2300 mesas a producir por semana

#Holgura primera restriccion

1*solucion$solution[1] + 2*solucion$solution[2] + 1*solucion$solution[3]
#Se utilizan los 4300 metros de madera por lo que S1=0

#Holgura segunda restriccion
3*solucion$solution[1] + 0*solucion$solution[2] + 2*solucion$solution[3]
#se utilizan los 4600 metros de tubo por lo que S2=0

#Holgura tercera restriccion
1*solucion$solution[1] + 4*solucion$solution[2] + 0*solucion$solution[3]
#se utilizan 4000 metros de formica por lo que S2 = 4200-4000 = 200
#Esto significa que sobra 200 mestros de formica.

#f. Valor optimo de la funcion objetivo.
solucion
#Success: the objective function is 135000.

#g. Analisis de sensibilidad

#g.1.Analisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi).

solucion$duals[1:3]
#[1] 10 20  0

# Y1 = 10. Aumento/decremento de Z si b1 aumenta/decrece en una unidad.(madera)
# Y2 = 20. Aumento/decremento de Z si b2 aumenta/decrece en una unidad.(tubo)
# Y3 = 0.  Aumento/decremento de Z si b3 aumenta/decrece en una unidad.(Formica)

#g.2. Analisis de sensibilidad para coeficientes de la funcion objetivo.

tibble(c = c("c1", "c2", "c3"),
       min = solucion$sens.coef.from,
       max = solucion$sens.coef.to)

# c          min       max
#   <chr>    <dbl>     <dbl>
# 1 c1     -1.00e30   7.00e 1
# 2 c2      0.        1.00e 2
# 3 c3      2.33e1    1.00e30

# -inf <= c1 <= 70  (el costo unitario de los pupitres unipersonal puede cambiar en este intervalo sin que 
#                   se modifique el plan optimo de produccion)
#  0.0 <= c2 <= 100 (el costo unitario de los pupitres bipersonal puede cambiar en este intervalo sin que se 
#                   modifique el plan optimo de produccion)
# 23.3 <= c3 <= +inf(el costo unitario de las mesas puede cambiar en este intervalo sin que se modifique el 
#                    plan optimo de produccion)


#g.3. Analisis de sensibilidad para los coeficientes bi.
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

#   2300 <= b1 <= 4400  (el coeficiente de la primera restriccion puede cambiar en este 
#                        intervalo sin que se modifique el el precio sombra Y1)
#   4400 <= b2 <= 8600  (el coeficiente de la segunda restriccion puede cambiar en este 
#                        intervalo sin que se modifique el el precio sombra Y2)
#   4000 <= b3 <= +inf  (el coeficiente de la tercera restriccion puede cambiar en este 
#                        intervalo sin que se modifique el el precio sombra Y2)


#h. Si la empresa pudiese incrementar la cantidad de materia prima a usar, ¿cuál tendrá la prioridad? Explique 
#fundamentadamente.

#  Segun los precios sombra para las materias primas (madera,tubo,formica), cada metro adicional de madera aumenta
#  el ingreso en $10, mientras que el metro de tubo aumenta $20 y el metro de formica no aumenta en nada cada metro
#  extra. Por lo tanto la prioridad la tendria el tubo ya que aumenta mas por cada metro.

#i. Se sugiere aumentar la cantidad de madera y tubo al costo adicional de 15/m para cada una. ¿Es esto 
#aconsejable? Explique fundamentadamente.

#  En el caso de la madera el ingreso adicional quedaria en negativo ($10 - $15 = $-5), en comparacion a los tubos que 
#  es $20 - $15 = $5, es por ello que lo aconsajable seria considera los tubos para el aumento de disponibilidad de 
#  recurso.

#j.Si la cantidad de fórmica se reduce en 100 metros, ¿cómo impactará este incremento al ingreso óptimo? 
#Explique fundamentadamente.

#  En primer lugar para la formica se tiene s3=200, esto se traduce a que sobran 200 metros de formica en el proceso,
#  por lo que una reduccion de 100 metros no cambiaria en nada. por otro lado el precio sombra para la disponibilidad 
#  de formica es $0 y el coeficiente de su intervalo de es 4000 a +inf, entocnes la disminucion delmaterial queda 
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



#############################Ejercicio 3######################################


#a.  Variables de decisión.
#                          X1 = Unidad del producto UNO
#                          X2 = Unidad del producto DOS
#                          

#b. Función onjetivo
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

#e. Se traspasa el anterior modelo a R.

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
#En conclusion, con ambos cambios aumentaria el ingreso total, siendo mas conveniente el aumento unitario del producto 1.
