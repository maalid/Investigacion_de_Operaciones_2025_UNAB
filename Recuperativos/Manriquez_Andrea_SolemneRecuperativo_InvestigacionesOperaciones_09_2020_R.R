#SOLEMNE RECUPERATIVO 1

#nombre: ANDREA MANRIQUEZ

#EJERCICIO 1

#La administración de High Tech Service (HTS) desea desarrollar un modelo que le ayude a 
#asignar el tiempo de sus técnicos entre llamada de servicio por contrato a clientes 
#tanto normales como nuevos. En el período de planeación de dos semanas hay disponible 
#un máximo de 80 horas de tiempo de técnico. A fin de satisfacer los requisitos de flujo 
#de caja, deben generarse por lo menos 800 dólares de ingresos (por técnico) durante el 
#período de dos semanas. El tiempo de técnico para los clientes normales genera 25 dólares 
#por hora, pero para clientes nuevos sólo genera un promedio de 84 dólares la hora, porque 
#en muchos casos el contacto con el cliente no llega a generar servicios facturables. Para 
#asegurarse de que se mantienen contactos nuevos, el tiempo de técnico utilizado en contactos 
#con clientes nuevos debe ser por lo menos 60% del tiempo utilizado en contactos con 
# clientes normales. Para los requerimientos de ingresos y políticas enunciadas, HTS desearía 
#determinar cómo asignar el tiempo de los técnicos entre clientes normales y nuevos, a fin de 
#maximizar el número total de clientes en contacto durante el período de dos semanas. 
#Los técnicos requieren un promedio de 50 minutos por cada contacto de cliente normal y de 
#Una hora por cada contacto con cliente nuevo.

#a)Defina correctamente todas las variables de decisión
#b)Escriba la función objetivo
#c)Escriba las restricciones asociadas al problema 
#d)Plantee matemáticamente el modelo completo asociado al problema
#e)Encuentre el plan óptimo de producción e interprete los resultados.
#f)Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción
# obtenido e interprete los resultados



#Desarrollo


#a)Defina correctamente todas las variables de decisión

#Definición de variables

# X1 = Número de horas de técnico asignado a clientes normales
# X2 = Número de horas de técnico asignado a clientes nuevos

#b)Escriba la función objetivo

# Función Objetivo(1,2 + 1)

#     max Z= 50X1/60 + 60X2/60(maximizar el número total de clientes a través del tiempo 
#                             de contacto por cliente)
#     
#     max Z= 0,83X1  + 1X2 

#c)Escriba las restricciones asociadas al problema

#Restricciones

# X1 + X2 <= 80 Horas disponibles de técnico
# X2 >= 0.6X1 Relación de tiempo de técnico
#25X1 + 8X2 >= 800 ingreso en dólares

# Xi >= 0; i= 1,2 (Condición de No negatividad)

#d)Plantee matemáticamente el modelo completo asociado al problema

# Zmax = 50X1 + 60X2 (número de clientes)
#
# s. A.
#
# X1 + X2    <= 80 minutos disponibles de técnico
# X2         >= 0.6X1 Relación de tiempo de técnico
# 25X1 + 8X2 >= 800 ingreso en dólares
#


# Coeficientes de la función objetivo
C<- c(0.83, 1)
C

# C
#[1] 0.83 1.00


#Matriz de coeficientes de las restricciones

A <- matrix(c(1, 1, 
             1, 0,
            25, 8), 
             ncol=2, byrow = TRUE)

A

#A 
#     [,1] [,2]
#[1,]    1    1
#[2,]    1    0
#[3,]   25    8

#
# Dirección de las desigualdades de las restricciones

D <- c("<=", ">=",">=")

D

#D
#[1] "<=" ">=" ">="


#Coeficientes lado derecho de las restricciones

B <- c(80, 0.6, 800)

B
#B [1]  80.0   0.6 800.0

#e)Encuentre el plan óptimo de producción e interprete los resultados.

