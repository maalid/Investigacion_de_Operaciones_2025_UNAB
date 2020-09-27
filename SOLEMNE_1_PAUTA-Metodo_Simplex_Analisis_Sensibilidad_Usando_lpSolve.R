### SOLENME 1 ----
## EJERCICIO 1 ----
library(linprog)

# (a) Definición de las variables de decisión ----
# xij : toneladas del mineral i asignadas a la aleación k
# wk  : toneladas producidas de la aleación k


# (b) Función objetivo (utilidades) ----
# Z = 200*wA + 300*wB - 30*(x1A + x1B) - 40*(x2A + x2B) - 50*(x3A + x3B)


# (c) Restricciones ----
# 0.20*x1A + 0.10*x2A + 0.05*x3A <= 0.80*wA
# 0.10*x1A + 0.20*x2A + 0.05*x3A <= 0.30*wA
# 0.30*x1A + 0.30*x2A + 0.20*x3A >= 0.50*wA
# 0.10*x1B + 0.20*x2B + 0.05*x3B >= 0.40*wB
# 0.10*x1B + 0.20*x2B + 0.05*x3B <= 0.60*wB
# 0.30*x1B + 0.30*x2B + 0.70*x3B >= 0.30*wB
# 0.30*x1B + 0.30*x2B + 0.20*x3B <= 0.70*wB
# x1A + x1B <= 1000
# x2A + x2B <= 2000
# x3A + x3B <= 3000


# (d) Modelo a resolver ----
# MAX Z = 200*wA + 300*wB - 30*(x1A + x1B) - 40*(x2A + x2B) - 50*(x3A + x3B)
# S.T.
# - 0.80*wA - 0.00*wB + 0.20*x1A + 0.00*x1B + 0.10*x2A + 0.00*x2B + 0.05*x3A + 0.00*x3B <= 0
# - 0.30*wA - 0.00*wB + 0.10*x1A + 0.00*x1B + 0.20*x2A + 0.00*x2B + 0.05*x3A + 0.00*x3B <= 0
# - 0.50*wA - 0.00*wB + 0.30*x1A + 0.00*x1B + 0.30*x2A + 0.00*x2B + 0.20*x3A + 0.00*x3B >= 0 
# - 0.00*wA - 0.40*wB + 0.00*x1A + 0.10*x1B + 0.00*x2A + 0.20*x2B + 0.00*x3A + 0.05*x3B >= 0
# - 0.00*wA - 0.60*wB + 0.00*x1A + 0.10*x1B + 0.00*x2A + 0.20*x2B + 0.00*x3A + 0.05*x3B <= 0
# - 0.00*wA - 0.30*wB + 0.00*x1A + 0.30*x1B + 0.00*x2A + 0.30*x2B + 0.00*x3A + 0.70*x3B >= 0
# - 0.00*wA - 0.70*wB + 0.00*x1A + 0.30*x1B + 0.00*x2A + 0.30*x2B + 0.00*x3A + 0.20*x3B <= 0
#   0.00*wA + 0.00*wB + 1.00*x1A + 1.00*x1B + 0.00*x2A + 0.00*x2B + 0.00*x3A + 0.00*x3B <= 1000
#   0.00*wA + 0.00*wB + 0.00*x1A + 0.00*x1B + 1.00*x2A + 1.00*x2B + 0.00*x3A + 0.00*x3B <= 2000
#   0.00*wA + 0.00*wB + 0.00*x1A + 0.00*x1B + 0.00*x2A + 0.00*x2B + 1.00*x3A + 1.00*x3B <= 3000
#        wk >= 0
#       xij >= 0


