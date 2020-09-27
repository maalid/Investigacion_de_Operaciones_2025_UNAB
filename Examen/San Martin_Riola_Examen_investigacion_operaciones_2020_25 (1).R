#                              Examen


# Riola San Martin Saez


library(lpSolve)
library(tibble)

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


#Funsion objetivo

# Max Z = 6x1 + 2x2 + 5x3

# Las restricciones 

#    3x1  +  5x2  +  24x3 <= 300 restriccion para los metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 restriccion para los metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 restriccion para los metros de tubo
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)




#B)Usando la función lpSolve resuelva el modelo y conteste las siguientes 
#preguntas: ¿Qué cantidad de cada uno de los artículos se deben fabricar? 
#¿Cuál es la utilidad óptima obtenida?



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
          objective.in = C)
#Valores optimos para las variables de decision

sol$solution


#cantidad de puertas a producir por semana
#                                         x1=100

#cantidad de rejas a producir por semana
#                                         x1=0

#cantidad de ventanas a producir por semana
#                                         x1=0

#holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]

                                         
#Se utilizan los 300 metros de lamina, por lo tanto la primera variable
#de holgura es:
  
#  S1=0

#no sobran metros de lamina

#holgura segunda restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:
  
#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

# Esto significa que sobran 40 metros de tubo.




#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol
         
# Es decir, se obtienen Z???=600 unidades monetarias de utilidad    




#C )Bajo esta solución óptima de producción, ¿se consumen todas las materias primas
#disponibles? En el caso que alguna(s) de ellas no sea(n) completamente
#consumida(s), diga cúanto de ésta(s) no son utilizadas.


#Se utilizan los 300 metros de lamina, por lo tanto no sobra nada


#Se utilizan 200 metros de angulo, por lo tanto:

#  angulo=400-200=200 , sobran 200 metros de angulo.


#Se utilizan 200 metros de tubo, por lo tanto 

#  tubo=240-200=40  Esto significa que sobran 40 metros de tubo.






#Analisis de sensibilidad para los coeficientes de recursos (lado derecho 
#de las restricciones, bi). El incremento/decremento de una unidad en bi,
#produce un aumento/disminucion en Z??? igual al precio sombra Yi. En efecto:


sol$duals[1:3]

#Aumento/decremento de Z??? si b1 aumenta/decrece en una unidad.
#Y1=2

#Aumento/decremento de Z??? si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento/decremento de Z??? si b3 aumenta/decrece en una unidad.
#Y3=0


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


#Comentarios del análisis: 
#los costos unitario de las actividades pueden cambiar en estos intervalo sin
#que se modifique el plan optimo de producción, es decir,
#los valores de las actividades: rejas puertas y ventas , pueden
#ver modificado su valor unitario, pero eso no afecta nuestro plan óptimo pero si
#modificaría el Z.



#   1.20 <= c1 <= 1.20                      
#                                       
#  -1.00 <= c2 <= -1.00                      
#                                       
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

#Comentario:

#Los coeficientes de las restricciones pueden variar de acuerdo
#al siguientes intervalos y esto no afectará los precios sombra Y*


#     0  <= b1 <= 3.60 
#                        
#    200 <= b2 <= 1.000  
#
#    200 <= b3 <= +inf 




#..............................................................................

#Escenario N°2


#Debido a un problema con los proveedores de tubos, se estima que es muy probable 
#que la disponibilidad de éstos disminuya en 50 metros el próximo período.

#..............................................................................

# D ) Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.


#modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 190 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)


E<-c(300,400,190)

E

#plan optimo


sol22<- lp(direction = "max",
         const.mat = A,
         const.rhs = E,
         const.dir = D,
         objective.in = C,
         compute.sens = 1)


#Valores optimos para las variables de decision


sol22$solution



#cantidad de puertas a producir por semana

#                                         x1=94.6666667
#lo que equivale a 94 puertas semanales


#cantidad de rejas a producir por semana

#                                         x1=0

#cantidad de ventanas a producir por semana

#                                         x1=0.6666667

#por lo tanto se producen 0 ventanas semanales, pero si juntamos la materia prima 
#que sobra de las puertas y lo que tenemos de las ventanas se prodia producir
#una ventana


#¿Existe alguna diferencia en términos de las cantidades de materia prima no 
#consumida? Explique el resultado obtenido.

#holgura primera restricción:

3*sol22$solution[1]+5*sol22$solution[2]+24*sol22$solution[3]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de 
#holgura es:

#  S1=0

#no sobran metros de lamina


#holgura segunda restricción:

2*sol22$solution[1]+4*sol22$solution[2]+5*sol22$solution[3]