#Plan óptimo de producción

#install packages ("lpSolve")
library(lpSolve)


sol1<- lp (direction = "max",
           const.mat = A,
           const.rhs = B,
        objective.in = C,
          const.dir = D,
          compute.sens = 1)

sol1$solution


#> sol1$solution
# [1]  9.411765 70.588235

# El plan Óptimo de producción que es capaz asignar el tiempo de los técnicos entre clientes 
#normales y nuevos, a fin de maximizar el número total de clientes en contacto durante el 
#período de dos semanas es el siguiente:

# Asignar 9 horas y 41 minutos al tiempo de técnico para contacto con clientes normales 

# X1 = 9.41

# Asignar 70 horas y 58 minutos al tiempo de técnico para contacto con clientes nuevos 

# x2 =70.58


# Esto significa que el número de horas de técnico asignado a clientes normales será de
# 9 horas y 41 minutos. y el número de horas de técnico asignado a clientes nuevos será de 70 horas y 58 minutos.


#f)Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción
# obtenido e interprete los resultados

sol1

#Success: the objective function is 78.4 

# Z = 78.4

# El valor óptimo de la función objetivo de acuerdo al plan óptimo de  producción obtenido es de 
# 78.4. Esto quiere decir que es el tiempo en promedio de contacto para  clientes nuevos y 
# antiguos a fin de maximizar el el número total de clientes en contacto durante el período de 
# dos semanas.
# Asegurándose de que el tiempo de técnico utilizado en contactos con clientes nuevos debe ser 
# por lo menos 60% del tiempo utilizado en contactos con clientes normales.


#===============================================================================================
#===============================================================================================

# Ejercicio 2
#La Ebel Mining Company es propietaria de dos minas que producen cierto tipo de mineral. 
# Dichas minas están localizadas en distintas partes del país y, en consecuencia, 
# presentan diferencias en sus capacidades de producción y en la calidad de su mineral. 
# Después de ser molido el mineral se clasifica en tres clases dependiendo de la calidad: 
# alta, media y baja. Ebel ha sido contratada para suministrar semanalmente a la planta 
# de fundición de su compañía matriz 12 toneladas de mineral de alta calidad, 88 toneladas
# de calidad mediana y 24 toneladas de calidad baja. A Ebel le cuesta $20.000
# diarios operar la primera mina y $16.000 la segunda. Sin embargo en un día de 
# operación la primera mina produce 66 tonelada de mineral de alta calidad, 22 toneladas de
# mediana y 44 toneladas de baja, mientras que la segunda produce 22 toneladas diarias de 
# material de alta calidad, 22 de mediana y 12 de baja. ¿Cuántos días a la semana tendrá
# que funcionar cada mina para cumplir los compromisos de Ebel de la manera más económica 
# posible? (En este caso resulta aceptable programar la operación de las minas en 
#fracciones de día).

#a.	Defina correctamente todas las variables de decisión.
#b.	Escriba la función objetivo.
#c.	Escriba las restricciones asociadas al problema.
#d.	Plantee matemáticamente el modelo completo asociado al problema.
#e.	Encuentre el plan óptimo de producción e interprete los resultados.
#f.	Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.
#g.	Realice un análisis de sensibilidad completo.


# Desarrollo:

#  ____________________________________________________________________________________________
# |        |             |             |                |                |                     |
# | MINA   |   ALTA      |  MEDIA      |   BAJA         |    COSTOS      |  TIEMPO             |
# |        | CALIDAD     | CALIDAD     |  CALIDAD       |    DIARIOS     |  UTILIZADO (SEMANAS)|
# |________|_____________|_____________|________________|________________|_____________________|
# |        |             |             |                |                |                     |
# |  1     |       6     |      2      |      4         |    $ 20 mil    |       1             |
# |________|_____________|_____________|________________|________________|_____________________|
# |        |             |             |                |                |                     |
# |  2     |       2     |      2      |      12        |    $ 16 mil    |       1             |
# |________|_____________|_____________|________________|________________|_____________________|
# |        |             |             |                |                |                     |
# | TOTALES|      8      |      4      |      16        |                |                     |
# |________|_____________|_____________|________________|________________|_____________________|                    
# 
# a) Defina correctamente todas las variables de decisión.

