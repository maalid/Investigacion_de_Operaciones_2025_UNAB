#Examen

#Roberto Neira Cisternas

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

#utilidad x unid     $6       $2      $5

#Variables de decision

#x1= Cantidad de puertas a producir por semana
#x2= Cantidad de rejas a producir por semana
#x3= Cantidad de ventanas a producir por semana


#FO

# Max Z = 6x1 + 2x2 + 5x3

# Restricciones:

#    3x1  +  5x2  +  24x3 <= 300 restriccion para los metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 restriccion para los metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 restriccion para los metros de tubo
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#MODELO MATEMATICO 

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

#Coeficientes de la FO

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
#install.packages("lpSolve")
library(lpSolve)

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
#                                         x2=0

#cantidad de ventanas a producir por semana
#                                         x3=0

#Holgura 1a restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]

#Se utilizan los 300 mts de lamina, por lo tanto la primera variable de holgura es:
  
#  S1=0

#Holgura 2a restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 metros de angulo, por lo que la 2da variable de holgura es:
  
#  S2=400-200=200

# Significa que sobran 200 mts de angulo.

#Holgura 3a restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]

#en este caso son utilizados los  200 mts de tubo, por lo cual la tercera variable de holgura es:

#  S3=240-200=40

#Sobran 40 mts de tubo.


#Valor optimo de la funcion objetivo. La utilidad que obtendria la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol
         
# Es decir, se obtienen ZMAX=600 unidades monetarias de utilidad    


#C )Bajo esta solución óptima de producción, ¿se consumen todas las materias primas
#disponibles? En el caso que alguna(s) de ellas no sea(n) completamente
#consumida(s), diga cúanto de ésta(s) no son utilizadas.


#Se utilizan los 300 mts de lamina.


#Se utilizan 200 mts de angulo, por lo tanto

#  angulo = 400 - 200 = 200

# Significa que sobran 200 metros de angulo.


# Son utilizados los  200 mts de tubo, por lo tanto 

#  tubo = 240 - 200 = 40

# Significa que sobran 40 mts de tubo.

#Analisis de sensibilidad para los coeficientes de recursos (lado derecho 
#de las restricciones, bi). El incremento/decremento de una unidad en bi,
#produce un aumento / disminucion en ZMAX igual al precio sombra Yi. 


sol$duals[1:3]

#Aumento / decremento de ZMAX si b1 aumenta/decrece en una unidad.
#Y1=2

#Aumento / decremento de ZMAX si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento / decremento de ZMAX si b3 aumenta/decrece en una unidad.
#Y3=0


#Analisis de sensibilidad para coeficientes de FO.

library(tibble)