#Se utilizan 192.6667 metros de angulo, por lo tanto la segunda variable 
#de holgura es:

#  S2=400-192.6667=207.3333

# Entonces sobran 207.3333 metros de angulo.



#Holgura tercera restriccion:


2*sol22$solution[1]+3*sol22$solution[2]+1*sol22$solution[3]


#Se utilizan 190 metros de tubo, entonces la tercera variable de holgura es:

#  S3=0

# no sobran metros de tubo





# si hay diferencia en las cantidades de materia prima no consumida, con respecto
#al scenario origuinal.
#En las laminas se mantienen igual,pero en los angulos en el primer escenario 
#sobran 200 en este escenario sobran 207.333 y con los tubos en el primer escenario
#sobran 40 y en este escenario no sobra nada
.

#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la
#compañia al producir según el plan óptimo de producción encontrado es:

sol22


# Es decir, se obtienen Z???=571.3333 unidades monetarias de utilidad.,por lo 
#que seria menos  que en el escenario original. por lo que seria una solucion
#un poco menos optima.


sol22$duals[1:3]

#Aumento/decremento de Z??? si b1 aumenta/decrece en una unidad.

                                                             #Y1=0.08888889

#Aumento/decremento de Z??? si b2 aumenta/decrece en una unidad.

                                                             #Y2=0.0000000

#Aumento/decremento de Z??? si b3 aumenta/decrece en una unidad.

                                                             #Y3=2.8666667


#Analisis de sensibilidad para coeficientes de la funcion objetivo.



tibble(c = c("c1","c2","c3"),
       min = sol22$sens.coef.from,
       max = sol22$sens.coef.from)


#Resultado

#c          min      max
#<chr>    <dbl>    <dbl>
#1 c1     1.27e 0  1.27e 0
#2 c2    -1.00e30 -1.00e30
#3 c3     3.00e 0  3.00e 0

#Comentarios del análisis: 
#los costos unitario de las actividades pueden cambiar en estos intervalo sin
#que se modifique el plan optimo de producción, es decir,
#los valores de las actividades: rejas puertas y ventas , pueden
#ver modificado su valor unitario, pero eso no afecta nuestro plan óptimo pero si
#modificaría el Z.


#   1.27 <= c1 <= 1.27                     
#                                       
#  -1.00 <= c2 <= -1.00                      
#                                       
#   3.00 <= c3 <= 3.00



#Analisis de sensibilidad para los coeficientes bi.


A_dual <- t(A)

B_dual <- C

C_dual <- E

D_dual <- c(">=", ">=", ">=")


solucion22_dual<-lp(direction = "min",
                  objective.in = C_dual,
                  const.mat = A_dual,
                  const.dir = D_dual,
                  const.rhs = B_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3"),
       min= solucion22_dual$sens.coef.from,
       max= solucion22_dual$sens.coef.to)

#b       min     max
#<chr> <dbl>   <dbl>
#1 b1      285 1.47e 3
#2 b2      193 1.00e30
#3 b3     12.5 2.00e20

#Comentario:
#Los coeficientes de las restricciones pueden variar de acuerdo
#al siguientes intervalos


#    285  <= b1 <= 1.47 e3 
#                        
#    193  <= b2 <= 100  e30
#
#   12.5  <= b3 <= +inf
  




#*******************************************************************************

#escenario N°3

#Debido a un error de conteo en la bodega de materias primas, el gerente de 
#producción se dá cuenta que la cantidad de lámina es 90 metros superior a la 
#que originalmente se disponía.



#..............................................................................


#F)Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.


#modelo matematico completo


# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 390 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)


t <-c(390,200,240)

t

#plan optimo

sol3<-lp(direction = "max",
        const.mat = A,
        const.rhs = t,
        const.dir = D,
        objective.in = C,
        compute.sens = 1)

#Valores optimos para las variables de decision

sol3$solution



#cantidad de puertas a producir por semana

#                                         x1=100

#cantidad de rejas a producir por semana

#                                         x1=0

#cantidad de ventanas a producir por semana

#                                         x1=0

#al aumentar 90 metros de lamina, no se alcanzaria a producir  otra puerta,
#reja o ventana , pero si sobraria mas material, debido a que aumenta solo la 
#lamina y para producir necesitamos mas metros de tubo y angulo.

#G) En el caso que la solución deje de ser óptima, haga los cambios necesarios 
#al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos se
#deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen todas 
#las materias primas disponibles? En el caso que alguna(s) de ellas no sea(n) 
#completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.
 

# No hay diferencia en la solución óptima respecto al escenario original,
#asique la solución  es óptima.


