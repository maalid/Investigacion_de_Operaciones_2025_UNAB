#         TALLER 4
#         INVESTIGACION DE OPERACIONES


#         INTEGRANTES


#         LILIAN MORA
#         HUMBERTO MUÑOZ

# EJERCICIO

# La alcaldía de la ciudad está interesada en asignar 4 proyectos a 4 contratistas de forma tal 
# que se genere el menor costo posible para la ciudad.En la tabla se presenta el costo de 
# elaboración de cada proyecto por cada uno de los contratistas.
#  ________________________________________________
# |               |           CONTRATISTA         |
# |   PROYECTO    |_______________________________|           
# |               | ALFA  | BETA  | GAMA  | LANDA |  
# |_______________|_______|_______|_______|_______|
# |               |       |       |       |       |
# |     PUENTE    | $ 96  | $ 96  | $ 100 | $ 88  |
# |_______________|_______|_______|_______|_______|
# |               |       |       |       |       |
# |    ESCUELA    | $ 112 | $ 120 | $ 120 | $ 136 |
# |_______________|_______|_______|_______|_______|
# |               |       |       |       |       |
# |     PARQUE    | $ 192 | $ 188 | $ 180 | $ 170 |
# |_______________|_______|_______|_______|_______|
# |               |       |       |       |       |
# |    HOSPITAL   | $ 84  | $ 88  | $ 108 | $ 92  |
# |_______________|_______|_______|_______|_______|

# ¿Cómo se deben asignar los proyectos para garantizar un costo mínimo para la alcaldía de la 
# ciudad? Se debe garantizar la asignación de un proyecto a cada uno de los contratistas.

#  a).- Formule matemáticamente este problema de Asignación, definiendo las variables de decisión,
#       la función objetivo y las restricciones.

#  b).- Encuentre el plan óptimo de asignación, que minimiza los costos.

#  c).- Interprete los resultados.

# DESARROLLO:

#  a).- Formule matemáticamente este problema de Asignación, definiendo las variables de decisión,
#       la función objetivo y las restricciones.


# Definición de las variables de decisión. 


# x11 : Proyecto Puente asignado a contratista Alfa.
# x12 : Proyecto Puente asignado a contratista Beta.
# x13 : Proyecto Puente asignado a contratista Gama.
# x14 : Proyecto Puente asignado a contratista Landa.
# x21 : Proyecto Escuela asignado a contratista Alfa
# x22 : Proyecto Escuela asignado a contratista Beta. 
# x23 : Proyecto Escuela asignado a contratista Gama.
# x24 : Proyecto Escuela asignado a contratista Landa.
# x31 : Proyecto Parque asignado a contratista Alfa.
# x32 : Proyecto Parque asignado a contratista Beta.
# x33 : Proyecto Parque asignado a  contratista Gama.
# x34 : Proyecto Parque asignado a contratista Landa.
# x41 : Proyecto Hospital asignado a contratista Alfa.
# x42 : Proyecto Hospital asignado a contratista Beta.
# x43 : Proyecto Hospital asignado a contratista Gama.
# x44 : Proyecto Hospital asignado a contratista Landa.

# De manera resumida podemos definir las 16 variables anteriores mediante una sola expresión. 
#
# En efecto, para i=1,2,3,4 y j=1,2,3,4 sea: 

#	xij:proyecto i, que corresponden al contratista j.


# Funcion Objetivo.

#                    MIN Z = 96x11 + 96x12  + 100x13 + 88x14  + 
#                           112x21 + 120x22 + 120x23 + 136x24 + 
#                           192x31 + 188x32 + 180x33 + 170x34 + 
#                            84x41 + 88x42  + 108x43 + 92x44 


# Modelo matemático completo. En base a la definición anterior para las variables de decisión,
# y a la información entregada, matemáticamente el modelo de Programación Lineal a resolver es
# el siguiente:


#                    MIN Z = 96x11 + 96x12  + 100x13 + 88x14  + 
#                           112x21 + 120x22 + 120x23 + 136x24 + 
#                           192x31 + 188x32 + 180x33 + 170x34 + 
#                            84x41 + 88x42  + 108x43 + 92x44 


#                   S.A.

