#Participantes: Rosario Torres
               
#Ejercicio 1

C <- c(70,345) #Una vez que se identifican las variables de decisión (X1,X2), se calcula la Función objetivo (Max Z=70X1 + 345X2, obteniendo los coeficientes (70,345)
A <- matrix(c(1, 0, #restricciones: 1X1+0X2<=15
              0, 1, # 0X1+1X2<=10
              1, 0, # 1X1+0X2>=5  
              0, 1, # 0X1+1X2>=5
              40, 50), ncol = 2, byrow = 1) #40X1+50X2<=1000
B <- c(15, 10, 5, 5, 1000) #La matriz B se genera tras haber identificado los coeficientes de las restricciones
D <- c("<=","<=",">=",">=","<=") #Se denotan los signos correspondientes a cada desigualdad de  restricción de manera respeciva. 
require(lpSolve)

lpSolve::lp(direction = "max", #utilizamos el comando lpSolve para calcular los valores óptimos de la función objetivo
          
               const.mat = A,
               const.rhs = B,
               objective.in = C,
               const.dir = D,
               compute.sens = 1)
sol=lpSolve::lp(direction = "max",
                const.mat = A,
                const.rhs = B,
                objective.in = C,
                const.dir = D,
                compute.sens = 1)
sol$solution



#Ejercicio 2 #El desarrollo de los siguientes ejercicios siguen una lógica similar al del ejercicio 1.

C1 <- c(0.3,0.52)
A1 <- matrix(c(2.5, 1,
              1, 2), ncol = 2, byrow = 1)
B1 <- c(3, 4)
D1 <- c(">=",">=")

require(lpSolve)

lpSolve::lp(direction = "min",
            const.mat = A1,
            const.rhs = B1,
            objective.in = C1,
            const.dir = D1,
            compute.sens = 1)
sol=lpSolve::lp(direction = "min",
                const.mat = A1,
                const.rhs = B1,
                objective.in = C1,
                const.dir = D1,
                compute.sens = 1)
sol$solution


#Ejercicio 2.c

C2 <- c(0.3,0.52)
A2 <- matrix(c(2.5, 1,
               1, 2,
               0, 1), ncol = 2, byrow = 1)
B2 <- c(3, 4, 1)
D2 <- c(">=",">=","<=")

require(lpSolve)

lpSolve::lp(direction = "min",
            const.mat = A2,
            const.rhs = B2,
            objective.in = C2,
            const.dir = D2,
            compute.sens = 1)
sol=lpSolve::lp(direction = "min",
                const.mat = A2,
                const.rhs = B2,
                objective.in = C2,
                const.dir = D2,
                compute.sens = 1)
sol$solution


#Ejercicio 3

C3 <- c(1.5,0.75,2,1.75,0.25)
A3 <- matrix(c(0.4, 0.05, 1, 1, 1,
               0.4, 0.1, 1, 1, 1,
               1, 0.2, 1, 1, 1,
               200, 400, 100, 50, 800), ncol = 5, byrow = 1)
B3 <- c(0.2, 0.1, 0.05, 500)
D3 <- c(">=",">=",">=",">=")

require(lpSolve)

lpSolve::lp(direction = "min",
            const.mat = A3,
            const.rhs = B3,
            objective.in = C3,
            const.dir = D3,
            compute.sens = 1)
sol=lpSolve::lp(direction = "min",
                const.mat = A3,
                const.rhs = B3,
                objective.in = C3,
                const.dir = D3,
                compute.sens = 1)
sol$solution