#holgura primera restricción:

3*sol3$solution[1]+5*sol3$solution[2]+24*sol3$solution[3]


#Se utilizan 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=390-300=90

#sobran 90 metros de lamina


#holgura segunda restricción:

2*sol3$solution[1]+4*sol3$solution[2]+5*sol3$solution[3]


#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200


# Esto significa que sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol3$solution[1]+3*sol3$solution[2]+1*sol3$solution[3]

#Se utilizan 200 metros de tubo, por lo tanto la segunda variable de holgura es:

#  tubo=240-200=40

# Entonces sobran 40 metros de tubo


sol3


# Es decir, se obtienen Z???=600 unidades monetarias de utilidad, igual que el 
#escenario origuinal , por lo tanto seria una solucion optima.


#Analisis de sensibilidad


sol3$duals[1:3]

#Aumento/decremento de Z??? si b1 aumenta/decrece en una unidad.

                                                             #Y1=0

#Aumento/decremento de Z??? si b2 aumenta/decrece en una unidad.

                                                             #Y2=3

#Aumento/decremento de Z??? si b3 aumenta/decrece en una unidad.

                                                              #Y3=0



#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol3$sens.coef.from,
       max = sol3$sens.coef.from)

#Resultado

#c          min      max
#<chr>    <dbl>    <dbl>
# c1     2.00e 0  2.00e 0
# c2    -1.00e30 -1.00e30
# c3    -1.00e30 -1.00e30



#Comentarios del análisis: 
#los costos unitario de las actividades pueden cambiar en estos intervalo sin
#que se modifique el plan optimo de producción, es decir,
#los valores de las actividades: rejas puertas y ventas , pueden
#ver modificado su valor unitario, pero eso no afecta nuestro plan óptimo pero si
#modificaría el Z.




#   2.00 <= c1 <= 2.00                     
#                                       
#  -1.00 <= c2 <= -1.00                      
#                                       
#  -1.00 <= c3 <= -1.00



#Analisis de sensibilidad para los coeficientes bi.

A_dual <- t(A)

B_dual <- C

C_dual <- f

D_dual <- c(">=", ">=", ">=")


solucion3_dual<-lp(direction = "min",
                  objective.in = C_dual,
                  const.mat = A_dual,
                  const.dir = D_dual,
                  const.rhs = B_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3"),
       min= solucion3_dual$sens.coef.from,
       max= solucion3_dual$sens.coef.to)

#b       min     max
#<chr> <dbl>   <dbl>
#1 b1     300 1.00e 30
#2 b2      0  2.40e 2
#3 b3     200 1.00e30

#Comentario:
#Los coeficientes de las restricciones pueden variar de acuerdo
#al siguientes intervalos y esto no afectará los precios sombra Y*


#    300 <= b1 <= 1.00 
#                        
#      0 <= b2 <= 2.40 
#
#    200 <= b3 <= +inf 








#...............................................................................

#escenario N°4

#Desde el departamento de ventas, el equipo de análisis hace llegar un reporte
#indicando que la demanda de rejas probablemente aumente, por lo que suguieren
#incrementar en $2 la utilidad de éstas.




#...............................................................................

#Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.

#modelo matematico completo

#...............................................................
#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#...............................................................
#Lamina             3m       5m      24m          300m
#Angulo             2m       4m      5m           400m
#Tubo               2m       3m      1m           240m
#..............................................................
#utilidad por u.    $6       $4      $5
#.............................................................


#modelo matemático completo

# Max Z = 6x1 + 4x2 + 5x3

# S. A.


#    3x1  +  5x2  +  24x3 <= 300 restriccion para los metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 restriccion para los metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 restriccion para los metros de tubo
#                x1,x2,x3 => 0 (restriccion de no negatividad)

# H) Analice si la solución óptima original sigue siendo óptima bajo bajo este posible
# escenario


#Coeficientes de la función objetivo

C22 <- c(6, 4, 5)

C22


#Plan óptimo de producción

sol4 <- lp (direction = "max",
            const.mat = A, 
            const.rhs = B,
            const.dir = D,
            objective.in = C22,
            compute.sens = 1)

#Valores óptimos para las variables de decisión

sol4$solution

#Cantidad de puertas a producir por semana

#                                           x1 = 100

#Cantidad de rejas a producir por semana

#                                           x2 = 0

#Cantidad de ventanas a producir por semana

#                                           x3 = 0

# Esto quiere decir que se seguirían produciendo 100 puertas, y 0 rejas 
#y ventanas, igual que el escenario original.


# i) ¿Existe alguna diferencia en términos de las cantidades de materia prima 
#no consumida?  Explique el resultado obtenido.