# x1 = Número de días a la semana de trabajo de la mina 1 
# x2 = Número de días a la semana de trabajo de la mina 2

# b) Escriba la función objetivo 

# Min Z = 20X1 + 16 X2 (miles de dólares)


# c)Escriba las restricciones asociadas al problema.

# 6x1 +2x2 >=12 (mineral de alta calidad)
# 2x1 + 2x2 >= 8 (mineral de mediana calidad)
# 4x1 + 12x2 >= 24 (mineral baja calidad)
# x1 + x2 <= 7 tiempo máximo, 1 semana (7 días)

# Xi >= 0; i= 1, 2 (Condición de No negatividad)

# d)	Plantee matemáticamente el modelo completo asociado al problema.

#  Min Z = 20X1 + 16 X2 (miles de dólares)
#
# S. A.
#
# 6x1 +2x2 >=12 (mineral de alta calidad)
# 2x1 + 2x2 >= 8 (mineral de mediana calidad)
# 4x1 + 12x2 >= 24 (mineral baja calidad)
# x1 + x2 <= 7 tiempo máximo, 1 semana (7 días)
#


# Transcribimos el modelo anterior a R

#Coeficientes de la función objetivo
C2 <-c(20,16)

C2
#C2
#[1] 20 16


#Matriz de coeficientes de las restricciones 

A2 <- matrix(c (6, 2, 
               2, 2, 
               4, 12,
               1, 1), ncol=2, byrow = TRUE)

A2
#A2               
#     [,1] [,2]
#[1,]    6    2
#[2,]    2    2
#[3,]    4   12
#[4,]    1    1

#Dirección de las desigualdades de las restricciones

D2 <- c(">=",">=",">=","<=")

D2
#D
# [1] ">=" ">=" ">=" "<="


#Coeficientes lado derecho de las restricciones

B2 <-c(12, 8, 24, 7)

B2
#B2
#[1] 12  8 24  7

#Plan óptimo de Producción: Resolvemos

#install.packages ("lpSolve")
library(lpSolve)

sol2 <- lp(direction ="min",
         const.mat = A2,
         const.rhs = B2,
         objective.in = C2,
         const.dir =D2,
         compute.sens = 1)

#Valores óptimos para las variables de decisión 
#(incluidas las variables auxiliares de holgura)

sol2$solution
#[1] 1 3

# Número de días de trabajo de la mina 1 =

# x1 = 1

# Número de días de trabajo de la mina 2 = 

# x2 = 3

#Holgura primera restrición

6*sol$solution[1] + 2*sol$solution[2]

#[1] 6
# S1 = 12 - 6 = 6

#Sobran 6 toneladas de mineral de alta calidad


#Holgura segunda restricción 

2*sol$solution[1] + 2*sol$solution[2]
#
#[1] 2
#
#S2 = 8 - 2 = 6
#S2 = 6

# Esto significa que sobran 6 toneladas de mineral de mediana calidad
#
# 
4*sol$solution[1] + 12*sol$solution[2]
# [1] 4
#
#S3 = 24 - 4 = 4
#S3 = 4

#Esto significa que sobran 4 toneladas de mineral de baja calidad

1*sol$solution[1] + 1*sol$solution[2]
#[1] 1

# S4 = 7-1 = 6
# S4 = 6

#Esto significa que sobran 6 días de la semana 


#Valor óptimo de la función objetivo:


sol2

# Success: the objective function is 68 

#El valor del plan ótimo en total será de 68 miles de dólares por semana, 
# ya que al operar la mina 1, un días de la semana, tiene un valor de 20 dólares y por 3 días nos
# daría como resultado $48 miles de dólares.