# (e.1) Transcribimos el modelo anterior a R ----
A1 <- matrix(c(-0.8,    0, 0.2,   0, 0.1,   0, 0.05,    0,
               -0.3,    0, 0.1,   0, 0.2,   0, 0.05,    0,
               -0.5,    0, 0.3,   0, 0.3,   0, 0.20,    0,
                  0, -0.4,   0, 0.1,   0, 0.2,    0, 0.05,
                  0, -0.6,   0, 0.1,   0, 0.2,    0, 0.05,
                  0, -0.3,   0, 0.3,   0, 0.3,    0, 0.70,
                  0, -0.7,   0, 0.3,   0, 0.3,    0, 0.20,
                  0,    0,   1,   1,   0,   0,    0,    0,
                  0,    0,   0,   0,   1,   1,    0,    0,
                  0,    0,   0,   0,   0,   0,    1,    1), ncol = 8, byrow = TRUE)
A1

B1 <- c(0, 0, 0, 0, 0, 0, 0, 1000, 2000, 3000)
B1

C1 <- c(200, 300, -30, -30, -40, -40, -50, -50)  
C1

D1 <- c("<=", "<=", ">=", ">=", "<=", ">=", "<=", "<=", "<=", "<=")
D1

sol1 <- lp(direction = "max", 
          const.mat = A1,
          const.rhs = B1,
          objective.in = C1, 
          const.dir = D1,
          compute.sens = 1)

          
# (e.2) Valores óptimos para las variables de decisión ----
sol1$solution
# [1] 1800 1000 1000    0    0 2000 3000    0
#  wA = 1.800 toneladas de aleación A producidas
#  wB = 1.000 toneladas de aleación B producidas
# x1A = 1.000 toneladas del mineral 1 asignadas a la aleación A
# x1B = 0     toneladas del mineral 1 asignadas a la aleación B
# x2A = 0     toneladas del mineral 2 asignadas a la aleación A
# x2B = 2.000 toneladas del mineral 2 asignadas a la aleación B
# x3A = 3.000 toneladas del mineral 3 asignadas a la aleación A
# x3B = 0     toneladas del mineral 3 asignadas a la aleación B


# (e.3) Analisis de utilizacion de recursos ----
0.8*sol1$solution[1] + 0*sol1$solution[2]
# [1] 1440

0.2*sol1$solution[3] + 0*sol1$solution[4] + 0.1*sol1$solution[5] + 0*sol1$solution[6] + 0.05*sol1$solution[7] + 0*sol1$solution[8]
# [1] 350


# (f) Valor óptimo de la función objetivo ----
sol1
# Success: the objective function is 4e+05
# Z* = 400.000 unidades monetarias de utilidad


## EJERCICIO 2 ----
library(lpSolve)
library(tibble)

# (a) Definicion de las variables de decision ----
# x1 : Cantidad de pupitres unipersonales a producir por semana.
# X2 : Cantidad de pupitres bipersonales a producir por semana.
# X3 : Cantidad de mesas a producir por semana.


# (b) Funcion objetivo (utilidad) ----
# Z = 30*X1 + 20*X2 + 50*X3


# (c) Restricciones ----
# 1*x1 + 2*x2 + 1*X3 <= 4300 (Madera)
# 3*x1 + 0*x2 + 2*X3 <= 4600 (Tubo)
# 1*X1 + 4*X4 + 0*X3 <= 4200 (Formica)
#                 xi >= 0    (no negatividad de las variables)


# (d) Modelo a resolver ----
# MAX Z = 30*X1 + 20*X2 + 50*X3
# S.T.
# 1*x1 + 2*x2 + 1*X3 <= 4300 
# 3*x1 + 0*x2 + 2*X3 <= 4600 
# 1*X1 + 4*X4 + 0*X3 <= 4200 
#                 xi >= 0


# (e.1) Transcribimos el modelo anterior a R ----
A2 <- matrix(c(1, 2, 1,
               3, 0, 2,
               1, 4, 0), ncol = 3, byrow = TRUE)
A2

C2 <- c(30, 20, 50)
C2

B2 <- c(4300, 4600, 4200)  
B2

