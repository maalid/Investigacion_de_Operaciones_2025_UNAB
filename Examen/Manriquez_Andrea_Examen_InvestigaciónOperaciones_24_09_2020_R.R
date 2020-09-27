#                              Examen

# nombre: Andrea Manriquez


#Una compañía especializada en ornamentación llamada Puro Hierro se dedica a la 
#fabricación de puertas, rejas y ventanas; productos para los cuales ha
#establecido una utilidad de $6, $2 y $5 por unidad respectivamente. Para la 
#manufacturación de dichos artículos la empresa cuenta con una disponibilidad 
#semanal de 300 metros de lámina, 400 metros de ángulo y 240 metros de tubo.
#Además, se sabe que para producir una puerta se requieren 3 metros de lámina,
#2 metros de ángulo y 2 metros de tubo; para producir una reja se necesitan 5
#metros de lámina, 4 metros de ángulo y 3 metros de tubo; mientras que, para
#producir una ventana se requieren 24 metros de lámina, 5 metros de ángulo y un
#metro de tubo. El objetivo de la compañía es optimizar al máximo las utilidades
#producto de la fabricación y posterior venta de los productos confeccionados.


#A)Formule matemáticamente el problema anterior. Para esto, confeccione una tabla
#de resumen con la información entregada y defina las variables de decisión, 
#la función objetivo, las restricciones. Finalmente, escriba el modelo matemático
#completo de programación lineal a resolver.

#  _________________________________________________________________________
# |            |             |             |                | DISPONIBILIDAD |
# | MATERIAL   |PUERTA       | REJA        | VENTANA        | POR SEMANA     |    
# |____________|_____________|_____________|________________|________________|  
# |            |             |             |                |                |
# |  Lámina    |    3 m      |    5 m      |     24 m       |     300 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Ángulo    |    2 m      |    4 m      |      5 m       |     400 m      | 
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Tubo      |    2 m      |    3 m      |      1 m       |     240 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |Utilidad/ u |    $6       |    $2       |      $5        |                |
# |____________|_____________|_____________|________________|________________|



#Variables de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana


#Función Objetivo

# Max Z = 6x1 + 2x2 + 5x3

# Las restricciones 

#    3x1  +  5x2  +  24x3 <= 300 restricción para los metros de lámina
#    2x1  +  4x2  +  5x3  <= 400 restricción para los metros de ángulo
#    2x1  +  3x2  +  1x3  <= 240 restricción para los metros de tubo
#                x1,x2,x3 => 0 (restricción de no negatividad)

#Modelo matemático completo

# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)




#B)Usando la función lpSolve resuelva el modelo y conteste las siguientes 
#preguntas: ¿Qué cantidad de cada uno de los artículos se deben fabricar? 
#¿Cuál es la utilidad óptima obtenida?

library(lpSolve)

#Transcribimos el modelo anterior a R.

#Coeficientes de la función objetivo.

C<- c(6,2,5)

C

#Matriz de coeficientes de las restricciones

A <- matrix (c (3 , 5 , 24,
                2 , 4 , 5,
                2 , 3 , 1),
             ncol = 3,
             byrow = TRUE)

A
#     [,1] [,2] [,3]
#[1,]    3    5   24
#[2,]    2    4    5
#[3,]    2    3    1

#Direccion de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

#Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan optimo de produccion. 


sol <- lp(direction = "max",
          const.mat = A,
          const.rhs = B,
          const.dir = D,
          objective.in = C,
          compute.sens = 1)

#Valores optimos para las variables de decision

sol$solution
# [1] 100   0   0

#cantidad de puertas a producir por semana
#                                         x1=100

#cantidad de rejas a producir por semana
#                                         x2=0

#cantidad de ventanas a producir por semana
#                                         x3=0

#Holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]
#[1] 300
                                         
#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:
  
#  S1=0

#holgura segunda restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]
#[1] 200

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:
  
#  S2=400-200=200

# Por lo tanto, sobran 200 metros de ángulo.


#Holgura tercera restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]
#[1] 200

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

# Por lo tanto, sobran 40 metros de tubo.



#Valor óptimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol
#Success: the objective function is 600

# Es decir, se obtienen Z=600 unidades monetarias de utilidad  


# ¿Qué cantidad de cada uno de los artículos se deben fabricar? 

#Respuesta: Según los valores óptimos para las variables de decisión se deben fabricar
#100 puertas por semana, 0 rejas por semana y 0 ventanas por semana.


#¿Cuál es la utilidad óptima obtenida?

#Respuesta: La utilidad obtenida es de 600 unidades monetarias.

#C )Bajo esta solución óptima de producción, ¿se consumen todas las materias primas
#disponibles? En el caso que alguna(s) de ellas no sea(n) completamente
#consumida(s), diga cúanto de ésta(s) no son utilizadas.

#Respuesta: Se consumen los 300 mt de lámina y no sobra nada, se consumen 200 mt de tubo
# por lo que sobran 200 mt de ángulo y se consumen 200 mt de tubo por lo que sobran 40 mt de tubo.

# Respuesta: No son utilizadas las materias primas que sobran, como los 200 mts de ángulo y 
# los 40 metros de tubo.


#Analisis de sensibilidad para los coeficientes de recursos (lado derecho 
#de las restricciones, bi). El incremento/decremento de una unidad en bi,
#produce un aumento/disminucion en Z igual al precio sombra Yi. En efecto:


sol$duals[1:3]

#Aumento/decremento de Z, si b1 aumenta/decrece en una unidad.
#Y1=2

#Aumento/decremento de Z, si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento/decremento de Z, si b3 aumenta/decrece en una unidad.
#Y3=0

#Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $2, en comparación con 0 para el ángulo 
# y 0 para los tubos . Por lo tanto, la lámina deben tener la prioridad.


#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.to)

#Resultado

# A tibble: 3 x 3
#   c        min       max
# <chr>    <dbl>      <dbl>
# 1 c1     1.20e 0   1.00e30
# 2 c2    -1.00e30   1.00e 1
# 3 c3    -1.00e30   4.80e 1


#Comentarios del análisis=los costos unitario de las actividades pueden cambiar dentro 
#de estos intervalos sin que se modifique el Plan Óptimo de Producción, es decir,
# que los valores de la produccion de puertas, rejas y/o ventanas , pueden
# verse modificado en su valor unitario, pero dicha modificación no afecta nuestro plan óptimo,
#pero si modifica a Z.

#Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden cambiar
# en estos intervalo sin que se modifique el plan optimo de produccion):

#   1.20 <= c1 <= inf                      
#                                       
#  -inf <= c2 <= 10                    
#                                       
#  -inf <= c3 <= 48


#Analisis de sensibilidad para los coeficientes bi.

A_dual <- t(A)

B_dual <- C

C_dual <- B

D_dual <- c(">=", ">=", ">=")


solucion_dual<-lp(direction = "min",
                  objective.in = C_dual,
                  const.mat = A_dual,
                  const.dir = D_dual,
                  const.rhs = B_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3"),
       min= solucion_dual$sens.coef.from,
       max= solucion_dual$sens.coef.to)

# A tibble: 3 x 3
#    b      min     max
#  <chr>   <dbl>   <dbl>
# 1 b1     144.   3.60e 2
# 2 b2     200    1.00e30
# 3 b3     200.   5.00e 2

#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo
#a los siguientes intervalos y esto no afectará los precios sombra Y*

#    144 <= b1 <= 360 
#                        
#    200 <= b2 <=  + inf
#
#    200 <= b3 <= 500

 
#******************************************************************************



#Debido a un problema con los proveedores de tubos, se estima que es muy probable 
#que la disponibilidad de éstos disminuya en 50 metros el próximo período.

# ____________________________________________________________________________
# |            |             |             |                | DISPONIBILIDAD |
# | MATERIAL   |PUERTA       | REJA        | VENTANA        | POR SEMANA     |    
# |____________|_____________|_____________|________________|________________|  
# |            |             |             |                |                |
# |  Lámina    |    3 m      |    5 m      |     24 m       |     300 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Ángulo    |    2 m      |    4 m      |      5 m       |     400 m      | 
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Tubo      |    2 m      |    3 m      |      1 m       |     190 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |Utilidad/ u |    $6       |    $2       |      $5        |                |
# |____________|_____________|_____________|________________|________________|

# D ) Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.

#modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 190 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)

#Coeficiente lado derecho de las restricciones 

B2<-c(300,400,190)

B2

#plan optimo

sol2<- lp(direction = "max",
         const.mat = A,
         const.rhs = E,
         const.dir = D,
         objective.in = C,
         compute.sens = 1)

#Valores optimos para las variables de decision

sol2$solution


#cantidad de puertas a producir por semana
#                                         x1=94.6666667
#lo que equivale a 94 puertas semanales

#cantidad de rejas a producir por semana
#                                         x1=0

#cantidad de ventanas a producir por semana
#                                         x1=0.6666667
#lo que equivale a 0 ventanas semanales

# e)¿Existe alguna diferencia en términos de las cantidades de materia prima no 
#consumida? Explique el resultado obtenido.

#holgura primera restricción:

3*sol2$solution[1]+5*sol2$solution[2]+24*sol2$solution[3]
#[1] 300

#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#por lo tanto no sobran metros de lamina

#holgura segunda restricción:

2*sol2$solution[1]+4*sol2$solution[2]+5*sol2$solution[3]
#[1] 192.6667

#Se utilizan 192.6667 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-192.6667=207.3333

# Esto significa que sobran 207.3333 metros de angulo.


#Holgura tercera restriccion:

2*sol2$solution[1]+3*sol2$solution[2]+1*sol2$solution[3]
#[1] 190

#Se utilizan 190 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=190 - 190 = 0

# por lo tanto no sobran metros de tubo

# Esto significa que sobran 0 metros de tubo.


# Por lo tanto si hay diferencia en las cantidades de materia prima no consumida,
# ya que respecto a la materia prima "laminas" se mantienen igual , pero en la materia prima
# "ángulos", en el primer ejercicio sobran 200 y en este ejercicio sobran 207.333,
# así como también existe diferencia en la materia prima "tubos" ya que en el primer
#ejercicio sobran 40 y en este ejercicio no sobran.


#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la
#compañia al producir según el plan óptimo de producción encontrado es:

sol2

# Es decir, se obtienen Z=571.3333 unidades monetarias de utilidad., esto significa que
#tenemos menos utilidad que en el escenario original.Por lo que no es una solución óptima
# 

#D ) Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.

#Respuesta: La solución óptima original sigue siendo óptima respecto de este nuevo escenario, 
# ya que al disminuir 50 mts de tubo la utilidad se reduce.

