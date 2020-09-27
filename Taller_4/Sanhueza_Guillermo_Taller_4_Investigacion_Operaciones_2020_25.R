#taller 4
#Rosario Torres
#Guillermo Sanhueza

library(lpSolve)

###### Variables de decisión ###### 

# X11 : proyecto puente asignado al contratista alfa
# X12 : proyecto puente asignado al contratista beta
# X13 : proyecto puente asignado al contratista gama
# X14 : proyecto puente asignado al contratista landa

# X21 : proyecto escuela asignado al contratista alfa
# X22 : proyecto escuela asignado al contratista beta
# X23 : proyecto escuela asignado al contratista gama
# X24 : proyecto escuela asignado al contratista landa

# X31 : proyecto parque asignado al contratista alfa
# X32 : proyecto parque asignado al contratista beta
# X33 : proyecto parque asignado al contratista gama
# X34 : proyecto parque asignado al contratista landa

# x41 : proyecto hospital asignado al contratista alfa
# x42 : proyecto hospital asignado al contratista beta
# x43 : proyecto hospital asignado al contratista gama
# x44 : proyecto hospital asignado al contratista landa

#### Modelo matematico completo (programación lineal)####

# MIN Z : 96  X11 + 96  X12 + 100 X13 + 88  X14
#         112 X21 + 120 X22 + 120 X23 + 136 X24
#         192 X31 + 188 X32 + 180 X33 + 170 X34
#         84  X41 + 88  X42 + 108 X43 + 92  X44

# S.A.

# X11 + X12 + X13 + X14 = 1 (restriccion proyecto puente)
# X21 + X22 + X23 + X24 = 1 (restriccion proyecto escuela)
# X31 + X32 + X33 + X34 = 1 (restriccion proyecto parque)
# X41 + X42 + X43 + X44 = 1 (restriccion proyecto hospital)
# X11 + X21 + X31 + X41 = 1 (restriccion proyecto alfa)
# X12 + X22 + X23 + X24 = 1 (restriccion proyecto beta)
# X13 + X32 + X33 + X34 = 1 (restriccion proyecto gama)
# X14 + X42 + X43 + X44 = 1 (restriccion contratista landa)

###### Transcribimos a R.######

# Matriz de costos. 

cost_mat_asig <- matrix(c(96,  96,  100,  88,
                         112, 120,  120, 136,
                         192, 188,  180, 170,
                          84,  88,  108, 92), ncol = 4, byrow = TRUE)

# Plan optimo. 

solucion_asig <- lp.assign (cost.mat = cost_mat_asig,
                         direction = "min",
                         presolve = 0,
                         compute.sens = 0)

###### Resolvemos ######

solucion_asig[["solution"]]

#                     Contratistas
#                  ALFA  BETA  GAMA  LANDA
#  Proyecto        [,1]  [,2]  [,3]  [,4]
#  Puente    [1,]    0     0     0     1
#  Escuela   [2,]    1     0     0     0
#  Parque    [3,]    0     0     1     0
#  Hospital  [4,]    0     1     0     0

# Valores optimos para las variables de decision

#Proyectos asignados.

#El Proyecto Puente es asigando al contratista Landa:  X14

#El proyecto Escuela es asignado al contratista Alfa:  X21

#El Proyecto Parque es asignado al conytratista Gama:  X33

#El Proyecto Hospital es asignado al contratista Beta: X42

#El costo minimo de asignacion es:

solucion_asig

#Success: the objective function is 468 
# Z*= $468 unidades monetarias.

## Por lo tanto los costos asociados para la asignacion de los proyectos a los 4 contratistas seria de $468 unidades monetarias.

