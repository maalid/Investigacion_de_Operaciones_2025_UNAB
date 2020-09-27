# Taller N°4


# Integrantes:

# Riola San Martin Saez
# Georgette Pilquinao 



library(lpSolve)
library(tibble)

# a) Formule matemáticamente este problema de Asignación, definiendo las
#variables de decisión, la función objetivo y las restricciones.


# Variables de decision

# x1  = proyecto puente asignado a la empresa contratista alfa
# x2  = proyecto escuela asignado a la empresa contratista alfa
# x3  = proyecto parque asignado a la empresa contratista alfa
# x4  = proyecto hospital asignado a la empresa contratista alfa
# x5  = proyecto puente asignado a la empresa contratista beta
# x6  = proyecto escuela asignado a la empresa contratista beta
# x7  = proyecto parque asignado a la empresa contratista beta 
# x8  = proyecto hospital asignado a la empresa contratista beta
# x9  = proyecto puente asignado a la empresa contratista gama
# x10 = proyecto escuela asignado a la empresa contratista gama
# x11 = proyecto parque asignado a la empresa contratista gama
# x12 = proyecto hospital asignado a la empresa contratista gama
# x13 = proyecto puente asignado a la empresa contratista landa
# x14 = proyecto escuela asignado a la empresa contratista landa
# x15 = proyecto parque asignado a la empresa contratista landa
# x16 = proyecto hospital asignado a la empresa contratista landa

#De manera resumida podemos definir las 16 variables anteriores mediante una 
#sola expresión. En efecto, para i= puente,escuela,parque,hospital
# y j=alfa,beta,gama,landa, 

#sea:

#  xij:proyecto i, asignada a la empresa contratista j.

# Modelo matemático completo.

# funsion objetivo


#minZ=     96x1  +  96x2   +  100x3  +  88x4        
#      +  112x5  +  120x6  +  120x7  +  136x8         
#      +  192x9  +  188x10 +  180x11 +  170x12       
#      +  84x13  +  88x14  +  108x15 +  92x16

# S.A.

#    x1  + x2  + x3  + x4  = 1  (restricción de TRABAJO DE LA EMPRESA ALFA).
#    x5  + x6  + x7  + x8  = 1  (restricción de TRABAJO DE LA EMPRESA BETA).
#    x9  + x10 + x11 + x12 = 1  (restricción de TRABAJO DE LA EMPRESA GAMA).
#    x13 + x14 + x15 + x16 = 1  (restricción de TRABAJO DE LA EMPRESA LANDA).
#    x1  + x5  + x9  + x13 = 1  (restricción de PROYECTO PUENTE).
#    x2  + x6  + x10 + x14 = 1  (restricción de PROYECYO ESCUELA).
#    x3  + x7  + x11 + x15 = 1  (restricción de PROYECTO PARQUE ).
#    x4  + x8  + x12 + x16 = 1  (restricción de PROYECTO HOSPITAL).
#            xij=0  o  xij = 1  (posibles valores de las variables).

#Transcribimos el modelo anterior a R.

#Matriz de costos

Cost_mat_4<- matrix(c(  96 ,  96 , 100 ,  88,
                      112 , 120 , 120 , 136,
                      192 , 188 , 180 , 170,
                       84 ,  88 , 108 , 92),
                   ncol = 4,
                   byrow = TRUE)

Cost_mat_4

#resolvemos 

solucion_4 <- lp.assign(Cost_mat_4,
                        direction = "min",
                        presolve = 0,
                        compute.sens = 0)

solucion_4$solution


# b) Valores optimos para las variables de decision. (Plan óptimo de asignación)


# proyecto puente no es asignado a la empresa contratista alfa
#                                                            x1= 0


# proyecto escuela no es asignado a la empresa contratista alfa
#                                                            x1= 0


# proyecto parque no es asignado a la empresa contratista alfa
#                                                            x1= 0


# proyecto hospital  es asignado a la empresa contratista alfa
#                                                            x1= 1


# proyecto puente  es asignado a la empresa contratista beta
#                                                            x1= 1


# proyecto escuela no es asignado a la empresa contratista beta
#                                                            x1= 0


# proyecto parque no es asignado a la empresa contratista beta
#                                                            x1= 0


# proyecto hospital  es asignado a la empresa contratista beta
#                                                            x1= 0



# proyecto puente  es asignado a la empresa contratista gama
#                                                            x1= 0


# proyecto escuela no es asignado a la empresa contratista gama
#                                                            x1= 0


# proyecto parque no es asignado a la empresa contratista gama
#                                                            x1= 1


# proyecto hospital  es asignado a la empresa contratista gama
#                                                            x1= 0


# proyecto puente  es asignado a la empresa contratista landa
#                                                            x1= 0


# proyecto escuela no es asignado a la empresa contratista landa
#                                                            x1= 1


# proyecto parque no es asignado a la empresa contratista landa
#                                                            x1= 0


# proyecto hospital  es asignado a la empresa contratista landa
#                                                            x1= 0



# Costo mínimo asociado al plan de asignación

solucion_4


# el menor costo posible para la ciudad es de $468