D2 <- c("<=", "<=", "<=")
D2

sol2 <- lp(direction = "max", 
          const.mat = A2,
          const.rhs = B2,
          objective.in = C2, 
          const.dir = D2,
          compute.sens = 1)


# (e.2) Valores óptimos para las variables de decisión ----
sol2$solution
# [1]    0 1000 2300
# x1 = 0    unidades de pupitres unipersonales a producir por semana
# x2 = 1000 unidades de pupitres bipersonales a producir por semana
# x3 = 2300 unidades de mesas a producir por semana


# (e.3) Analisis de utilizacion de recursos ----
1*sol2$solution[1] + 2*sol2$solution[2] + 1*sol2$solution[3]
# [1] 4300 Se utilizan los 4300 metros de madera
# S1 = 0   Holgura asociada a primera restricción: no hay sobrante

3*sol2$solution[1] + 0*sol2$solution[2] + 2*sol2$solution[3]
# [1] 4600 Se utilizan los 4600 metros de tubo
# S2 = 0   Holgura asociada a segunda restricción: no hay sobrante

1*sol2$solution[1] + 4*sol2$solution[2] + 0*sol2$solution[3]
# [1] 4000  Se utilizan 4000 metros de fórmica
# S3 = 200  Holgura asociada a tercera restricción: sobran 200 metros de formica


# (f) Valor optimo de la funcion objetivo ----
sol2
# Success: the objective function is 135000 
# Z* = 135.000 Unidades monetarias de utilidad


# (g.1) Analisis de sensibilidad para los coeficientes de recursos ----
# Lado derecho de las restricciones, bi. 
# El incremento/decremento de una unidad en bi, produce un aumento/disminucion en Z∗ igual al precio sombra Yi.
sol2$duals[1:3]
# [1] 10 20  0
# Aumento/decremento de Z∗ si b1 aumenta/decrece en una unidad.
# Y1 = 10 (precio sombra de la disponibilidad de madera)
# Aumento/decremento de Z∗ si b2 aumenta/decrece en una unidad.
# Y2 = 20 (precio sombra de la disponibilidad de tubo)
# Aumento/decremento de Z∗ si b3 aumenta/decrece en una unidad.
# Y3 = 0 (precio sombra de la disponibilidad de formica)


# (g.2) Analisis de sensibilidad para coeficientes cj ----
# El plan de produccion optimo X∗ no cambia, pero si cambia Z∗ ya que cambian los coeficientes cj.
tibble(c = c("c1", "c2", "c3"),
       min = sol2$sens.coef.from,
       max = sol2$sens.coef.to)
#  c       min     max
# c1    -1.00e30 7.00e 1
# c2     0.      1.00e 2
# c3     2.33e 1 1.00e30

# Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden cambiar cambiar en estos intervalo sin que se modifique el plan optimo de produccion)

#    -inf  <= c1 <= 70    (el costo unitario de los pupitres unipersonales puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)
#       0  <= c2 <= 100   (el costo unitario de los pupitres bipersonales puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)
#     23.3 <= c3 <= +inf  (el costo unitario de las mesas puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)


# (g.3) Analisis de sensibilidad para los coeficientes bi ----
A2_dual <- t(A2)

B2_dual <- C2

C2_dual <- B2

D2_dual <- c(">=", ">=", ">=")

sol2_dual <- lp(direction = "min", 
               const.mat = A2_dual,
               const.rhs = B2_dual,
               objective.in = C2_dual, 
               const.dir = D2_dual,
               compute.sens = 1)
sol2_dual

tibble(b = c("b1", "b2", "b3"), 
       min = sol2_dual$sens.coef.from,
       max = sol2_dual$sens.coef.to)

# b      min    max
# b1    2300  4.40e 3
# b2    4400  8.60e 3
# b3    4000  1.00e30

# Los intervalos para los coeficientes bi son 

