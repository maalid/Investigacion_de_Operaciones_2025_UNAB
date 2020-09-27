# SOLUCION 1.

# Dado que tenemos los costos de transporte, resolvemos el problema de minimizacion de costos
# pero debemos interpretar respecto a las utilidades.

# Matriz de costos
cost_mat_1 <- matrix(c(30, 10, 25, 20,
                       15, 25, 30, 10,
                       20, 30, 15, 20,
                        0,  0,  0,  0), ncol = 4, byrow = TRUE)

cost_mat_1


# Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs_1 <- c("==", "==", "==", "==")

row_constr_signs_1


# Coeficientes de las restricciones para las filas (oferta)

row_rhs_1 <- c(1500, 1500, 1500, 200)

row_rhs_1


# Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs_1 <- c("==", "==", "==", "==")

col_constr_signs_1


# Coeficientes de las restricciones para las columnas (demanda)

col_rhs_1 <- c(1000, 1200, 1500, 1000)

col_rhs_1

    
# Resolvemos.

library(lpSolve)

solucion_1 <- lp.transport(cost.mat = cost_mat_1,
                           direction = "min",
                           row.signs = row_constr_signs_1,
                           row.rhs = row_rhs_1,
                           col.signs = col_constr_signs_1,
                           col.rhs = col_rhs_1, 
                           presolve = 0)

solucion_1$solution
#      [,1] [,2] [,3] [,4]
# [1,]    0 1200    0  300
# [2,]  800    0    0  700
# [3,]    0    0 1500    0
# [4,]  200    0    0    0

solucion_1
# Success: the objective function is 59500
# De acuerdo con el plan optimo de transporte, la utilidad optima sera:
1200*(110-10) + 300*(110-20) + 800*(110-15) + 700*(110-10) + 1500*(110-15) + 200*0 = 435500
# es decir, 435500 unidades monetarias de utilidad.



# SOLUCION 2.

# Podemos resolver directamente eel problema de maximizacion, pero hay que calcular primero la matriz de utilidades:
# u11 = 110-c11 = 110-30 = 80
# u12 = 110-c12 = 110-10 = 100
# etc...

# Matriz de utilidades
cost_mat_2 <- matrix(c(80, 100, 85,  90,
                       95,  85, 80, 100,
                       90,  80, 95,  90,
                        0,   0,  0,   0), ncol = 4, byrow = TRUE)

cost_mat_2


# Direccion de las desigualdades de las restricciones para las filas (oferta)

row_constr_signs_2 <- c("==", "==", "==", "==")

row_constr_signs_2


# Coeficientes de las restricciones para las filas (oferta)

row_rhs_2 <- c(1500, 1500, 1500, 200)

row_rhs_2


# Direccion de las desigualdades de las restricciones para las columnas (demanda)

col_constr_signs_2 <- c("==", "==", "==", "==")

col_constr_signs_2


# Coeficientes de las restricciones para las columnas (demanda)

col_rhs_2 <- c(1000, 1200, 1500, 1000)

col_rhs_2


# Resolvemos.

library(lpSolve)

solucion_2 <- lp.transport(cost.mat = cost_mat_2,
                           direction = "max",
                           row.signs = row_constr_signs_2,
                           row.rhs = row_rhs_2,
                           col.signs = col_constr_signs_2,
                           col.rhs = col_rhs_2, 
                           presolve = 0)

solucion_2$solution
#      [,1] [,2] [,3] [,4]
# [1,]    0 1200    0  300
# [2,]  800    0    0  700
# [3,]    0    0 1500    0
# [4,]  200    0    0    0
solucion_2
#Success: the objective function is 435500 