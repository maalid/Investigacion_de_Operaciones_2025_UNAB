# Taller 4: Método de Asignación Usando lpSolve()

# Ejercicio 1

# La alcaldía de la ciudad está interesada en asignar 4 proyectos a 4 contratistas de forma tal que se genere el menor costo posible para 
# la ciudad. En la tabla se presenta el costo de elaboración de cada proyecto por cada uno de los contratistas.

# Tabla
#                             Contratista 
#                     | Alfa | Beta | Gama | Landa |   
#         Proyectos  _______________________________ 
#         Puente      | $ 96 | $ 96 | $100 | $ 88  |
#         Escuela     | $112 | $120 | $120 | $136  |
#         Parque      | $192 | $188 | $180 | $170  |
#         Hospital    | $ 84 | $ 88 | $108 | $ 92  |
#                    _______________________________ 


# ¿Cómo se deben asignar los proyectos para garantizar un costo mínimo para la alcaldía de la ciudad? Se debe garantizar la asignación de 
# un proyecto a cada uno de los contratistas.

# a. Formule matemáticamente este problema de Asignación, definiendo las variables de decisión, la función objetivo y las restricciones.
# b. Encuentre el plan óptimo de asignación, que minimiza los costos.
# c. Interprete los resultados.

# SOLUCIÓN.
# Definicion de las variables de decision

#  x11:Proyecto sobre Puente asignado a Contratista Alfa.
#  x12:Proyecto sobre Puente asignado a Contratista Beta.
#  x13:Proyecto sobre Puente asignado a Contratista Gama.
#  x14:Proyecto sobre Puente asignado a Contratista Landa.
#  x21:Proyecto sobre Escuela asignado a Contratista Alfa.
#  x22:Proyecto sobre Escuela asignado a Contratista Beta.
#  x23:Proyecto sobre Escuela asignado a Contratista Gama.
#  x24:Proyecto sobre Escuela asignado a Contratista Landa.
#  x31:Proyecto sobre Parque asignado a Contratista Alfa.
#  x32:Proyecto sobre Parque asignado a Contratista Beta.
#  x33:Proyecto sobre Parque asignado a Contratista Gama.
#  x34:Proyecto sobre Parque asignado a Contratista Landa.
#  x41:Proyecto sobre Hospital asignado a Contratista Alfa.
#  x42:Proyecto sobre Hospital asignado a Contratista Beta.
#  x43:Proyecto sobre Hospital asignado a Contratista Gama.
#  x44:Proyecto sobre Hospital asignado a Contratista Landa.

# De manera resumida podemos definir las 16 variables anteriores mediante una sola expresión. En efecto, para i=1,2,3,4 y j=1,2,3,4, sea:
#              xij:Proyecto i, asignado a Contratista j.



# Modelo matemático completo.

# minZ =  96x11+  96x12+ 100x13+  88x14          
#      + 112x21+ 120x22+ 120x23+ 136x24          
#      + 192x31+ 188x32+ 180x33+ 170x34          
#      +  84x41+  88x42+ 108x43+  92x44

# S.A.          

# x11+x12+x13+x14=1  (restricción de Proyecto Alfa).          
# x21+x22+x23+x24=1  (restricción de Proyecto Beta).          
# x31+x32+x33+x34=1  (restricción de Proyecto Gama).          
# x41+x42+x43+x44=1  (restricción de Proyecto Landa).          
# x11+x21+x31+x41=1  (restricción de Contratista Alfa).          
# x12+x22+x32+x42=1  (restricción de Contratista Beta).          
# x13+x23+x33+x43=1  (restricción de Contratista Gama).          
# x42+x24+x34+x44=1  (restricción de Contratista Landa).                       
#   xij=0  o  xij=1  (posibles valores de las variables).

# Transcribimos el modelo anterior a R

# Matriz de costos

cost_mat <- matrix(c(  96,  96, 100,  88,
                      112, 120, 120, 136,
                      192, 188, 180, 170,
                       84,  88, 108,  92), ncol = 4, byrow = TRUE)
cost_mat

install.packages("lpSolve")
library(lpSolve)

solucion <- lp.assign(cost.mat = cost_mat, 
                        direction = "min", 
                        presolve = 0, 
                        compute.sens = 0)


solucion$solution

#      [,1] [,2] [,3] [,4]
#[1,]    0    0    0    1
#[2,]    1    0    0    0
#[3,]    0    0    1    0
#[4,]    0    1    0    0

# c. Interprete los resultados.

# Valores optimos para las variables de decision. (Plan óptimo de asignación)

# Proyecto sobre Puente no es asignado a Contratista Alfa.

# x11 = 0

# Proyecto sobre Puente no es asignado a Contratista Beta.

# x12 = 0

# Proyecto sobre Puente no es asignado a Contratista Gama.

# x13 = 0

# Proyecto sobre Puente es asignado a Contratista Landa.

# x14 = 1

# Proyecto sobre Escuela es asignado a Contratista Alfa.

# x21 = 1

# Proyecto sobre Escuela no es asignado a Contratista Beta.

# x22 = 0

# Proyecto sobre Escuela no es asignado a Contratista Gama.

# x23 = 0

# Proyecto sobre Escuela no es asignado a Contratista Landa.

# x24 = 0

# Proyecto sobre Parque no es asignado a Contratista Alfa.

# x31 = 0

# Proyecto sobre Parque no es signado a Contratista Beta.

# x32 = 0

# Proyecto sobre Parque es asignado a Contratista Gama.

# x33 = 1

# Proyecto sobre Parque no es asignado a Contratista Landa.

# x34 = 0

# Proyecto sobre Hospital no es asignado a Contratista Alfa.

# x41 = 0

# Proyecto sobre Hospital es asignado a Contratista Beta.

# x42 = 1

# Proyecto sobre Hospital no es asignado a Contratista Gama.

# x43 = 0

# Proyecto sobre Hospital no es asignado a Contratista Landa.

# x44 = 0

solucion

# El costo minimo total de asignar los 4 proyectos, uno para cada empresa contratista sera de 468 unidades monetarias.