#   2300 <= b1 <= 4400  (la cantidad disponible de madera puede cambiar en este intervalo sin que se modifique el precio sombra Y1)
#   4400 <= b2 <= 8600  (la cantidad disponible de tubo puede cambiar en este intervalo sin que se modifique el precio sombra Y2)
#   4000 <= b3 <= +inf  (la cantidad disponible de formica puede cambiar en este intervalo sin que se modifique el precio sombra Y2)


# (h) Pregunta de analisis 1 ----
#     Según los precios sombra para las materias primas 1, 2 y 3, cada metro adicional de madera aumenta
#     el ingreso en $10, en comparación con $20 para los tubos 2 y ninguno para la fórmica. Por lo tanto,
#     los tubos deben tener la prioridad.


# (i) Pregunta de analisis 2 ----
#     Para la madera, el ingreso neto adicional por minuto es $10 - $15 = -$5, y para los tubos,
#     es $20 - $15 = $5. Por consiguiente, sólo los tubos deben considerarse para el incremento de
#     disponibilidad.


# (j) Pregunta de analisis 3 ----
#     El precio sombra para la disponibilidad de fórmica es $0 y es válido en el intervalo (4000, inf)metros. 
#     La cantidad semanal actual disponible de formica es de 4200 metros y la disminución propuesta de 100 metros queda comprendido
#     dentro del intervalo de factibilidad (4200 - 100 = 4100). Por consiguiente, la disminucion del ingreso
#     es $0*100 = $0, lo que significa que el ingreso total se no incrementará quedando en los $135.000 (= $135.000 - $0).


# (k) Pregunta de analisis 4 ----
#     El precio sombra para la disponibilidad de madera es $10 y es valido en el intervalo (2300, 4400)metros.
#     La cantidad semanal actual disponible de madera es 4300 metros y el incremento propuesto de 200 metros queda 
#     fuera del intervalo de factibilidad (4300 + 200 = 4500). Por lo tanto, sólo
#     podemos hacer una conclusión inmediata con respecto a un incremento hasta de 100 metros. Más
#     allá de eso, se requieren más cálculos para hallar la respuesta. Recuerde que
#     quedar fuera del intervalo de factibilidad no significa que el problema no tenga solución,
#     sino que la información disponible no es suficiente para llegar a una conclusión completa.
#     Resolvemos el nuevo escenario para encontrar las respuestas:
#     Nuevo escenario donde se tienen 4500 metros de madera disponible
B2_k <- c(4500, 4600, 4200)

sol2_k <- lp(direction = "max", 
             const.mat = A2,
             const.rhs = B2_k,
             objective.in = C2, 
             const.dir = D2,
             compute.sens = 1)
# Utilidad óptima
sol2_k
# Success: the objective function is 136000 
# Z'* = 136.000 Unidades monetarias de utilidad

# Plan productivo óptimo
sol2_k$solution
# [1]    0 1050 2300
# x'1 = 0    unidades de pupitres unipersonales a producir por semana
# x'2 = 1050 unidades de cpupitres bipersonales a producir por semana
# x'3 = 2300 unidades de mesas a producir por semana

# Precios sombra
sol2_k$duals[1:3]
# [1] 0 25  5
# Y'1 = 0  (precio sombra de la disponibilidad de madera)
# Y'2 = 25 (precio sombra de la disponibilidad de tubo)
# Y'3 = 5  (precio sombra de la disponibilidad de formica)

# Intervalo para coeficientes c′j.
tibble(c = c("c'1", "c'2", "c'3"), 
       min = sol2_k$sens.coef.from, 
       max = sol2_k$sens.coef.to)
#  c        min     max
# c'1   -1.00e30  8.00e1
# c'2    3.55e-15 1.00e30
# c'3    1.67e1   1.00e30