#e) ¿Existe alguna diferencia en términos de las cantidades de materia prima no consumida? 
# Explique el resultado obtenido.

# Respuesta: No existe diferencia respecto a los mts de lámina ya que se consumen los 300 por lo cual
# no sobra material de lámina, ni falta material de lámina. 
# Pero si existe diferencia en los mts de ángulo ya que en el escenario original sobran 200 mts
# de ángulo y en este nuevo escenario sobran 207.3333.
# Y respecto a los metros de tubos también existe diferencia ya que en el escenario original
# sobran 40 mts de tubo y en el nuevo escenario se consumen todos los metros de tubo,
# es decir no sobran ni faltan metros de tubo.


#Análisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi)

sol2$duals[1:3]
#[1] 0.08888889 0.00000000 2.86666667  

#Aumento/decremento de Z*, si b1 aumenta/decrece en una unidad.
#Y1=0.08888889

#Aumento/decremento de Z*, si b2 aumenta/decrece en una unidad.
#Y2=0.0000000

#Aumento/decremento de Z*, si b3 aumenta/decrece en una unidad.
#Y3= 2.8666667

##Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $0.88, 
# en comparación con $2.86 para el ángulo y 0 para los tubos . 
# Por lo tanto, el maaterial de tubo debe tener la prioridad


#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol2$sens.coef.from,
       max = sol2$sens.coef.to)


## A tibble: 3 x 3
#c          min       max
#<chr>    <dbl>      <dbl>
# 1 c1     1.27e 0   10   
# 2 c2    -1.00e30    9.04
# 3 c3     3.00e 0   48.0 


#Comentarios del análisis=los costos unitario de las actividades pueden cambiar 
#en estos intervalo sin que se modifique el plan optimo de producción, es decir,
#los valores de la produccio de las puerta, rejas y/o ventanas , pueden
#verse modificado en su valor unitario, pero eso no afecta nuestro plan óptimo, aunque si
#modificaría Z.

#Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden cambiar 
# en estos intervalo sin que se modifique el plan optimo de produccion):

#   1.27 <= c1 <= 10
# - inf <= c2  <=  9.04
#  3.00 <= c3 <= 48

#Analisis de sensibilidad para los coeficientes bi.

A_dual <- t(A)

B2_dual <- C

C_dual <- E

D_dual <- c(">=", ">=", ">=")

solucion_dual<-lp(direction = "min",
                  objective.in = C_dual,
                  const.mat = A_dual,
                  const.dir = D_dual,
                  const.rhs = B2_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3"),
       min= solucion_dual$sens.coef.from,
       max= solucion_dual$sens.coef.to)

# A tibble: 3 x 3
#b       min     max
#<chr>  <dbl>   <dbl>
#1 b1    285   1.47e 3
#2 b2    193.  1.00e30
#3 b3   12.5   2.00e 2


#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo
#a los siguientes intervalos y esto no afectará los precios sombra Y*

# 285  <= b1 <=  1470
# 193. <= b2 <= + inf
# 12.5 <= b3 <=   200




#*******************************************************************************


#Debido a un error de conteo en la bodega de materias primas, el gerente de 
#producción se dá cuenta que la cantidad de lámina es 90 metros superior a la 
#que originalmente se disponía.

#  _________________________________________________________________________
# |            |             |             |                | DISPONIBILIDAD |
# | MATERIAL   |PUERTA       | REJA        | VENTANA        | POR SEMANA     |    
# |____________|_____________|_____________|________________|________________|  
# |            |             |             |                |                |
# |  Lámina    |    3 m      |    5 m      |     24 m       |     390 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Ángulo    |    2 m      |    4 m      |      5 m       |     400 m      | 
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Tubo      |    2 m      |    3 m      |      1 m       |     240 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |Utilidad/ u |    $6       |    $2       |      $5        |                |
# |____________|_____________|_____________|________________|________________|

#F)Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.

#modelo matemático completo


# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 390 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)


B3 <-c(390,200,240)

B3
#[1] 390 200 240
#plan optimo

sol3<-lp(direction = "max",
        const.mat = A,
        const.rhs = B3,
        const.dir = D,
        objective.in = C,
        compute.sens = 1)

#Valores optimos para las variables de decision

sol3$solution
#[1] 100   0   0

#cantidad de puertas a producir por semana
#                                         x1=100

#cantidad de rejas a producir por semana
#                                         x2=0

#cantidad de ventanas a producir por semana
#                                         x3=0

#al aumentar 90 metros de lamina, no alcanzaria a producir ninguna otra puerta,
#reja u ventana , por lo que sobraria mas material, la Producción de puertas sigue igual
# que en el escenario original, al igual que la de rejas y ventanas.



#holgura primera restricción:

3*sol3$solution[1]+5*sol3$solution[2]+24*sol3$solution[3]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=390-300=90

#por lo tanto sobran 90 metros de lamina

#holgura segunda restricción:

2*sol3$solution[1]+4*sol3$solution[2]+5*sol3$solution[3]

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.


#Holgura tercera restriccion:

2*sol3$solution[1]+3*sol3$solution[2]+1*sol3$solution[3]

#Se utilizan 200 metros de tubo, por lo tanto la segunda variable de holgura es:

#  tubo=240-200=40

# por lo tanto  sobran 40 metros de tubo

sol3

# Es decir, se obtienen Z=600 unidades monetarias de utilidad  

# Bajo este escenario nos damos cuenta que al aumentar los metros de lámina, 
# no aumenta nuestra utilidad respecto al escenario original. 



# f) Analice si la solución óptima original sigue siendo óptima bajo este posible escenario.

#Respuesta: La solución óptima original sigue siendo óptima bajo este posible escenario
# ya que la utilidad es la misma sin necesidad de aumentar los metros de lámina


#g) En el caso que la solución deje de ser óptima, haga los cambios necesarios 
# al modelo matemático y resuelva.

# ¿Qué cantidad de cada uno de los artículos se deben fabricar ahora? 

# Se deben fabricar: 100 puertas, 0 rejas y 0 ventanas

# ¿Cuál es la utilidad óptima obtenida? 

# La utilidad óptima obtenida es de 600 unidades monetarias.

# ¿Se consumen todaslas materias primas disponibles?

# No se consumen todas las materias disponbles. Pero si se consumen 300 metros de lámina
# y sobran 90 metros de lámina, además se consumen 200 metros de ángulo por lo cual sobran
# 200 metros de ángulo. Y por último se consumen 200 metros de tubo por lo que sobran
# 40 metros de tubo.

# En el caso que alguna(s) de ellas no sea(n) completamente consumida(s), 
# diga cúanto de ésta(s) no son utilizadas.

# Las materia prima de lámina no es completamente consumida por lo que 90 metros de
# ella no son utilizados, en el caso de la materia prima de ángulo hay 200 metros de ella
# que no son utilizados, y por último tenemos la materia prima de tubo en que hay 40 metros
# de ella que no son utilizados.

#Análisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones)

sol3$duals[1:3]
#[1] 0 3 0

#Aumento/decremento de Z??? si b1 aumenta/decrece en una unidad.
#Y1= 0

#Aumento/decremento de Z??? si b2 aumenta/decrece en una unidad.
#Y2= 3

#Aumento/decremento de Z??? si b3 aumenta/decrece en una unidad.
#Y3= 0

#Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $0, 
# en comparación con $3 para el ángulo y $0 para los tubos . 
# Por lo tanto, el ángulo debe tener la prioridad.

#Analisis de sensibilidad para coeficientes de la función objetivo.

tibble(c = c("c1","c2","c3"),
       min = sol3$sens.coef.from,
       max = sol3$sens.coef.to)

# A tibble: 3 x 3
#  c          min     max
# <chr>    <dbl>     <dbl>
# 1 c1     2.00e 0  1.00e30
# 2 c2    -1.00e30  1.20e 1
# 3 c3    -1.00e30  1.50e 1

#comentarios del análisis

#Comentarios del análisis= Los costos unitario de las actividades pueden cambiar 
#en estos intervalo sin que se modifique el plan Óptimo de producción, es decir,
#los valores de la produccion de puertas, rejas y/o ventanas , pueden
#verse modificado en su valor unitario, pero eso no afecta nuestro plan óptimo, aunque si
#modificaría  Z, ya que cambian los coeficientes cj.

#Los intervalos para los coeficientes cj son:

#   2.00 <= c1 <= inf
# - inf <= c2 <= 12
# - inf <= c4 <= 15

#Análisis de sensibilidad para los coeficientes bi
 
A_dual <- t(A)

B_dual <- C3

C3_dual <- B

D_dual <- c (">=", ">=", ">=")

sol3_dual <- lp(direction = "min",
               const.mat = A_dual,
               const.rhs = B_dual,
               objective.in = C3_dual,
               const.dir = D_dual,
               compute.sens = 1)


tibble (b=c("b1","b2","b3"),
       min = sol3_dual$sens.coef.from,
       max= sol3_dual$sens.coef.to)

# A tibble: 3 x 3
# b       min     max
#<chr>   <dbl>   <dbl>
# 1 b1     0   3.60e 2
# 2 b2   200   1.00e30
# 3 b3   200   1.00e30

#Así, finalmente los intervalos bi,min???bi???bi,max para los coeficientes bi 
#quedan como se presentan a continuación:

# 0   <= b1 <= 360
# 200 <= b2 <= + inf
# 200 <= b3 <= + inf


#************************************************************************************


#Desde el departamento de ventas, el equipo de análisis hace llegar un reporte
#indicando que la demanda de rejas probablemente aumente, por lo que sugieren
#incrementar en $2 la utilidad de éstas.


#  _________________________________________________________________________
# |            |             |             |                | DISPONIBILIDAD |
# | MATERIAL   |PUERTA       | REJA        | VENTANA        | POR SEMANA     |    
# |____________|_____________|_____________|________________|________________|  
# |            |             |             |                |                |
# |  Lámina    |    3 m      |    5 m      |     24 m       |     300 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Ángulo    |    2 m      |    4 m      |      5 m       |     400 m      | 
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Tubo      |    2 m      |    3 m      |      1 m       |     240 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |Utilidad/ u |    $6       |    $4       |      $5        |                |
# |____________|_____________|_____________|________________|________________|



#modelo matemático completo

# Max Z = 6x1 + 4x2 + 5x3

# S. A.


#    3x1  +  5x2  +  24x3 <= 300 restriccion para los metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 restriccion para los metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 restriccion para los metros de tubo
#                x1,x2,x3 => 0 (restriccion de no negatividad)

# h) Analice si la solución óptima original sigue siendo óptima bajo este posible
# escenario

#Coeficientes de la función objetivo

