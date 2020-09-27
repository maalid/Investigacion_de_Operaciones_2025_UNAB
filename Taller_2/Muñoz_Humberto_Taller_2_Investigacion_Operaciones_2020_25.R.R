#         TALLER 2
#         INVESTIGACION DE OPERACIONES


#         INTEGRANTES


#         LILIAN MORA
#         HUMBERTO MUÑOZ



#Ejercicio 1

# _______________________________________________________________________
#|            | Horas de trabajo | Horas de trabajo  |                  |
#|            |   Máquina M100   | Máquina M200      |  Disponibilidad  |
#|            |  A la Semana     | A la Semana       |                  |
#|____________|__________________|___________________|__________________|
#| Horas      |                  |                   |                  |
#| Maximas de |      <=15        |        <=10       |                  |
#| Maquinas   |                  |                   |                  |
#|____________|__________________|___________________|__________________|
#| Horas      |                  |                   |                  |
#| Minimas de |       >=5        |        >=5        |                  |
#| Maquinas   |                  |                   |                  |
#|____________|__________________|___________________|__________________|
#| Libras de  |                  |                   |                  |
#| Materia    |        40        |          50       |      <=1000      |
#| Prima dis- |                  |                   |                  |
#| ponible    |                  |                   |                  |
#|____________|__________________|___________________|__________________|


# DEFINICION DE VARIABLES

# x= Número de horas de trabajo de máquina M100 a la semana.
# y= Número de horas de trabajo de máquina M200 a la semana.


#Coeficientes de la funcion objetivo, donde X es el primer valor e Y es el segundo valor.

C_1 <- c(70,345)

#Se genera la matriz de coeficientes de las restricciones

A_1 <- matrix(c(1, 0,
              0, 1,
              1, 0,
              0, 1,
              40, 50), 
              ncol = 2, 
              byrow = TRUE)

#La direccion de las desigualdades de las restricciones

D_1 <- c("<=","<=",">=",">=","<=")

#Coeficientes lado derecho de las restricciones

B_1 <- c(15, 10, 5, 5, 1000)



sol_1 <- lp(direction = "max",
               objective.in = C_1,
               const.mat = A_1,
               const.dir = D_1,
               const.rhs = B_1)

#Valor optimo de la funcion objetivo. 
#La utilidad máxima que obtendrá la compañia al trabjar según el plan óptimo es de:

sol_1



#Ejercicio 2

# _______________________________________________________________________
#|            |                  |                   |                  |
#|            |       Maiz       |       Trigo       |  Requerimiento   |
#|            |                  |                   |                  |
#|____________|__________________|___________________|__________________|
#|            |                  |                   |                  |
#|  Hierro    |      2,5         |         1         |       >=3        |
#|            |                  |                   |                  |
#|____________|__________________|___________________|__________________|
#|            |                  |                   |                  |
#| Vitaminas  |         1        |          2        |       >=4        |
#|            |                  |                   |                  |
#|____________|__________________|___________________|__________________|
#|            |                  |                   |                  |
#|    Costos  |        0,3       |        0,52       |                  |
#|            |                  |                   |                  |
#|____________|__________________|___________________|__________________|


# DEFINICION DE VARIABLES

# x= Cantidad de kilogramos de Maíz diario.
# y= Cantidad de kilogramos de Trigo diario.

#Coeficientes de la funcion objetivo, donde X es el primer valor e Y es el segundo valor.

C_2 <- c(0.3, 0.52)

#Se genera la matriz de coeficientes de las restricciones

A_2 <- matrix(c(2.5, 1,
              1, 2), 
              ncol = 2, 
              byrow = TRUE)

#Coeficientes lado derecho de las restricciones

B_2 <- c(3, 4)

#La direccion de las desigualdades de las restricciones

D_2 <- c(">=",">=")

solucion_2 <- lp(direction = "min",
               objective.in = C_2,
               const.mat = A_2,
               const.dir = D_2,
               const.rhs = B_2)

