# Taller 2 Investigacion de operaciones

#Integrantes
#ALFREDO SILVA BURGOS
#ROBERTO NEIRA Cisternas

#Ejercicio 1

#Coeficientes de la funcion objetivo
C <- c(70,345)

#Matriz de coeficientes de las restricciones
# x y
A <- matrix (c(1, 0,
               0, 1,
               1, 0,
               0, 1,
               40, 50), ncol = 2, byrow =TRUE)

#Coeficientes lado derecho de las restricciones
B <- c(15, 10, 5, 5, 1000)

#Direccion de las desigualdades de las restricciones
D <- c("<=","<=",">=",">=","<=")

library(linprog)

solucion <- solveLP(cvec =C,
                    bvec =B,
                    Amat = A,
                    const.dir =D,
                    maximum =TRUE,
                    lpSolve =TRUE,
                    solve.dual = TRUE,
                    verbose = 0)
solucion

#Solucion
#Objective function (: 4325 

#Solution
#opt
#1 12.5
#2 10.0

#Constraints
#actual dir bvec free   dual
#1   12.5  <=   15  2.5   0.00
#2   10.0  <=   10  0.0 257.50
#3   12.5  >=    5  7.5   0.00
#4   10.0  >=    5  5.0   0.00
#5 1000.0  <= 1000  0.0   1.75

#Resolucion
#La maxima utilidad que se puede obtener son $USD 4325, la maquina M100 deberia funcionar 12,5 horas, la maquina M200 deberia funcionar 10 horas.
#Produccion total 750 cajas, generando una aprovechamiento total de la materia prima.

#Ejercicio 2

#Coeficientes de la funcion objetivo
C <- c(0.3, 0.52)

#Matriz de coeficientes de las restricciones
# x y
A <- matrix(c(2.5, 1,
              1, 2), ncol = 2, byrow = TRUE)

#Coeficientes lado derecho de las restricciones
B <- c(3, 4)

#Direccion de las desigualdades de las restricciones
D <- c(">=",">=")

library(linprog)

solucion <- solveLP(cvec =C,
                    bvec =B,
                    Amat = A,
                    const.dir =D,
                    maximum =FALSE,
                    lpSolve =TRUE,
                    solve.dual = TRUE,
                    verbose = 0)
solucion

#solucion
#Objective function (Minimum): 1.06 
#Solution
# opt
#1 0.50
#2 1.75

#Constraints
#actual dir bvec free dual
#1      3  >=    3    0 0.02
#2      4  >=    4    0 0.25
#Resolucion
#Se deben suministrar 0.50 kilos de maiz y 1.50 kilos de trigo para poder cumplir con la dieta diaria minima aconsejada por el veterinario
#Para tener el menor costo posible.

#Ejercicio 3

#Coeficientes de la funcion objetivo
C <- c(1.50, 0.75, 2.00, 1.75, 0.25)

#Matriz de coeficientes de las restricciones
# x y
A <- matrix(c(0.4, 0.05, 1, 0, 0,
              0.4, 0.1, 0, 1, 0,
              0, 0.2, 0, 0, 0,
              200, 400, 100, 50, 800), ncol = 5,byrow = TRUE)

#Coeficientes lado derecho de las restricciones
B <- c(0.2, 0.1, 0.05, 500)

#Direccion de las desigualdades de las restricciones
D <- c(">=",">=",">=",">=")

library(linprog)

solucion <- solveLP(cvec =C,
                    bvec =B,
                    Amat = A,
                    const.dir =D,
                    maximum =FALSE,
                    lpSolve =TRUE,
                    solve.dual = TRUE,
                    verbose = 0)
solucion

#Solucion
#Objective function (Minimum): 0.803516 
#Solution
#opt
#1 0.187500
#2 0.250000
#3 0.112500
#4 0.000000
#5 0.439062

#Constraints
#actual dir  bvec free      dual
#1  2e-01  >= 2e-01    0 1.9687500
#2  1e-01  >= 1e-01    0 1.6250000
#3  5e-02  >= 5e-02    0 1.8203125
#4  5e+02  >= 5e+02    0 0.0003125

#Resolucion
#Para cumplir con la cantidad minima de litros solicitados y sus respectivos porcentajes de concentracion de jugos requeridos, es necesario que se
#preparen 18% de bebida A, 25% de bebida B. 11.25% de bebida C, 0% de la bebida D y 44% de la bebida D, a 80 % del costo total de los 500 litros, 
#estos significaria; bebida A 93.75 litros, de la bebida B 125 Litros, de la bebida C 56.25 litros, de la bebida D 0 litros y de la bebida E 225 que
#completa los litros restantes, ya que esta no afecta en las restricciones. 





