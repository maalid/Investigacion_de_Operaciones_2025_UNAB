#                              EXAMEN


# GEORGETTE PILQUINAO


#Una compañía especializada en ornamentación llamada Puro Hierro se dedica a la fabricación de puertas, rejas y ventanas; productos para los cuales ha establecido una utilidad de $6, $2 y $5 por unidad respectivamente. Para la manufacturación de dichos artículos la empresa cuenta con una disponibilidad 
#semanal de 300 metros de lámina, 400 metros de ángulo y 240 metros de tubo.Además, se sabe que para producir una puerta se requieren 3 metros de lámina,2 metros de ángulo y 2 metros de tubo; para producir una reja se necesitan 5
#metros de lámina, 4 metros de ángulo y 3 metros de tubo; mientras que, para producir una ventana se requieren 24 metros de lámina, 5 metros de ángulo y un metro de tubo. El objetivo de la compañía es optimizar al máximo las utilidades
#producto de la fabricación y posterior venta de los productos confeccionados.


#a.Formule matemáticamente el problema anterior. Para esto, confeccione una tabla de resumen con la información entregada y defina las variables de decisión, 
#la función objetivo, las restricciones. Finalmente, escriba el modelo matemático completo de programación lineal a resolver.


#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#Lámina             3m       5m      24m          300m
#Ángulo             2m       4m      5m           400m
#Tubo               2m       3m      1m           240m

#utilidad por u.    $6       $2      $5

#Variables de desición

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana


# Función objetivo

# Max Z = 6x1 + 2x2 + 5x3

#  Restricciones 

#    3x1  +  5x2  +  24x3 <= 300 restricción para los metros de lámina
#    2x1  +  4x2  +  5x3  <= 400 restricción para los metros de angúlo
#    2x1  +  3x2  +  1x3  <= 240 restricción para los metros de tubo
#                x1,x2,x3 => 0 (restricción de no negatividad)

#  modelo matemático completo

# Max Z = 6x1 + 2x2 + 5x3

# S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lámina
#    2x1  +  4x2  +  5x3  <= 400 metros de ángulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)




#b.Usando la función lpSolve resuelva el modelo y conteste las siguientes preguntas: ¿Qué cantidad de cada uno de los artículos se deben fabricar? ¿Cuál es la utilidad óptima obtenida?

library(lpSolve)

# Transcribimos el modelo anterior a R.

# Coeficientes de la función objetivo.

C<- c(6,2,5)

C

# Matriz de coeficientes de las restricciones

A <- matrix (c (3 , 5 , 24,
                2 , 4 , 5,
                2 , 3 , 1),
             ncol = 3,
             byrow = TRUE)

A

#DirecciÓn de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

# Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan Óptimo de produccion. 


sol <- lp(direction = "max",
          const.mat = A,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C)

#Valores optimos para las variables de decision

sol$solution


#cantidad de puertas a producir por semana

# x1=100

#cantidad de rejas a producir por semana

# x1=0

#cantidad de ventanas a producir por semana

#  x1=0

#holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]

                                         
#Se utilizan los 300 metros de lamina, primera variable de holgura es:
  
#  S1=0

#holgura segunda restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 metros de angulo,la segunda variable de holgura es:
  
#  S2=400-200=200

# sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]

#Se utilizan 200 metros de tubo,la tercera variable de holgura es:

#  S3=240-200=40

#  sobran 40 metros de tubo.


#Valor óptimo de la función objetivo. la útilidad optima que obtendrá la compañia al producir según el plan óptimo de producción encontrado es:

sol
         
#  Z?=600 unidades monetarias de útilidad    




# c.Bajo esta solución óptima de producción, ¿se consumen todas las materias primas disponibles? En el caso que alguna(s) de ellas no sea(n) completamenteconsumida(s), diga cúanto de ésta(s) no son utilizadas.


#Se utilizan los 300 metros de lamina.


#Se utilizan 200 metros de angulo,es decir:

#  angulo=400-200=200

# sobran 200 metros de ángulo.


#Se utilizan 200 metros de tubo, es decir

#  tubo=240-200=40

# sobran 40 metros de tubo.



#Analisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi). El incremento/descenso de la unidad en bi,
#produce un aumento/disminucion en Z? igual al precio sombra Yi. En efecto:


sol$duals[1:3]

#Aumento/disminución de Z? si b1 aumenta/desciende en la unidad.

#Y1=2

#Aumento/disminución de Z? si b2 aumenta/desciendee en la unidad.

#Y2=0

#Aumento/disminución de Z? si b3 aumenta/desciende en la unidad.

#Y3=0


#Analisis de sensibilidad para coéficientes de la F.O