C4 <- c(6, 4, 5)

C4
#[1] 6 4 5

#Plan óptimo de producción

sol4 <- lp (direction = "max",
           const.mat = A, 
           const.rhs = B,
           const.dir = D,
           objective.in = C4,
           compute.sens = 1)

#Valores óptimos para las variables de decisión

sol4$solution

#Cantidad de puertas a producir por semana

# x1 = 100

#Cantidad de rejas a producir por semana

#x2 = 0

#Cantidad de ventanas a producir por semana

#x3 = 0

# Esto significa que se seguiría produciendo 100 puertas, y 0 rejas y 0 ventanas, al igual
# que el escenario original del ejercicio

# i) ¿Existe alguna diferencia en términos de las cantidades de materia prima no consumida? 
# Explique el resultado obtenido.


# Holgura primera restricción
3*sol4$solution[1]+5*sol4$solution[2]+24*sol4$solution[3]

#[1] 300

#Se utilizan los 300 mt de material de lámina por lo tanto, la primera variable de holgura es:

# S1 = 0

#Holgura segunda restricción

2*sol4$solution[1]+4*sol4$solution[2]+5*sol4$solution[3]

# [1] 200

#Se utilizan 200 metros de ángulo, por lo tanto la segunda variable de holgura es :

#S2 = 400 - 200 = 200 

#Esto significa que sobram 200 metros de ángulo.

#Holgura tercera restricción

2*sol4$solution[1]+3*sol4$solution[2]+1*sol4$solution[3]

#[1] 200
# Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#S3 = 240 - 200 = 40

# Esto significa que sobran 40 mts de tubo.


sol4

#Success: the objective function is 600

#Valor óptimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es: The objective function es 600


# h)Analice si la solución óptima original sigue siendo óptima bajo este posible escenario

# Respuesta La solución óptima original sigue siendo óptima bajo este escenario, ya que al 
#aumentar $2 la utilidad de las rejas,  la solución óptima sigue teniendo la misma utilidad.


# i)¿Existe alguna diferencia en términos de las cantidades de materia prima no consumida?
# Explique el resultado obtenido.

#Respuesta :No existe diferencia en términos de cantidades consumidas respecto del escenario 
# original. El resultado obtenido bajo este posible escenario es:

# No sobra ni falta material de lámina, sobran 200 mts de ángulo, y sobran 40 mts de tubo.

#Análisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones)

sol4$duals[1:3]
#[1] 2 0 0

#Aumento/decremento de Z, si b1 aumenta/decrece en una unidad.
#Y1=2

#Aumento/decremento de Z, si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento/decremento de Z, si b3 aumenta/decrece en una unidad.
#Y3=0

#Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $2, en comparación con 0 para el ángulo 
# y 0 para los tubos . Por lo tanto, la lámina deben tener la prioridad.

#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol4$sens.coef.from,
       max = sol4$sens.coef.from)

#Resultado

# A tibble: 3 x 3
#   c        min      max
# <chr>     <dbl>    <dbl>
# 1 c1     2.40e 0   2.40e 0
# 2 c2    -1.00e30  -1.00e30
# 3 c3    -1.00e30  -1.00e30


#Comentarios del análisis=los costos unitario de las actividades pueden cambiar dentro 
#de estos intervalos sin que se modifique el Plan Óptimo de Producción, es decir,
# que los valores de la produccion de puertas, rejas y/o ventanas , pueden
# verse modificado en su valor unitario, pero dicha modificación no afecta nuestro plan óptimo,
#pero si modifica a Z.

#Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden 
# cambiar en estos intervalo sin que se modifique el plan optimo de produccion):

#   2.40 <= c1 <=  2.40                      
#                                       
#  -inf  <= c2 <= -inf                     
#                                       
#  -inf  <= c3 <= -inf


#Analisis de sensibilidad para los coeficientes bi.

A_dual <- t(A)

B_dual <- C4

C4_dual <- B

D_dual <- c(">=", ">=", ">=")


solucion_dual<-lp(direction = "min",
                  objective.in = C4_dual,
                  const.mat = A_dual,
                  const.dir = D_dual,
                  const.rhs = B_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3"),
       min= solucion_dual$sens.coef.from,
       max= solucion_dual$sens.coef.to)

# A tibble: 3 x 3
#  b        min     max
#<chr>     <dbl>   <dbl>
# 1 b1        0   3.60e 2
# 2 b2      200  1.00e30
# 3 b3      200  1.00e30

# Así, finalmente los intervalos bi,min???bi???bi,max para 
# los coeficientes bi quedan como se presentan a continuación:

# 0   <= b1 <= 360
# 200 <= b2 <= + inf
# 200 <= b3 <= + inf



#*******************************************************************************

#El mismo equipo de análisis del departamento de ventas recomienda ahora 
#disminuir en $3 la utilidad de cada puerta y aumentar en la misma cantidad 
#la utilidad de cada ventana, respondiendo así a una baja en la demanda de 
#las primeras y un aumento en la de las segundas.

#  _________________________________________________________________________
# |            |             |             |                | DISPONIBILIDAD |
# | MATERIAL   |PUERTA       | REJA        | VENTANA        | POR SEMANA     |    
# |____________|_____________|_____________|________________|________________|  
# |            |             |             |                |                |
# |  Lámina    |    3 m      |    5 m      |     24 m       |     300 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Ángulo    |    2 m      |    4 m      |      5 m       |     400 m      | 
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Tubo      |    2 m      |    3 m      |      1 m       |     240 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |Utilidad/ u |    $3       |    $2       |      $8        |                |
# |____________|_____________|_____________|________________|________________|


#J)Haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad 
#de cada uno de los artículos se deben fabricar ahora? ¿Cuál es la utilidad 
#óptima obtenida? ¿Se consumen todas las materias primas disponibles? En el 
#caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto
#de ésta(s) no son utilizadas.



#modelo matemático completo

# Max Z = 3x1 + 2x2 + 8x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)

#Coeficientes de la función objetivo

C5<- c(3, 2, 8)

C5
#[1] 3 2 8


#Plan óptimo de producción

sol5 <- lp(direction = "max",
           const.mat = A,
           const.rhs = B,
           const.dir = D,
           objective.in = C5,
           compute.sens = 1)

#Valores óptimos para las variables de decisión

sol5$solution
#[1] 100   0   0


#cantidad de puertas a producir por semana
#                                         x1=100

#cantidad de rejas a producir por semana
#                                         x2=0

#cantidad de ventanas a producir por semana
#                                         x3=0



#holgura primera restricción:

3*sol5$solution[1]+5*sol5$solution[2]+24*sol5$solution[3]

#[1] 300

#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol5$solution[1]+4*sol5$solution[2]+5*sol5$solution[3]

#[1] 200

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.


#Holgura tercera restriccion:

2*sol5$solution[1]+3*sol5$solution[2]+1*sol5$solution[3]

#[1] 200

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

# Esto significa que sobran 40 metros de tubo.

sol5
#Success: the objective function is 300, es decir se obtienen  Z= 300 unidades monetarias de utilidad
 
# Bajo este supuesto escenario, el resultado es menor que el escenario original por lo cual la 
# solución no es óptima y la solución del escenario original sigue siendo óptima.

# j) Haga los cambios necesarios al modelo matemático y resuelva.

# ¿Qué cantidad de cada uno de los artículos se deben fabricar ahora?

# Respuesta: Según los Valores óptimos para las variables de decisión se deben fabricar:
# 100 puertas, 0 rejas, 0 ventanas

# ¿Cuál es la utilidad óptima obtenida? .

#Respuesta: La utilidad óptima obtenida es de 300 unidades monetarias,
# bajo este posible escenario podemos decir que no es una solución óptima, ya que 
# el resultado de z en el escenario original es de 600 unidades monetarias por lo cual
# es mucha mayor la utilidad del escenario original.

#¿Se consumen todas las materias primas disponibles?

#Respuesta: Se consumen los 300 metros de lámina, se consumen 200 metros de ángulo por lo cual
# sobran 200 metros de ángulo y además se consumen 200 metros de tubo por lo que sobran
# 40 metros de tubo.

# En el caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto de
# ésta(s) no son utilizadas

# Respuesta: No son utilizados los 200 metros de ángulo que sobran, ni los 40  metros
# de tubo que sobran.

#Análisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones)

sol5$duals[1:3]
#[1] 1 0 0

#Aumento/decremento de Z, si b1 aumenta/decrece en una unidad.
#Y1=1

#Aumento/decremento de Z, si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento/decremento de Z, si b3 aumenta/decrece en una unidad.
#Y3=0

#Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $1, en comparación con 0 para el ángulo 
# y 0 para los tubos . Por lo tanto, la lámina deben tener la prioridad.


#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol5$sens.coef.from,
       max = sol5$sens.coef.to)

#Resultado

# A tibble: 3 x 3
# c          min     max
# <chr>    <dbl>   <dbl>
# 1 c1     1.20e 0 1.00e30
# 2 c2    -1.00e30 5.00e 0
# 3 c3    -1.00e30 2.40e 1


#Comentarios del análisis=los costos unitario de las actividades pueden cambiar dentro 
#de estos intervalos sin que se modifique el Plan Óptimo de Producción, es decir,
# que los valores de la produccion de puertas, rejas y/o ventanas , pueden
# verse modificado en su valor unitario, pero dicha modificación no afecta nuestro plan óptimo,
#pero si modifica a Z.

#Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden cambiar 
# en estos intervalo sin que se modifique el plan optimo de produccion):

#   1.20 <= c1 <= + inf                      
#                                       
#  - inf <= c2 <=  5.00                      
#                                       
#  - inf <= c3 <=  24


#Analisis de sensibilidad para los coeficientes bi.

A_dual <- t(A)

B_dual <- C5

C5_dual <- B

D_dual <- c(">=", ">=", ">=")


solucion_dual<-lp(direction = "min",
                  objective.in = C5_dual,
                  const.mat = A_dual,
                  const.dir = D_dual,
                  const.rhs = B_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3"),
       min= solucion_dual$sens.coef.from,
       max= solucion_dual$sens.coef.to)

# A tibble: 3 x 3
#  b        min     max
#<chr>     <dbl>   <dbl>
# 1 b1        0   3.60e 2
# 2 b2      200  1.00e30
# 3 b3      200  1.00e30

#Así, finalmente los intervalos bi,min???bi???bi,max para 
# los coeficientes bi quedan como se presentan a continuación:

#   0 <= b1 <=  360
# 200 <= b2 <= +inf
# 200 <= b3 <= + inf

#******************************************************************************