# Holgura primera restricción

3*sol4$solution[1]+5*sol4$solution[2]+24*sol4$solution[3]


#Se utilizan los 300 metros de lamina por lo tanto, la primera variable 
#de holgura es:

# S1 = 0

#no sobran metros de lamina

#Holgura segunda restricción

2*sol4$solution[1]+4*sol4$solution[2]+5*sol4$solution[3]


#Se utilizan 200 metros de ángulo, por lo tanto la segunda variable de holgura es :

#S2 = 400 - 200 = 200 

# sobran 200 metros de ángulo.



#Holgura tercera restricción

2*sol4$solution[1]+3*sol4$solution[2]+1*sol4$solution[3]


# Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#S3 = 240 - 40 = 200

# Esto significa que sobran 200 metros de tubo.


# Respuesta:

#No existe diferencia de la materia prima consumidas respecto al escenario original




sol4

# Se obtienen Z???=600 unidades monetarias de utilidad, igual que el 
#escenario origuinal , por lo tanto seria una solucion optima.







#...............................................................................

#Escenario n°5


#El mismo equipo de análisis del departamento de ventas recomienda ahora 
#disminuir en $3 la utilidad de cada puerta y aumentar en la misma cantidad 
#la utilidad de cada ventana, respondiendo así a una baja en la demanda de 
#las primeras y un aumento en la de las segundas.


#..............................................................................



#J)Haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad 
#de cada uno de los artículos se deben fabricar ahora? ¿Cuál es la utilidad 
#óptima obtenida? ¿Se consumen todas las materias primas disponibles? En el 
#caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto
#de ésta(s) no son utilizadas.

#............................................................
#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#............................................................
#Lamina             3m       5m      24m          300m
#Angulo             2m       4m      5m           400m
#Tubo               2m       3m      1m           240m
#...........................................................
#utilidad por u.    $3       $2      $8
#...........................................................



#modelo matemático completo

# Max Z = 3x1 + 2x2 + 8x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)


#Coeficientes de la función objetivo

C30<- c(3, 2, 8)

C30



#Plan óptimo de producción

sol5 <- lp(direction = "max",
           const.mat = A,
           const.rhs = B,
           const.dir = D,
           objective.in = C30,
           compute.sens = 1)


#Valores óptimos para las variables de decisión

sol5$solution



#cantidad de puertas a producir por semana
#                                         x1=100

#cantidad de rejas a producir por semana
#                                         x1=0

#cantidad de ventanas a producir por semana
#                                         x1=0



#holgura primera restricción:

3*sol5$solution[1]+5*sol5$solution[2]+24*sol5$solution[3]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#no sobran metros de laminas 


#holgura segunda restricción:

2*sol5$solution[1]+4*sol5$solution[2]+5*sol5$solution[3]


#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.


#Holgura tercera restriccion:

2*sol5$solution[1]+3*sol5$solution[2]+1*sol5$solution[3]


#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

# Esto significa que sobran 40 metros de tubo.

sol5

#se obtienen  Z= 300 unidades monetarias de utilidad en este escenario, el
#resultado  es menor que el escenario original por lo cual la solución no es óptima


#******************************************************************************

#Escenario N°6

#El gerente de producción está evaluando un cambio en el proceso de producción
#de las rejas. Este cambio implica que la asignación de recursos para cada
#reja se modifica, requiriendo ahora 7 metros de lámina, 8 metros de ángulo 
#y 9 metros de tubo.

#..............................................................................


#K)Haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad
# de cada uno de los artículos se deben fabricar ahora? ¿Cuál es la utilidad
#óptima obtenida? ¿Se consumen todas las materias primas disponibles? En el
#caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto 
#de ésta(s) no son utilizadas.

#...........................................................
#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#...........................................................
#Lamina             3m       7m      24m          300m
#Angulo             2m       8m      5m           400m
#Tubo               2m       9m      1m           240m
#..........................................................
#utilidad por u.    $6       $2      $5
#..........................................................

#Varibles de desicion

#x1= Cantidad de puertas a producir por cada semana
#x2= Cantidad de rejas a producir por cada semana
#x3= Cantidad de ventanas a producir por cada semana


#Funsion objetivo

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

M <- matrix (c (3 , 7 , 24,
                2 , 8 , 5,
                2 , 9 , 1),
             ncol = 3,
             byrow = TRUE)

M

#Direccion de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

#Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan optimo de produccion. 


sol7 <- lp(direction = "max",
          const.mat = M,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C)
#Valores optimos para las variables de decision

sol7$solution


#cantidad de puertas a producir por semana