tibble(c = c("c1","c2","c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.from)

#Resultado

#c          min      max
#<chr>    <dbl>    <dbl>
# c1     1.20e 0  1.20e 0
# c2    -1.00e30 -1.00e30
# c3    -1.00e30 -1.00e30


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

#Los coeficientes de las restricciones pueden variar de acuerdo
#al siguientes intervalos y esto no afectará los precios sombra Y*

#     0  <= b1 <= 3.60 
#                        
#    200 <= b2 <= 1.000  
#
#    200 <= b3 <= +inf 


#####################################################

#Debido a un problema con los proveedores de tubos, se estima que es muy probable 
#que la disponibilidad de éstos disminuya en 50 metros el próximo período.

# D ) Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.

# El modelo matematico;

# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 190 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)


E<-c(300,400,190)

E

#plan optimo

sol<- lp(direction = "max",
         const.mat = A,
         const.rhs = E,
         const.dir = D,
         objective.in = C,
         compute.sens = 1)

#Valores optimos para las variables de decision

sol$solution


#cantidad de puertas a producir por semana
#                                         x1=94.6666667
#equivale a 94 puertas semanales

#cantidad de rejas a producir por semana
#                                         x1=0

#cantidad de ventanas a producir por semana
#                                         x1=0.6666667

#equivale a 0 ventanas semanales.

#¿Existe alguna diferencia en términos de las cantidades de materia prima no 
#consumida? Explique el resultado obtenido.

#holgura 1a restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]

#Se utiliza los 300 mts de lamina, por lo cual la primera variable de holgura es:

#  S1=0

#por lo tanto no sobran metros de lamina


#holgura 2da restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]

#Se utilizan 192.6667 mts de angulo, 2da variable de holgura es:

#  S2 = 400 - 192.6667 = 207.3333

# sobran 207.3333 mts de angulo.


#Holgura 3era restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]

#Se utiliza los  190 mts de tubo, 3era variable de holgura es:

#  S3=0

# no sobran metros de tubo

# sobran 0 metros de tubo.


# existe diferencia en las cantidades de materia prima no consumida,
# en las laminas se mantienen igual , angulos del 1er ejercicio sobra
# 200 mts en este sobran 207.3 mts y en el primer ejercicio #sobran 40 mts 
y aqui no sobra material. 


#Valor optimo de la FO. La utilidad óptima que obtendrá la
#compañia al producir según el plan óptimo de producción encontrado es:

sol  

# Es decir, se obtienen ZMAX=571.3333 unidades monetarias de utilidad menos 
# que en el escenario original. por ende deja de ser una solucion optima.

sol$duals[1:3]

#Aumento/decremento de ZMAX si b1 aumenta/decrece en una unidad.
#Y1=0.08888889

#Aumento/decremento de ZMAX si b2 aumenta/decrece en una unidad.
#Y2=0.0000000

#Aumento/decremento de ZMAX si b3 aumenta/decrece en una unidad.
#Y3=2.8666667


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


#El costo unitario de las actividades podria variar
#en estos intervalo sin que modifique el plan optimo de producción.
#los valores de la  produccion de:puerta, rejas, ventanas, podrian
#ver modificado valor unitario, pero no afecta el plan óptimo, pero si podria
#modificar el Z.


#   1.20 <= c1 <= 1.20                      
#                                       
#  -1.00 <= c2 <= -1.00                      
#                                       
#  -1.00 <= c3 <= -1.00



#Analisis de sensibilidad para los coeficientes bi.

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

#Comentario= Los coeficientes de las restricciones pueden variar de acuerdo
#al siguientes intervalos y esto no afectará los precios sombra Y*

#    285  <= b1 <= 1.47 e3 
#                        
#    193  <= b2 <= 100  e30
#
#   12.5  <= b3 <= +inf
  




###########################################################


#Debido a un error de conteo en la bodega de materias primas, el gerente de 
#producción se dá cuenta que la cantidad de lámina es 90 metros superior a la 
#que originalmente se disponía.



#F)Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.

#modelo matematico completo


# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 390 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                x1,x2,x3 => 0 (no negatividad)


f <-c(390,200,240)

f

#plan optimo

sol<-lp(direction = "max",
        const.mat = A,
        const.rhs = f,
        const.dir = D,
        objective.in = C,
        compute.sens = 1)

#Valores optimos para las variables de decision

sol$solution

#cantidad de puertas a producir por semana
#                                         x1=100

#cantidad de rejas a producir por semana
#                                         x1=0

#cantidad de ventanas a producir por semana
#                                         x1=0

#al aumentar 90 metros de lamina, no se alcanza a producir ninguna otra puerta,
#reja y ventana , sobra mas material, por lo que aumenta solo la lamina y 
#para producir necesitamos mas metros de tubo y angulo.

#G) En el caso que la solución deje de ser óptima, haga los cambios necesarios 
#al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos se
#deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen todas 
#las materias primas disponibles? En el caso que alguna(s) de ellas no sea(n) 
#completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.


## No hay diferencia en la solución óptima en relacion al escenario original por lo tant la solución es óptima


#holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]


#Se utilizan los 300 metros de lamina, 1era variable de holgura es:

#  S1 = 390 - 300 = 90

#por lo tanto sobran 90 metros de lamina

#holgura 2da restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 mts de angulo, por lo tanto la 2da variable de holgura es:

#  S2 = 400 - 200 = 200

# Significa que sobran 200 mts de angulo.


#Holgura 3era restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]

#Se utilizan 200 mts de tubo, la 2da variable de holgura es:

#  tubo = 240 - 200 = 40

# por lo tanto  sobran 40 mts de tubo

# Significa que sobran 0 mts de tubo.

sol

# Se obtiene ZMAX=600 unidades monetarias de utilidad.    



sol$duals[1:3]

#Aumento/decremento de ZMAX si b1 aumenta/decrece en una unidad.
#Y1=0

#Aumento/decremento de ZMAX si b2 aumenta/decrece en una unidad.
#Y2=3

#Aumento/decremento de ZMAX si b3 aumenta/decrece en una unidad.
#Y3=0

#Analisis de sensibilidad para coeficientes de la FO.


tibble(c = c("c1","c2","c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.from)

#Resultado

#c          min      max
#<chr>    <dbl>    <dbl>
# c1     2.00e 0  2.00e 0
# c2    -1.00e30 -1.00e30
# c3    -1.00e30 -1.00e30



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

#Los coeficientes de las restricciones pueden variar de acuerdo
#a los siguientes intervalos y esto no afecta precios sombra Y*

#    300 <= b1 <= 1.00 
#                        
#      0 <= b2 <= 2.40 
#
#    200 <= b3 <= +inf 


#################################################################



#Desde el departamento de ventas, el equipo de análisis hace llegar un reporte
#indicando que la demanda de rejas probablemente aumente, por lo que suguieren
#incrementar en $2 la utilidad de éstas.

#Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.

#modelo matematico 


#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#Lamina             3m       5m      24m          300m
#Angulo             2m       4m      5m           400m
#Tubo               2m       3m      1m           240m

#utilidad por u.    $6       $4      $5


#modelo matemático

# Max Z = 6x1 + 4x2 + 5x3

# S. A.


#    3x1  +  5x2  +  24x3 <= 300 restriccion para los mts de lamina
#    2x1  +  4x2  +  5x3  <= 400 restriccion para los mts de angulo
#    2x1  +  3x2  +  1x3  <= 240 restriccion para los mts de tubo
#                x1,x2,x3 => 0 (restriccion de no negatividad)

# H) Analice si la solución óptima original sigue siendo óptima bajo bajo este posible
# escenario

#Coeficientes de la FO

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

# se podria seguir produciendo 100 puertas, 0 rejas y 0 ventanas, similar la
# escenario original de este ejercicio

# i) ¿Existe alguna diferencia en términos de las cantidades de materia prima no consumida? 
# Explique el resultado obtenido.


# Holgura 1era restricción
3*sol4$solution[1]+5*sol4$solution[2]+24*sol4$solution[3]

#[1] 300

#Se utilizan los 300 mt de material por lo tanto, la 1era variable de holgura es:

# S1 = 0

#Holgura 2da restricción

2*sol4$solution[1]+4*sol4$solution[2]+5*sol4$solution[3]

# [1] 200

#Se utilizan 200 mts de ángulo, 2da variable de holgura es :

#S2 = 400 - 200 = 200 

#significa que sobran 200 mts de ángulo.

#Holgura 3era restricción

2*sol4$solution[1]+3*sol4$solution[2]+1*sol4$solution[3]

#[1] 200
# Se utilizan 200 metros de tubo, 3era variable de holgura es:

#S3 = 240 - 40 = 200

# Sobran 200 mts de tubo.

#  i): respuesta
#No existe diferencia en las cantidades consumidas en relacion al escenario original



#Valor óptimo de la FO. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado por FO es 600 

sol4
# FO 600
# No hay diferencia en la solución óptima respecto al escenario original.


###############################################################

#El mismo equipo de análisis del departamento de ventas recomienda ahora 
#disminuir en $3 la utilidad de cada puerta y aumentar en la misma cantidad 
#la utilidad de cada ventana, respondiendo así a una baja en la demanda de 
#las primeras y un aumento en la de las segundas.



#J)Haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad 
#de cada uno de los artículos se deben fabricar ahora? ¿Cuál es la utilidad 
#óptima obtenida? ¿Se consumen todas las materias primas disponibles? En el 
#caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto
#de ésta(s) no son utilizadas.


#                  Puerta   Reja   Ventana   Disponibilidad
#                                              por semana
#Lamina             3m       5m      24m          300m
#Angulo             2m       4m      5m           400m
#Tubo               2m       3m      1m           240m

#utilidad por u.    $3       $2      $8


#modelo matemático

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
#                                         x1=0

#cantidad de ventanas a producir por semana
#                                         x1=0



#holgura primera restricción:

3*sol5$solution[1]+5*sol5$solution[2]+24*sol5$solution[3]

#[1] 300

#Se utilizan los 300 mts de lamina, 1era variable de holgura es:

#  S1=0

#holgura 2da restricción:

2*sol5$solution[1]+4*sol5$solution[2]+5*sol5$solution[3]

#[1] 200

#Se utilizan 200 metros de angulo, 2da  variable de holgura es:

#  S2=400-200=200

# significa que sobra 200 mts de angulo.


#Holgura 3era restriccion:

2*sol5$solution[1]+3*sol5$solution[2]+1*sol5$solution[3]

#[1] 200

#Se utilizan 200 metros de tubo, 3era variable de holgura es:

#  S3=240-200=40

#  sobran 40 mts de tubo.

sol5
#Success: the objective function is 300, es decir se obtienen  ZMAX= 300 unidades monetarias de utilidad

# Bajo este escenario, el resultado en la maximización de utilidades es menor que el escenario
#original por lo cual la solución no es óptima


####################################################


#El gerente de producción está evaluando un cambio en el proceso de producción
#de las rejas. Este cambio implica que la asignación de recursos para cada
#reja se modifica, requiriendo ahora 7 metros de lámina, 8 metros de ángulo 
#y 9 metros de tubo.


#K)Haga los cambios necesarios al modelo matemático y resuelva. ¿Qué cantidad
# de cada uno de los artículos se deben fabricar ahora? ¿Cuál es la utilidad
#óptima obtenida? ¿Se consumen todas las materias primas disponibles? En el
#caso que alguna(s) de ellas no sea(n) completamente consumida(s), diga cúanto 
#de ésta(s) no son utilizadas.


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

H <- matrix (c (3 , 7 , 24,
                2 , 8 , 5,
                2 , 9 , 1),
             ncol = 3,
             byrow = TRUE)

H

#Direccion de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

#Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan optimo de produccion. 


sol <- lp(direction = "max",
          const.mat = H,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C)
#Valores optimos para las variables de decision

sol$solution


#cantidad de puertas a producir por semana
#                                         x1=100

#cantidad de rejas a producir por semana
#                                         x2=0

#cantidad de ventanas a producir por semana
#                                         x3=0

#holgura primera restricción:

3*sol$solution[1]+7*sol$solution[2]+24*sol$solution[3]


#Se utilizan los 300 mts de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura 2da restricción:

2*sol$solution[1]+8*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 mts de angulo, 2da variable de holgura es:

#  S2=400-200=200

# sobran 200 metros de angulo.



#Holgura 3era restriccion:

2*sol$solution[1]+9*sol$solution[2]+1*sol$solution[3]

#Se utilizan 200 mts de tubo, 3era variable de holgura es:

#  S3=240-200=40

# Sobran 40 metros de tubo.


#Valor optimo de la FO. La utilidad óptima que obtendrá la compañia 
#al producir en base al plan óptimo de producción es:

sol

# Es decir, se obtienen ZMAX=600 unidades monetarias de utilidad, es igual al original

sol$duals[1:3]

#Aumento/decremento de ZMAX si b1 aumenta/decrece en una unidad.
#Y1=2

#Aumento/decremento de ZMAX si b2 aumenta/decrece en una unidad.
#Y2=0

#Aumento/decremento de ZMAX si b3 aumenta/decrece en una unidad.
#Y3=0


#Analisis de sensibilidad para coeficientes de la funcion objetivo.


tibble(c = c("c1","c2","c3"),
       min = sol$sens.coef.from,
       max = sol$sens.coef.from)

#Resultado

#c          min      max
#<chr>    <dbl>    
# c1     8.57e-1  8.57e-1
# c2    -1.00e30 -1.00e30
# c3    -1.00e30 -1.00e30





#   8.57 <= c1 <= 8.57                     
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

#los coeficientes de las restricciones pueden variar de acuerdo
#al siguientes intervalos y esto no afectará los precios sombra Y*

#     0  <= b1 <= 3.60 
#                        
#    200 <= b2 <= 1.000  
#
#    200 <= b3 <= +inf 


######################################################################


#En base al resultado anterior, el gerente de producción decide evaluar otro 
#cambio en el proceso de fabricación de las rejas, requiriendo ahora 5 mts
#de ángulo, $34 metros de tubo y ninguno de lámina.


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


sol <- lp(direction = "max",
          const.mat = I,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C)
#Valores optimos para las variables de decision

sol$solution


#cantidad de puertas a producir por semana
#                                         x1=100.0000

#cantidad de rejas a producir por semana
#                                         x2=1.176471

#cantidad de ventanas a producir por semana
#                                         x3=0.000


#holgura 1era restricción:

3*sol$solution[1]+0*sol$solution[2]+24*sol$solution[3]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura 2da restricción:

2*sol$solution[1]+5*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 mts de angulo, 2da variable de holgura es:

#  S2=400-205.8824=194.1176

# Sobran 194.1176 mts de angulo.



#Holgura 3era restriccion:

2*sol$solution[1]+34*sol$solution[2]+1*sol$solution[3]

#Se utilizan 200 mts de tubo,  tercera variable de holgura es:

#  S3=240

# Esto significa que no sobran metros de tubo.


#Valor optimo de la FO. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol

# Es decir, se obtienen ZMAX=602.3529 unidades monetarias de utilidad, es mejor que 
#valor optimo  original


sol$duals[1:3]

#Aumento/decremento de ZMAX si b1 aumenta/decrece en una unidad.
#Y1=1.96078431

#Aumento/decremento de ZMAX si b2 aumenta/decrece en una unidad.
#Y2=0.0000000

#Aumento/decremento de ZMAX si b3 aumenta/decrece en una unidad.
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


#Los costos unitario de las actividades pueden cambiar 
#en estos intervalo sin que se modifique el plan optimo de producción, es decir,
#los valores de la produccion:puerta, rejas, ventanas , pueden
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

#Los coeficientes de las restricciones pueden variar de acuerdo
#al siguientes intervalos y esto no afectará los precios sombra Y*

#     0  <= b1 <= 3.60 
#                        
#    200 <= b2 <= 1.000  
#
#    200 <= b3 <= +inf 










#*******************************************************************************

#Desde el departamento de Marketing, luego de realizar un estudio de mercado,
#se dan cuenta que los clientes están prefiriendo comprar los productos a la 
#competencia ya que ésta los entrega pintados. Es necesario entonces evaluar
#si se pinta o no la producción, pero manteniendo constante las utilidades
#unitarias de cada producto. Para lograr esto, se planea utilizar semanalmente
#5.000 mililitros de pintura sobrante de otro proceso. Además, se sabe que una
#puerta consume 15 mililitros de pintura, una reja requiere 50 mililitros de
#pintura, mientras que una ventana necesita 20 mililitros.


#Analice si la solución óptima original sigue siendo óptima bajo este posible
#escenario. ¿Es posible entonces entregar los productos pintados para así no
#perder clientes? Explique.


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


#FO

# Max Z = 6x1 + 2x2 + 5x3

# Las restricciones 

#    3x1  +  5x2  +  24x3 <= 300   restriccion para los metros de lamina
#    2x1  +  4x2  +  5x3  <= 400   restriccion para los metros de angulo
#    2x1  +  3x2  +  1x3  <= 240   restriccion para los metros de tubo
#   15x1  + 50x2  + 20x3  <= 5.000 restriccion para produccion pintada
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#modelo matematico

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

A2 <- matrix (c (3 ,  5 , 24,
                 2 ,  4 ,  5,
                 2 ,  3 ,  1,
                 15, 50 , 20),
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
#                                         x1=100

#cantidad de rejas pintadas a producir por semana
#                                         x1=0

#cantidad de ventanas pintadas a producir por semana
#                                         x1=0

#holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]


#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.



#Holgura tercera restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

#por lo tanto sobran 40 metros de tubo

#Holgura cuarta restriccion:

15*sol$solution[1]+50*sol$solution[2]+20*sol$solution[3]

#Se utilizan 1500 mililitros de pintura, por lo tanto la cuarta variable de holgura es:

#  S4=5000-1500=3500

# Esto significa que sobran 3500 mililitros de pintura.


#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol

# Es decir, se obtienen ZMAX=600 unidades monetarias de utilidad , es igual que el
#origuinal



#si la solución óptima original sigue siendo óptima bajo este posible escenario,
#a sique no habria problema en entregar los productos pintados.




#*******************************************************************************

#Mediante otro estudio de mercado, se proyecta que es posible que en los 
#próximos períodos, máximo se podrán vender 60 puertas por semana.


#Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.


#En el caso que la solución deje de ser óptima, haga los cambios necesarios 
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
#                     x1  <=  60 restricción para venta de puertas por semana.
#                x1,x2,x3 => 0 (restriccion de no negatividad)

#modelo matemático completo

# Max Z = 6x1 + 2x2 + 5x3

#S.A.

#    3x1  +  5x2  +  24x3 <= 300 metros de lamina
#    2x1  +  4x2  +  5x3  <= 400 metros de angulo
#    2x1  +  3x2  +  1x3  <= 240 metros de tubo
#                     x1  <= 60 venta de puertas por semana
#                x1,x2,x3 => 0 (no negatividad)


#Coeficientes de la función objetivo

C <- c(6,2,5)

C
#[1] 6 2 5

#Matriz de coeficientes de las restricciones

A15 <- matrix(c(3, 5, 24,
                2, 4, 5,
                2, 3, 1,
                1, 0, 0),
              ncol = 3,
              byrow = TRUE)

A15
#       [,1] [,2] [,3]
# [1,]    3    5   24
# [2,]    2    4    5
# [3,]    2    3    1
# [4,]    1    0    0

#Direccion de las desigualdades de las restricciones

D15 <- c( "<=","<=","<=", "<=")


D15
#"<=" "<=" "<=" "<="

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
#[1] 60 24  0

#cantidad de puertas a producir por semana
#                                         x1=60

#cantidad de rejas a producir por semana
#                                         x1=24

#cantidad de ventanas a producir por semana
#                                         x1=0
#holgura primera restricción:

3*sol15$solution[1]+5*sol15$solution[2]+24*sol15$solution[3]
#[1] 300

# Se utilizn los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=300 - 300 = 0

#Esto significa que se uutilizan los 300 mt de lámina
#holgura segunda restricción:

2*sol15$solution[1]+4*sol15$solution[2]+5*sol15$solution[3]
#[1] 216

# Se utilizan los 216 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-216=184

# Esto significa que sobran 184 metros de angulo.


#Holgura tercera restriccion:

2*sol15$solution[1]+3*sol15$solution[2]+1*sol15$solution[3]
#[1] 192

# Se utilizan los 192 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-192 = 48

# Esto significa que sobran 48 metros de tubo.

#Holgura cuarta restricción

1*sol15$solution[1] + 0*sol15$solution [2] + 0*sol15$solution[3]
#[1] 60

# Se venden 60 puertas a la semana, por lo tanto la cuarta variable de holgura es 

#S4 = 60 - 60 = 0

# Es decir, sobran 0 puertas para vender por semana.


#*******************************************************************************

#En un tercer estudio, el departamento de Marketing concluyó que en los próximos 
#períodos es muy probable que la cantidad de ventanas a vender sea mínimo 60 
#unidades semanales.


#Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario.


#En el caso que la solución deje de ser óptima, haga los cambios necesarios 
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
#                     x3  >= 60 venta de ventanas por semana
#                x1,x2,x3 => 0 (no negatividad)


#Coeficientes de la función objetivo

C <- c(6,2,5)

C
#[1] 6 2 5

#Matriz de coeficientes de las restricciones

A16 <- matrix(c(3, 5, 24,
                2, 4, 5,
                2, 3, 1,
                0, 0, 1),
              ncol = 3,
              byrow = TRUE)

A16
#       [,1] [,2] [,3]
# [1,]    3    5   24
# [2,]    2    4    5
# [3,]    2    3    1
# [4,]    0    0    1

#Direccion de las desigualdades de las restricciones

D16 <- c( "<=","<=","<=", ">=")


D16
#"<=" "<=" "<=" ">="

#Coeficientes lado derecho de las restricciones

B16 <- c(300,400,240,60)

B16
#[1] 300 400 240  60

#Plan óptimo de producción


sol16 <- lp(direction = "max",
            const.mat = A16,
            const.rhs = B16,
            const.dir = D16,
            objective.in = C,
            compute.sens = 1)

#Valores optimos para las variables de decision

sol16$solution
#[1] 0 0 0

#cantidad de puertas a producir por semana
#                                         x1=0

#cantidad de rejas a producir por semana
#                                         x1=0

#cantidad de ventanas a producir por semana
#                                         x1=0
#holgura primera restricción:

3*sol16$solution[1]+5*sol16$solution[2]+24*sol16$solution[3]
#[1] 0

# Se utilizan 0 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=300 - 0 = 300

#Esto significa que sobran los 300 mt de lámina

#holgura segunda restricción:

2*sol16$solution[1]+4*sol16$solution[2]+5*sol16$solution[3]
#[1] 0

# Se utilizan 0 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-0=400

# Esto significa que sobran 400 metros de angulo.


#Holgura tercera restriccion:

2*sol16$solution[1]+3*sol16$solution[2]+1*sol16$solution[3]
#[1] 0

# Se utilizan 0 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-0 = 240

# significa que sobran 240 metros de tubo.

#Holgura cuarta restricción

1*sol16$solution[1] + 0*sol16$solution [2] + 0*sol16$solution[3]
#[1] 0

# Se producen 0 ventanas a la semana, por lo tanto la cuarta variable de holgura es 

#S4 = 60 - 0 = 60

# Es decir, faltan 60 ventanas para vender por semana.

#En la primera solucion del modelo cuenta como respuesta solo 100 puertas, ahora
#bajo este nuevo lineamiento, se indica necesario consderar la creacion de 60 ventanas 
#las cuales nunca se an cosiderado para el modelo matematico, por ende ahora como
#respuesta se obtiene una no solucion factible, ya que, no procede la produccion de 60
#ventanas como minimo.

#Ademas, en un simple calculo, lo necesario para  producir un minimo de 60 ventanas 
#son los siguientes materiales

#Para 60 ventanas se necesita 1440m de lamina, hay disponible 300m, deficit de 1140m
#Para 60 ventanas se necesita  300m de angulo, hay disponible 400m, superavit de 100m
#Para 60 ventanas se necesita   60m de tubo, hay disponible 240m, superavit de 180m

#La cantidad de lamina faltante es muy alta y su valor final (utilidad)es muy bajo para 
#hacerlo viable.


#************************************************************************************

#La Gerencia esta evaluando la posibilidad de fabricar un nuevo producto, 
#sillas metálicas, a las cuales se les ha asignado una utilidad unitaria 
#de $3 y se ha establecido que cada una requiere 5 metros de lámina, 10 
#metros de ángulo y 24 metros de tubo.

#Analice si la solución óptima original sigue siendo óptima bajo este 
#posible escenario. ¿En base al resultado obtenido, ¿es rentable producir
#sillas? Explique.


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
#                                         x1=100

#cantidad de rejas  a producir por semana
#                                         x1=0

#cantidad de ventanas a producir por semana
#                                         x1=0

#cantidad de sillas a producir por semana
#                                         x1=0

#holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]+5*sol$solution[4]
#[1] 300

#Se utilizan los 300 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=0

#holgura segunda restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]+10*sol$solution[4]
#[1] 200

#Se utilizan 200 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-200=200

# Esto significa que sobran 200 metros de angulo.


#Holgura tercera restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]+24*sol$solution[4]
#[1] 200

#Se utilizan 200 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-200=40

#por lo tanto sobran 40 metros de tubo



#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol

# Es decir, se obtienen ZMAX=600 unidades monetarias de utilidad, es igual de optimo
#que el problema origuinal


# Segun los resultados obtenidos no es rentable la produccion de sillas, ya que 
# consume mas material que los otros productos y a su vez su utilidad es mas baja. 
# El modelo explica que sigue siendo mejor y mas rentable la produccion de puertas.


#*******************************************************************************


#El Gerente está obsesionado con agregar un nuevo producto para ser más
#competitivo. Esta vez, encarga que se analice la factibilidad de fabricar 
#lockers, para cada uno de los cuales se ha estimado una utilidad de $10.
#Además, se estableció que cada unidad consume 3 metros de lámina, 2 metros 
#de ángulo y 5 metros de tubo.

#Analice si la solución óptima original sigue siendo óptima bajo este posible 
#escenario.
#En el caso que la solución deje de ser óptima, haga los cambios necesarios
#al modelo matemático y resuelva. ¿Qué cantidad de cada uno de los artículos 
#se deben fabricar ahora? ¿Cuál es la utilidad óptima obtenida? ¿Se consumen
#todas las materias primas disponibles? En el caso que alguna(s) de ellas no 
#sea(n) completamente consumida(s), diga cúanto de ésta(s) no son utilizadas.
#¿Es recomendable incluir este nuevo producto? Explique.


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

C7<- c(6,2,5,10)

C

#Matriz de coeficientes de las restricciones

A4 <- matrix (c (3 , 5 , 24,3,
                2 , 4 , 5, 2,
                2 , 3 , 1, 5),
             ncol = 4,
             byrow = TRUE)

A4

#Direccion de las desigualdades de las restricciones

D <- c( "<=","<=","<=")

D

#Coeficientes lado derecho de las restricciones

B <- c(300,400,240)

B

# Plan optimo de produccion. 


sol <- lp(direction = "max",
          const.mat = A4,
          const.rhs = B,
          const.dir = D,
          compute.sens = 1,
          objective.in = C7)
#Valores optimos para las variables de decision

sol$solution


#cantidad de puertas a producir por semana
#                                         x1=86.66667

#cantidad de rejas a producir por semana
#                                         x1=0.00000

#cantidad de ventanas a producir por semana
#                                         x1=0.00000


#cantidad de lockers a producir por semana
#                                         x1=13.33333


#holgura primera restricción:

3*sol$solution[1]+5*sol$solution[2]+24*sol$solution[3]
#[1] 260

#Se utilizan 260 metros de lamina, por lo tanto la primera variable de holgura es:

#  S1=300-260=40

#esto significa que sobran 40 metros de lamina

#holgura segunda restricción:

2*sol$solution[1]+4*sol$solution[2]+5*sol$solution[3]
#[1] 173.3333

#Se utilizan 173.3333 metros de angulo, por lo tanto la segunda variable de holgura es:

#  S2=400-173.333=226.667

# Esto significa que sobran 226.667 metros de angulo.

#Holgura tercera restriccion:

2*sol$solution[1]+3*sol$solution[2]+1*sol$solution[3]
#[1] 173.3333

#Se utilizan 173.3333 metros de tubo, por lo tanto la tercera variable de holgura es:

#  S3=240-173.3333=66.6667

# Esto significa que sobran 66.6667 metros de tubo.



#Valor optimo de la funcion objetivo. La utilidad óptima que obtendrá la compañia 
#al producir según el plan óptimo de producción encontrado es:

sol

# Es decir, se obtienen ZMAX=653.3333 unidades monetarias de utilidad,es decir 
#es ,mas optimo que el escenario origuinal

# Se recomineda la integracion de este producto ya que en el primer caso se obtienen
# 600 unidades monetarias por semana en concepto de ventas, con este nuevo producto
# se obrienen 653.333 unidades monetarias mensuales con la misma cantidad de materias
# primas disponibles en el primer caso.





