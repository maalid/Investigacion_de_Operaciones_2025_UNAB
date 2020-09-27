#Realizado por Guillermo Sanhueza Briones.

#Comentario:
#La solucion se nos presenta en el apartado "enviroment" en donde estas se abren en una pestaña 
#y se pueden visualizar en la consola, esto nos facilida la informacion para analizarla.

library(lpSolve)

                                       #Ejercicio 1

#Variables de decisión.

#X1: Cantidad de horas de trabajo de la maquina M100
#X2: Cantidad de horas de trabajo de la maquina M100

#F.O:  
#Max z = 70X1 + 345X2

#Restricciones:
# X1??? 15 (Horas de trabajo máxima de maquina M100)
# X2??? 10 (Horas de trabajo máxima de maquina M200)
# X1??? 5 (Horas de trabajo mínimas de maquina M100)
# X2??? 5 (Horas de trabajo mínimas de maquina M100)
# 40X1 + 50X2 ??? 1000 (libras de materia prima disponible)
# X1, X2 ??? 0 (No negatividad)

#F.O.
C <- c(70,345) 

#restricciones a trabajar
A <- matrix(c(1, 0,
              0, 1,
              1, 0,
              0, 1,
              40, 50), ncol = 2, byrow = TRUE)

#Disponibilidad de recursos.
B <- c(15, 10, 5, 5, 1000)

#simbologia de desigualdades
D <- c("<=","<=",">=",">=","<=")

solucion <- lp(direction = "max",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B)

#Solucion ejercicio 1:

#Al analizar la informacion que nos entrega R podemos concluir de que la maquina M100 necesita
#necesita estar operativa por 12,5horas maximo, mientras que la maquina M200 tiene que funcionar por 
#maximo 10 horas para que se pueda optimizar la utilidad por venga de caja y lograr una utilidad 
#maxima de $4.325.



                                    #Ejercicio 2

#Variables de decisión.

#X1: Cantidad de kg de maíz a suministrar diariamente
#X2: Cantidad de kg de trigo a suministrar diariamente


#F.O:  
#Min z = 0.3X1 + 0.52X2

#Restricciones:
# 2.5X1 + 1X2 ??? 3 (Cantidad mínima de hierro a suministrar diariamente)
# 1X1    + 2X2 ??? 4 (Cantidad mínima de vitaminas a suministrar diariamente)
# X1, X2 ??? 0 (no negatividad)

#F.O.
C <- c(0.3, 0.52)

#restricciones a trabajar
A <- matrix(c(2.5, 1,
               1, 2), ncol = 2, byrow = TRUE)

#Disponibilidad de recursos.
B <- c(3, 4)

#simbologia de desigualdades
D <- c(">=",">=")

solucion <- lp(direction = "min",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B)

#Solucion ejercicio 2:

#Para que el costo minimo pueda ser $1.06, se les debe dar diariamente a las aves un minimo de
#0.50kg de Maiz y 1.75 kg de trigo.



                                     #Ejercicio 2 letra C

#Se nos presenta una nueva restricción en el cual solo se puede disponer de 1 kg diario de 
#trigo diariamente, o sea X2???1.

#F.O.
C <- c(0.3, 0.52)

#restricciones a trabajar
A <- matrix(c(2.5, 1,
                1, 2,
               0, 1), ncol = 2, byrow = TRUE)

#Disponibilidad de recursos.
B <- c(3, 4, 1)

#simbologia de desigualdades.
D <- c(">=",">=","<=")

solucion <- lp(direction = "min",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B)

#Solucion ejercicio 2,C.:

#Debido a la nueva restriccion que se impuso en la cual solo se dispone de 1kg diario minimo de 
#trigo, es que se debio analizar nuevamente este problema y nos da como resultado que para que el 
#costo minimo para alimentar a las aves diariamente es de $1.12 en donde se les deve suministrar 
#2 kg de maiz y 1 kg de trigo minimo y diario.


                                 #Ejercicio 3

#Variables de decisión.

#X1: Cantidad de bebida fruta A
#X2: Cantidad de bebida fruta B
#X3: Cantidad de bebida fruta C
#X4: Cantidad de bebida fruta D
#X5: Cantidad de bebida fruta E

#F.O:  
#Min Z = 1.50X1 + 0.75X2 + 2.00X3 + 1.75X4 + 0.25X5

#Restricciones:
#0.4X1 + 0.05X2 + 1X3 + X4 +X5 ??? 0.2 (Requerimiento mínimo de jugo de naranja)
#0.4X1 + 0.1X2 + X3 + 1X4 +X5 ??? 0.1(Requerimiento mínimo de jugo de Pomelo)
#   X1 + 0.2X2 + X3 + X4 +X5 ??? 0.05(Requerimiento mínimo de jugo de arándano)
#200X1 + 400X2 + 100X3 + 50X4 +800X5 ??? 500 (Cantidad en litros solicitada)
#   X1, X2, X3, X4, X5 ??? 0 (no negatividad
                        
#F.O.
C <- c(1.50, 0.75, 2.00, 1.75, 0.25)

#restricciones a trabajar
A <- matrix(c(0.4, 0.05, 1, 0, 0, 
               0.4, 0.1, 0, 1, 0,
                 0, 0.2, 0, 0, 0,
               200, 400, 100, 50, 800), ncol = 5, byrow = TRUE)

#Disponibilidad de recursos.
B <- c(0.2, 0.1, 0.05, 500)

#simbologia de desigualdades
D <- c(">=",">=",">=",">=")

solucion <- lp(direction = "min",
               objective.in = C,
               const.mat = A,
               const.dir = D,
               const.rhs = B)

#Solucion ejercicio 3

#FO = 0.8035156
#Fruta A 0.1875000*100 Fruta B 0.2500000*100  Fruta C 0.1125000*100  Fruta D 0.0000000  Fruta E 0.4390625*100
#Fruta A= 18.75%  Fruta B=25%   Fruta C=11.25%   Fruta D= 0   Fruta E =43.90625%

#Con la finalidad minimizar los costos de los almenos 500 litros de ponche solicitados, este debera 
#estar conformado por un 18,75% de la bebida de fruta A, de la bebida de fruta B 25%, un 11.25% de 
#la bebida de fruta C y el resto sera un 43.90625% de la fruta de la bebida E, mientra que de la 
#bebida de fruta tipo D no se ocupara nada.
#Es por esto que el costo minimo para realizar el ponche sera de $0.8035156 por litro.

