# coeficiente de la funsion objetiva

C <- c (0.3,0.52)

#matriz de coeficiente de las restricciones

A <- matrix(
             data = c(2.5,1,
                       1,2), 
             ncol = 2, 
             byrow = TRUE)

# Direccion de las desigualdades de las restricciones

D <- c(">=", ">=")

# Coeficientes lado derecho de las restricciones

B <- c(3,4)

#Resolver

library(lpSolve)

sol <- lp(direction = "min", 
          const.mat = A,
          const.rhs = B,
          objective.in = C, 
          const.dir = D)

sol$objval
sol$solution



2.5*sol$solution[1] + 1*sol$solution[2]
1*sol$solution[1] + 2*sol$solution[2]