#                                         x1=100

#cantidad de rejas a producir por semana

#                                         x2=0

#cantidad de ventanas a producir por semana

#                                         x3=0

#holgura primera restricción:

3*sol7$solution[1]+7*sol7$solution[2]+24*sol7$solution[3]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#no sobran metros de lamina


#holgura segunda restricción:

2*sol7$solution[1]+8*sol7$solution[2]+5*sol7$solution[3]


#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

#  sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol7$solution[1]+9*sol7$solution[2]+1*sol7$solution[3]

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

#  sobran 40 metros de tubo.


#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol7

# Es decir, se obtienen Z???=600 unidades monetarias de utilidad, es igual al original

sol$duals[1:3]

#Aumento/decremento de Z??? si b1 aumenta/decrece en una unidad.
#Y1=2

#Aumento/decremento de Z??? si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento/decremento de Z??? si b3 aumenta/decrece en una unidad.
#Y3=0


#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol7$sens.coef.from,
       max = sol7$sens.coef.from)

#Resultado

#c           min       max
#<chr>     <dbl>     <dbl>
#1 c1     8.57e- 1  8.57e- 1
#2 c2    -1.00e+30 -1.00e+30
#3 c3    -1.00e+30 -1.00e+30




#   8.57 <= c1 <= 8-57                    
#                                       
#  -1.00 <= c2 <= -1.00                      
#                                       
#  -1.00 <= c3 <= -1.00



#Analisis de sensibilidad para los coeficientes bi.

A_dual <- t(A)

B_dual <- C

C_dual <- B

D_dual <- c(">=", ">=", ">=")


solucion7_dual<-lp(direction = "min",
                  objective.in = C_dual,
                  const.mat = A_dual,
                  const.dir = D_dual,
                  const.rhs = B_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3"),
       min= solucion7_dual$sens.coef.from,
       max= solucion7_dual$sens.coef.to)

#b       min     max
#<chr> <dbl>   <dbl>
#1 b1        0 3.60e 2
#2 b2      200 1.00e30
#3 b3      200 1.00e30

#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo
#al siguientes intervalos y esto no afectará los precios sombra Y*

#     0  <= b1 <= 3.60 
#                        
#    200 <= b2 <= 1.000  
#
#    200 <= b3 <= +inf 








#*******************************************************************************

#Escenario N°7

#En base al resultado anterior, el gerente de producción decide evaluar otro 
#cambio en el proceso de fabricación de las rejas, requiriendo ahora 5 metros
#de ángulo, $34 metros de tubo y ninguno de lámina.

#..............................................................................


#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#..........................................................
#Lamina             3m       0m      24m          300m
#Angulo             2m       5m      5m           400m
#Tubo               2m      34m      1m           240m
#..........................................................
#utilidad por u.    $6       $2      $5
#..........................................................


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

#    3x1  +  0x2  +  24x3 <= 300 metros de lamina
#    2x1  +  5x2  +  5x3  <= 400 metros de angulo
#    2x1  + 34x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)




#Coeficientes de la función objetivo.

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

# Plan optimo de produccion. 


sol8 <- lp(direction = "max",
          const.mat = I,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C)
#Valores optimos para las variables de decision

sol8$solution


#cantidad de puertas a producir por semana
#                                         x1=100.0000

#cantidad de rejas a producir por semana
#                                         x2=1.176471

#cantidad de ventanas a producir por semana
#                                         x3=0.000


#holgura primera restricción:

3*sol8$solution[1]+0*sol8$solution[2]+24*sol8$solution[3]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#no sobran metros de lamina


#holgura segunda restricción:

2*sol8$solution[1]+5*sol8$solution[2]+5*sol8$solution[3]

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-205.8824=194.1176

# Esto significa que sobran 194.1176 metros de angulo.



#Holgura tercera restriccion:

2*sol8$solution[1]+34*sol8$solution[2]+1*sol8$solution[3]

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240

# Esto significa que no sobran metros de tubo.


#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol8

# Es decir, se obtienen Z???=602.3529 unidades monetarias de utilidad, es mejor que 
#valor optimo del origuinal


sol8$duals[1:3]

#Aumento/decremento de Z??? si b1 aumenta/decrece en una unidad.
#Y1=1.96078431

#Aumento/decremento de Z??? si b2 aumenta/decrece en una unidad.
#Y2=0.0000000

#Aumento/decremento de Z??? si b3 aumenta/decrece en una unidad.
#Y3=0.05882353


#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol8$sens.coef.from,
       max = sol8$sens.coef.from)

#Resultado