#                    x11 + x12 + x13 + x14  = 1 (Restricción del Proyecto Puente).
#                    x21 + x22 + x23 + x24  = 1 (Restricción del Proyecto Escuela).
#                    x31 + x32 + x33 + x34  = 1 (Restricción del Proyecto Parque).
#                    x41 + x42 + x43 + x44  = 1 (Restricción del Proyecto Hospital).
#                    x11 + x21 + x31 + x41  = 1 (Restricción del contratista Alfa).
#                    x12 + x22 + x32 + x42  = 1 (Restricción del contratista Beta).
#                    x13 + x23 + x33 + x43  = 1 (Restricción del contratista Gama).
#                    x14 + x24 + x34 + x44  = 1 (Restricción del contratista Landa).
#                             xij = 0 o xij = 1 (Posibles valores de las varriables).

# Transcribimos el modelo anterior a R, para encontrar el plan óptimo.

# MATRIZ DE COSTOS:


cost_mat <- matrix(c(   96,  96, 100,  88,
                        112, 120, 120, 136,
                        192, 188, 180, 170,
                        84,  88, 108, 92), 
                        ncol = 4, 
                        byrow = TRUE)

cost_mat
#     [,1] [,2] [,3] [,4]
#[1,]   96   96  100   88
#[2,]  112  120  120  136
#[3,]  192  188  180  170
#[4,]   84   88  108   92

#install.packages("lpSolve")
library(lpSolve)

solucion <- lp.assign (cost.mat = cost_mat, 
                         direction = "min", 
                         presolve = 0, 
                         compute.sens = 0)

solucion$solution
#> solucion$solution
#       [,1] [,2] [,3] [,4]
# [1,]    0    0    0    1    
# [2,]    1    0    0    0   
# [3,]    0    0    1    0    
# [4,]    0    1    0    0    


#  b).- Encuentre el plan óptimo de asignación, que minimiza los costos.


# El plan óptimo de asignación que minimiza los costos para la alcaldía es el siguiente:


#       - El proyecto PUENTE NO es asignado al contratista ALFA.
#
#               X11 = 0
#
#       - El proyecto PUENTE NO es asignado al contratista BETA.
#
#               X12 = 0
#
#       - El proyecto PUENTE NO es asignado al contratista GAMA.
#
#               X13 = 0
#
#       - El proyecto PUENTE SI es asignado al contratista LANDA.
#
#               X14 = 1
#
#       - El proyecto ESCUELA SI es asignado al contratista ALFA.
#
#               X21 = 1
#
#       - El proyecto ESCUELA no es asignado al contratista BETA.
#
#               X22 = 0
#
#       - El proyecto ESCUELA NO es asignado al contratista GAMA.
#
#               X23 = 0
#
#       - El proyecto ESCUELA NO es asignado al contratista LANDA.
#
#               X24 = 0
#
#       - El proyecto PARQUE NO es asignado al contratista ALFA.
#
#               X31 = 0
#
#       - El proyecto PARQUE NO es asignado al contratista BETA.
#
#               X32 = 0
#
#       - El proyecto PARQUE SI es asignado al contratista GAMA.
#
#               X33 = 1
#
#       - El proyecto PARQUE NO es asignado al contratista LANDA.
#
#               X34 = 0
#
#       - El proyecto HOSPITAL NO es asignado al contratista ALFA.
#
#               X41 = 0
#
#       - El proyecto HOSPITAL SI es asignado al contratista BETA.
#
#               X42 = 1
#
#       - El proyecto HOSPITAL NO es asignado al contratista GAMA.
#
#               X43 = 0
#
#       - El proyecto ESCUELA NO es asignado al contratista LANDA.
#
#               X44 = 0
 
# El costo mínimo asociado a este plan de asignación es de $ 468 pesos:
#               Z* = $ 468 pesos. 

solucion 
# Success: the objective function is 468.


#  c).- Interprete los resultados.

# Para que la alcaldía reduzca los costos al mínimo debe:
#
#
#       - Asignar el proyecto Puente a la empresa contratista Landa por un costo de $ 88 pesos.
#       - Asignar el proyecto Escuela a la empresa contratista Alfa por un costo de $ 112 pesos.
#       - Asignar el proyecto Parque a la empresa contratista Gama por un costo de $ 180 pesos.
#       - Asignar el proyecto Hospital a la empresa contratista Beta por un costo de $ 88 pesos.

# Lo que nos lleva un costo total de las asiganaciones de: $ 468 pesos. Que es el mínimo costo 
# que se puede pagar por el plan de asignación mencionado.








