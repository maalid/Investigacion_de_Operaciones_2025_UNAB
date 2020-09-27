# coeficiente de la funsion objetiva

C <- c (1.50,0.75,2.00,1.75,0,25)

#matriz de coeficiente de las restricciones

A <- matrix(
             data = c(40,5,100,0,0,
                      40,10,0,100,0,
                      0,200,0,0,0,
                      200,400,100,50,800), 
             ncol = 5, 
             byrow = TRUE)

# Direccion de las desigualdades de las restricciones

D <- c(">=", ">=",">=",">=",">=")

# Coeficientes lado derecho de las restricciones

B <- c(20,10,5,500)

#Resolver

library(lpSolve)

sol <- lp(direction = "min", 
          const.mat = A,
          const.rhs = B,
          objective.in = C, 
          const.dir = D)

sol$objval
sol$solution

40*sol$solution[1] + 5*sol$solution[2] + 10*sol$solution[3]
4*sol$solution[1] + 10*sol$solution[2] + 100*sol$solution[4]
200*sol$solution[1] 
200*sol$solution[1] + 400*sol$solution[2] + 100*sol$solution[3] + 50*sol$solution[4]+800*sol$solution[5]