#c           min       max
#<chr>     <dbl>     <dbl>
#1 c1     7.35e- 1  7.35e- 1
#2 c2     0.        0.      
#3 c3    -1.00e+30 -1.00e+30


#Comentarios del análisis=los costos unitario de las actividades pueden cambiar 
#en estos intervalo sin que se modifique el plan optimo de producción, es decir,
#los valores de la produccion:puerta, rejas, ventanas , pueden
#ver modificado su valor unitario, pero eso no afecta nuestro plan óptimo pero si
#modificaría el Z.


#   7.35 <= c1 <= 7.35                    
#                                       
#      0 <= c2 <= 0                      
#                                       
#  -1.00 <= c3 <= -1.00



#Analisis de sensibilidad para los coeficientes bi.

A_dual <- t(A)

B_dual <- C

C_dual <- B

D_dual <- c(">=", ">=", ">=")


solucion8_dual<-lp(direction = "min",
                  objective.in = C_dual,
                  const.mat = A_dual,
                  const.dir = D_dual,
                  const.rhs = B_dual,
                  compute.sens = 1)

tibble(b=c("b1","b2","b3"),
       min= solucion8_dual$sens.coef.from,
       max= solucion8_dual$sens.coef.to)

#b       min     max
#<chr> <dbl>   <dbl>
#1 b1        0 3.60e 2
#2 b2      200 1.00e30
#3 b3      200 1.00e30

#Comentario:
#Los coeficientes de las restricciones pueden variar de acuerdo
#al siguientes intervalos y esto no afectará los precios sombra Y*

#     0  <= b1 <= 3.60 
#                        
#    200 <= b2 <= 1.000  
#
#    200 <= b3 <= +inf 










#*******************************************************************************
#*
#Escenario N°8


#Desde el departamento de Marketing, luego de realizar un estudio de mercado,
#se dan cuenta que los clientes están prefiriendo comprar los productos a la 
#competencia ya que ésta los entrega pintados. Es necesario entonces evaluar
#si se pinta o no la producción, pero manteniendo constante las utilidades
#unitarias de cada producto. Para lograr esto, se planea utilizar semanalmente
#5.000 mililitros de pintura sobrante de otro proceso. Además, se sabe que una
#puerta consume 15 mililitros de pintura, una reja requiere 50 mililitros de
#pintura, mientras que una ventana necesita 20 mililitros.

#..............................................................................

#Analice si la solución óptima original sigue siendo óptima bajo este posible
#escenario. ¿Es posible entonces entregar los productos pintados para así no
#perder clientes? Explique.

#.............................................................

#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#............................................................
#Lamina             3m       5m      24m          300m
#Angulo             2m       4m      5m           400m
#Tubo               2m       3m      1m           240m
#pintura           15ml     50ml    20ml        5.000ml
#...........................................................

#utilidad por u.    $6       $2      $5
#............................................................



#Varibles de desicion

#x1= Cantidad de puertas pintadas a producir por semana
#x2= Cantidad de rejas pintadas a producir por semana
#x3= Cantidad de ventanas pintadas a producir por semana


#Funsion objetivo

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


sol9 <- lp(direction = "max",
          const.mat = A2,
          const.rhs = B2,
          const.dir = D2,
          compute.sens = 1,
          objective.in = C)
#Valores optimos para las variables de decision

sol9$solution


#cantidad de puertas pintadas a producir por semana
#                                         x1=100

#cantidad de rejas pintadas a producir por semana
#                                         x1=0

#cantidad de ventanas pintadas a producir por semana
#                                         x1=0

#holgura primera restricción:

3*sol9$solution[1]+5*sol9$solution[2]+24*sol9$solution[3]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

# no sobran metros de lamina


#holgura segunda restricción:

2*sol9$solution[1]+4*sol9$solution[2]+5*sol9$solution[3]

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol9$solution[1]+3*sol9$solution[2]+1*sol9$solution[3]

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

#por lo tanto sobran 40 metros de tubo

#Holgura cuarta restriccion:

15*sol9$solution[1]+50*sol9$solution[2]+20*sol9$solution[3]

#Se utilizan 1500 mililitros de pintura, por lo tanto la cuarta variable de holgura es:

#  S4=5000-1500=3500

# Esto significa que sobran 3500 mililitros de pintura.


#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol9

# Es decir, se obtienen Z???=600 unidades monetarias de utilidad , es igual que el
# escenario origuinal



#si la solución óptima original sigue siendo óptima bajo este posible escenario,
#a sique no habria problema en entregar los productos pintados.










#*******************************************************************************

#Escenario 9

#Mediante otro estudio de mercado, se proyecta que es posible que en los 
#próximos períodos, máximo se podrán vender 60 puertas por semana.

