#ALUMNA ROSARIO TORRES

# Ejercicios 1

A <- matrix(c( 1.08, 1.095, 1.110, 1.125, 0,
               1000, 1.110, 1.125, 1.140, 0,
               1000, 1000, 1.100, 1.115, 0,
               1000,  1000, 1000, 1.130, 0), ncol = 5, byrow = TRUE)

B <- c(">=", ">=", ">=", ">=") #Se denotan los signos correspondientes a cada desigualdades de producción máxima
C <- c(25, 35, 30, 10) #La matriz se genera tras haber identificado los coeficientes de las restricciones de producción máxima
D <- c("<=", "<=", "<=", "<=", "<=") #Se denotan los signos corrrespondientes  a cada desigualdades de instalaciones programadas
E <- c(10, 15, 25, 20, 30) #La matriz se genera tras haber identificado las restricciones de instalaciones programadas

solucion_5 <- lpSolve::lp.transport (cost.mat = A,
                                     direction = "min",
                                     row.signs = B,
                                     row.rhs = C,
                                     col.signs = D,
                                     col.rhs = E, 
                                     presolve = 1)

solucion_5$solution

solucion_5

#Ejercicio 2


A <- matrix(c( 5,  8, 1000, 1000, 1000,
               3, 11, 1000, 1000, 1000,
               1000, 4, 14, 11, 12,
               4, 1000, 13, 13, 10 ), ncol = 5, byrow = TRUE)

B <- c(2000, 3000,5000,5000) #La matriz se genera tras haber identificado los coeficientes de las restricciones
C <- c("<=", "<=", "<=", "<=") #Se denotan los signos correspondientes a cada desigualdades de producción máxima
E <- c(5000,5000,1500 ,1700,1800) #La matriz se genera tras haber identificado las restricciones de instalaciones programadas
D <- c(">=", ">=", ">=", ">=", ">=") #Se denotan los signos corrrespondientes  a cada desigualdades de instalaciones programadas


solucion_2 <- lpSolve::lp.transport(cost.mat = A,
                                    direction = "min",
                                    row.signs = C,
                                    row.rhs = B,
                                    col.signs = D,
                                    col.rhs = E, 
                                    presolve = 0,
                                    compute.sens = 0 )


solucion_2["solution"]
solucion_2


# Ejercicios 3


A <- matrix(c( 37.7, 32.9, 33.8,  37.0, 35.4,
               43.4, 33.1, 42.2, 34.7, 41.8,
               33.3, 28.5, 38.9, 30.4, 33.6,
               29.2,  26.4, 29.6, 28.5, 31.1,
               0, 0, 0, 0, 0 ), ncol = 5, byrow = TRUE)

B <- c("=>", "=>", "=>", "=>", "=>") 
C <- c(1, 1, 1, 1, 1)
D <- c("<=", "<=", "<=", "<=", "<=")
E <- c(1, 1, 1, 1, 1)
solucion_5 <- lpSolve::lp.transport(cost.mat = A,
                                    direction = "min",
                                    row.signs = B,
                                    row.rhs = C,
                                    col.signs = D,
                                    col.rhs = E, 
                                    presolve = 1)

solucion_5$solution

solucion_5