#El gerente de producción está evaluando un cambio en el proceso de producción
#de las rejas. Este cambio implica que la asignación de recursos para cada
#reja se modifica, requiriendo ahora 7 metros de lámina, 8 metros de ángulo 
#y 9 metros de tubo.

#  _________________________________________________________________________
# |            |             |             |                | DISPONIBILIDAD |
# | MATERIAL   |PUERTA       | REJA        | VENTANA        | POR SEMANA     |    
# |____________|_____________|_____________|________________|________________|  
# |            |             |             |                |                |
# |  Lámina    |    3 m      |    7 m      |     24 m       |     300 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Ángulo    |    2 m      |    8 m      |      5 m       |     400 m      | 
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Tubo      |    2 m      |    9 m      |      1 m       |     240 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |Utilidad/ u |    $6       |    $2       |      $5        |                |
# |____________|_____________|_____________|________________|________________|

#K)Haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad
# de cada uno de los artículos se deben fabricar ahora? ¿Cuál es la utilidad
#óptima obtenida? ¿Se consumen todas las materias primas disponibles? En el
#caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto 
#de ésta(s) no son utilizadas.


#Variables de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana


#Funcion objetivo

# Max Z = 6x1 + 2x2 + 5x3

# Las restricciones 

#    3x1  +  7x2  +  24x3 <= 300 restriccion para los metros de lamina
#    2x1  +  8x2  +  5x3  <= 400 restriccion para los metros de angulo
#    2x1  +  9x2  +  1x3  <= 240 restriccion para los metros de tubo
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  7x2  +  24x3 <= 300 metros de lamina
#    2x1  +  8x2  +  5x3  <= 400 metros de angulo
#    2x1  +  9x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)




#Coeficientes de la función objetivo.

C<- c(6,2,5)

C

#Matriz de coeficientes de las restricciones

A6 <- matrix (c (3 , 7 , 24,
                2 , 8 , 5,
                2 , 9 , 1),
             ncol = 3,
             byrow = TRUE)

A6
#     [,1] [,2] [,3]
#[1,]    3    7   24
#[2,]    2    8    5
#[3,]    2    9    1


#Direccion de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

#Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan optimo de produccion. 


sol6 <- lp(direction = "max",
          const.mat = A6,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C)
#Valores optimos para las variables de decision

sol6$solution


#cantidad de puertas a producir por semana
#                                         x1=100

#cantidad de rejas a producir por semana
#                                         x2=0

#cantidad de ventanas a producir por semana
#                                         x3=0

#holgura primera restricción:

3*sol6$solution[1]+7*sol6$solution[2]+24*sol6$solution[3]
#[1] 300

#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol6$solution[1]+8*sol6$solution[2]+5*sol6$solution[3]
#[1] 200

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.

#Holgura tercera restriccion:

2*sol6$solution[1]+9*sol6$solution[2]+1*sol6$solution[3]
#[1] 200

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

# Esto significa que sobran 40 metros de tubo.


#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol6
# Success: the objective function is 600 

# Es decir, se obtienen Z=600 unidades monetarias de utilidad    

# k) Haga los cambios necesarios al modelo matemático y resuelva. 

# ¿Qué cantidad de cada uno de los artículos se deben fabricar ahora?
 
# Respuesta: Se deben fabricar 100 puertas, 0 rejas y 0 ventanas

#  ¿Cuál es la utilidad óptima obtenida?

#Respuesta: La utilidad óptima obtenida bajo este posible escenario es de 600 unidades monetarias

#¿Se consumen todas las materias primas disponibles? 

#Respuesta: Se consumen los 300 mts de lámina por lo cual se consume la materia prima completa 
# de lámina. Se consumen 200 mts de ángulo por lo cual sobran 200 metros de ángulo de materia prima.
# Y por último se consumen 200 metros de tubo por lo cual sobran 40 metros de tubo de materia prima.


#  En el caso que alguna(s) de ellas no sea(n) completamente consumida(s),
#diga cúanto de ésta(s) no son utilizadas.

# Respuesta: No son utilizadas la materia prima que sobra de ángulo los cuales son
# 200 metros, y además tampoco es utilizada la materia prima que sobra de tubo
# los cuales son 40 metros de tubo.


#Analisis de sensibilidad para los coeficientes de recursos (lado derecho 
#de las restricciones, bi). El incremento/decremento de una unidad en bi,
#produce un aumento/disminucion en Z igual al precio sombra Yi. En efecto:


sol6$duals[1:3]
#[1] 2 0 0

#Aumento/decremento de Z, si b1 aumenta/decrece en una unidad.
#Y1=2

#Aumento/decremento de Z, si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento/decremento de Z, si b3 aumenta/decrece en una unidad.
#Y3=0

#Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $2, en comparación con 0 para el ángulo 
# y 0 para los tubos . Por lo tanto, la lámina deben tener la prioridad.

#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.to)

#Resultado

# A tibble: 3 x 3
# c          min     max
# <chr>    <dbl>   <dbl>
# 1 c1     1.20e 0 1.00e30
# 2 c2    -1.00e30 1.00e 1
# 3 c3    -1.00e30 4.80e 1


#Comentarios del análisis=los costos unitarios de las actividades pueden cambiar dentro 
#de estos intervalos sin que se modifique el Plan Óptimo de Producción, es decir,
# que los valores de la produccion de puertas, rejas y/o ventanas , pueden
# verse modificado en su valor unitario, pero dicha modificación no afecta nuestro plan óptimo,
#pero si modifica a Z.

# Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden
# cambiar en estos intervalo sin que se modifique el plan optimo de produccion):


#   1.20 <= c1 <=  + inf                      
#                                       
#  - inf <= c2 <=  10                     
#                                       
#  - inf <= c3 <=  48


#Analisis de sensibilidad para los coeficientes bi.

A6_dual <- t(A6)

B_dual <- C

C_dual <- B

D_dual <- c(">=", ">=", ">=")


solucion_dual<-lp(direction = "min",
                  objective.in = C_dual,
                  const.mat = A6_dual,
                  const.dir = D_dual,
                  const.rhs = B_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3"),
       min= solucion_dual$sens.coef.from,
       max= solucion_dual$sens.coef.to)

# A tibble: 3 x 3
#  b           min     max
#<chr>     <dbl>     <dbl>
# 1 b1    -5.68e-14   3.60e 2
# 2 b2     2.00e+ 2   1.00e30
# 3 b3     2.00e+ 2   1.00e30

#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo
#a los siguientes intervalos y esto no afectará los precios sombra Y*

# Así, finalmente los intervalos bi,min???bi???bi,max para los coeficientes bi quedan como 
# se presentan a continuación:

#   - inf  <= b1 <= 360
#                        
#    200 <= b2 <= + inf 
#
#    200 <= b3 <= + inf




#*******************************************************************************


#En base al resultado anterior, el gerente de producción decide evaluar otro 
#cambio en el proceso de fabricación de las rejas, requiriendo ahora 5 metros
#de ángulo, 34 metros de tubo y ninguno de lámina.

#  _________________________________________________________________________
# |            |             |             |                | DISPONIBILIDAD |
# | MATERIAL   |PUERTA       |   REJAS     | VENTANA        | POR SEMANA     |    
# |____________|_____________|_____________|________________|________________|  
# |            |             |             |                |                |
# |  Lámina    |    3 m      |    0 m      |     24 m       |     300 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Ángulo    |    2 m      |    5 m      |      5 m       |     400 m      | 
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Tubo      |    2 m      |    34 m     |      1 m       |     240 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |Utilidad/ u |    $6       |    $2       |      $5        |                |
# |____________|_____________|_____________|________________|________________|



#Variables de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana

#l  )Haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad de cada uno de
#los artículos se deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen 
#todas las materias primas disponibles? En el caso que alguna(s) de ellas no sea(n) 
# completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.

#Funsion objetivo

# Max Z = 6x1 + 2x2 + 5x3

# Las restricciones 

#    3x1  +  0x2  +  24x3 <= 300 restriccion para los metros de lamina
#    2x1  +  5x2  +  5x3  <= 400 restriccion para los metros de angulo
#    2x1  + 34x2  +  1x3  <= 240 restriccion para los metros de tubo
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  0x2  +  24x3 <= 300 metros de lamina
#    2x1  +  5x2  +  5x3  <= 400 metros de angulo
#    2x1  + 34x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)


#Coeficientes de la función objetivo.

C<- c(6,2,5)

C

#Matriz de coeficientes de las restricciones

A7 <- matrix (c (3 , 0 , 24,
                2 , 5 , 5,
                2 ,34 , 1),
             ncol = 3,
             byrow = TRUE)

A7
#     [,1] [,2] [,3]
# [1,]    3    0   24
# [2,]    2    5    5
# [3,]    2   34    1

#Direccion de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

#Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan optimo de produccion. 


sol7 <- lp(direction = "max",
          const.mat = A7,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C)

#Valores optimos para las variables de decision

sol7$solution
#[1] 100.000000   1.176471   0.000000

#cantidad de puertas a producir por semana
#                                         x1=100.0000

#cantidad de rejas a producir por semana
#                                         x2=1.176471

#cantidad de ventanas a producir por semana
#                                         x3=0.000000


#holgura primera restricción:

3*sol7$solution[1]+0*sol7$solution[2]+24*sol7$solution[3]
#[1] 300

#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol7$solution[1]+5*sol7$solution[2]+5*sol7$solution[3]
# [1] 205.8824

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-205.8824= 194.1176

# Esto significa que sobran 194.1176 metros de angulo.


#Holgura tercera restriccion:

2*sol7$solution[1]+34*sol7$solution[2]+1*sol7$solution[3]
# [1] 240

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:
#[1] 240
#  S3= 240 - 240 = 0

# Esto significa que no sobran metros de tubo.


#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol7
#Success: the objective function is 602.3529.
# Es decir, se obtienen Z=602.3529 unidades monetarias de utilidad. Por lo tanto es la solución
# óptima de acuerdo a todos los escenarios propuestos además dl original.


# (l) Haga los cambios necesarios al modelo matemático y resuelva. 

# ¿Qué cantidad de cada uno de los artículos se deben fabricar ahora? 

#Respuesta: Se deben fabricar 100 puertas, 1,17 rejas y 0 ventanas


# ¿Cuál es la utilidad óptima obtenida? 

#Respuesta: La utilidad óptima obtenida es de 602.3529 unidades monetarias

#¿Se consumen todas las materias primas disponibles?

#Respuesta: Se consumen por completo los 300 metros de lámina por lo cuál no sobra materia prima de
# lámina, se consumen 205.8824 metros de ángulo por lo cual sobran 194.1176 de materia prima
# de ángulo. Y por último se consumen por completo los 240 metros de tubo, por lo cual no sobra
# materia prima de tubo. 