tibble(c = c("c1","c2","c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.from)

# Resultado

# c          min      max
#<chr>    <dbl>    <dbl>
# c1     1.20e 0  1.20e 0
# c2    -1.00e30 -1.00e30
# c3    -1.00e30 -1.00e30



#   1.20 <= c1 <= 1.20                      
#                                       
#  -1.00 <= c2 <= -1.00                      
#                                       
#  -1.00 <= c3 <= -1.00



#Analisis de sensibilidad para los coéficientes bi.

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



#b       min     max
#<chr> <dbl>   <dbl>
#1 b1        0 3.60e 2
#2 b2      200 1.00e30
#3 b3      200 1.00e30

#Los coeficientes de las restricciones pueden alterar de acuerdo a los siguientes intervalos pero no afectará los precios sombra Y*

#     0  <= b1 <= 3.60 
#                        
#    200 <= b2 <= 1.000  
#
#    200 <= b3 <= +inf 


# Debido a un problema con los proveedores de tubos, se estima que es muy probable que la disponibilidad de éstos disminuya en 50 metros el próximo período.

# d. Analice si la solución óptima original sigue siendo óptima bajo este posible escenario.

# modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3

# S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lámina
#    2x1  +  4x2  +  5x3  <= 400 metros de ángulo
#    2x1  +  3x2  +  1x3  <= 190 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)


E<-c(300,400,190)

E

# plan óptimo

sol<- lp(direction = "max",
         const.mat = A,
         const.rhs = E,
         const.dir = D,
         objective.in = C,
         compute.sens = 1)

# Valores óptimos para las variables de decisión

sol$solution



# cantidad de puertas a producir por semana

# x1=94.6666667

# Es decir equivale a 94 puertas semanales

#cantidad de rejas a producir por semana

# x1=0

#cantidad de ventanas a producir por semana

# x1=0.6666667
#lo que equivale a 0 ventanas semanales, pero si con la materia prima que sobra de las puertas y lo que tenemos de las ventanas podriamos realizar una ventana

#¿Existe alguna diferencia en términos de las cantidades de materia prima no consumida? Explique el resultado obtenido.

#holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]

#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

# por lo tanto no sobrán metros de lámina

# holgura segunda restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]

#Se utilizan 192.6667 metros de ángulo,es decir la segunda variable de holgura es:

#  S2=400-192.6667=207.3333

# Esto significa que sobrán 207.3333 metros de ángulo.



#Holgura tercera restricción:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]

#Se utilizan 190 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=0

# por lo tanto no sobrán metros de tubo

# Esto significa que sobrán 0 metros de tubo.


# es decir si hay diferencia en las cantidades de materia prima no consumida,
#se mantiene la igualdad en las láminas,en los ángulos en el primer ejercicio quedan 200 
#en este ejercicio quedan 207.333 y con los tubos en el primer ejercicio
#quedan 40 y en este ejercicio no hay diferencia


#Valor optimo de la funcion objetivo. La compañia la utilidad óptima que obtendrá al producir según el plan óptimo de producción es:

sol  

# Es decir, se obtienen Z?=571.3333 unidades monetarias de utilidad., menos que en el escenario inicial. por lo cual, ya no es una solucion optima

sol$duals[1:3]

#Aumento/descenso de Z? si b1 aumenta/desciende en la unidad.
#Y1=0.08888889

#Aumento/descenso de Z??? si b2 aumenta/desciende en la unidad.
#Y2=0.0000000

#Aumento/descenso de Z??? si b3 aumenta/desciende en la unidad.
#Y3=2.8666667


#Analisis de sensibilidad para coeficientes de la F.O


tibble(c = c("c1","c2","c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.from)

# Resultado

#c          min      max
#<chr>    <dbl>    <dbl>
# c1     1.20e 0  1.20e 0
# c2    -1.00e30 -1.00e30
# c3    -1.00e30 -1.00e30


#Com :los costos unitario de las actividades pueden modificarse 
#en estos intervalo sin que se modifique el plan optimo de producción, es decir,
#los valores de la produccion:puerta, rejas, ventanas ,pueden verse en una modificacion de valor unitario, pero eso no afectaria el plan optimo establecido, pero si se cambiaria el Z.

#   1.20 <= c1 <= 1.20                      
#                                       
#  -1.00 <= c2 <= -1.00                      
#                                       
#  -1.00 <= c3 <= -1.00



# Analisis de sensibilidad para los coeficientes bi.

A_dual <- t(A)

B_dual <- C

C_dual <- E

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

#b       min     max
#<chr> <dbl>   <dbl>
#1 b1      285 1.47e 3
#2 b2      193 1.00e30
#3 b3     12.5 2.00e20

#Com: Los coeficientes de las restricciones pueden cambiar acorde a los siguientes intervalos pero no afectará los valores sombra  Y*

#    285  <= b1 <= 1.47 e3 
                       
#    193  <= b2 <= 100  e30

#   12.5  <= b3 <= +inf
  



#Debido a un error de conteo en la bodega de materias primas, el gerente de producción se dá cuenta que la cantidad de lámina es 90 metros superior a la que originalmente se disponía.


#f. Analice si la solución óptima original sigue siendo óptima bajo este posible escenario.

# modelo matemático completo


# Max Z = 6x1 + 2x2 + 5x3

# S.A.

#    3x1  +  5x2  +  24x3 <= 390 metros de lámina
#    2x1  +  4x2  +  5x3  <= 400 metros de ángulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo

#                x1,x2,x3 => 0 (no negatividad)


f <-c(390,200,240)

f

# Plan óptimo

sol<-lp(direction = "max",
        const.mat = A,
        const.rhs = f,
        const.dir = D,
        objective.in = C,
        compute.sens = 1)

#Valores óptimos para las variables de decision

sol$solution

#cantidad de puertas a producir por semana

# x1=100

#cantidad de rejas a producir por semana

# x1=0

#cantidad de ventanas a producir por semana

# x1=0

#Al adicionar 90 mt de lamina, no se podria producir ninguna puerta,reja u ventana adicional , solo restaria mas material, ya que aumentaria solo la lamina y para produccion se necesita mas cantidad de tubo y ángulo

#g. En el caso que la solución deje de ser óptima, haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos sedeben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen todas 
#las materias primas disponibles? En el caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.


# Respecto al escenario inicial no hay diferencia en la solucion optima.lo que significa que la solución es óptima


# Holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]


#Se utilizan los 300 metros de lamina, por lo cual la primera variable de holgura es:

#  S1=390-300=90

# sobran 90 metros de lamina

# Holgura segunda restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 metros de angulo, por lo cual la segunda variable de holgura es:

#  S2=400-200=200

# sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]

#Se utilizan 200 metros de tubo, por lo cual la segunda variable de holgura es:

#  tubo=240-200=40

# sobran 40 metros de tubo

# no queda material restante de tubo

sol

# Es decir, se obtienen Z?=600 unidades monetarias de utilidad    



sol$duals[1:3]

#Aumento/descenso de Z?si b1 aumenta/desciende en la unidad.

#Y1=0

#Aumento/descenso de Z? si b2 aumenta/desciende en la unidad.

#Y2=3

#Aumento/descenso de Z? si b3 aumenta/desciende en la unidad.

#Y3=0

#Analisis de sensibilidad para coeficientes de la F.O


tibble(c = c("c1","c2","c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.from)

# Resultado

#c          min      max
#<chr>    <dbl>    <dbl>
# c1     2.00e 0  2.00e 0
# c2    -1.00e30 -1.00e30
# c3    -1.00e30 -1.00e30





#   2.00 <= c1 <= 2.00                     
                                       
#  -1.00 <= c2 <= -1.00                      
                                       
#  -1.00 <= c3 <= -1.00



#Analisis de sensibilidad para los coeficientes bi.

A_dual <- t(A)

B_dual <- C

C_dual <- f

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

#b       min     max
#<chr> <dbl>   <dbl>
#1 b1     300 1.00e 30
#2 b2      0  2.40e 2
#3 b3     200 1.00e30

# Com: Pueden cambiar los coeficientes de las restricciones acorde a los siguientes intervalos y esto no afectará los valores sombra Y*

#    300 <= b1 <= 1.00 
#                        
#      0 <= b2 <= 2.40 
#
#    200 <= b3 <= +inf 



#Desde el departamento de ventas, el equipo de análisis hace llegar un reporte indicando que la demanda de rejas probablemente aumente, por lo que suguieren incrementar en $2 la utilidad de éstas.

# h. Analice si la solución óptima original sigue siendo óptima bajo este posible escenario.

# modelo matemático completo


#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#Lamina             3m       5m      24m          300m
#Angulo             2m       4m      5m           400m
#Tubo               2m       3m      1m           240m

#utilidad por u.    $6       $4      $5


# modelo matemático completo

# Max Z = 6x1 + 4x2 + 5x3

# S.A.


#    3x1  +  5x2  +  24x3 <= 300 restricción para los metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 restricción para los metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 restricción para los metros de tubo
#                x1,x2,x3 => 0 (restricción de no negatividad)

# H) Analice si la solución óptima original sigue siendo óptima bajo bajo este posible
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

# Valores óptimos para las variables de decisión

sol4$solution

# Cantidad de puertas a producir por semana

# x1 = 100

#Cantidad de rejas a producir por semana

#x2 = 0

#Cantidad de ventanas a producir por semana

#x3 = 0

# Esto significa que se produciran 100 puertas, pero no rejas y ventanas, al igual
# que el escenario inicial.

# i) ¿Existe alguna diferencia en términos de las cantidades de materia prima no consumida? 
# Explique el resultado obtenido.


# Holgura primera restricción
3*sol4$solution[1]+5*sol4$solution[2]+24*sol4$solution[3]

#[1] 300

#Se utilizan los 300 mt de material, por lo cual, la primera variable de holgura es:

# S1 = 0

#Holgura segunda restricción

2*sol4$solution[1]+4*sol4$solution[2]+5*sol4$solution[3]

# [1] 200

#Se utilizan 200 metros de ángulo, por lo cual la segunda variable de holgura es :

#S2 = 400 - 200 = 200 

#sobrán 200 metros de ángulo.

#Holgura tercera restricción

2*sol4$solution[1]+3*sol4$solution[2]+1*sol4$solution[3]

#[1] 200
# Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#S3 = 240 - 40 = 200

# sobrán 200 mts de tubo.

# respuesta i:No existe diferencia en las cantidades consumidas respecto del escenario inicial



#Valor óptimo de la funcion objetivo.La compañia obtendra la utilidad optima al producir de acuerdo al plan óptimo de producción encontrado es:he objective function es 600 

sol4
#Success: the objective function is 600
# No presenta diferencia en la solución óptima en comparacion al escenario principal



#El mismo equipo de análisis del departamento de ventas recomienda ahora disminuir en $3 la utilidad de cada puerta y aumentar en la misma cantidad 
#la utilidad de cada ventana, respondiendo así a una baja en la demanda de las primeras y un aumento en la de las segundas.


# j.Haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos se deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen todas las materias primas disponibles? En el 
#caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.


#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#Lamina             3m       5m      24m          300m
#Angulo             2m       4m      5m           400m
#Tubo               2m       3m      1m           240m

#utilidad por u.    $3       $2      $8


# Modelo matemático completo

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


# Plan óptimo de producción

sol5 <- lp(direction = "max",
           const.mat = A,
           const.rhs = B,
           const.dir = D,
           objective.in = C5,
           compute.sens = 1)

# Valores óptimos para las variables de decisión

sol5$solution
#[1] 100   0   0


#cantidad de puertas a producir por semana

#x1=100

#cantidad de rejas a producir por semana

# x1=0

#cantidad de ventanas a producir por semana

#x1=0



#holgura primera restricción:

3*sol5$solution[1]+5*sol5$solution[2]+24*sol5$solution[3]

#[1] 300

#Se utilizan los 300 metros de lamina, por lo cual la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol5$solution[1]+4*sol5$solution[2]+5*sol5$solution[3]

#[1] 200

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# sobran 200 metros de angulo.


#Holgura tercera restriccion:

2*sol5$solution[1]+3*sol5$solution[2]+1*sol5$solution[3]

#[1] 200

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

#sobran 40 metros de tubo.

sol5

#Success: the objective function is 300, es decir se obtienen  Z= 300 unidades monetarias de utilidad

#En este caso el resultado de la Maximización de utilidades es menor que el escenario principal, es decir la solucion no es optima


#El gerente de producción está evaluando un cambio en el proceso de producción de las rejas. Este cambio implica que la asignación de recursos para cada reja se modifica, requiriendo ahora 7 metros de lámina, 8 metros de ángulo y 9 metros de tubo.


#k.Haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos se deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen todas las materias primas disponibles? En el
#caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.


#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#Lamina             3m       7m      24m          300m
#Angulo             2m       8m      5m           400m
#Tubo               2m       9m      1m           240m

#utilidad por u.    $6       $2      $5

#Varibles de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana


#Función objetivo

# Max Z = 6x1 + 2x2 + 5x3

# Restricciones 

#    3x1  +  7x2  +  24x3 <= 300 restriccion para los metros de lámina
#    2x1  +  8x2  +  5x3  <= 400 restriccion para los metros de ángulo
#    2x1  +  9x2  +  1x3  <= 240 restriccion para los metros de tubo
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#modelo matemático completo

# Max Z = 6x1 + 2x2 + 5x3

# S.A.

#    3x1  +  7x2  +  24x3 <= 300 metros de lamina
#    2x1  +  8x2  +  5x3  <= 400 metros de angulo
#    2x1  +  9x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)




# Coeficientes de la función objetivo.

C<- c(6,2,5)

C

# Matriz de coeficientes de las restricciones

H <- matrix (c (3 , 7 , 24,
                2 , 8 , 5,
                2 , 9 , 1),
             ncol = 3,
             byrow = TRUE)

H

#Direccion de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

# Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan óptimo de producción. 


sol <- lp(direction = "max",
          const.mat = H,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C)

#Valores óptimos para las variables de decision

sol$solution


#cantidad de puertas a producir por semana

# x1=100

#cantidad de rejas a producir por semana

# x2=0

#cantidad de ventanas a producir por semana

# x3=0

#holgura primera restricción:

3*sol$solution[1]+7*sol$solution[2]+24*sol$solution[3]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol$solution[1]+8*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol$solution[1]+9*sol$solution[2]+1*sol$solution[3]

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

# sobran 40 metros de tubo.

# Valor optimo de la F.O. La compañia obtendra la utilidad optima al producir acorde al plan optimo de produccion encontrado:


sol

# Es decir, se obtienen Z?=600 unidades monetarias de utilidad, es igual al original

sol$duals[1:3]

#Aumento/descenso de Z?si b1 aumenta/desciende en la unidad.

#Y1=2

#Aumento/descenso de Z? si b2 aumenta/desciende en una unidad.

#Y2=0

#Aumento/descenso de Z?si b3 aumenta/desciende en la unidad.

#Y3=0


#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble (c = c("c1", "c2", "c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.from)

# Resultado

#c          min      max
#<chr>    <dbl>    
# c1     8.57e-1  8.57e-1
# c2    -1.00e30 -1.00e30
# c3    -1.00e30 -1.00e30





#   8.57 <= c1 <= 8.57                     
                                       
#  -1.00 <= c2 <= -1.00                      
                                       
#  -1.00 <= c3 <= -1.00



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

#b       min     max
#<chr> <dbl>   <dbl>
#1 b1        0 3.60e 2
#2 b2      200 1.00e30
#3 b3      200 1.00e30

#Com:Los coeficientes de las restricciones pueden cambiar acorde a los siguientes intervalos y esto no afectará los valores sombra Y*
 
#     0  <= b1 <= 3.60 
                     
#    200 <= b2 <= 1.000  

#    200 <= b3 <= +inf 





#En base al resultado anterior, el gerente de producción decide evaluar otro cambio en el proceso de fabricación de las rejas, requiriendo ahora 5 metros de ángulo, $34 metros de tubo y ninguno de lámina.


#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#Lamina             3m       0m      24m          300m
#Angulo             2m       5m      5m           400m
#Tubo               2m      34m      1m           240m

#utilidad por u.    $6       $2      $5

#Varibles de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana


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

#    3x1  +  0x2  +  24x3 <= 300 metros de lámina
#    2x1  +  5x2  +  5x3  <= 400 metros de ángulo
#    2x1  + 34x2  +  1x3  <= 240 metros de tubo

#                x1,x2,x3 => 0 (no negatividad)




#Coeficientes de la F.O

C<- c(6,2,5)

C

#Matriz de coeficientes de las restricciones

I <- matrix (c (3 , 0 , 24,
                2 , 5 , 5,
                2 ,34 , 1),
             ncol = 3,
             byrow = TRUE)

I

#Direccion de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

#Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan Óptimo de produccion. 


sol <- lp(direction = "max",
          const.mat = I,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C)

#Valores optimos para las variables de decision

sol$solution


#cantidad de puertas a producir por semana

# x1=100.0000

#cantidad de rejas a producir por semana
#x2=1.176471

#cantidad de ventanas a producir por semana
#x3=0.000


#holgura primera restricción:

3*sol$solution[1]+0*sol$solution[2]+24*sol$solution[3]


#Se utilizan los 300 metros de lamina, por lo cual la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol$solution[1]+5*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 metros de angulo, por lo cual la segunda variable de holgura es:

#  S2=400-205.8824=194.1176

#sobran 194.1176 metros de angulo.



#Holgura tercera restriccion:

2*sol$solution[1]+34*sol$solution[2]+1*sol$solution[3]

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240

# no sobran metros de tubo.


#Valor optimo de la funcion objetivo.la compañia obtendra la utididad optima según el plan óptimo de producción encontrado es:

sol

# Es decir, se obtienen Z?=602.3529 unidades monetarias de utilidad, es mejor que valor optimo del inicial


sol$duals[1:3]

#Aumento/descenso de Z? si b1 aumenta/desciende en la unidad.

#Y1=1.96078431

#Aumento/descenso de Z? si b2 aumenta/desciende en la unidad.

#Y2=0.0000000

#Aumento/descenso de Z? si b3 aumenta/desciende en la unidad.

#Y3=0.05882353


#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.from)

#Resultado

#c          min      max
#<chr>    <dbl>    <dbl>
# c1     1.20e 0  1.20e 0
# c2    -1.00e30 -1.00e30
# c3    -1.00e30 -1.00e30


#Com:los costos unitario de las actividades pueden cambiar en estos intervalo sin que se cambie el plan optimo de producción, es decir,los valores de la produccion:puerta, rejas, ventanas , pueden
#ver modificado su valor unitario, pero eso no afecta nuestro plan óptimo pero si modificaría el Z.


#   1.20 <= c1 <= 1.20                      
                                       
#  -1.00 <= c2 <= -1.00                      
                                       
#  -1.00 <= c3 <= -1.00



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

#b       min     max
#<chr> <dbl>   <dbl>
#1 b1        0 3.60e 2
#2 b2      200 1.00e30
#3 b3      200 1.00e30

#Com: Los coeficientes de las restricciones pueden cambiar acorde a los siguientes intervalos y esto no afectará los valores sombra Y*

#     0  <= b1 <= 3.60 
                      
#    200 <= b2 <= 1.000  

#    200 <= b3 <= +inf 






#Desde el departamento de Marketing, luego de realizar un estudio de mercado,se dan cuenta que los clientes están prefiriendo comprar los productos a la competencia ya que ésta los entrega pintados. Es necesario entonces evaluar
#si se pinta o no la producción, pero manteniendo constante las utilidades unitarias de cada producto. Para lograr esto, se planea utilizar semanalmente 5.000 mililitros de pintura sobrante de otro proceso. Además, se sabe que una
#puerta consume 15 mililitros de pintura, una reja requiere 50 mililitros de pintura, mientras que una ventana necesita 20 mililitros.


#Analice si la solución óptima original sigue siendo óptima bajo este posible escenario. ¿Es posible entonces entregar los productos pintados para así no perder clientes? Explique.


#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#Lamina             3m       5m      24m          300m
#Angulo             2m       4m      5m           400m
#Tubo               2m       3m      1m           240m
#pintura           15ml     50ml    20ml        5.000ml

#utilidad por u.    $6       $2      $5

#Varibles de desicion

#x1= Cantidad de puertas pintadas a producir por semana
#x2= Cantidad de rejas pintadas a producir por semana
#x3= Cantidad de ventanas pintadas a producir por semana


#Funcion objetivo

# Max Z = 6x1 + 2x2 + 5x3

# restricciones 

#    3x1  +  5x2  +  24x3 <= 300   restriccion para los metros de lámina
#    2x1  +  4x2  +  5x3  <= 400   restriccion para los metros de ángulo
#    2x1  +  3x2  +  1x3  <= 240   restriccion para los metros de tubo
#   15x1  + 50x2  + 20x3  <= 5.000 restriccion para produccion pintada
#                x1,x2,x3 => 0 (restriccion de no negatividad)

# modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3

# S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lámina
#    2x1  +  4x2  +  5x3  <= 400 metros de ángulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#   15x1  + 50x2  + 20x3  <= 5.000 produccion pintada
#                x1,x2,x3 => 0 (no negatividad)



#Coeficientes de la función objetivo.

C<- c(6,2,5)

C

#Matriz de coeficientes de las restricciones

A2 <- matrix (c (3 , 5 , 24,
                2 , 4 , 5,
                2 , 3 , 1,
                15,50 ,20),
             ncol = 3,
             byrow = TRUE)

A2

#Direccion de las desigualdades de las restricciones

D2 <- c( "<=","<=","<=","<=")

D2

#Coeficientes lado derecho de las restricciones

B2 <- c(300,400,240,5000)

B2

# Plan optimo de produccion. 


sol <- lp(direction = "max",
          const.mat = A2,
          const.rhs = B2,
          const.dir = D2,
          compute.sens = 1,
          objective.in = C)
#Valores optimos para las variables de decision

sol$solution


#cantidad de puertas pintadas a producir por semana

# x1=100

#cantidad de rejas pintadas a producir por semana

# x1=0

#cantidad de ventanas pintadas a producir por semana

# x1=0

#holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]


#Se utilizan los 300 metros de lámina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 metros de ángulo, por lo cual la segunda variable de holgura es:

#  S2=400-200=200

# sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]

#Se utilizan 200 metros de tubo, por lo cual la tercera variable de holgura es:

#  S3=240-200=40

# sobran 40 metros de tubo

#Holgura cuarta restriccion:

15*sol$solution[1]+50*sol$solution[2]+20*sol$solution[3]

#Se utilizan 1500 mililitros de pintura, por lo tanto la cuarta variable de holgura es:

#  S4=5000-1500=3500

# Esto significa que sobran 3500 mililitros de pintura.


#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol

# Es decir, se obtienen Z?=600 unidades monetarias de utilidad , es igual que el origuinal



#si la solución óptima original sigue igual bajo este posible escenario, no habria problema en entregar los productos pintados.





#Mediante otro estudio de mercado, se proyecta que es posible que en los próximos períodos, máximo se podrán vender 60 puertas por semana.



# p. Analice si la solución óptima original sigue siendo óptima bajo este posible escenario.


# q.En el caso que la solución deje de ser óptima, haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos se deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen 
#todas las materias primas disponibles? En el caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.

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

#    3x1  +  5x2  +  24x3 <= 300 restriccion para los metros de lámina
#    2x1  +  4x2  +  5x3  <= 400 restriccion para los metros de ángulo
#    2x1  +  3x2  +  1x3  <= 240 restriccion para los metros de tubo
#                     x3  >=  60 restricción para venta de ventanas por semana.
#                x1,x2,x3 => 0 (restriccion de no negatividad)

# modelo matemático completo

# Max Z = 6x1 + 2x2 + 5x3

# S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lámina
#    2x1  +  4x2  +  5x3  <= 400 metros de ángulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                     x3  >= 60 venta ventanas por semana
#                x1,x2,x3 => 0 (no negatividad)


#Coeficientes de la F.O

C <- c(6,2,5)

C
#[1] 6 2 5

#Matriz de coeficientes de las restricciones

A15 <- matrix(c(3, 5, 24,
                2, 4, 5,
                2, 3, 1,
                0, 0, 1),
              ncol = 3,
              byrow = TRUE)

A15
#       [,1] [,2] [,3]
# [1,]    3    5   24
# [2,]    2    4    5
# [3,]    2    3    1
# [4,]    0    0    1

#Direccion de las desigualdades de las restricciones

D15 <- c( "<=","<=","<=", ">=")


D15
#"<=" "<=" "<=" ">="

#Coeficientes lado derecho de las restricciones

B15 <- c(300,400,240,60)

B15
#[1] 300 400 240  60

#Plan óptimo de producción


sol15 <- lp(direction = "max",
            const.mat = A15,
            const.rhs = B15,
            const.dir = D15,
            objective.in = C,
            compute.sens = 1)

#Valores optimos para las variables de decision

sol15$solution
#  [1] 0 0 0

#cantidad de puertas a producir por semana

# x1=0

#cantidad de rejas a producir por semana

# x1=0

#cantidad de ventanas a producir por semana

# x1=0

#holgura primera restricción:

3*sol15$solution[1]+5*sol15$solution[2]+24*sol15$solution[3]
#[1] 0

# No se utilizAn los 300 metros de lamina, por lo cual la primera variable de holgura es:

#  S1=300 - 0 = 300

#que sobran 300 mt de lámina

#holgura segunda restricción:

2*sol15$solution[1]+4*sol15$solution[2]+5*sol15$solution[3]

#[1] 0

#No se utilizan los 200 metros de angulo, por lo cual la segunda variable de holgura es:

#  S2=400-0=400

# Esto significa que sobran 400 metros de angulo.


#Holgura tercera restriccion:

2*sol15$solution[1]+3*sol15$solution[2]+1*sol15$solution[3]

#[1] 0

#No se utilizan los 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-0= 240

# sobran 240 metros de tubo.

#Holgura cuarta restricción

0*sol15$solution[1] + 0*sol15$solution [2] + 1*sol15$solution[3]
#[1] 0

# Se venden 0 ventanas a la semana, por lo tanto la cuarta variable de holgura es 

#S4 = 60 - 0 = 60

# sobran 60 ventanas para vender por semana.




#La Gerencia esta evaluando la posibilidad de fabricar un nuevo producto, sillas metálicas, a las cuales se les ha asignado una utilidad unitaria de $3 y se ha establecido que cada una requiere 5 metros de lámina, 10 
#metros de ángulo y 24 metros de tubo.

#Analice si la solución óptima original sigue siendo óptima bajo este posible escenario. ¿En base al resultado obtenido, ¿es rentable producir sillas? Explique.


#                  Puerta   Reja   Ventana   silla  Disponibilidad
#                                                    por semana
#Lamina             3m       5m      24m      5m      300m
#Angulo             2m       4m      5m      10m      400m
#Tubo               2m       3m      1m      24m      240m

#utilidad por u.    $6       $2      $5       $3

#Varibles de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana
#x4=Cantidad de sillas a producir por semana


#F.O

# Max Z = 6x1 + 2x2 + 5x3 + 3x4

# Las restricciones 

#    3x1  +  5x2  +  24x3 + 5x4 <= 300 restriccion para los metros de lámina
#    2x1  +  4x2  +  5x3  + 10x4<= 400 restriccion para los metros de ángulo
#    2x1  +  3x2  +  1x3  + 24x4<= 240 restriccion para los metros de tubo
#                x1,x2,x3 => 0 (restriccion de no negatividad)

# modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3 + 3x4

# S.A.

#    3x1  +  5x2  +  24x3  +  5x4 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3   + 10x4 <= 400 metros de angulo
#    2x1  +  3x2  +  1x3   + 24x4 <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)



#Coeficientes de la función objetivo.

C3<- c(6,2,5,3)

C3

#Matriz de coeficientes de las restricciones

A3 <- matrix (c (3 , 5 , 24, 5,
                 2 , 4 , 5 , 10,
                 2 , 3 , 1 , 24),
             ncol = 4,
             byrow = TRUE)

A3

#Direccion de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

#Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan optimo de produccion. 


sol <- lp(direction = "max",
          const.mat = A3,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C3)
#Valores optimos para las variables de decision

sol$solution


#cantidad de puertas  a producir por semana
# x1=100

#cantidad de rejas  a producir por semana
#  x1=0

#cantidad de ventanas a producir por semana
# x1=0

#cantidad de sillas a producir por semana
# x1=0

#holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]+5*sol$solution[4]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]+10*sol$solution[4]

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]+24*sol$solution[4]

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

#por lo tanto sobran 40 metros de tubo



#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol

# Es decir, se obtienen Z?=600 unidades monetarias de utilidad, es igual de optimo
#que el problema origuinal


#Analisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi). El incremento/decremento de una unidad en bi,produce un aumento/disminucion en Z? igual al precio sombra Yi. En efecto:


#El Gerente está obsesionado con agregar un nuevo producto para ser más competitivo. Esta vez, encarga que se analice la factibilidad de fabricar lockers, para cada uno de los cuales se ha estimado una utilidad de $10.
#Además, se estableció que cada unidad consume 3 metros de lámina, 2 metros de ángulo y 5 metros de tubo.

#s.Analice si la solución óptima original sigue siendo óptima bajo este posible escenario.

# t.En el caso que la solución deje de ser óptima, haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos se deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen
#todas las materias primas disponibles? En el caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.¿Es recomendable incluir este nuevo producto? Explique.


#                  Puerta   Reja   Ventana  lockers  Disponibilidad
#                                                       por semana
#Lamina             3m       5m      24m       3m         300m
#Angulo             2m       4m      5m        2m         400m
#Tubo               2m       3m      1m        5m         240m

#utilidad por u.    $6       $2      $5       $10

#Varibles de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana
#x4= Cantidad de lockers a producir por semana


#Funsion objetivo

# Max Z = 6x1 + 2x2 + 5x3 +10x4

#  restricciones 

#    3x1  +  5x2  +  24x3 +3x4 <= 300 restriccion para los metros de lámina
#    2x1  +  4x2  +  5x3  +2x4 <= 400 restriccion para los metros de ángulo
#    2x1  +  3x2  +  1x3  +5x4 <= 240 restriccion para los metros de tubo
#                x1,x2,x3,x4   => 0 (restriccion de no negatividad)

# modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3 + 10x4

#S.A.

#    3x1  +  5x2  +  24x3 + 3x4 <= 300 metros de lámina
#    2x1  +  4x2  +  5x3  + 2x4 <= 400 metros de ángulo
#    2x1  +  3x2  +  1x3  + 5x4 <= 240 metros de tubo
#                x1,x2,x3,x4     => 0 (no negatividad)


#Coeficientes de la F.O

C7<- c(6,2,5,10)

C

#Matriz de coeficientes de las restricciones

A <- matrix (c (3 , 5 , 24,3,
                2 , 4 , 5, 2,
                2 , 3 , 1, 5),
             ncol = 4,
             byrow = TRUE)

A

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
          compute.sens = 1,
          objective.in = C7)
#Valores optimos para las variables de decision

sol$solution


#cantidad de puertas a producir por semana
# x1=86.66667

#cantidad de rejas a producir por semana
# x1=0.00000

#cantidad de ventanas a producir por semana
# x1=0.00000


#cantidad de lockers a producir por semana
# x1=13.33333


#holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]


#Se utilizan los 300 metros de lamina, por lo cual la primera variable de holgura es:

#  S1=300-260=40

#sobran 40 metros de lamina

#holgura segunda restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 metros de angulo, por lo cual la segunda variable de holgura es:

#  S2=400-173.333=226.667

# Esto significa que sobran 226.667 metros de ángulo.



#Holgura tercera restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-173.3333=66.6667

# sobran 66.6667 metros de tubo.



#Valor optimo de la funcion objetivo.  la compañia obtendra la utilidad optima al producir según el plan óptimo de producción encontrado es:

sol

# Z?=653.3333 unidades monetarias de utilidad,es ,mas optimo que el escenario original