#...............................................................................



#P)Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.


#Q)En el caso que la solución deje de ser óptima, haga los cambios necesarios 
#al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos 
#se deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen 
#todas las materias primas disponibles? En el caso que alguna(s) de ellas no
#sea(n) completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.

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


#Matriz de coeficientes de las restricciones

A50 <- matrix(c(3, 5, 24,
                2, 4, 5,
                2, 3, 1,
                0, 0, 1),
              ncol = 3,
              byrow = TRUE)

A50



#Direccion de las desigualdades de las restricciones

D50 <- c( "<=","<=","<=", ">=")


D50
#"<=" "<=" "<=" ">="

#Coeficientes lado derecho de las restricciones

B50 <- c(300,400,240,60)

B50


#Plan óptimo de producción


sol10 <- lp(direction = "max",
            const.mat = A50,
            const.rhs = B50,
            const.dir = D50,
            objective.in = C,
            compute.sens = 1)

#Valores optimos para las variables de decision

sol10$solution



#cantidad de puertas a producir por semana
#                                         x1=0

#cantidad de rejas a producir por semana
#                                         x1=0

#cantidad de ventanas a producir por semana
#                                         x1=0
#holgura primera restricción:

3*sol10$solution[1]+5*sol10$solution[2]+24*sol10$solution[3]


# No se utilizn los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=300 - 0 = 300

#sobran 300 metros de lámina


#holgura segunda restricción:

2*sol10$solution[1]+4*sol10$solution[2]+5*sol10$solution[3]

#No se utilizan los 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-0=400

# sobran 400 metros de angulo.


#Holgura tercera restriccion:

2*sol10$solution[1]+3*sol10$solution[2]+1*sol10$solution[3]

#No se utilizan los 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-0= 240

# Esto significa que sobran 240 metros de tubo.

#Holgura cuarta restricción

0*sol10$solution[1] + 0*sol10$solution [2] + 1*sol10$solution[3]


# Se venden 0 ventanas a la semana, por lo tanto la cuarta variable de holgura es 

#S4 = 60 - 0 = 60

# Es decir,  60 ventanas se pueden vender por semana.





sol10



#...............................................................................

#Escenario N°10


#En un tercer estudio, el departamento de Marketing concluyó que en los próximos
#períodos es muy probable que la cantidad de ventanas a vender sea mínimo 60 
#unidades semanales.

#...............................................................................

#Analice si la solución óptima original sigue siendo óptima bajo este posible 
#escenario.
#En el caso que la solución deje de ser óptima, haga los cambios necesarios 
#al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos 
#se deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen 
#todas las materias primas disponibles? En el caso que alguna(s) de ellas no
#sea(n) completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.








#*******************************************************************************



#Escenario N°11


#La Gerencia esta evaluando la posibilidad de fabricar un nuevo producto, 
#sillas metálicas, a las cuales se les ha asignado una utilidad unitaria 
#de $3 y se ha establecido que cada una requiere 5 metros de lámina, 10 
#metros de ángulo y 24 metros de tubo.


#..............................................................................


#Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario. ¿En base al resultado obtenido, ¿es rentable producir
#sillas? Explique.

#..................................................................
#                  Puerta   Reja   Ventana   silla  Disponibilidad
#                                                    por semana
#..................................................................
#Lamina             3m       5m      24m      5m      300m
#Angulo             2m       4m      5m      10m      400m
#Tubo               2m       3m      1m      24m      240m
#.................................................................

#utilidad por u.    $6       $2      $5       $3
#................................................................



#Varibles de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana
#x4=Cantidad de sillas a producir por semana


#Funsion objetivo

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

C70<- c(6,2,5,3)

C70

#Matriz de coeficientes de las restricciones

A70 <- matrix (c (3 , 5 , 24, 5,
                 2 , 4 , 5 , 10,
                 2 , 3 , 1 , 24),
             ncol = 4,
             byrow = TRUE)

A70

#Direccion de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

#Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan optimo de produccion. 


sol11 <- lp(direction = "max",
          const.mat = A70,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C70)

#Valores optimos para las variables de decision

sol11$solution


#cantidad de puertas  a producir por semana

#                                         x1=100

#cantidad de rejas  a producir por semana

#                                         x1=0

#cantidad de ventanas a producir por semana

#                                         x1=0

#cantidad de sillas a producir por semana

#                                         x1=0

#holgura primera restricción:

3*sol11$solution[1]+5*sol11$solution[2]+24*sol11$solution[3]+5*sol11$solution[4]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol11$solution[1]+4*sol11$solution[2]+5*sol11$solution[3]+10*sol11$solution[4]

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol11$solution[1]+3*sol11$solution[2]+1*sol11$solution[3]+24*sol11$solution[4]

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

