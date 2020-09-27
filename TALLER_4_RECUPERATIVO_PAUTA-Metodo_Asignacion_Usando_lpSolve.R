library(lpSolve)

cost_mat_2 <- matrix(c( 2, 4, 10,     3, 6,
                        7, 7,  5,     6, 4,
                        8, 6,  7, 0.001, 9,
                        0, 0,  0,     0, 0,
                        0, 0,  0,     0, 0), 
                     ncol = 5, 
                     byrow = TRUE)
cost_mat_2
solucion_2 <- lp.assign(cost.mat = cost_mat_2, 
                        direction = "max", 
                        presolve = 0, 
                        compute.sens = 0)


solucion_2["solution"]
solucion_2