#Además, esta solucíón plantea que es necesario que la mina 1 opere solo un día de la semana y la
# mina 2 opere solo 3 días a la semana para llevar a cabo el plan óptimo.

# g) Realice Análisis de sensibilidad completo

# g.1 Análisis de sensibilidad para los coeficientes de los recursos (lado derecho de las restricciones),
#     bi) El incremento/decremento de una unidad en bim produce aumento/disminución en Z* igual al
#     sombra Yi. En efecto

sol2$duals[1:4]

#[1]  1  7  0 0

# Aumento/decremento de Z* si b1 aumenta/decrece en una unidad

# Yi = 1

# Aumento/decremento de Z* si b2 aumenta/decrece en una unidad

# Y2 = 7

#Aumento/decremento de Z* SI b3 aumenta/decrece en una unidad

# Y3 = 0

#Aumento/decremento de Z* si b4 aumenta/decrece en una unidad

#Y4 = 0

#g.2 Análisis de sensibilidad para coeficientes de la función objetivo. El plan de producción
# óptimo "X" no cambia, pero si cambia Z* ya que cambian los coeficientes cj.


tibble (c=c("c1","c2" ),
       min = sol$sens.coef.from,
       max = sol$sens.coef.to)






#=======================================================================================================
#=======================================================================================================

# Ejercicio 3
#
# La administración de un viñedo desea combinar cuatro cosechas distintas para producir 
#tres tipos distintos de vinos en forma combinada. Las existencias de las cosechas y 
#los precios de venta de los vinos combinados se muestran en la tabla, junto con ciertas 
#restricciones sobre los porcentajes incluidos en la composición de las tres mezclas.
#En particular, las cosechas 2 y 3 en conjunto deberán constituir cuando menos 75% 
# de la mezcla de A y cuando menos 35% de la mezcla C. Además, la mezcla A deberá 
#contener cuando menos el 8% de la cosecha 4, mientras que la mezcla B deberá contener
#por lo menos 10% de la cosecha 2 y a lo sumo 35% de la cosecha 4. Se podrá vender
#cualquier cantidad que se elabore de las mezclas A, B y C.
#
#
# __________________________________________________________________________________________
# |           |                         COSECHA                             |    PRECIO     |
# | MEZCLA    |_____________________________________________________________|  VENTA/GALON  |
# |           |       1     |      2      |      3         |       4        |               |
# |___________|_____________|_____________|________________|________________|_______________|
# |           |             | CUANDO MENOS 75% 2 Y 3       |CUANDO MENOS    |               |
# |  A        |       *     | EN CUALQUIER PROPORCIÓN      |8%              |      $ 80     |
# |___________|_____________|______________________________|________________|_______________|
# |           |             |CUANDO MENOS |                |CUANDO MUCHO    |               |
# |  B        |       *     |10%          |      *         |35%             |      $ 50     |
# |___________|_____________|_____________|________________|________________|_______________|
# |           |             | CUANDO MENOS 35% 2 Y 3       |                |               |               |
# |  C        |       *     | EN CUALQUIER PROPORCIÓN      |                |      $ 35     |
# |___________|_____________|______________________________|________________|_______________|
# |EXISTENCIAS|             |             |                |                |               |
# |(GALONES)  |       130   |   200       |     150        |      350       |               |
# |___________|_____________|_____________|________________|________________|_______________|
# | * indica que no existe restricción alguna                                                                                       |
# |                                                                                         |
# |_________________________________________________________________________________________|                    
# 
# a.	Defina correctamente todas las variables de decisión.
# b.	Escriba la funcion objetivo que optimiza.
# c.	Escriba las restricciones asociadas al problema.
# d.	Plantee matemáticamente el modelo completo asociado al problema.
# e.	Encuentre el plan óptimo de producción e interprete los resultados.
# f.	Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.
# g.	Realice un análisis de sensibilidad completo.

