#taller 4
#Integrantes: Jaime Bravo - Ivan Vidal


# a) Formule matemáticamente este problema de Asignación, definiendo las
#variables de decisión, la función objetivo y las restricciones.

# Variables de decision
# x1= Proyecto puente contratista alfa
# x2= Proyecto escuela contratista alfa
# x3= Proyecto parque contratista alfa
# x4= Proyecto hospital contratista alfa
# x5= Proyecto puente contratista beta
# x6= Proyecto escuela contratista beta
# x7= Proyecto parque contratista beta 
# x8= Proyecto hospital contratista beta
# x9= Proyecto puente contratista gama
# x10= Proyecto escuela contratista gama
# x11= Proyecto parque contratista gama
# x12= Proyecto hospital contratista gama
# x13= Proyecto puente contratista landa
# x14= Proyecto escuela contratista landa
# x15= Proyecto parque contratista landa
# x16= Proyecto hospital contratista landa

# Modelo matemático
# FO
#   MIN:
#          96x1  +  96x2   +  100x3  +  88x4        
#      +  112x5  +  120x6  +  120x7  +  136x8         
#      +  192x9  +  188x10 +  180x11 +  170x12       
#      +  84x13  +  88x14  +  108x15 +  92x16

# Resticciones

#    x1  + x2  + x3  + x4  = 1  Restriccion Trabajo empresa Alfa
#    x5  + x6  + x7  + x8  = 1  Restriccion Trabajo empresa Beta.
#    x9  + x10 + x11 + x12 = 1  Restriccion Trabajo empresa Gama.
#    x13 + x14 + x15 + x16 = 1  Restriccion Trabajo empresa Landa.
#    x1  + x5  + x9  + x13 = 1  Restriccion proyecto puente.
#    x2  + x6  + x10 + x14 = 1  Restriccion proyecto escuela.
#    x3  + x7  + x11 + x15 = 1  Restriccion proyecto parque.
#    x4  + x8  + x12 + x16 = 1  Restriccion proyecto hospital.

library(lpSolve)
library(tibble)

Costos_4<- matrix(c(  96 ,  96 , 100 ,  88,
                        112 , 120 , 120 , 136,
                        192 , 188 , 180 , 170,
                        84 ,  88 , 108 , 92),
                    ncol = 4,
                    byrow = TRUE)


Costos_4


sol <- lp.assign(Costos_4,
                        direction = "min",
                        presolve = 0,
                        compute.sens = 0)

sol$solution


# b) Valores optimos para las variables de decision. 

# proyecto escuela se asigna a contratista alfa x2= 1
# proyecto hospital  se asigna a contratista beta x8= 1
# proyecto parque se asigna a contratista gama x11= 1
# proyecto puente se asigna a contratista landa x13= 1

sol

# El menor costo para la ciudad es 468 Unidades monetarias