#por lo tanto sobran 40 metros de tubo



#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol11

# Es decir, se obtienen Z???=600 unidades monetarias de utilidad, es igual de optimo
#que el escenario origuinal



sol11$duals[1:4]


#Aumento/decremento de Z??? si b1 aumenta/decrece en una unidad.
                                                              
                                                             #Y1=2

#Aumento/decremento de Z??? si b2 aumenta/decrece en una unidad.

#                                                            Y2=0

#Aumento/decremento de Z??? si b3 aumenta/decrece en una unidad.

#                                                             Y3=0



#Aumento/decremento de Z??? si b4 aumenta/decrece en una unidad.

#                                                             Y4=0






#*******************************************************************************

#Escenario N°12

#El Gerente está obsesionado con agregar un nuevo producto para ser más
#competitivo. Esta vez, encarga que se analice la factibilidad de fabricar 
#lockers, para cada uno de los cuales se ha estimado una utilidad de $10.
#Además, se estableció que cada unidad consume 3 metros de lámina, 2 metros 
#de ángulo y 5 metros de tubo.

#...............................................................................


#Analice si la solución óptima original sigue siendo óptima bajo este posible 
#escenario.
#En el caso que la solución deje de ser óptima, haga los cambios necesarios
#al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos 
#se deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen
#todas las materias primas disponibles? En el caso que alguna(s) de ellas no 
#sea(n) completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.
#¿Es recomendable incluir este nuevo producto? Explique.

#...................................................................
#                  Puerta   Reja   Ventana  lockers  Disponibilidad
#                                                       por semana
#...................................................................
#Lamina             3m       5m      24m       3m         300m
#Angulo             2m       4m      5m        2m         400m
#Tubo               2m       3m      1m        5m         240m
#..................................................................

#utilidad por u.    $6       $2      $5       $10
#..................................................................


#Varibles de desicion

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana
#x4= Cantidad de lockers a producir por semana


#Funsion objetivo

# Max Z = 6x1 + 2x2 + 5x3 +10x4

# Las restricciones 

#    3x1  +  5x2  +  24x3 +3x4 <= 300 restriccion para los metros de lamina
#    2x1  +  4x2  +  5x3  +2x4 <= 400 restriccion para los metros de angulo
#    2x1  +  3x2  +  1x3  +5x4 <= 240 restriccion para los metros de tubo
#                x1,x2,x3,x4   => 0 (restriccion de no negatividad)

#modelo matematico completo

# Max Z = 6x1 + 2x2 + 5x3 + 10x4

#S.A.

#    3x1  +  5x2  +  24x3 + 3x4 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  + 2x4 <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  + 5x4 <= 240 metros de tubo
#                x1,x2,x3,x4     => 0 (no negatividad)


#Coeficientes de la función objetivo.

C75<- c(6,2,5,10)

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


sol12 <- lp(direction = "max",
          const.mat = A,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C75)
#Valores optimos para las variables de decision

sol12$solution


#cantidad de puertas a producir por semana
#                                         x1=86.66667

#cantidad de rejas a producir por semana
#                                         x1=0.00000

#cantidad de ventanas a producir por semana
#                                         x1=0.00000


#cantidad de lockers a producir por semana
#                                         x1=13.33333


#holgura primera restricción:

3*sol12$solution[1]+5*sol12$solution[2]+24*sol12$solution[3]+3*sol12$solution[4]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=300-260=40

#esto significa que sobran 40 metros de lamina

#holgura segunda restricción:

2*sol12$solution[1]+4*sol12$solution[2]+5*sol12$solution[3]+2*sol12$solution[4]

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol12$solution[1]+3*sol12$solution[2]+1*sol12$solution[3]+5*sol12$solution[4]

#Se utilizan 240 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=0

# Esto significa que no sobran metros de tubo.



#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol12

# Es decir, se obtienen Z???=653.3333 unidades monetarias de utilidad,es decir 
#es ,mas optimo que el escenario origuinal




sol12$duals[1:4]



#Aumento/decremento de Z??? si b1 aumenta/decrece en una unidad.

#                                                            Y1=1.111111

#Aumento/decremento de Z??? si b2 aumenta/decrece en una unidad.

#                                                            Y2=0

#Aumento/decremento de Z??? si b3 aumenta/decrece en una unidad.

#                                                             Y3=1.333333



#Aumento/decremento de Z??? si b4 aumenta/decrece en una unidad.

#                                                             Y4=0






