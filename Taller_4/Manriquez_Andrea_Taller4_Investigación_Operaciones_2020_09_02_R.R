
#Taller 4: Método de Asignación Usando lpSolve()

#Alumnnas_Andrea Manriquez y Carolina Contreras G.


#Ejercicio N°1

# La alcaldía de la ciudad está interesada en asignar 4 proyectos a 4 contratistas de forma tal 
# que se genere el menor costo posible para la ciudad. En la tabla se presenta el costo de 
# elaboración de cada proyecto por cada uno de los contratistas
#
#  ________________________________________________
# |               |       EMPRESAS CONTRATISTAS   |
# |   Proyecto    |_______________________________|           
# |               | ALFA  | BETA  | GAMA  | LANDA |  
# |_______________|_______|_______|_______|_______|
# |               |       |       |       |       |
# |     Puente    | $ 96  | $ 96  | $ 100 | $ 88  |
# |_______________|_______|_______|_______|_______|
# |               |       |       |       |       |
# |    Escuela    | $ 112 | $ 120 | $ 120 | $ 136 |
# |_______________|_______|_______|_______|_______|
# |               |       |       |       |       |
# |     Parque    | $ 192 | $ 188 | $ 180 | $ 170 |
# |_______________|_______|_______|_______|_______|
# |               |       |       |       |       |
# |    Hospital   | $ 84  | $ 88  | $ 108 | $ 92  |
# |_______________|_______|_______|_______|_______|

# a.- Formule matemáticamente este problema de Asignación, definiendo las variables de decisión, la función objetivo y las restricciones.

#X11 : Proyecto puente,   asignado a la empresa contratista alfa
#X12 : Proyecto puente,   asignado a la empresa contratista beta
#X13 : Proyecto puente,   asignado a la empresa contratista gamma
#X14 : Proyecto puente,   asignado a la empresa contratista landa
#X21 : Proyecto escuela,  asignado a la empresa contratista alfa
#X22 : Proyecto escuela,  asignado a la empresa contratista beta
#X23 : Proyecto escuela,  asignado a la empresa contratista gamma
#X24 : Proyecto escuela,  asignado a la empresa contratista landa
#X31 : Proyecto parque,   asignado a la empresa contratista alfa
#X32 : Proyecto parque,   asignado a la empresa contratista beta
#X33 : Proyecto parque,   asignado a la empresa contratista gamma
#X34 : Proyecto parque,   asignado a la empresa contratista landa
#X41 : Proyecto hospital, asignado a la empresa contratista alfa
#X42 : Proyecto hospital, asignado a la empresa contratista beta
#X43 : Proyecto hospital, asignado a la empresa contratista gamma
#X44 : Proyecto hospital, asignado a la empresa contratista landa

#En resumen, podemos definir las 16 variables anteriores mediante una sola expresión

# Para i=1,2,3,4 y j=1,2,3,4 sea: 

#	xij:nombre de proyecto i, que corresponde a la empresa contratista j.


# Modelo matemático completo (programacion lineal)

#Función Objetivo:

# MIN Z: 96  X11 + 96  X12 + 100 X13 + 88  X14 +
#        112 X21 + 120 X22 + 120 X23 + 136 X24 + 
#        192 X31 + 188 X32 + 180 X33 + 170 X34 +
#        84  X41 + 88  X42 + 108 X43 + 92  X44


# S.A.

# X11 + X12 + X13 + X14 = 1 (RESTRICCION PROYECTO PUENTE)
# X21 + X22 + X23 + X24 = 1 (RESTRICCION PROYECTO ESCUELA)
# X31 + X32 + X33 + X34 = 1 (RESTRICCION PROYECTO PARQUE)
# X41 + X42 + X43 + X44 = 1 (RESTRICCION PROYECTO HOSPITAL)
# X11 + X21 + X31 + X41 = 1 (RESTRICCION CONTRATISTA ALFA)
# X12 + X22 + X32 + X42 = 1 (RESTRICCION CONTRATISTA BETA)
# X13 + X23 + X33 + X43 = 1 (RESTRICCION CONTRATISTA GAMMA)
# X14 + X24 + X34 + X44 = 1 (RESTRICCION CONTRATISTA LANDA)
#      Xij = 0  o  X ij = 1 (posibles valores de ls variables)


