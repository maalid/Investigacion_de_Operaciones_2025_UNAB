#       Taller 4
#
#                                                                               Gonzalo Venegas Carrasco
# Proyecto----------Contratista------------                                     Sebastian Venegas Carrasco
#                                                                               Rodrigo Charpentier Brevis 
#             Alfa   Beta   Gama  Landa  
#              x1     x2     x3     x4    
# Puente       96     96    100     88       
# Escuela     112    120    120    136
# Parque      192    188    180    170
# Hospital     84     88    108     92

# a) Formule matemáticamente este problema de Asignación, definiendo las variables de decisión, la función objetivo y las restricciones.

#x11 : Proyecto  Puente asignado a la contratista Alfa.
#x12 : Proyecto  Puente asignado a la contratista Beta.
#x13 : Proyecto  Puente asignado a la contratista Gama.
#x14 : Proyecto  Puente asignado a la contratista Landa.
#x21 : Proyecto  Escuela asignado a la contratista Alfa.
#x22 : Proyecto  Escuela asignado a la contratista Beta.
#x23 : Proyecto  Escuela asignado a la contratista Gama.
#x24 : Proyecto  Escuela asignado a la contratista Landa.
#x31 : Proyecto  Parque asignado a la contratista Alfa.
#x32 : Proyecto  Parque asignado a la contratista Beta.
#x33 : Proyecto  Parque asignado a la contratista Gama.
#x34 : Proyecto  Parque asignado a la contratista Landa.
#x41 : Proyecto  Hospital asignado a la contratista Alfa.
#x42 : Proyecto  Hospital asignado a la contratista Beta.
#x43 : Proyecto  Hospital asignado a la contratista Gama.
#x44 : Proyecto  Hospital asignado a la contratista Landa.
#
#
#Modelo Matematico completo :
#
#Min Z :   96x11 +  96x12 + 100x13 +  88x14
#       + 111x21 + 120x22 + 120x23 + 136x24 
#       + 192x31 + 188x32 + 180x33 + 170x34
#       +  84x41 +  88x42 + 108x43 +  92x44
#
#
#   Sujeto a : 
#
#   x11 + x12 + x13 + x14 = 1 Restriccion Proyecto Puente.
#   x21 + x22 + x23 + x24 = 1 Restriccion Proyecto Escuela.
#   x31 + x32 + x33 + x34 = 1 Restriccion Proyecto Parque.
#   x41 + x42 + x43 + x44 = 1 Restriccion Proyecto Hospital.
#   x11 + x21 + x31 + x41 = 1 Restriccion contratista Alfa.         
#   x12 + x22 + x32 + x42 = 1 Restriccion contratista Beta.
#   x13 + x23 + x33 + x43 = 1 Restriccion contratista Gama.
#   x14 + x24 + x34 + x44 = 1 Restriccion contratista Landa.
#
#
#   Matriz de Costos

#
cost_mat_1 <- matrix(c( 96,  96, 100,  88,
                        112, 120, 120, 136,
                        192, 188, 180, 170,
                        84,  88, 108, 92), ncol = 4, byrow = TRUE)

cost_mat_1

solucion_2 <- lp.assign (cost.mat = cost_mat_1, 
                         direction = "min", 
                         presolve = 0, 
                         compute.sens = 0)


solucion_2["solution"]
solucion_2

# b) Encuentre el plan óptimo de asignación, que minimiza los costos.

#$solution
#     [,1] [,2] [,3] [,4]
#[1,]    0    0    0    1
#[2,]    1    0    0    0
#[3,]    0    0    1    0
#[4,]    0    1    0    0

#Valores optimos para las variables de decision. (Plan óptimo de asignación)
#
# El proyecto Puente NO es asignado a la costratista Alfa. 
# El proyecto Puente NO es asignado a la costratista Beta.  
# El proyecto Puente NO es asignado a la costratista Gama. 
# El proyecto Puente SI es asignado a la costratista Landa. 
# 
# El proyecto Escuela SI es asignado a la contratista Alfa.
# El proyecto Escuela NO es asignado a la contratista Beta.
# El proyecto Escuela NO es asignado a la contratista Gama.
# El proyecto Escuela NO es asignado a la contratista Landa.
#
# El proyecto Parque NO es asignado a la contratista Alfa.
# El proyecto Parque NO es asignado a la contratista Beta.
# El proyecto Parque SI es asignado a la contratista Gama.
# El proyecto Parque NO es asignado a la contratista Landa.
#
# El proyecto Hospital NO es asignado a la contratista Alfa.
# El proyecto Hospital SI es asignado a la contratista Beta.
# El proyecto Hospital NO es asignado a la contratista Gama.
# El proyecto Hospital NO es asignado a la contratista Delta.
#

#c) Interprete los resultados.
#
# Costo mínimo asociado al plan de asignación.
#
# solucion_2
#
# Success: the objective function is 468 Unidades Monetarias.
#
# Para garantizar un costo mínimo para la alcaldía de la ciudad se deben asignar los proyectos en el siguiente orden:
# *El proyecto Puente se asigna a la Contratista Landa, con un costo asociado de 88 Unidades Monetarias para garantizar un costo mínimo para la alcaldía de la ciudad. 
# *El Proyecto Escuela se asigna a la Contratista Alfa, con un costo asociado de 112 Unidades Monetarias para garantizar un costo mínimo para la alcaldía de la ciudad.
# *El Proyecto Parque se asigna a la Contratista Gama, con un costo asociado de 180 Unidades Monetarias para garantizar un costo mínimo para la alcaldía de la ciudad.
# *El Proyecto Hospital se le asigna a la Contratista Beta, con un costo asociado de 88 Unidades Monetarias para garantizar un costo mínimo para la alcaldía de la ciudad.

# Lo que al sumar los costos de cada uno de los proyectos da una suma total de 468 Unidades Monetarias para garantizar el costo minimo a la Alcaldia  de la Ciudad.
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#
#