#Taller 2
#Andrea Manriquez y Carolina Contreras.

#Ejercicio 1

#Deficion de Variables
# x= Número de horas de trabajo de máquina M100 a la semana.
# y= Número de horas de trabajo de máquina M200 a la semana.

#coeficientes de funcion objetivo

C <- c(70,345)

#matriz de coeficientes de restricciones
A <- matrix(c(1, 0,
              0, 1,
              1, 0,
              0, 1,
              40, 50), ncol = 2, byrow = TRUE)

#Coeficientes lado derecho de las restricciones
B <- c(15, 10, 5, 5, 1000)

#Direccion de las desigualdades de las restricciones
D <- c("<=","<=",">=",">=","<=")
library(lpSolve)
solucion <- lp(direction = "max",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B)
solucion

#conclusion
#Para optimizar la uilidad por venta de cajas de plastico la maquina M100 debera trabajar por 12.5 horas y la M200 por 10 horas, para obtener
#4325 unidades monetarias.

#Ejercicio 2

#Deficion de Variables
# x= Cantidad de kilogramos de Maíz diario.
# y= Cantidad de kilogramos de Trigo diario.

#Coeficientes de la funcion objetivo
C <- c(0.3, 0.52)

#Se genera la matriz de coeficientes de las restricciones
A <- matrix(c(2.5, 1,
              1, 2), ncol = 2, byrow = TRUE)

#Coeficientes lado derecho de las restricciones
B <- c(3, 4)

#Direccion de las desigualdades de las restricciones
D <- c(">=",">=")
library(lpSolve)
solucion <- lp(direction = "min",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B)
solucion

#Ejercicio 2 letra C

C <- c(0.3, 0.52)
A <- matrix(c(2.5, 1,
              1, 2,
              0, 1), ncol = 2, byrow = TRUE)

#Coeficientes lado derecho de las restricciones
B <- c(3, 4, 1)

D <- c(">=",">=","<=")
library(lpSolve)
solucion <- lp(direction = "min",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B)
solucion

#Ejercicio 3

# DEFINICION DE VARIABLES

# A= Cantidad de Bebida A.
# B= Cantidad de Bebida B.
# C= Cantidad de Bebida C.
# D= Cantidad de Bebida D.
# E= Cantidad de Bebida E.

#Coeficientes de la funcion objetivo
C <- c(1.50, 0.75, 2.00, 1.75, 0.25)

#Se genera la matriz de coeficientes de las restricciones
A <- matrix(c(0.4, 0.05, 1, 0, 0, 
              0.4, 0.1, 0, 1, 0,
              0, 0.2, 0, 0, 0,
              200, 400, 100, 50, 800), ncol = 5, byrow = TRUE)

#Coeficientes lado derecho de las restricciones
B <- c(0.2, 0.1, 0.05, 500)

#La direccion de las desigualdades de las restricciones
D <- c(">=",">=",">=",">=")
library(lpSolve)
solucion <- lp(direction = "min",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B)
solucion