# En el caso que alguna(s) de ellas no sea(n) completamente consumida(s), 
#diga cúanto de ésta(s) no son utilizadas.

# La única materia prima que no es utilizada es la que sobra de la materia prima "ángulo".
# Lo cual equivale a 194.1176 metros de ángulo.


#Analisis de sensibilidad para los coeficientes de recursos (lado derecho 
#de las restricciones, bi). El incremento/decremento de una unidad en bi,
#produce un aumento/disminucion en Z igual al precio sombra Yi. En efecto:


sol7$duals[1:3]
#[1] 1.96078431 0.00000000 0.05882353

#Aumento/decremento de Z, si b1 aumenta/decrece en una unidad.
#Y1= 1.96

#Aumento/decremento de Z, si b2 aumenta/decrece en una unidad.
#Y2= 0

#Aumento/decremento de Z, si b3 aumenta/decrece en una unidad.
#Y3= 0.058

#Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $1.96, en comparación con 0 para el ángulo 
# y $0.058 para los tubos . Por lo tanto, la lámina deben tener la prioridad.

#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol7$sens.coef.from,
       max = sol7$sens.coef.to)


#Resultado

#  A tibble: 3 x 3
# c           min       max
# <chr>     <dbl>       <dbl>
#  1 c1     7.35e- 1   1.00e30
#  2 c2     0.         9.75e 1
#  3 c3    -1.00e+30   4.71e 1


#Comentarios del análisis=los costos unitario de las actividades pueden cambiar dentro 
#de estos intervalos sin que se modifique el Plan Óptimo de Producción, es decir,
# que los valores de la produccion de puertas, rejas y/o ventanas , pueden
# verse modificado en su valor unitario, pero dicha modificación no afecta nuestro plan óptimo,
#pero si modifica a Z.


# Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden cambiar
# en estos intervalo sin que se modifique el plan optimo de produccion):

#   0.735  <= c1 <= + inf                     
#                                       
#   0     <= c2 <= 97.5                     
#                                       
# - inf  <= c3 <= 47.1


#Analisis de sensibilidad para los coeficientes bi.

A7_dual <- t(A7)

B_dual <- C

C_dual <- B

D_dual <- c(">=", ">=", ">=")


solucion_dual<-lp(direction = "min",
                  objective.in = C_dual,
                  const.mat = A7_dual,
                  const.dir = D_dual,
                  const.rhs = B_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3"),
       min= solucion_dual$sens.coef.from,
       max= solucion_dual$sens.coef.to)

# A tibble: 3 x 3
#    b       min    max
#  <chr>   <dbl>   <dbl>
# 1 b1       0    3.60e 2
# 2 b2     206.   1.00e30
# 3 b3     200    1.56e 3

#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo
#a los siguientes intervalos y esto no afectará los precios sombra Y*

#

#Así, finalmente los intervalos bi,min???bi???bi,max para los coeficientes bi quedan como se presentan
#a continuación:

#     0  <= b1 <= 360
#                        
#    206 <= b2 <= + inf  
#
#    200 <= b3 <= 1560



#*******************************************************************************

#Desde el departamento de Marketing, luego de realizar un estudio de mercado,
#se dan cuenta que los clientes están prefiriendo comprar los productos a la 
#competencia ya que ésta los entrega pintados. Es necesario entonces evaluar
#si se pinta o no la producción, pero manteniendo constante las utilidades
#unitarias de cada producto. Para lograr esto, se planea utilizar semanalmente
#5.000 mililitros de pintura sobrante de otro proceso. Además, se sabe que una
#puerta consume 15 mililitros de pintura, una reja requiere 50 mililitros de
#pintura, mientras que una ventana necesita 20 mililitros.

#  _________________________________________________________________________
# |            |             |             |                | DISPONIBILIDAD |
# | MATERIAL   |PUERTA       | REJA        | VENTANA        | POR SEMANA     |    
# |____________|_____________|_____________|________________|________________|  
# |            |             |             |                |                |
# |  Lámina    |    3 m      |    5 m      |     24 m       |     300 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Ángulo    |    2 m      |    4 m      |      5 m       |     400 m      | 
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |  Tubo      |    2 m      |    3 m      |      1 m       |     240 m      |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |Pintura     |    15 ml    |    50 ml    |    20 ml       |   5000 ml      |                       |                |
# |____________|_____________|_____________|________________|________________|
# |            |             |             |                |                |
# |Utilidad/u  |     $6      |     $2      |     $5         |                |
# |____________|_____________|_____________|________________|________________|

# m) Analice si la solución óptima original sigue siendo óptima bajo este posible
#escenario. ¿Es posible entonces entregar los productos pintados para así no
#perder clientes? Explique.


#Variables de desicion

#x1= Cantidad de puertas pintadas a producir por semana
#x2= Cantidad de rejas pintadas a producir por semana
#x3= Cantidad de ventanas pintadas a producir por semana


#Funcion objetivo

# Max Z = 6x1 + 2x2 + 5x3

# Las restricciones 

#    3x1  +  5x2  +  24x3 <= 300   restriccion para los metros de lamina
#    2x1  +  4x2  +  5x3  <= 400   restriccion para los metros de angulo
#    2x1  +  3x2  +  1x3  <= 240   restriccion para los metros de tubo
#   15x1  + 50x2  + 20x3  <= 5.000 restriccion para produccion pintada
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#   15x1  + 50x2  + 20x3  <= 5.000 produccion pintada
#                x1,x2,x3 => 0 (no negatividad)



#Coeficientes de la función objetivo.

C<- c(6,2,5)

C

#Matriz de coeficientes de las restricciones

A8 <- matrix (c (3 , 5 , 24,
                2 , 4 , 5,
                2 , 3 , 1,
                15,50 ,20),
             ncol = 3,
             byrow = TRUE)

A8
#     [,1] [,2] [,3]
# [1,]    3    5   24
# [2,]    2    4    5
# [3,]    2    3    1
# [4,]   15   50   20

#Direccion de las desigualdades de las restricciones

D8 <- c( "<=","<=","<=","<=")

D8

#Coeficientes lado derecho de las restricciones

B8 <- c(300,400,240,5000)

B8

# Plan optimo de produccion. 


sol8 <- lp(direction = "max",
          const.mat = A8,
          const.rhs = B8,
          const.dir = D8,
          compute.sens = 1,
          objective.in = C)

#Valores optimos para las variables de decision

sol8$solution
#[1] 100   0   0

#cantidad de puertas pintadas a producir por semana
#                                         x1=100

#cantidad de rejas pintadas a producir por semana
#                                         x2=0

#cantidad de ventanas pintadas a producir por semana
#                                         x3=0

#holgura primera restricción:

3*sol8$solution[1]+5*sol8$solution[2]+24*sol8$solution[3]
#[1] 300

#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol8$solution[1]+4*sol8$solution[2]+5*sol8$solution[3]
#[1] 200

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.


#Holgura tercera restriccion:

2*sol8$solution[1]+3*sol8$solution[2]+1*sol8$solution[3]
#[1] 200

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

#por lo tanto sobran 40 metros de tubo

#Holgura cuarta restriccion:

15*sol8$solution[1]+50*sol8$solution[2]+20*sol8$solution[3]

#Se utilizan 1500 mililitros de pintura, por lo tanto la cuarta variable de holgura es:

#  S4=5000-1500=3500

# Esto significa que sobran 3500 mililitros de pintura.


#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol8

# Es decir, se obtienen Z=600 unidades monetarias de utilidad    


#La solución óptima original sigue siendo óptima bajo este posible escenario,
#aunque esta solución es óptima bajo el posible escenario de que los clientes prefieran
# los productos pintados en vez del escenario original en donde no están pintados.

# m) Analice si la solución óptima original sigue siendo óptima bajo este posible escenario. 

#Respuesta:  

# El escenario original sigue siendo una solución óptima, aunque el posible escenario
# también es una solución óptima. La única diferencia es que bajo este posible escenario,
# en que los clientes tengan preferencia por los productos pintados, será ésta la solución 
# óptima,

#¿Es posible entonces entregar los productos pintados para así no perder clientes? Explique.

# Si, es posible entregar los productos pintados ya que la utilidad sería la misma
# que en el escenario original, además de eso sobrarían 3500 mililitros de pintura.


#Analisis de sensibilidad para los coeficientes de recursos (lado derecho 
#de las restricciones, bi). El incremento/decremento de una unidad en bi,
#produce un aumento/disminucion en Z igual al precio sombra Yi. En efecto:


sol8$duals[1:4]

#Aumento/decremento de Z, si b1 aumenta/decrece en una unidad.
#Y1=2

#Aumento/decremento de Z, si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento/decremento de Z, si b3 aumenta/decrece en una unidad.
#Y3=0

##Aumento/decremento de Z, si b4 aumenta/decrece en una unidad

#Y4=0

#Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $2, en comparación con 0 para el ángulo, 
# 0 para los tubos y 0 para la pintura . Por lo tanto, la lámina deben tener la prioridad.


#Análisis de sensibilidad para coeficientes de la función objetivo