#    -inf  <= c'1 <= 80    (el costo unitario de los pupitres unipersonales puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)
#      ~0  <= c'2 <= +inf  (el costo unitario de los pupitres bipersonales puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)
#     16.7 <= c'3 <= +inf  (el costo unitario de las mesas puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)

# Intervalo para coeficientes b′i (hay que resolver el problema dual).
A2_k_dual <- t(A2)

B2_k_dual <- C2

C2_k_dual <- B2_k

D2_k_dual <- c(">=", ">=", ">=")

sol2_k_dual <- lp(direction = "min", 
                  const.mat = A2_k_dual,
                  const.rhs = B2_k_dual,
                  objective.in = C2_k_dual, 
                  const.dir = D2_k_dual,
                  compute.sens = 1)

tibble(b = c("b'1", "b'2", "b'3"), 
       min = sol2_k_dual$sens.coef.from, 
       max = sol2_k_dual$sens.coef.to)
#  b      min   max
# b'1    4400 1.00e30
# b'2       0 4.80e 3
# b'3       0 4.40e 3

#   4400 <= b'1 <= +inf  (la cantidad disponible de madera puede cambiar en este intervalo sin que se modifique el precio sombra Y1)
#      0 <= b'2 <= 4800  (la cantidad disponible de tubo puede cambiar en este intervalo sin que se modifique el precio sombra Y2)
#      0 <= b'3 <= 4400  (la cantidad disponible de formica puede cambiar en este intervalo sin que se modifique el precio sombra Y2)

# (l) Pregunta de analisis 5 ----
#     Los ingresos unitarios actuales de los pupitres unipersonales y bipersonales son $30 y $20 respectivamente.
#     Los aumentos propuestos ($60 y $30) quedan dentro de los intervalos respectivos de factibilidad por lo que
#     la solución X* permanecerá óptima.
#     Observe que aunque los valores de las variables X* no cambian, el valor óptimo de Z* cambia a 
#     60*(0) + 20*(1000) + 50*(2300) = $135.000 en el primer caso (se mantiene igual ya que no se producen pupitres unipersonales en este nuevo escenario)
#     30*(0) + 30*(1000) + 50*(2300) = $145.000 en el segundo caso (aumenta debido al aumento de utilidad de los pupitres bipersonales)


## EJERCICIO 3 ----
library(lpSolve)
library(tibble)

# (a) Definicion de las variables de decision ----
# x1 : Cantidad de producto 1 producir por dia.
# X2 : Cantidad de producto 2 producir por dia.


# (b) Funcion objetivo (utilidad) ----
# Z = 60*X1 + 40*X2


# (c) Restricciones ----
# 4*x1 + 2*x2 <= 16 (maquina 1)
# 2*x1 + 6*x2 <= 16 (maquina 2)
#          xi >= 0  (no negatividad de las variables)

# (d) Modelo a resolver ----
# MAX Z = 60*X1 + 40*X2
# S.T.
# 4*x1 + 2*x2 <= 16 
# 2*x1 + 6*x2 <= 16 
#          xi >= 0


# (e.1) Transcribimos el modelo anterior a R ----
A3 <- matrix(c(4, 2,
               2, 6), ncol = 2, byrow = TRUE)
A3

B3 <- c(16, 16)  
B3

C3 <- c(60, 40)
C3

D3 <- c("<=", "<=")
D3

sol3 <- lp(direction = "max", 
           const.mat = A3,
           const.rhs = B3,
           objective.in = C3, 
           const.dir = D3,
           compute.sens = 1)


# (e.2) Valores óptimos para las variables de decisión ----
sol3$solution
# [1] 3.2 1.6
# x1 = 3.2 unidades del producto 1 producir por dia
# x2 = 1.6 unidades del producto 2 producir por dia


# (e.3) Analisis de utilizacion de recursos ----
4*sol3$solution[1] + 2*sol3$solution[2]
# [1] 16   Se utilizan las 16 horas de la maquina 1
# S1 = 0   Holgura asociada a primera restricción: no hay sobrante