# Desarrollo

# a.	Defina correctamente todas las variables de decisión.

# X11 = Cantidad de galones de vino de la cosecha 1 para la mezcla A
# X12 = Cantidad de galones de vino de la cosecha 1 para la mezcla B
# X13 = Cantidad de galones de vino de la cosecha 1 para la mezcla C
# X21 = Cantidad de galones de vino de la cosecha 2 para la mezcla A
# X22 = Cantidad de galones de vino de la cosecha 2 para la mezcla B
# X23 = Cantidad de galones de vino de la cosecha 2 para la mezcla C
# X31 = Cantidad de galones de vino de la cosecha 3 para la mezcla A
# X32 = Cantidad de galones de vino de la cosecha 3 para la mezcla C
# X33 = Cantidad de galones de vino de la cosecha 3 para la mezcla C
# X41 = Cantidad de galones de vino de la cosecha 4 para la mezcla A
# X42 = Cantidad de galones de vino de la cosecha 4 para la mezcla B
# X43 = Cantidad de galones de vino de la cosecha 4 para la mezcla C

# b.	Escriba la funcion objetivo que optimiza.
#
# Función Objetivo

# max Z = 80X11 + 80X21 + 80X31 + 80X41 +
#         50 X12 + 50X22 + 50X32 + 50X42 + 
#         35 X13 + 35 X23 + 35 X33 + 35X43
#
# 

# c.	Escriba las restricciones asociadas al problema.

# X21 + x31       >= 0,75 por lo menos 75% de 2 y 3 en mezcla A
# X41             >= 0,08 cuando menos el 8% en mezcla A     
# X22             >= 0,10 cuando menos el 10% en mezcla B
# X42             <= 0,35 cuando mucho el 35% en mezcla B
# X23 + x33       >= 0,35 por lo menos 35% de 2 y 3 en C
# X11 + X12 + X13 <= 130 
# X21 + X22 + 23  <= 200
# X31 + X32 + X33 <= 150
# X41 + X42 + X43 <= 350

# Xij >= 0 ; i = 1, 4 ; j= 1, 3 (Condición de No negatividad)
# I = cosecha
# J= mezcla

# d.	Plantee matemáticamente el modelo completo asociado al problema.

#max Z =  80X11 + 80X21 + 80X31 + 80X41 +
#         50 X12 + 50X22 + 50X32 + 50X42 + 
#         35 X13 + 35 X23 + 35 X33 + 35X43
#
# S. A.
#
# X21 + x31 >= 0,75 por lo menos 75% de 2 y 3 en mezcla A
# X41 >= 0,08 cuando menos el 8% en mezcla A     
# X22 >= 0,10 cuando menos el 10% en mezcla B
# X42 <= 0,35 cuando mucho el 35% en mezcla B
# X23 + x33 >= 0,35 por lo menos 35% de 2 y 3 en C
# X11 + X12 + X13 <= 130 
# X21 + X22 + 23 <= 200
# X31 + X32 + X33 <= 150
# X41 + X42 + X43 <= 350
# Xij >= 0 ; i = 1, 4 ; j= 1, 3
# I = cosecha
# J= mezcla



# Trancribimos el modelo anterior a R

# Coeficientes de la función objetivo

C3 <- c(80, 80, 80, 80, 50, 50, 50, 50, 35, 35, 35, 35)

C3
#C3
# [1] 80 80 80 80 50 50 50 50 35 35 35 35


# Matriz de coeficientes de las restricciones

A3 <- matrix (c( 1, 1, 0,
                 1, 0, 0,
                 1, 0, 0,
                 1, 0, 0,
                 1, 1, 0,
                 1, 1, 1,
                 1, 1, 1,
                 1, 1, 1,
                 1, 1, 1), ncol= 3, byrow = TRUE)

A3