tibble(c = c("c1","c2","c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.to)

#Resultado

#   A tibble: 3 x 3
#   c          min      max
# <chr>    <dbl>       <dbl>
# 1 c1     1.20e 0    1.00e30
# 2 c2    -1.00e30    1.00e 1
# 3 c3    -1.00e30    4.80e 1


#Comentarios del análisis=los costos unitario de las actividades pueden cambiar dentro 
#de estos intervalos sin que se modifique el Plan Óptimo de Producción, es decir,
# que los valores de la produccion de puertas, rejas y/o ventanas , pueden
# verse modificado en su valor unitario, pero dicha modificación no afecta nuestro plan óptimo,
#pero si modifica a Z.

## Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden cambiar
# en estos intervalo sin que se modifique el plan optimo de produccion):

#   1.20 <= c1 <= + inf                     
#                                       
#  -inf <= c2 <= 10                     
#                                       
#  - inf <= c3 <= 48


#Analisis de sensibilidad para los coeficientes bi.

A8_dual <- t(A8)

B8_dual <- C

C_dual <- B8

D8_dual <- c(">=", ">=", ">=")


solucion_dual<-lp(direction = "min",
                  objective.in = C_dual,
                  const.mat = A8_dual,
                  const.dir = D8_dual,
                  const.rhs = B_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3","b4"),
       min= solucion_dual$sens.coef.from,
       max= solucion_dual$sens.coef.to)

# A tibble: 4 x 3
#  b       min     max
#<chr>    <dbl>   <dbl>
# 1 b1       0   3.60e 2
# 2 b2     200.  1.00e30
# 3 b3     200.  1.00e30
# 4 b4    1500   1.00e30

#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo
#a los siguientes intervalos y esto no afectará los precios sombra Y*

##Así, finalmente los intervalos bi,min???bi???bi,max para los coeficientes bi quedan 
# como se presentan a continuación:

#     0  <= b1 <= 360
#                        
#    200 <= b2 <= + inf 
#
#    200 <= b3 <= + inf
# 
#   1500 <= b4 <= + inf


#*******************************************************************************

#Mediante otro estudio de mercado, se proyecta que es posible que en los 
#próximos períodos, máximo se podrán vender 60 puertas por semana.


# n)Analice si la solución óptima original sigue siendo óptima bajo este posible 
# escenario.

# o) En el caso que la solución deje de ser óptima, haga los cambios necesarios 
# al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos se 
# deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen todas 
# las materias primas disponibles? En el caso que alguna(s) de ellas no sea(n) 
# completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.

#Desarrollo



#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#Lamina             3m       5m      24m          300m
#Angulo             2m       4m      5m           400m
#Tubo               2m       3m      1m           240m

#utilidad por u.    $6       $2      $5



#Varibles de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana


#Funcion objetivo

# Max Z = 6x1 + 2x2 + 5x3

# Las restricciones 

#    3x1  +  5x2  +  24x3 <= 300 restriccion para los metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 restriccion para los metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 restriccion para los metros de tubo
#                     x1  <=  60 restricción para venta de puertas por semana.
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#modelo matemático completo

# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                     x1  <= 60 venta puertas por semana
#                x1,x2,x3 => 0 (no negatividad)


#Coeficientes de la función objetivo

C <- c(6,2,5)

C
#[1] 6 2 5

#Matriz de coeficientes de las restricciones

A9 <- matrix(c(3, 5, 24,
                2, 4, 5,
                2, 3, 1,
                0, 0, 1),
                ncol = 3,
                byrow = TRUE)

A9
#     [,1] [,2] [,3]
# [1,]    3    5   24
# [2,]    2    4    5
# [3,]    2    3    1
# [4,]    0    0    1

#Direccion de las desigualdades de las restricciones

D9 <- c( "<=","<=","<=", "<=")


D9

#Coeficientes lado derecho de las restricciones

B9 <- c(300,400,240,60)

B9
#[1] 300 400 240  60

#Plan óptimo de producción


sol9 <- lp(direction = "max",
          const.mat = A9,
          const.rhs = B9,
          const.dir = D9,
          objective.in = C,
          compute.sens = 1)

#Valores optimos para las variables de decision

sol9$solution
#[1] 100   0   0

#cantidad de puertas a producir por semana
#                                         x1=100

#cantidad de rejas a producir por semana
#                                         x2=0

#cantidad de ventanas a producir por semana
#                                         x3=0
#holgura primera restricción:

3*sol9$solution[1]+5*sol9$solution[2]+24*sol9$solution[3]
#[1] 300

#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol9$solution[1]+4*sol9$solution[2]+5*sol9$solution[3]
#[1] 200

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.


#Holgura tercera restriccion:

2*sol9$solution[1]+3*sol9$solution[2]+1*sol9$solution[3]
#[1] 200

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

# Esto significa que sobran 40 metros de tubo.

#Holgura cuarta restricción

0*sol9$solution[1] + 0*sol9$solution [2] + 1*sol9$solution[3]

#[1] 0

# Se venden 0 puertas a la semana, por lo tanto la cuarta variable de holgura es 

#S4 = 60 - 0 = 60

sol9
#Success: the objective function is 600 

# Es decir, se obtienen Z=600 unidades monetarias de utilidad  


# n)Analice si la solución óptima original sigue siendo óptima bajo este posible 
# escenario.

# Respuesta: La solución óptima original sigue siendo óptima bajo este posible escenario, ya que
# su utilidad es de 600 unidades monetarias, independientemente de que haya restricción en la 
# venta de puertas o no.

# o) En el caso que la solución deje de ser óptima, haga los cambios necesarios 
# al modelo matemático y resuelva. 


# ¿Qué cantidad de cada uno de los artículos se deben fabricar ahora? 

#Respuesta: Se deben fabricar 100 puertas, 0 rejas y 0 ventanas.

# ¿Cuál es la utilidad óptima obtenida? 

# Respuesta: La utilidad óptima obtenida es de 600 unidades monetarias.

# ¿Se consumen todas las materias primas disponibles?

#Respuesta: Se consume toda la materia prima de lámina, es decir los 300 mts de lámina, además
# se consumen 200 mts de ángulo por lo cuál sobran 200 mts de ángulo y se consumen 
# 200 mts de tubo por lo que sobran 40 mts de tubo.

# En el caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto de 
# ésta(s) no son utilizadas.

# Respuesta: La materia prima de ángulo no es completamente utilizada por lo que le sobran 200
#mts de ángulo, y la materia prima de tubo tampoco es completamente utilizada por lo que sobran
#40 mts de tubo.

#Analisis de sensibilidad para los coeficientes de recursos (lado derecho 
#de las restricciones, bi). El incremento/decremento de una unidad en bi,
#produce un aumento/disminucion en Z igual al precio sombra Yi. En efecto:


sol9$duals[1:4]
#[1] 2 0 0 0

#Aumento/decremento de Z, si b1 aumenta/decrece en una unidad.
#Y1=2

#Aumento/decremento de Z, si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento/decremento de Z, si b3 aumenta/decrece en una unidad.
#Y3=0

#Aumento/decremento de Z, si b4 aumenta/decrece en una unidad.
#Y4=0

##Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $2, en comparación con 0 para el ángulo 
# y 0 para los tubos . Por lo tanto, la lámina deben tener la prioridad. 
# Además de esto si se vende o no se vende una puerta no aumenta ni disminuye la utilidad


#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol9$sens.coef.from,
       max = sol9$sens.coef.to)

#Resultado

#A tibble: 3 x 3
#   c       min       max
# <chr>    <dbl>     <dbl>
# 1 c1    1.20e 0   1.00e30
# 2 c2   -1.00e30   1.00e 1
# 3 c3   -1.00e30   4.80e 1

#Comentarios del análisis=los costos unitario de las actividades pueden cambiar dentro 
#de estos intervalos sin que se modifique el Plan Óptimo de Producción, es decir,
# que los valores de la produccion de puertas, rejas y/o ventanas , pueden
# verse modificado en su valor unitario, pero dicha modificación no afecta nuestro plan óptimo,
#pero si modifica a Z.

# Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden cambiar
# en estos intervalo sin que se modifique el plan optimo de produccion):

#   1.20 <= c1 <=  + inf                     
#                                       
#  -inf <= c2 <= 10                     
#                                       
#  -inf <= c3 <= 48


#Analisis de sensibilidad para los coeficientes bi.

A9_dual <- t(A9)

B9_dual <- C

C_dual <- B9

D9_dual <- c(">=", ">=", ">=")


solucion9_dual<-lp(direction = "min",
                  objective.in = C_dual,
                  const.mat = A9_dual,
                  const.dir = D9_dual,
                  const.rhs = B9_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3","b4"),
       min= solucion9_dual$sens.coef.from,
       max= solucion9_dual$sens.coef.to)

## A tibble: 4 x 3
#  b         min       max
#<chr>     <dbl>      <dbl>
# 1 b1    -5.68e-14   3.60e 2
# 2 b2     2.00e+ 2   1.00e30
# 3 b3     2.00e+ 2   1.00e30
# 4 b4     0.         1.00e30

#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo
#a los siguientes intervalos y esto no afectará los precios sombra Y*

#Así, finalmente los intervalos bi,min???bi???bi,max para los coeficientes bi quedan como se presentan
#a continuación:

#   -inf  <= b1 <= 360
#                        
#    200 <= b2 <=  + inf
#
#    200 <= b3 <= + inf 
#
#      0  <= b4 <= + inf



#****************************************************************************************
#En un tercer estudio, el departamento de Marketing concluyó que en los próximos 
#períodos es muy probable  que la cantidad de ventanas a vender sea mínimo 60
#unidades semanales.


#P)Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.


#Q)En el caso que la solución deje de ser óptima, haga los cambios necesarios 
#al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos 
#se deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen 
#todas las materias primas disponibles? En el caso que alguna(s) de ellas no
#sea(n) completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.

#Desarrollo



#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#Lamina             3m       5m      24m          300m
#Angulo             2m       4m      5m           400m
#Tubo               2m       3m      1m           240m

#utilidad por u.    $6       $2      $5



#Varibles de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana


#Funcion objetivo

# Max Z = 6x1 + 2x2 + 5x3

# Las restricciones 

#    3x1  +  5x2  +  24x3 <= 300 restriccion para los metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 restriccion para los metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 restriccion para los metros de tubo
#                     x3  >=  60 restricción para venta de ventanas por semana.
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#modelo matemático completo

# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                     x3  >= 60 venta ventanas por semana
#                x1,x2,x3 => 0 (no negatividad)


#Coeficientes de la función objetivo

C <- c(6,2,5)

C
#[1] 6 2 5

#Matriz de coeficientes de las restricciones

A10 <- matrix(c(3, 5, 24,
                2, 4, 5,
                2, 3, 1,
                0, 0, 1),
              ncol = 3,
              byrow = TRUE)

A10
#       [,1] [,2] [,3]
# [1,]    3    5   24
# [2,]    2    4    5
# [3,]    2    3    1
# [4,]    0    0    1

#Direccion de las desigualdades de las restricciones

D10 <- c( "<=","<=","<=", ">=")


D10
#"<=" "<=" "<=" ">="

#Coeficientes lado derecho de las restricciones

B10 <- c(300,400,240,60)

B10
#[1] 300 400 240  60

#Plan óptimo de producción


sol10 <- lp(direction = "max",
            const.mat = A10,
            const.rhs = B10,
            const.dir = D10,
            objective.in = C,
            compute.sens = 1)

#Valores optimos para las variables de decision

sol10$solution
#  [1] 0 0 0

sol10

#cantidad de puertas a producir por semana
#                                         x1=0

#cantidad de rejas a producir por semana
#                                         x2=0

#cantidad de ventanas a producir por semana
#                                         x3=0

#holgura primera restricción:

3*sol10$solution[1]+5*sol10$solution[2]+24*sol10$solution[3]
#[1] 0

# No se utilizn los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=300 - 0 = 300

#Esto significa que sobran 300 mt de lámina
#holgura segunda restricción:

2*sol10$solution[1]+4*sol10$solution[2]+5*sol10$solution[3]
#[1] 0
#No se utilizan los 400 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-0=400

# Esto significa que sobran 400 metros de angulo.


#Holgura tercera restriccion:

2*sol10$solution[1]+3*sol10$solution[2]+1*sol10$solution[3]
#[1] 0
#No se utilizan los 240 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-0= 240

# Esto significa que sobran 240 metros de tubo.

#Holgura cuarta restricción

0*sol10$solution[1] + 0*sol10$solution [2] + 1*sol10$solution[3]
#[1] 0

# Se venden 0 ventanas a la semana, por lo tanto la cuarta variable de holgura es 

#S4 = 60 - 0 = 60

# Es decir, sobran 60 ventanas para vender por semana.



# p) Analice si la solución óptima original sigue siendo óptima bajo este posible escenario.

# Respuesta: La solución óptima original sigue siendo óptima bajo este posible escenario, 
# ya que en este posible escenario no hay solución óptima


# q) En el caso que la solución deje de ser óptima, haga los cambios necesarios al modelo 
# matemático y resuelva. 


# ¿Qué cantidad de cada uno de los artículos se deben fabricar ahora?

# #Respuesta:Se deben fabricar:
#                              0 puertas
#                              0 rejas
#                              0 ventanas
 

# ¿Cuál es la utilidad óptima obtenida?

# Respuesta: La utilidad óptima obtenida es ninguna.

#¿Se consumen todas las materias primas disponibles?

#Respuesta: No se consume ninguna materia prima disponible.

# En el caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto de ésta(s)
# no son utilizadas.

# # Respuesta: Ninguna es consumida, por lo que todas las materias primas: lámina, ángulo y
#tubo no son utilizadas

#Analisis de sensibilidad para los coeficientes de recursos (lado derecho 
#de las restricciones, bi). El incremento/decremento de una unidad en bi,
#produce un aumento/disminucion en Z igual al precio sombra Yi. En efecto:


sol$duals[1:4]
#[1] 2 0 0 0

#Aumento/decremento de Z, si b1 aumenta/decrece en una unidad.
#Y1=2

#Aumento/decremento de Z, si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento/decremento de Z, si b3 aumenta/decrece en una unidad.
#Y3=0

##Aumento/decremento de Z, si b3 aumenta/decrece en una unidad.
#Y4=0

#Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $2, en comparación con 0 para el ángulo 
# y 0 para los tubos . Por lo tanto, la lámina deben tener la prioridad.

#Además si se vende o no puerta, no aumenta ni disminuye la utilidad

#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.to)

#Resultado

# # A tibble: 3 x 3
#   c       min        max
# <chr>    <dbl>      <dbl>
# 1 c1     1.20e 0   1.00e30
# 2 c2    -1.00e30   1.00e 1
# 3 c3    -1.00e30   4.80e 1

#Comentarios del análisis=los costos unitario de las actividades pueden cambiar dentro 
#de estos intervalos sin que se modifique el Plan Óptimo de Producción, es decir,
# que los valores de la produccion de puertas, rejas y/o ventanas , pueden
# verse modificado en su valor unitario, pero dicha modificación no afecta nuestro plan óptimo,
#pero si modifica a Z.

# Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden cambiar
# en estos intervalo sin que se modifique el plan optimo de produccion):

#   1.20 <= c1 <=  + inf                     
#                                       
#  - inf <= c2 <=  10                     
#                                       
#  - inf <= c3 <=  48


#Analisis de sensibilidad para los coeficientes bi.

A10_dual <- t(A10)

B10_dual <- C

C_dual <- B10

D10_dual <- c(">=", ">=", ">=")


solucion10_dual<-lp(direction = "min",
                  objective.in = C_dual,
                  const.mat = A10_dual,
                  const.dir = D10_dual,
                  const.rhs = B10_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3","b4"),
       min= solucion10_dual$sens.coef.from,
       max= solucion10_dual$sens.coef.to)

## A tibble: 4 x 3
#   b       min     max
#  <chr>  <dbl>   <dbl>
#1 b1       0    3.60e 2
#2 b2     200.   1.00e30
#3 b3     200    1.00e30
#4 b4       0    1.00e30

#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo
#a los siguientes intervalos y esto no afectará los precios sombra Y*

#Así, finalmente los intervalos bi,min???bi???bi,max para los coeficientes bi quedan como se presentan
#a continuación:

#     0  <= b1 <= 360
#                        
#    200 <= b2 <= + inf
#
#    200 <= b3 <= + inf
# 
#      0 <= b4 <= + inf


#*******************************************************************************

#La Gerencia esta evaluando la posibilidad de fabricar un nuevo producto, 
#sillas metálicas, a las cuales se les ha asignado una utilidad unitaria 
#de $3 y se ha establecido que cada una requiere 5 metros de lámina, 10 
#metros de ángulo y 24 metros de tubo.

# r) Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario. ¿En base al resultado obtenido, ¿es rentable producir
#sillas? Explique.

#  __________________________________________________________________________________________
# |            |             |             |                |                | DISPONIBILIDAD |
# | MATERIAL   |PUERTA       | REJA        | VENTANA        |   SILLAS       | POR SEMANA     |   
# |____________|_____________|_____________|________________|________________|________________|  
# |            |             |             |                |                |                |
# |  Lámina    |    3 m      |    5 m      |     24 m       |     5 m        |  300 m         |
# |____________|_____________|_____________|________________|________________|________________|
# |            |             |             |                |                |                |
# |  Ángulo    |    2 m      |    4 m      |      5 m       |     10 m       |  400 m         |
# |____________|_____________|_____________|________________|________________|________________|
# |            |             |             |                |                |                |
# |  Tubo      |    2 m      |    3 m      |      1 m       |     24 m       |  240 m         |
# |____________|_____________|_____________|________________|________________|________________|
# |            |             |             |                |                |
# |Utilidad/ u |    $6       |    $2       |      $5        |      $3        |
# |____________|_____________|_____________|________________|________________|


#Variables de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana
#x4=Cantidad de sillas a producir por semana


#Funcion objetivo

# Max Z = 6x1 + 2x2 + 5x3 + 3x4

# Las restricciones 

#    3x1  +  5x2  +  24x3 + 5x4 <= 300 restriccion para los metros de lamina
#    2x1  +  4x2  +  5x3  + 10x4<= 400 restriccion para los metros de angulo
#    2x1  +  3x2  +  1x3  + 24x4<= 240 restriccion para los metros de tubo
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3 + 3x4

#S.A.

#    3x1  +  5x2  +  24x3  +  5x4 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3   + 10x4 <= 400 metros de angulo
#    2x1  +  3x2  +  1x3   + 24x4 <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)



#Coeficientes de la función objetivo.

C11<- c(6,2,5,3)

C11

#Matriz de coeficientes de las restricciones

A11 <- matrix (c (3 , 5 , 24, 5,
                 2 , 4 , 5 , 10,
                 2 , 3 , 1 , 24),
             ncol = 4,
             byrow = TRUE)

A11
#       [,1] [,2] [,3] [,4]
# [1,]    3    5   24    5
# [2,]    2    4    5   10
# [3,]    2    3    1   24

#Direccion de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

#Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan optimo de produccion. 


sol11 <- lp(direction = "max",
          const.mat = A11,
          const.rhs = B,
          const.dir = D,
          objective.in = C11,
          compute.sens = 1)

#Valores optimos para las variables de decision

sol11$solution
#[1] 100   0   0   0

#cantidad de puertas  a producir por semana
#                                         x1=100

#cantidad de rejas  a producir por semana
#                                         x2=0

#cantidad de ventanas a producir por semana
#                                         x3=0

#cantidad de sillas a producir por semana
#                                         x4=0

#holgura primera restricción:

3*sol11$solution[1]+5*sol11$solution[2]+24*sol11$solution[3]+5*sol11$solution[4]
#[1] 300

#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol11$solution[1]+4*sol11$solution[2]+5*sol11$solution[3]+10*sol11$solution[4]
#[1] 200

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.


#Holgura tercera restriccion:

2*sol11$solution[1]+3*sol11$solution[2]+1*sol11$solution[3]+24*sol11$solution[4]
#[1] 200
#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

#Por lo tanto sobran 40 metros de tubo.


#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol11
#Success: the objective function is 600
# Es decir, se obtienen Z=600 unidades monetarias de utilidad  

# r) #Analice si la solución óptima original sigue siendo óptima bajo este posible escenario.


#Respuesta: La solución óptima original sigue siendo óptima, y la solución de este 
#posible escenario deja de ser óptima ya que al producir un nuevo producto " sillas"
#da como resultado la misma utilidad del escenario original.por lo cual el fabricar este
# nuevo producto no asegura maximizar las utilidades a la compañía.


# ¿es rentable producir sillas?
# En base al resultado obtenido, no resulta rentable producir sillas ya que en el escenario
# original la utilidad sin producir sillas es de 600 unidades monetarias y bajo el posible 
# escenario con la producción de sillas la utilidad sigue siendo la misma, por lo que no 
# hay un aumento de utilidad ni tampoco un beneficio.



#Analisis de sensibilidad para los coeficientes de recursos (lado derecho 
#de las restricciones, bi). El incremento/decremento de una unidad en bi,
#produce un aumento/disminucion en Z??? igual al precio sombra Yi. En efecto:


sol11$duals[1:4]
#[1] 2 0 0 0

#Aumento/decremento de Z??? si b1 aumenta/decrece en una unidad.
#Y1=2

#Aumento/decremento de Z??? si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento/decremento de Z??? si b3 aumenta/decrece en una unidad.
#Y3=0

#Aumento/decremento de Z??? si b3 aumenta/decrece en una unidad.
#Y4=0

#Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $2, en comparación con 0 para el ángulo 
# y 0 para los tubos . Por lo tanto, la lámina deben tener la prioridad.

#Además de esto si se vende o no una silla, no aumenta ni disminuye la utilidad.

#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3","c4"),
       min = sol11$sens.coef.from,
       max = sol11$sens.coef.to)