2*sol3$solution[1] + 6*sol3$solution[2]
# [1] 16   Se utilizan las 16 horas de la maquina 2
# S2 = 0   Holgura asociada a segunda restricción: no hay sobrante


# (f) Valor optimo de la funcion objetivo ----
sol3
# Success: the objective function is 256
# Z* = 256 Unidades monetarias de utilidad


# (g.1) Analisis de sensibilidad para los coeficientes de recursos ----
# Lado derecho de las restricciones, bi. 
# El incremento/decremento de una unidad en bi, produce un aumento/disminucion en Z∗ igual al precio sombra Yi.
sol3$duals[1:2]
# [1] 14 2
# Aumento/decremento de Z∗ si b1 aumenta/decrece en una unidad.
# Y1 = 14 (precio sombra de la disponibilidad de la maquina 1)
# Aumento/decremento de Z∗ si b2 aumenta/decrece en una unidad.
# Y2 = 2 (precio sombra de la disponibilidad de la maquina 2)


# (g.2) Analisis de sensibilidad para coeficientes cj ----
# El plan de produccion optimo X∗ no cambia, pero si cambia Z∗ ya que cambian los coeficientes cj.
tibble(c = c("c1", "c2"),
       min = sol3$sens.coef.from,
       max = sol3$sens.coef.to)
#  c     min   max
# c1    13.3    80
# c2    30     180

# Los intervalos para los coeficientes cj son (los costos unitario de las actividades pueden cambiar cambiar en estos intervalo sin que se modifique el plan optimo de produccion)

#  13.33 <= c1 <= 80  (el costo unitario del primer producto puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)
#  30.00 <= c2 <= 180 (el costo unitario del segundo producto puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)


# (g.3) Analisis de sensibilidad para los coeficientes bi ----
A3_dual <- t(A3)

B3_dual <- C3

C3_dual <- B3

D3_dual <- c(">=", ">=")

sol3_dual <- lp(direction = "min", 
                const.mat = A3_dual,
                const.rhs = B3_dual,
                objective.in = C3_dual, 
                const.dir = D3_dual,
                compute.sens = 1)
sol3_dual

tibble(b = c("b1", "b2"), 
       min = sol3_dual$sens.coef.from,
       max = sol3_dual$sens.coef.to)

# b      min  max
# b1    5.33  32
# b2    8     48

# Los intervalos para los coeficientes bi son 

#   5.34 <= b1 <= 32 (las horas disponibles de la maquina 1 pueden cambiar en este intervalo sin que se modifique el el precio sombra Y1)
#   8.00 <= b2 <= 48 (las horas disponibles de la maquina 2 pueden cambiar en este intervalo sin que se modifique el el precio sombra Y2)


# (h) Pregunta de analisis 1 ----
#     Según los precios sombra para las máquinas 1 y 2, cada hora adicional de la máquina 1 incrementa
#     el ingreso en $14, en comparación con sólo $2 para la máquina 2. Por lo tanto, la máquina
#     1 debe tener la prioridad.


# (i) Pregunta de analisis 2 ----
#     Para la máquina 1, el ingreso neto adicional por hora es $14 - $20 = -$6, y para la maquina 2,
#     es $2 - $20 = -$18. Por consiguiente, no es recomendable considerarse el incremento de
#     capacidad en ninguna maquina.


# (j) Pregunta de analisis 3 ----
#     El precio sombra para la maquina 1 es $14 y es válido en el intervalo (5.34,32)h. 
#     La cantidad de horas actuales disponibles de la maquina 1 son 16 horas y el incremento propuesto de 10 horas queda comprendido 
#     dentro del intervalo de factibilidad (16 + 10 = 26). Por consiguiente, el incremento del ingreso
#     es $14*(26 - 16) = $140, lo que significa que el ingreso total se incrementará de $256 a $396 (= $256 + $140).


