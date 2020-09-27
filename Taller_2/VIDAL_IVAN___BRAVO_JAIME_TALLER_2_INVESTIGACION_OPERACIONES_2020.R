#funcion objetiva

C <- c(70,345)

#restricciones

A<- matrix(
         data = c(1,0,
                  0,1,
                  1,0,
                  0,1,
                  40,50),
         ncol = 2,
         byrow=TRUE
)

#direccion de ls desigualdades

D <- c("<=","<=",">=",">=","<=")
B <- c(15,10,5,5,1000)


#install.packages("lpSolve")
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


#------------------Problema 2--------------------------------

#funcion objetiva

C <- c(0.3,0.52)

#restricciones

A<- matrix(
  data = c(2.5,1,
           1,2
  ),
  ncol = 2,
  byrow=TRUE
)

#direccion de ls desigualdades

D <- c(">=",">=")
B <- c(3,4)


#install.packages("lpSolve")
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


#------------------Problema 3--------------------------------
#funcion objetiva

C <- c(1.5,0.75,2.00,1.75,0.25)

#restricciones

A<- matrix(
  data = c(0.40,0.5,1,0,0,
           0.40,0.1,0,1,0,
           0,0.2,0,0,0,
           200,400,100,100,800
  ),
  ncol = 5,
  byrow=TRUE
)

#direccion de ls desigualdades

D <- c(">=",">=",">=",">=")
B <- c(0.20,0.10,0.05,500)


#install.packages("lpSolve")
library(lpSolve)

sol <- lp(direction = "min", 
          const.mat = A,
          const.rhs = B,
          objective.in = C, 
          const.dir = D)

sol$objval
sol$solution

0.40*sol$solution[1] + 0.5*sol$solution[2] + 1*sol$solution[3] + 0*sol$solution[4]+ 0*sol$solution[5]
0.40*sol$solution[1] + 0.1*sol$solution[2] + 0*sol$solution[3] + 1*sol$solution[4]+ 0*sol$solution[5]
0*sol$solution[1] + 0.2*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4]+ 0*sol$solution[5]
200*sol$solution[1] + 400*sol$solution[2] + 100*sol$solution[3] + 100*sol$solution[4]+ 800*sol$solution[5]