#Resultado

# A tibble: 4 x 3
#  c          min     max
# <chr>    <dbl>    <dbl>
# 1 c1     1.80e 0  1.00e30
# 2 c2    -1.00e30  1.00e 1
# 3 c3    -1.00e30  4.80e 1
# 4 c4    -1.00e30  1.00e 1


#Comentarios del análisis=Los costos unitario de las actividades pueden cambiar 
#dentro de éstos intervaloss sin que se modifique el plan optimo de producción, es decir,
#los valores de la produccion de las puerta, rejas y/o ventanas , el valor unitario de 
#éstas puede verse modificado, pero eso no afecta nuestro plan óptimo, aunque si se puede
# modificar el z.

## Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden cambiar
# en estos intervalo sin que se modifique el plan optimo de produccion):

#   1.80 <= c1 <=  + inf                     
#                                       
#  - inf <= c2 <=  10                      
#                                       
#  - inf <= c3 <=  48
#
#  - inf <= c3 <= 10



#Analisis de sensibilidad para los coeficientes bi.

A11_dual <- t(A11)

B_dual <- C11

C11_dual <- B

D_dual <- c(">=", ">=", ">=")


solucion11_dual<-lp(direction = "min",
                  const.mat = A11_dual,
                  const.dir = D_dual,
                  const.rhs = B_dual,
                  objective.in = C11_dual,
                  compute.sens = 1)