# (k) Pregunta de analisis 4 ----
#     El precio sombra para la disponibilidad de de la maquina 1 es $14 y es valido en el intervalo (5.34,32)h.
#     La cantidad de horas actuales disponibles de la maquina 1 son 16 horas y el incremento propuesto a 40 horas queda 
#     fuera del intervalo de factibilidad. Por lo tanto, sólo
#     podemos hacer una conclusión inmediata con respecto a un incremento hasta de 32 horas. Más
#     allá de eso, se requieren más cálculos para hallar la respuesta. Recuerde que
#     quedar fuera del intervalo de factibilidad no significa que el problema no tenga solución,
#     sino que la información disponible no es suficiente para llegar a una conclusión completa.
#     Resolvemos el nuevo escenario para encontrar las respuestas:
#     Nuevo escenario donde se tienen 40 horas disponibles de la maquina 1
B3_k <- c(40, 16)

sol3_k <- lp(direction = "max", 
             const.mat = A3,
             const.rhs = B3_k,
             objective.in = C3, 
             const.dir = D3,
             compute.sens = 1)
# Utilidad óptima
sol3_k
# Success: the objective function is 480 
# Z'* = 480 Unidades monetarias de utilidad

# Plan productivo óptimo
sol3_k$solution
# [1] 8 0
# x'1 = 8 unidades del producto 1 producir por dia
# x'2 = 0 unidades del producto 2 producir por dia

# Precios sombra
sol3_k$duals[1:2]
# [1] 0 30
# Y'1 = 0  (precio sombra de la disponibilidad de la maquina 1)
# Y'2 = 30 (precio sombra de la disponibilidad de la maquina 2)

# Intervalo para coeficientes c′j.
tibble(c = c("c'1", "c'2"), 
       min = sol3_k$sens.coef.from, 
       max = sol3_k$sens.coef.to)
#  c       min      max
# c'1    1.33e 1  1.00e30
# c'2   -1.00e30  1.80e 2

#  13.33 <= c'1 <= +inf (el costo unitario del primer producto puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)
#   -inf <= c'2 <=  180 (el costo unitario del segundo producto puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)

# Intervalo para coeficientes b′i (hay que resolver el problema dual).
A3_k_dual <- t(A3)

B3_k_dual <- C3

C3_k_dual <- B3_k

D3_k_dual <- c(">=", ">=")

sol3_k_dual <- lp(direction = "min", 
                  const.mat = A3_k_dual,
                  const.rhs = B3_k_dual,
                  objective.in = C3_k_dual, 
                  const.dir = D3_k_dual,
                  compute.sens = 1)

tibble(b = c("b'1", "b'2"), 
       min = sol3_k_dual$sens.coef.from, 
       max = sol3_k_dual$sens.coef.to)
#  b      min   max
# b'1      32  1.00e30
# b'2       0  2.00e 1

#   32 <= b'1 <= +inf (las horas disponibles de la maquina 1 pueden cambiar en este intervalo sin que se modifique el el precio sombra Y1)
#    0 <= b'2 <=   20 (las horas disponibles de la maquina 2 pueden cambiar en este intervalo sin que se modifique el el precio sombra Y2)


# (l) Pregunta de analisis 5 ----
#     Los ingresos unitarios actuales de los productos 1 y 2 son $60 y $40 respectivamente.
#     Los aumentos propuestos ($70 y $50) quedan dentro de los intervalos respectivos de factibilidad por lo que
#     la solución X* permanecerá óptima.
#     Observe que aunque los valores de las variables X* no cambian, el valor óptimo de Z* cambia a:
#     $70*(3.2) + $40*(1.6) = $288 en el primer escenario (aumenta debido al aumento en la utilidad unitaria del primer producto).
#     $60*(3.2) + $50*(1.6) = $272 en el segundo escenario (aumenta debido al aumento en la utilidad unitaria del segundo producto).