# Transcribimos el modelo anterior a R

cost_mat_asig<- matrix(c(96,  96, 100, 88,
                         112, 120, 120, 136,
                         192, 188, 180, 170,
                          84,  88, 108, 92), ncol = 4, byrow = TRUE)


cost_mat_asig
#
#> cost_mat_asig
#      [,1] [,2] [,3] [,4]
#[1,]   96   96  100   88
#[2,]  112  120  120  136
#[3,]  192  188  180  170
#[4,]   84   88  108   92
#
#
#

solucion_asig[["solution"]]

# Solucion
 library (lpSolve)

solucionasig <- lp.assign (cost.mat = cost_mat_asig,
                            direction = "min",
                            presolve = 0,
                            compute.sens = 0)



solucionasig$solution
#
#solucionasig$solution
#      [,1] [,2] [,3] [,4]
#[1,]    0    0    0    1
#[2,]    1    0    0    0
#[3,]    0    0    1    0
#[4,]    0    1    0    0
#
#
# b) Encuentre el plan óptimo de asignación, que minimiza los costos.
#
# El plan óptimo de asignación que minimiza los costos para la alcaldía es el siguiente:
#
#
#       - El proyecto Puente NO es asignado al contratista ALFA.
#
#               X11 = 0
#
#       - El proyecto Puente NO es asignado al contratista BETA.
#
#               X12 = 0
#
#       - El proyecto Puente NO es asignado al contratista GAMA.
#
#               X13 = 0
#
#       - El proyecto Puente SI es asignado al contratista LANDA.
#
#               X14 = 1
#
#       - El proyecto Escuela SI es asignado al contratista ALFA.
#
#               X21 = 1
#
#       - El proyecto Escuela NO es asignado al contratista BETA.
#
#               X22 = 0
#
#       - El proyecto Escuela NO es asignado al contratista GAMA.
#
#               X23 = 0
#
#       - El proyecto Escuela NO es asignado al contratista LANDA.
#
#               X24 = 0
#
#       - El proyecto Parque NO es asignado al contratista ALFA.
#
#               X31 = 0
#
#       - El proyecto Parque NO es asignado al contratista BETA.
#
#               X32 = 0
#
#       - El proyecto Parque SI es asignado al contratista GAMA.
#
#               X33 = 1
#
#       - El proyecto Parque NO es asignado al contratista LANDA.
#
#               X34 = 0
#
#       - El proyecto Hospital NO es asignado al contratista ALFA.
#
#               X41 = 0
#
#       - El proyecto Hospital SI es asignado al contratista BETA.
#
#               X42 = 1
#
#       - El proyecto Hospital NO es asignado al contratista GAMA.
#
#               X43 = 0
#
#       - El proyecto Escuela NO es asignado al contratista LANDA.
#
#               X44 = 0

solucionasig
#Success: the objective function is 468 

#Z*= $468

# c) Interprete los resultados:

#Para que el plan óptimo de la alcadía reduzca sus costos al mínimo, se debe:

# Asignar el Proyecto Puente a la empresa contratista Landa por el costo de $88
# Asignar el Proyecto escuela es asignado a la empresa contratista Alfa por el costo de $112
# Asignar el Proyecto parque a la empresa contratista Gamma por el costo de $180
# Asignar el Proyecto Hospital a la empresa contratista Beta.por el costo de $88

#Podemos concluir que para garantizar un PLAN ÓPTIMO de asignacion de los proyectos a cada una
#de las empresas contratistas, éste sería de 468 unidades monetarias.












