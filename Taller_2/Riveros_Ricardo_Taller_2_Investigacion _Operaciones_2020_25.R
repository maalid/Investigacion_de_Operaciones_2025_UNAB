
#Ejercicio 1

#Coeficientes de la funcion objetivo, donde X es el primer valor e Y es el segundo valor.

C_1 <- c(70,345)

#Se genera la matriz de coeficientes de las restricciones

A_1 <- matrix(c(1, 0,
              0, 1,
              1, 0,
              0, 1,
              40, 50), ncol = 2, byrow = TRUE)

#La direccion de las desigualdades de las restricciones

D_1 <- c("<=","<=",">=",">=","<=")

#Y por ultimo los coeficientes lado derecho de las restricciones

B_1 <- c(15, 10, 5, 5, 1000)

#Ejecutamos la solucion

solucion_1 <- lp(direction = "max",
               objective.in = C_1,
               const.mat = A_1,
               const.dir = D_1,
               const.rhs = B_1)
#Este es el punto óptimo, y los valores para X e Y son los siguientes
solucion_1

#Continuaremos comprobando las restricciones del sistema

#Restriccion 1, las horas maximas de trabajo para la maquina M100 son 15 horas.

1*solucion_1$solution[1]+0*solucion_1$solution[2]

#La maquina M100 consume 12.5 horas, por lo tanto quedan disponibles 2,5 horas para el proximo periodo

#Restriccion 2, las horas maximas de trabajo para la maquina M200 son 10 horas.

0*solucion_1$solution[1] + 1*solucion_1$solution[2]

#La maquina M200 consume las 10 horas disponibles.

#Restriccion 3, las horas minimas de trabajo para la M100 son 5 horas.

1*solucion_1$solution[1] + 0*solucion_1$solution[2]

#La maquina M100 Consume mas de las 5 horas minimas.

#Restriccion 4, las horas minimas de trabajo para la M200 son 5 horas.

0*solucion_1$solution[1] + 1*solucion_1$solution[2]

#La maquina M200 Consume mas de las 5 horas minimas.

#Restriccion 5, Libras de materia prima disponible.

40*solucion_1$solution[1] + 50*solucion_1$solution[2]

#Entre ambas maquinas se utiliza la totalidad de matria prima disponible.





#Ejercicio 2

#Coeficientes de la funcion objetivo, donde X es el primer valor e Y es el segundo valor.

C_2 <- c(0.3, 0.52)

#Se genera la matriz de coeficientes de las restricciones

A_2 <- matrix(c(2.5, 1,
                  1, 2), ncol = 2, byrow = TRUE)

#La direccion de las desigualdades de las restricciones

D_2 <- c(">=",">=")

#Y por ultimo los coeficientes lado derecho de las restricciones

B_2 <- c( 3, 4)

#Ejecutamos la solucion

solucion_2 <- lp(direction = "min",
               objective.in = C_2,
               const.mat = A_2,
               const.dir = D_2,
               const.rhs = B_2)
#Este es el punto óptimo, y los valores para X e Y son los siguientes
solucion_2

#Continuaremos comprobando las restricciones del sistema

#Restriccion 1, Dieta mínima de unidades de Hierro

2.5*solucion_2$solution[1]+1*solucion_2$solution[2]

#Se cumple con el requerimiento minimo de unidades de Hierro en la dieta

#Restriccion 2, Dieta mínima de unidades de Vitaminas

1*solucion_2$solution[1] + 2*solucion_2$solution[2]

#Se cumple con el requerimiento minimo de unidades de Vitaminas en la dieta





#Ejercicio 2 letra C

#Para esta parte del Ejercicio se solicita como nueva restriccion contar maximo con 1 kilo de Trigo, 
#que en este caso es Y

#Los demas datos permanecen iguales.

#Coeficientes de la funcion objetivo, donde X es el primer valor e Y es el segundo valor.

C_2c <- c(0.3, 0.52)

#Se genera la matriz de coeficientes de las restricciones

A_2c <- matrix(c(2.5, 1,
                   1, 2,
                   0, 1), ncol = 2, byrow = TRUE)

#La direccion de las desigualdades de las restricciones

D_2c <- c(">=",">=","<=")

#Y por ultimo los coeficientes lado derecho de las restricciones

B_2c <- c(3, 4, 1)

#Ejecutamos la solucion

solucion_2c <- lp(direction = "min",
               objective.in = C_2c,
               const.mat = A_2c,
               const.dir = D_2c,
               const.rhs = B_2c)
#Este es el punto óptimo, y los valores para X e Y son los siguientes
solucion_2c

#Continuaremos comprobando las restricciones del sistema

#Restriccion 1, Dieta mínima de unidades de Hierro

2.5*solucion_2c$solution[1]+1*solucion_2c$solution[2]

#El valor es de 6 unidades de Hierro en la dieta y esta por sobre el minimo de 3, sobrando para posteriormente 3 unidades de hierro.

#Restriccion 2, Dieta mínima de unidades de Vitaminas

1*solucion_2c$solution[1] + 2*solucion_2c$solution[2]

#El valor es de 4 unidades de Hierro en la dieta, se cumple con el minimo de 4 de forma exacta.

#Restriccion 3, Disponibilidad de 1 kilo de trigo.

0*solucion_2c$solution[1] + 1*solucion_2c$solution[2]

#Se cumple con el requerimiento de disponibilidad de 1 kilo de trigo.





#Ejercicio 3

#Coeficientes de la funcion objetivo, donde X es el primer valor e Y es el segundo valor.

C_3 <- c(1.50, 0.75, 2.00, 1.75, 0.25)

#Se genera la matriz de coeficientes de las restricciones

A_3 <- matrix(c(0.4, 0.05, 1, 0, 0, 
                0.4, 0.1, 0, 1, 0,
                  0, 0.2, 0, 0, 0,
                200, 400, 100, 50, 800), ncol = 5, byrow = TRUE)

#La direccion de las desigualdades de las restricciones

D_3 <- c(">=",">=",">=",">=")

#Y por ultimo los coeficientes lado derecho de las restricciones

B_3 <- c(0.2, 0.1, 0.05, 500)

#Ejecutamos la solucion

solucion_3 <- lp(direction = "min",
               objective.in = C_3,
               const.mat = A_3,
               const.dir = D_3,
               const.rhs = B_3)
#Este es el punto óptimo, y los valores para X e Y son los siguientes
solucion_3

#Continuaremos comprobando las restricciones del sistema

#Restriccion 1, Que el ponche tenga un 20% de jugo de naranja, (0.2) en el ponche.

0.4*solucion_3$solution[1]+0.5*solucion_3$solution[2]+1*solucion_3$solution[3]

#Se cumple y pasa la restriccion de al menos 20% de jugo de naranja en el ponche en el ponche, el exedente es de 11.25%.

#Restriccion 2, Que el ponche tenga un 10% de jugo de pomelo, (0.1) en el ponche.

0.4*solucion_3$solution[1]+0.10*solucion_3$solution[2]+1*solucion_3$solution[4]

#Se cumple la restriccion de al menos 10% de jugo de pomelo en el ponche

#Restriccion 3, Que el ponche tenga un 5% de jugo de arandano, (0.05) en el ponche.

0.2*solucion_3$solution[2]

#Se cumple la restriccion de al menos 5% de jugo de arandano en el ponche

#Restriccion 4, Que el ponche sea de al menos 500 litros.

200*solucion_3$solution[1]+400*solucion_3$solution[2]+100*solucion_3$solution[3]+50*solucion_3$solution[4]+800*solucion_3$solution[5]

#Se cumple la restriccion asignada al menos 500 litros de ponche