#A3
#       [,1] [,2] [,3]
# [1,]    1    1    0
# [2,]    1    0    0
# [3,]    1    0    0
# [4,]    1    0    0
# [5,]    1    1    0
# [6,]    1    1    1
# [7,]    1    1    1
# [8,]    1    1    1
# [9,]    1    1    1


# Dirección de las desigualdades de las restricciones

D3 <- c(">=",">=",">=","<=", ">=","<=","<=","<=","<=")

#D3
#[1] ">=" ">=" ">=" "<=" ">=" "<=" "<=" "<=" "<="


#Coeficientes lado derecho de las restricciones

B3 <- c(0.75, 0.08, 0.10, 0.35, 0.35, 130, 200, 150, 350)

B3
# B3
#[1]   0.75   0.08   0.10   0.35   0.35 130.00 200.00 150.00 350.00

# e)	Encuentre el plan óptimo de producción e interprete los resultados.

# Plan óptimo de Producción: Resolvemos

#install.packages("lpSolve)
library(lpSolve)

sol <- lp(direction = "max",
          const.mat = A3,
          const.rhs = B3,
          objective.in = C3,
          const.dir = D3,
          compute.sens = 1)

#Valores óptimos para las variables de decisión (incluidas las variables auxiliares de holgura)   

sol

sol$solution

#[1] 1 0 0 0 0 0 0 0 0 0 0 0

# El Plan óptimo de producción es el siguiente:

# X11 = Cantidad de galones de vino de la cosecha 1 para la mezcla A

# X11 = 1

# X12 = Cantidad de galones de vino de la cosecha 1 para la mezcla B

# X12 = 0

# X13 = Cantidad de galones de vino de la cosecha 1 para la mezcla C

# X13 = 0

# X21 = Cantidad de galones de vino de la cosecha 2 para la mezcla A

# X21 = 0

# X22 = Cantidad de galones de vino de la cosecha 2 para la mezcla B

# X22 = 0

# X23 = Cantidad de galones de vino de la cosecha 2 para la mezcla C

# X23 =0

# X31 = Cantidad de galones de vino de la cosecha 3 para la mezcla A

# X31 =0

# X32 = Cantidad de galones de vino de la cosecha 3 para la mezcla C

# X32 = 0

# X33 = Cantidad de galones de vino de la cosecha 3 para la mezcla C

# X33 = 0

# X41 = Cantidad de galones de vino de la cosecha 4 para la mezcla A

# X41 = 0

# X42 = Cantidad de galones de vino de la cosecha 4 para la mezcla B

# X42 = 0

# X43 = Cantidad de galones de vino de la cosecha 4 para la mezcla C

# X43 = 0


#Holgura primera restricción

1*sol$solution[1] + 1*sol$solution[2] + 0*sol$solution[3]

#[1] 1

# Se utiliza el el galón que había, por lo tanto la primera variable de holgura es:

# S1 = 0.75 - 1 = -0.25

#Holgura segunda restricción

1*sol$solution[1] + 0*sol$solution[2] + 0* sol$solution[3]

# [1] 1

# Se utiliza el el galón que había, por lo tanto la primera variable de holgura es:

# S2= 0.08 - 1 = -0.92

#Holgura tercera restricción

1*sol$solution[1] + 0*sol$solution[2] + 0* sol$solution[3]

# [1] 1

# Se utiliza 1 galón, por lo tanto la tercera variable de holgura es:

# S3 0.10 - 1 = 0.9 Por lo cual faltará un galón

#Holgura cuarta restricción

1*sol$solution[1] + 0*sol$solution[2] + 0* sol$solution[3]

#[1] 1

#Se utiliza 1 galón que hay por lo cual, la cuarta variable de holgura es :

#S4 = 0.35 - 1 = 0.65


#Holgura quinta restricción

1*sol$solution[1] + 1*sol$solution[2] + 0*sol$solution[3]

#[1] 1

#Se utiliza 1 galón, por lo cual la quinta variable de holgura es:

#S5 0.35 - 1 = -0.65 Por lo cual faltará 0.65 galon


#Holgura sexta restricción

1*sol$solution[1] + 1*sol$solution[2] + 1*sol$solution[3]

# [1] 1

# Se utiliza 1 galon, por lo cual la sexta variable de holgura es:

# S6 = 130-1 = 129 

#Holgura séptima restricción

1*sol$solution[1] + 1*sol$solution[2] + 1*sol$solution[3]

#[1] 1

#Se utiliza 1 galón, por lo cual la séptima variable de holgura es:

# S7 = 200 - 1 = 199 

# Holgura octava restricción

1*sol$solution[1] + 1*sol$solution[2] + 1*sol$solution[3]

# [1] 1

#Se utiliza un galón, por lo cual la séptima variable de holgura es:

# S8 = 150 - 1 = 149 

#Holgura novena restricción

1*sol$solution[1] + 1*sol$solution[2] + 1*sol$solution[3]

#[1] 1

# Se utiliza un galon, por lo cual la novena variable de holgura es:

# S9 = 350 - 1 = 349

#Valor óptimo de la función objetivo: La utilidad óptima que obtendrá la compañía al
#producir según el plan óptimo de producción encontrado es:

sol

#Success: the objective function is 80 

# El valor óptimo de la función es 80, esto quiere decir el máximo de utilidad a obtener es de 
# $80

sol$duals[1:9]

#[1]      0     80      0 -10320      0      0    -30    -30 -15950

#Aumento/decremento de Z* si bi aumenta/decrece en una unidad

# Y1 = 0

#Aumento/decremento de Z* si b2 aumenta/decrece en una unidad

#Y2=0

#Aumento/decremento de Z* si b3 aumenta /decrece en una unidad.

#Y3 = 0

#Análisis de sensibilidad para coeficientes de la función objetivo. El plan de producción 
#óptimo X* no cambia, pero si cambia Z* ya que cambian los coeficientes cj.

tibble (c=c("c1","c2","c3","c4","c5","c6","c7","c8","c9","c10","c11","c12"),
        min = sol$sens.coef.from,
        max = sol$sens.coef.to)

## A tibble: 12 x 3
#c           min     max
#<chr>      <dbl>   <dbl>
#1 c1      8.00e 1 1.00e30
#2 c2     -1.00e30 1.04e 4
#3 c3     -1.00e30 8.00e 1
#4 c4     -1.00e30 8.00e 1
#5 c5     -1.00e30 8.00e 1
#6 c6     -1.00e30 8.00e 1
#7 c7     -1.00e30 1.60e 4
#8 c8     -1.00e30 8.00e 1
#9 c9     -1.00e30 8.00e 1
#10 c10   -1.00e30 8.00e 1
#11 c11   -1.00e30 8.00e 1
#12 c12   -1.00e30 1.20e 4

#Los intervalos para los coeficientes son (los costos unitario de las actividades pueden cambiar
#en estos intervalos sin que se modifique el plan óptimo de producción)

#    80 <= c1  <= +inf
# - inf <= c2  <= +inf
# - inf <= c3  <=  80
# - inf <= c4  <=  80
# - inf <= c5  <=  80
# - inf <= c6  <=  80
# - inf <= c7  <= +inf
# - inf <= c8  <=  80
# - inf <= c9  <=  80
# - inf <= c10 <=  80
# - inf <= c11 <=  80
# - inf <= c12 <=  12

# g.3 Análisis de sensibilidad para los coeficientes bi

A3_dual <- t(A3)

B3_dual <- C3

C3_dual <- B3

D3_dual <- c(">=", ">=", ">=", "<=", ">=", "<=", "<=", "<=", "<=")

sol31_dual <- lp (direction = "min",
                 const.mat = A3_dual,
                 const.rhs = B3_dual,
                 objective.in = C3_dual,
                 const.dir = D3_dual,
                 compute.sens = 1)
|

      