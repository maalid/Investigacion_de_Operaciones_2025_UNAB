# coeficiente de la funsion objetiva

C <- c (70,345)

#matriz de coeficiente de las restricciones

A <- matrix(
             data = c(1,0,
                      0,1,
                      1,0,
                      0,1,
                      40,50), 
             ncol = 2, 
             byrow = TRUE)

# Direccion de las desigualdades de las restricciones

D <- c("<=", "<=",">=",">=","<=")

# Coeficientes lado derecho de las restricciones

B <- c(15,10,5,5,1000)

#Resolver

library(lpSolve)

sol <- lp(direction = "max", 
          const.mat = A,
          const.rhs = B,
          objective.in = C, 
          const.dir = D)

sol$objval
sol$solution

1*sol$solution[1] + 0*sol$solution[2]
0*sol$solution[1] + 1*sol$solution[2]
1*sol$solution[1] + 0*sol$solution[2]
0*sol$solution[1] + 1*sol$solution[2]
40*sol$solution[1] + 50*sol$solution[2]