#Valor optimo de la funcion objetivo. 
#El gasto minimo que que se debe realizar para
#cumplir con el requerimiento de hierro y 
#vitaminas es de:

solucion_2

#Ejercicio 2 letra C

C_2c <- c(0.3, 0.52)
A_2c <- matrix(c(2.5, 1,
                   1, 2,
                   0, 1), 
               ncol = 2, 
               byrow = TRUE)

#Coeficientes lado derecho de las restricciones

B_2c <- c(3, 4, 1)

#La direccion de las desigualdades de las restricciones

D_2c <- c(">=",">=","<=")

solucion_2c <- lp(direction = "min",
               objective.in = C_2c,
               const.mat = A_2c,
               const.dir = D_2c,
               const.rhs = B_2c)

#Valor optimo de la funcion objetivo. 
#El gasto minimo que que se debe realizar para
#cumplir con el requerimiento de hierro y 
#vitaminas, considerando que sólo se tiene
# 1kg de trigo disponible, es de:

solucion_2c

#Ejercicio 3

# ______________________________________________________________________________________________________________
#|            | Jugo Naranja     |  Jugo Pomelo      |  Jugo Arandano   |     Litros       |   Costo por litro |  
#|            |                  |                   |                  |                  |                   |
#|____________|__________________|___________________|__________________|__________________|___________________|
#|            |                  |                   |                  |                  |                   |
#|  Bebida A  |       40         |         40        |         0        |        200       |       1,50        |
#|            |                  |                   |                  |                  |                   |         
#|____________|__________________|___________________|__________________|__________________|___________________|
#|            |                  |                   |                  |                  |                   |  
#|  Bebida B  |         5        |          10       |       20         |        400       |       0,75        |
#|            |                  |                   |                  |                  |                   |
#|____________|__________________|___________________|__________________|__________________|___________________|
#|            |                  |                   |                  |                  |                   |
#|  Bebida C  |        100       |        0          |        0         |        100       |        2.0        |
#|            |                  |                   |                  |                  |                   |
#|____________|__________________|___________________|__________________|__________________|___________________|
#|            |                  |                   |                  |                  |                   |  
#|  Bebida D  |         0        |        100        |        0         |        50        |       1,75        |
#|            |                  |                   |                  |                  |                   |
#|____________|__________________|___________________|__________________|__________________|___________________|
#|            |                  |                   |                  |                  |                   |
#|  Bebida E  |         0        |         0         |        0         |        800       |        0.25       |
#|            |                  |                   |                  |                  |                   |
#|____________|__________________|___________________|__________________|__________________|___________________|


# DEFINICION DE VARIABLES

# A= Cantidad de Bebida A.
# B= Cantidad de Bebida B.
# C= Cantidad de Bebida C.
# D= Cantidad de Bebida D.
# E= Cantidad de Bebida E.

#Coeficientes de la funcion objetivo, de izquierda a derecha donde A es el primer valor y E es el último valor.

C_3 <- c(1.50, 0.75, 2.00, 1.75, 0.25)

#Se genera la matriz de coeficientes de las restricciones

A_3 <- matrix(c(0.4, 0.05, 1, 0, 0, 
              0.4, 0.1, 0, 1, 0,
              0, 0.2, 0, 0, 0,
              200, 400, 100, 50, 800), 
              ncol = 5, 
              byrow = TRUE)

#Coeficientes lado derecho de las restricciones

B_3 <- c(0.2, 0.1, 0.05, 500)

#La direccion de las desigualdades de las restricciones

D_3 <- c(">=",">=",">=",">=")

sol_3 <- lp(direction = "min",
               objective.in = C_3,
               const.mat = A_3,
               const.dir = D_3,
               const.rhs = B_3)

#Valor optimo de la funcion objetivo. 
#El gasto minimo que que se debe realizar para
#cumplir con el requerimiento para
#la producción de las bebidas es de:

sol_3