tibble(b=c("b1","b2","b3","b4"),
       min= solucion_dual$sens.coef.from,
       max= solucion_dual$sens.coef.to)

# A tibble: 4 x 3
#   b       min     max
# <chr> <dbl>   <dbl>
# 1 b1       0  3.60e 2
# 2 b2     200. 1.00e30
# 3 b3     200  1.00e30
# 4 b4       0  1.00e30

#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo
#al siguientes intervalos y esto no afectará los precios sombra Y*

# #Así, finalmente los intervalos bi,min???bi???bi,max para los coeficientes bi quedan como se presentan
#a continuación:

#     0  <= b1 <= 360
#                        
#    200 <= b2 <= + inf
#
#    200 <= b3 <= + inf
#
#      0 <= b4 <= + inf




#*******************************************************************************


#El Gerente está obsesionado con agregar un nuevo producto para ser más
#competitivo. Esta vez, encarga que se analice la factibilidad de fabricar 
#lockers, para cada uno de los cuales se ha estimado una utilidad de $10.
#Además, se estableció que cada unidad consume 3 metros de lámina, 2 metros 
#de ángulo y 5 metros de tubo.


#  ___________________________________________________________________________________________
# |            |             |             |                |                | DISPONIBILIDAD |
# | MATERIAL   |PUERTA       | REJA        | VENTANA        |   LOCKERS      | POR SEMANA     |   
# |____________|_____________|_____________|________________|________________|________________|  
# |            |             |             |                |                |                |
# |  Lámina    |    3 m      |    5 m      |     24 m       |     3 m        |  300 m         |
# |____________|_____________|_____________|________________|________________|________________|
# |            |             |             |                |                |                |
# |  Ángulo    |    2 m      |    4 m      |      5 m       |     2 m        |  400 m         |
# |____________|_____________|_____________|________________|________________|________________|
# |            |             |             |                |                |                |
# |  Tubo      |    2 m      |    3 m      |      1 m       |     5 m        |  240 m         |
# |____________|_____________|_____________|________________|________________|________________|
# |            |             |             |                |                |
# |Utilidad/ u |    $6       |    $2       |      $5        |      $10       |
# |____________|_____________|_____________|________________|________________|


# s) Analice si la solución óptima original sigue siendo óptima bajo este posible 
#escenario.


#t) En el caso que la solución deje de ser óptima, haga los cambios necesarios
#al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos 
#se deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen
#todas las materias primas disponibles? En el caso que alguna(s) de ellas no 
#sea(n) completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.
#¿Es recomendable incluir este nuevo producto? Explique.

# Desarrollo


#Varibles de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana
#x4 = Cantidad de lockers a producir por semana


#Funcion objetivo

# Max Z = 6x1 + 2x2 + 5x3 + 10x4

# Las restricciones 

#    3x1  +  5x2  +  24x3 + 3x4 <= 300 restriccion para los metros de lamina
#    2x1  +  4x2  +  5x3 + 2x4  <= 400 restriccion para los metros de angulo
#    2x1  +  3x2  +  1x3 + 5x4  <= 240 restriccion para los metros de tubo
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3 + 10x4

#S.A.

#    3x1  +  5x2  +  24x3 + 3x4 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3 + 2x4 <= 400 metros de angulo
#    2x1  +  3x2  +  1x3 + 5x4 <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)


#Coeficientes de la función objetivo

C12 <- c(6, 2, 5, 10)

C12

#Matriz de coeficientes de las restricciones

A12 <- matrix (c(3, 5, 24, 3,
                  2, 4, 5, 2,
                  2, 3, 1, 5), 
                 ncol= 4,
                byrow = TRUE)

A12
#     [,1] [,2] [,3] [,4]
#[1,]    3    5   24    3
#[2,]    2    4    5    2
#[3,]    2    3    1    5

#Dirección de las desigualdades de las restricciones 

D <- c( "<=","<=","<=")

D

#Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan optimo de produccion. 


sol12 <- lp(direction = "max",
          const.mat = A12,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C12)

#Valores optimos para las variables de decision

sol12$solution
#[1] 86.66667  0.00000  0.00000 13.33333


#cantidad de puertas a producir por semana
#                                         x1= 86.66667

#cantidad de rejas a producir por semana
#                                         x2= 0.00000

#cantidad de ventanas a producir por semana
#                                         x3= 0.00000

#Cantidad de lockers a producir por semana 
#                                         x4 = 13.33333

#holgura primera restricción:

3*sol12$solution[1]+5*sol12$solution[2]+24*sol12$solution[3]+3*sol12$solution[4]
#[1] 300

#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol12$solution[1]+4*sol12$solution[2]+5*sol12$solution[3]+ 2*sol12$solution[4]
#[1] 200}

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.


#Holgura tercera restriccion:

2*sol12$solution[1]+3*sol12$solution[2]+1*sol12$solution[3]+5*sol12$solution[4]
#[1] 240
#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

# Esto significa que sobran 40 metros de tubo.

sol12
#Success: the objective function is 653.3333 

#Es decir se obtienen 653.3333 unidades monetarias de utilidad.



# s) Analice si la solución óptima original sigue siendo óptima bajo este posible escenario.

# Respuesta: La solución óptima original no sigue siendo óptima bajo este escenario ya que
# la utilidad de este posible escenario es mayor a la utilidad del escenario original.
# Esto quiere decir que la posibilidad de fabricar un nuevo producto aumentara la utilidad
# de la COMPAÑÍA.

# En el caso que la solución deje de ser óptima, haga los cambios necesarios al modelo 
# matemático y resuelva. ¿Qué cantidad de cada uno de los artículos se deben fabricar ahora?

# Respuesta: 
# Se deben fabricar: 86.66667 (86) puertas, 0 rejas, 0 ventanas y
# 13,33333 lockers, (13) lockers 


# t) ¿Cuál es la utilidad óptima obtenida? 

# Respuesta: La utilidad óptima otenida es de 653.3333 unidades monetarias

# ¿Se consumen todas las materias primas disponibles?

#Respuesta: Se consumen los 300 metros de lámina por lo cual no sobra materia ni falta 
#prima de lámina, 
# se consumen 200 metros de ángulo por lo cual sobran 200 metros de materia prima de ángulo,
# Se consumen 200 metros de tubo por lo que sobran 40 metros de tubo.

# En el caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cuánto de ésta(s)
# no son utilizadas. 

# Respuesta: Los metros de ángulo no son completamente consumidos, por lo que no son utilizados
# 200 metros de ángulo. Los metros de tubo tampoco son completamente consumidos, por lo que 
# no son utilizados 40 metros de tubo. 

# ¿Es recomendable incluir este nuevo producto? Explique.

# Respuesta: Si, es recomendable incluir este nuevo producto. Ya que hará a la compañía mucho 
# más competitiva y porque su gama de productos va a aumentar el número de clientes, por ende
# Y además de eso, le significará 53.3333 unidades monetarias más de utilidad para
# su compañía.


#Analisis de sensibilidad para los coeficientes de recursos (lado derecho 
#de las restricciones, bi). El incremento/decremento de una unidad en bi,
#produce un aumento/disminucion en Z igual al precio sombra Yi. En efecto:

sol12$duals[1:3]
#[1] 1.111111 0.000000 1.333333

#Aumento/decremento de Z, si b1 aumenta /decrece en una unidad.
#Y1= 1.111111 

#Aumento/decremento de Z, si b2 aumenta/decrece en una unidad.
#Y2= 0

#Aumento/decremento de Z, si b3 aumenta/decrece en una unidad.
#Y3= 1.333333

#Según los precios sombra para las materias primas 1, 2 y 3, 
# cada metro adicional de lámina aumenta la utilidad en $1.11, en comparación con 0 para el ángulo 
# y $1.33 para los tubos . Por lo tanto, los tubos deben tener la prioridad.

#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3","c4"),
       min = sol12$sens.coef.from,
       max = sol12$sens.coef.to)



#Resultado

# A tibble: 4 x 3
#  c          min     max
# <chr>    <dbl>     <dbl>
# 1 c1     4.23e 0   10.0 
# 2 c2    -1.00e30   9.56
# 3 c3    -1.00e30   28.  
# 4 c4     6.00e 0   14.6 


#Comentarios del análisis=los costos unitario de las actividades pueden cambiar dentro 
#de estos intervalos sin que se modifique el Plan Óptimo de Producción, es decir,
# que los valores de la produccion de puertas, rejas y/o ventanas , pueden
# verse modificado en su valor unitario, pero dicha modificación no afecta nuestro plan óptimo,
#pero si modifica a Z.

# Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden cambiar
# en estos intervalo sin que se modifique el plan optimo de produccion):

#   4.23 <= c1 <=  10.0                     
#                                       
#  - inf <= c2 <=  9.56                     
#                                       
#  - inf <= c3 <=  28
#
#   6.00 <= c4 <=  14.6


#Analisis de sensibilidad para los coeficientes bi.

A12_dual <- t(A12)

B_dual <- C12

C12_dual <- B

D_dual <- c(">=", ">=", ">=")

sol12_dual <- lp(direction = "min",
            const.mat = A12_dual,
            const.rhs = B_dual,
            const.dir = D_dual,
            compute.sens = 1,
            objective.in = C12_dual)


tibble(b=c("b1","b2","b3"),
       min= solucion_dual$sens.coef.from,
       max= solucion_dual$sens.coef.to)

# A tibble: 3 x 3
#   b       min     max
# <chr>    <dbl>   <dbl>
# 1 b1     144.   3.60e 2
# 2 b2     200    1.00e30
# 3 b3     200.   5.00e 2

#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo
#a los siguientes intervalos y esto no afectará los precios sombra Y*

#Así, finalmente los intervalos bi,min???bi???bi,max para los coeficientes bi quedan como se presentan
#a continuación:

#     144  <= b1 <= 360
#                       
#     200 <= b2  <= + inf 
#
#     200 <= b3  <= 500 


