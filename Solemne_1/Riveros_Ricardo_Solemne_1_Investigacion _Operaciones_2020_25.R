#Ricardo A. Riveros J. 

#Solemne 1 Investigacion de Operaciones.

#Ejercicio 1
#(a) Defina correctamente todas las variables de decisión, Sugerencia: sea xik las toneladas del mineral i asignadas a la aleación k, y defina wk como las toneladas producidas de la aleación k.
#(b) Escriba la funcion objetivo que optimiza la utilidad para la elaboración de las aleaciones.
#(c) Escriba las restricciones asociadas al problema.
#(d) Plantee matemáticamente el modelo completo asociado al problema.
#(e) Encuentre el plan óptimo de producción e interprete los resultados.
#(f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.



#(a) Definicion de las variables de decision:

#                                     xik: toneladas  de mineral asignadas a la aleacion k
#                                     wk:  toneladas producidas de la aleación k
#                                     WA:  toneladas producidas de la aleación A
#                                     WB:  toneladas producidas de la aleación B
#                                     X1A: toneladas  de mineral asignadas a la aleacion A 
#                                     X2A: toneladas  de mineral asignadas a la aleacion A
#                                     X3A: toneladas  de mineral asignadas a la aleacion A
#                                     X1B: toneladas  de mineral asignadas a la aleacion B
#                                     X2B: toneladas  de mineral asignadas a la aleacion B
#                                     X3B: toneladas  de mineral asignadas a la aleacion B



#(b)Escriba la funcion objetivo que optimiza la utilidad para la elaboración de las aleaciones:

#funcion Objetivo:
#                                     Zmaximisar:200WA + 300WB -30(X1A+X1B)-40(X2A+X2B)-50(X3A+X3B)


#(c) Escriba las restricciones asociadas al problema:

#Restricciones:

#                                              0.2X1A + 0.1X2A + 0.05X3A <= 0.8WA   (Toneladas de mineral (I),(II),(III) asignadas a la aleacion A )
#                                              0.1X1A + 0.2X2A + 0.05X3A <= 0.3WA   (Toneladas de mineral (I),(II),(III) asignadas a la aleacion A )
#                                              0.3X1A + 0.3X2A + 0.2X3A  >= 0.5WA   (Toneladas de mineral (I),(II),(III) asignadas a la aleacion A )
#                                              0.1X1B + 0.2X2B + 0.05X3B >= 0.4WB   (Toneladas de mineral (I),(II),(III) asignadas a la aleacion B )
#                                              0.1X1B + 0.2X2B + 0.05X3B <= 0.6WB   (Toneladas de mineral (I),(II),(III) asignadas a la aleacion B )
#                                              0.3X1B + 0.3X2B + 0.7X3B  >= 0.3WB   (Toneladas de mineral (I),(II),(III) asignadas a la aleacion B )
#                                              0.3X1B + 0.3X2B + 0.2X3B  <= 0.7WB   (Toneladas de mineral (I),(II),(III) asignadas a la aleacion B )
#                                                              x1A + X1B <= 1000    (Total de mineral 1 Utilizado para la aleacion A Y B )
#                                                              x2A + X2B <= 2000    (Total de mineral 2 Utilizado para la aleacion A Y B )
#                                                              x3A + X3B <= 3000    (Total de mineral 3 Utilizado para la aleacion A Y B )
#                                         XIA , X2A ,X3A, XIB , X2B ,X3B >= 0       (Restricicion de no negatividad de las variables )

#(d) Plantee matemáticamente el modelo completo asociado al problema:

#Modelo a resolver:

#Zmax: 200WA + 300WB -30(X1A+X1B)-40(X2A+X2B)-50(X3A+X3B)

# -0.8WA + 0.2X1A + 0.1X2A + 0.05X3A <= 0  
# -0.3WA + 0.1X1A + 0.2X2A + 0.05X3A <= 0  
# -0.5WA + 0.3X1A + 0.3X2A + 0.2X3A  >= 0  
# -0.4WB + 0.1X1B + 0.2X2B + 0.05X3B >= 0  
# -0.6WB + 0.1X1B + 0.2X2B + 0.05X3B <= 0  
# -0.3WB + 0.3X1B + 0.3X2B + 0.7X3B  >= 0  
# -0.7WB + 0.3X1B + 0.3X2B + 0.2X3B  <= 0   
#                          xIA + XIB <= 1000                  
#                          x2A + X2B <= 2000                  
#                          x3A + X3B <= 3000

#Transcripcion de datos a R.

#Coeficientes de la función objetivo.

C1 <- c(200, 300, -30, -40, -50, -30, -40, -50)

C1

#Matriz de coeficientes de las restricciones.

A1 <- matrix(c(  -0.8,    0,   0.2,  0.1,  0.05,    0,    0,    0,  
                 -0.3,    0,   0.1,  0.2,  0.05,    0,    0,    0,   
                 -0.5,    0,   0.3,  0.3,   0.2,    0,    0,    0,  
                    0, -0.4,     0,    0,     0,  0.1,  0.2, 0.05,   
                    0, -0.6,     0,    0,     0,  0.1,  0.2, 0.05, 
                    0, -0.3,     0,    0,     0,  0.3,  0.3,  0.7,
                    0, -0.7,     0,    0,     0,  0.3,  0.3,  0.2,   
                    0,    0,     1,    0,     0,    1,    0,    0,   
                    0,    0,     0,    1,     0,    0,    1,    0,   
                    0,    0,     0,    0,     1,    0,    0,    1), ncol = 8, byrow = TRUE)
A1

#Direccion de las desigualdades de las restricciones

D1 <- c("<=","<=",">=",">=","<=",">=","<=","<=","<=","<=")

D1

#Coeficientes lado derecho de las restricciones

B1 <- c(0, 0, 0, 0, 0, 0, 0, 1000, 2000, 3000)

B1

#Plan optimo de produccion.

#install.packages("lpSolve")
library(lpSolve)
sol1 <- lp(direction = "max",
          const.mat = A1,
          const.rhs = B1,
          objective.in = C1,
          const.dir = D1,
          compute.sens = 1)

sol1$solution

#Cantidad de toneladas de aleacion A (WA) a producir 1800. 

sol1$solution[1]

#Cantidad de toneladas de aleacion B (WB) a producir 1000. 

sol1$solution[2]

#Cantidad de toneladas de mineral 1 (X1A) para la aleacion A (WA) 1000.

sol1$solution[3]

#Cantidad de toneladas de mineral 2 (X2A) para la aleacion A (WA) 0.

sol1$solution[4]

#Cantidad de toneladas de mineral 3 (X3A) para la aleacion A (WA) 3000.

sol1$solution[5]

#Cantidad de toneladas de mineral 1 (X1B) para la aleacion B (WB) 0.

sol1$solution[6]

#Cantidad de toneladas de mineral 2 (X2B) para la aleacion B (WB) 2000.

sol1$solution[7]

#Cantidad de toneladas de mineral 3 (X3B) para la aleacion B (WB) 0.

sol1$solution[8]

#Holgura primera restricción: 

-0.8*sol1$solution[1] + 0*sol1$solution[2] + 0.2*sol1$solution[3] + 0.1*sol1$solution[4] + 0.05*sol1$solution[5] + 0*sol1$solution[6] + 0*sol1$solution[7] + 0*sol1$solution[8]

#Holgura segunda restricción:

-0.3*sol1$solution[1] + 0*sol1$solution[2] + 0.1*sol1$solution[3] + 0.2*sol1$solution[4] + 0.05*sol1$solution[5] + 0*sol1$solution[6] + 0*sol1$solution[7] + 0*sol1$solution[8]

#Holgura tercera restricción:

-0.5*sol1$solution[1] + 0*sol1$solution[2] + 0.3*sol1$solution[3] + 0.3*sol1$solution[4] + 0.2*sol1$solution[5] + 0*sol1$solution[6] + 0*sol1$solution[7] + 0*sol1$solution[8]

#Holgura cuarta restricción:

0*sol1$solution[1] + -0.4*sol1$solution[2] + 0*sol1$solution[3] + 0*sol1$solution[4] + 0*sol1$solution[5] + 0.1*sol1$solution[6] + 0.2*sol1$solution[7] + 0.05*sol1$solution[8]

#Holgura quinta restricción:

0*sol1$solution[1] + -0.6*sol1$solution[2] + 0*sol1$solution[3] + 0*sol1$solution[4] + 0*sol1$solution[5] + 0.1*sol1$solution[6] + 0.2*sol1$solution[7] + 0.05*sol1$solution[8]

#Holgura sexta restricción:

0*sol1$solution[1] + -0.3*sol1$solution[2] + 0*sol1$solution[3] + 0*sol1$solution[4] + 0*sol1$solution[5] + 0.3*sol1$solution[6] + 0.3*sol1$solution[7] + 0.7*sol1$solution[8]

#Holgura septima restricción:

0*sol1$solution[1] + -0.7*sol1$solution[2] + 0*sol1$solution[3] + 0*sol1$solution[4] + 0*sol1$solution[5] + 0.3*sol1$solution[6] + 0.3*sol1$solution[7] + 0.2*sol1$solution[8]

#Holgura octava restricción:

0*sol1$solution[1] + 0*sol1$solution[2] + 1*sol1$solution[3] + 0*sol1$solution[4] + 0*sol1$solution[5] + 1*sol1$solution[6] + 0*sol1$solution[7] + 0*sol1$solution[8]

#Holgura novena restricción:

0*sol1$solution[1] + 0*sol1$solution[2] + 0*sol1$solution[3] + 1*sol1$solution[4] + 0*sol1$solution[5] + 0*sol1$solution[6] + 1*sol1$solution[7] + 0*sol1$solution[8]

#Holgura decima restricción:

0*sol1$solution[1] + 0*sol1$solution[2] + 0*sol1$solution[3] + 0*sol1$solution[4] + 1*sol1$solution[5] + 0*sol1$solution[6] + 0*sol1$solution[7] + 1*sol1$solution[8]

#(e) Encuentre el plan óptimo de producción e interprete los resultados.

#Para la holgura de la primer restriccion el valor es : 1090 en el programa aparece con signo negativo, se debe a que se llevo a negativo el valor del lado derecho de la restricicion, para poder ingresar el problema matematico en R
#Para la holgura de la segunda restriccion el valor es : 290 en el programa aparece con signo negativo, se debe a que se llevo a negativo el valor del lado derecho de la restricicion, para poder ingresar el problema matematico en R
#Para la holgura de la tercera restriccion el valor es : 0
#Para la holgura de la cuarta restriccion el valor es : 0 el valor se lleva 0 puesto que el numero es muy pequeño 5.684342e-14 
#Para la holgura de la quinta restriccion el valor es : 200 en el programa aparece con signo negativo, se debe a que se llevo a negativo el valor del lado derecho de la restricicion, para poder ingresar el problema matematico en R
#Para la holgura de la sexta restriccion el valor es : 300
#Para la holgura de la septima restriccion el valor es : 100 en el programa aparece con signo negativo, se debe a que se llevo a negativo el valor del lado derecho de la restricicion, para poder ingresar el problema matematico en R
#Para la holgura de la octava restriccion el valor es : 1000 
#Para la holgura de la novena restriccion el valor es : 2000
#Para la holgura de la decima restriccion el valor es : 3000

#(f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.

sol1
# El valor optimo de la funcion objetivo es de $400.000 como venta total.




#Ejercicio 2
#(a) Defina correctamente todas las variables de decisión.
#(b) Escriba la función objetivo que optimiza la utilidad para la elaboración de los productos.
#(c) Escriba las restricciones asociadas al problema.
#(d) Plantee matemáticamente el modelo completo asociado al problema.
#(e) Encuentre el plan óptimo de producción e interprete los resultados.
#(f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.
#(g) Realice un análisis de sensibilidad completo.
#(h) Si la empresa pudiese incrementar la cantidad de materia prima a usar, ¿cuál tendrá la prioridad? Explique fundamentadamente.
#(i) Se sugiere aumentar la cantidad de madera y tubo al costo adicional de 15/m para cada una. ¿Es esto aconsejable? Explique fundamentadamente.
#(j) Si la cantidad de fórmica se reduce en 100 metros, ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente.
#(k) Suponga que la disponibilidad de madera se incrementa en 200 metros, ¿cómo afectará este incremento al ingreso óptimo? Explique fundamentadamente.
#(l) Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a 60 y 30 unidades monetarias respectivamente, y de manera independiente. ¿Permanecerá igual el óptimo actual? Explique fundamentadamente y calcule el valor de la función objetivo en este nuevo escenario.

#(a) Defina correctamente todas las variables de decisión.

#                                           X1:cantidad de pupitres unipersonal a producir por semana. 
#                                           X2:cantidad de pupitres biperosonales a producir por semana. 
#                                           X3:cantidad de mesas a producir por semana. 

#(b) Escriba la función objetivo que optimiza la utilidad para la elaboración de los productos.

#funcion Objetivo:
#                                     Zmaximisar:30X1 + 20X2 + 50X3


#(c) Escriba las restricciones asociadas al problema.

#Restricciones:

#                                              1X1 + 2X2 + 1X3 <= 4300   (Metros de madera disponible para la fabricacion semanal)
#                                              3X1 + 0X2 + 2X3 <= 4600   (Metros de tubos disponibles para la fabricacion semanal)
#                                              1X1 + 4X2 + 0X3 <= 4200   (Metros de formica disponible para la fabricacion semanal)
#                                                   X1, X2, X3 >= 0      (Restricicion de no negatividad de las variables )

#(d) Plantee matemáticamente el modelo completo asociado al problema.


#Modelo a resolver:

#Zmax: 30X1 + 20X2 + 50X3

# 1X1 + 2X2 + 1X3 <= 4300  
# 3X1 + 0X2 + 2X3 <= 4600 
# 1X1 + 4X2 + 0X3 <= 4200 


#Transcripcion de datos a R.

#Coeficientes de la función objetivo.

C2 <- c(30, 20, 50)

C2

#Matriz de coeficientes de las restricciones.

A2 <- matrix(c(  1,    2,    1,
                 3,    0,    2,
                 1,    4,    0), ncol = 3, byrow = TRUE)
A2

#Direccion de las desigualdades de las restricciones

D2 <- c("<=","<=","<=")

D2

#Coeficientes lado derecho de las restricciones

B2 <- c(4300, 4600, 4200)

B2

#Plan optimo de produccion.

#install.packages("lpSolve")
library(lpSolve)
sol2 <- lp(direction = "max",
           const.mat = A2,
           const.rhs = B2,
           objective.in = C2,
           const.dir = D2,
           compute.sens = 1)

sol2$solution

#Cantidad de pupitres unipersonales a producir por semana.

sol2$solution[1]

#Cantidad de pupitres bipersonales a producir por semana.

sol2$solution[2]

#Cantidad de mesas a producir por semana.

sol2$solution[3]

#Holgura primera restricción: 

1*sol2$solution[1] + 2*sol2$solution[2] + 1*sol2$solution[3]

#Holgura segunda restricción:

3*sol2$solution[1] + 0*sol2$solution[2] + 2*sol2$solution[3]

#Holgura tercera restricción:

1*sol2$solution[1] + 4*sol2$solution[2] + 0*sol2$solution[3]

#(e) Encuentre el plan óptimo de producción e interprete los resultados.

#Para la holgura de la primer restriccion el valor es : 4300
#Para la holgura de la segunda restriccion el valor es : 4600
#Para la holgura de la tercera restriccion el valor es : 4000

#(f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.

sol2
# El valor optimo de la funcion objetivo es de $135.000 unidades monetarias de utilidad.

#(g) Realice un análisis de sensibilidad completo.

#(g.1.) Analisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi).

sol2$duals[1:3]

#[1] 10 20  0

# Y1 = 10. Aumento/disminucion de Z si b1 aumenta/decrece en una unidad.(Madera)
# Y2 = 20. Aumento/disminucion de Z si b2 aumenta/decrece en una unidad.(Tubo)
# Y3 = 0.  Aumento/disminucion de Z si b3 aumenta/decrece en una unidad.(Formica)

#(g.2.) Analisis de sensibilidad para coeficientes de la funcion objetivo.

tibble(c = c("c1", "c2", "c3"),
       min = sol2$sens.coef.from,
       max = sol2$sens.coef.to)

# A tibble: 3 x 3
#     c      min      max
#   <chr>   <dbl>    <dbl>
#  1 c1   -1.00e30  7.00e 1
#  2 c2    0.       1.00e 2
#  3 c3    2.33e 1  1.00e30

# -inf <= c1 <= 70    (el costo unitario de los pupitres unipersonal puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)
#  0.0 <= c2 <= 100   (el costo unitario de los pupitres bipersonal puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)
# 23.3 <= c3 <= +inf  (el costo unitario de las mesas puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)

#(g.3.) Analisis de sensibilidad para los coeficientes bi.

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

tibble(b = c("b1", "b2", "b3"), 
       min = sol2_dual$sens.coef.from,
       max = sol2_dual$sens.coef.to)

# A tibble: 3 x 3
#     b       min     max
#   <chr>    <dbl>   <dbl>
#   1 b1     2300   4.40e 3
#   2 b2     4400   8.60e 3
#   3 b3     4000.  1.00e30

#   2300 <= b1 <= 4400  (el coeficiente de la primera restriccion puede cambiar en este intervalo sin que se modifique el el precio sombra Y1)
#   4400 <= b2 <= 8600  (el coeficiente de la segunda restriccion puede cambiar en este intervalo sin que se modifique el el precio sombra Y2)
#   4000 <= b3 <= +inf  (el coeficiente de la tercera restriccion puede cambiar en este intervalo sin que se modifique el el precio sombra Y3)

#(h) Si la empresa pudiese incrementar la cantidad de materia prima a usar, ¿cuál tendrá la prioridad? Explique fundamentadamente.

# Segun los precios sombra para las materias primas, cada metro adicional de madera aumenta el ingreso en $10, mientras que el metro de tubo 
# aumenta $20 y el metro de formica no aumenta en nada cada metro extra.
# Por ende la prioridad de compra de materia prima la debe tener el tubo, ya que , por cada metro de este material el ingreso aumenta.

#(i) Se sugiere aumentar la cantidad de madera y tubo al costo adicional de 15/m para cada una. ¿Es esto aconsejable? Explique fundamentadamente.

# Para el caso de la madera el ingreso adicional seria negativo ($10 - $15 = $-5), a diferencia de los tubos que es ($20 - $15 = $5), con 
# esto en mente es mas aconsajable tener en cuenta los tubos para el aumento de disponibilidad de recurso.

#(j) Si la cantidad de fórmica se reduce en 100 metros, ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente.

# Existen tres puntos importantes a evaluar:
# Primero entre lo disponible y la holgura de formica existe una diferencia (sobran) 200 unidades, quitar 100 no importa.
# Segundo el precio sombra para la formica es 0.
# Tercero el intervalo de b3 en este caso es de 4000 a +inf., si al disponible de 4200 le quitamos 100, aun deja la cantidad suficiente para estar dentro del intervalo.
# Con respecto a el precio optimo de $135.000 se mantiene.

#(k) Suponga que la disponibilidad de madera se incrementa en 200 metros, ¿cómo afectará este incremento al ingreso óptimo? Explique fundamentadamente.

# Los puntos a observar son:
# Primero al tener una disponibilidad de 4300 metros de madera y agregar 200 mas nos encontramos con un total de 4500 metros de madera, lo que nos deja fuera del rango del precio sombra
# que es de 2300 <= b1 <= 4400, esto ademas obliga a recalcuar, pero a grandes rasgos se utilizaria la totalidad del metros de tubo y formica disponible y solo sobrarian 100 metros de madera
# El precio optimo pasaria de $135.000 a $136.000.

#(l) Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a 60 y 30 unidades monetarias respectivamente, y de manera independiente. ¿Permanecerá igual el óptimo actual? Explique fundamentadamente y calcule el valor de la función objetivo en este nuevo escenario.
# Al cambiar de 30 a 60 el ingreso unitario de los pupitres unipersonales y de 20 a 30 los pupitres bipersonales aun se mantiene en los dos casos el intervalo para el valor unitario. 
# el valor optimo actual es                            30*(0) + 20*(1000) + 50*(2300) = $135.000.
# y el valor optimo con los nuevos ingresos unitarios  60*(0) + 30*(1000) + 50*(2300) = $145.000.
# 

#Ejercicio 3
#(a) Defina correctamente todas las variables de decisión.
#(b) Escriba la funcion objetivo que optimiza la utilidad para la elaboración de los productos.
#(c) Escriba las restricciones asociadas al problema.
#(d) Plantee matemáticamente el modelo completo asociado al problema.
#(e) Encuentre el plan óptimo de producción e interprete los resultados.
#(f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.
#(g) Realice un análisis de sensibilidad completo.
#(h) Si la empresa puede incrementar la capacidad de ambas máquinas, ¿cuál máquina tendrá la prioridad? Explique fundamentadamente.
#(i) Se sugiere incrementar las capacidades de las máquinas 1 y 2 al costo adicional de $20/h para cada máquina. ¿Es esto aconsejable? Explique fundamentadamente.
#(j) Si la capacidad de la máquina 1 se incrementa de 16 a 26 horas, ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente.
#(k) Suponga que la capacidad de la máquina 1 se incrementa a 40 horas, ¿cómo afectará este incremento al ingreso óptimo? Explique fundamentadamente.
#(l) Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a $70 y $50, respectivamente, y de manera independiente. ¿Permanecerá igual el óptimo actual? Explique fundamentadamente y calcule el valor de la función objetivo en este nuevo escenario.

#(a) Defina correctamente todas las variables de decisión.

#                                           X1:cantidad de unidades que se fabricaran del producto 1. 
#                                           X2:cantidad de unidades que se fabricaran del producto 2. 


#(b) Escriba la función objetivo que optimiza la utilidad para la elaboración de los productos.

#funcion Objetivo:
#                                     Zmaximisar:60X1 + 40X2 


#(c) Escriba las restricciones asociadas al problema.

#Restricciones:

#                                                    4X1 + 2X2 <= 16     (Horas disponibles para la fabricacion del producto 1)
#                                                    2X1 + 6X2 <= 16     (Horas disponibles para la fabricacion del producto 2)
#                                                       X1, X2 >= 0      (Restricicion de no negatividad de las variables )

#(d) Plantee matemáticamente el modelo completo asociado al problema.


#Modelo a resolver:

#Zmax: 60X1 + 40X2

# 4X1 + 2X2 <= 16  
# 2X1 + 6X2 <= 16 

#Transcripcion de datos a R.

#Coeficientes de la función objetivo.

C3 <- c(60, 40)

C3

#Matriz de coeficientes de las restricciones.

A3 <- matrix(c(  4,    2,
                 2,    6), ncol = 2, byrow = TRUE)
A3

#Direccion de las desigualdades de las restricciones

D3 <- c("<=","<=")

D3

#Coeficientes lado derecho de las restricciones

B3 <- c(16, 16)

B3

#Plan optimo de produccion.

#install.packages("lpSolve")
library(lpSolve)
sol3 <- lp(direction = "max",
           const.mat = A3,
           const.rhs = B3,
           objective.in = C3,
           const.dir = D3,
           compute.sens = 1)

sol3$solution

# Cantidad de unidades que se fabricaran del producto 1.

sol3$solution[1]

# Cantidad de unidades que se fabricaran del producto 2.

sol3$solution[2]

# Holgura primera restricción: 

4*sol3$solution[1] + 2*sol3$solution[2]

# Holgura segunda restricción:

2*sol3$solution[1] + 6*sol3$solution[2]

#(e) Encuentre el plan óptimo de producción e interprete los resultados.

# Para la holgura de la primer restriccion el valor es : 16
# Para la holgura de la segunda restriccion el valor es : 16

#(f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.

sol3
# El valor optimo de la funcion objetivo es de 256 unidades monetarias.

#(g) Realice un análisis de sensibilidad completo.

#(g.1.) Analisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi).

sol3$duals[1:2]

#[1] 14  2

# Y1 = 14. Aumento/disminucion de Z si b1 aumenta/decrece en una unidad.(Maquina 1)
# Y2 =  2. Aumento/disminucion de Z si b2 aumenta/decrece en una unidad.(Maquina 2)

#(g.2.) Analisis de sensibilidad para coeficientes de la funcion objetivo.

tibble(c = c("c1", "c2"),
       min = sol3$sens.coef.from,
       max = sol3$sens.coef.to)

# A tibble: 2 x 3
#     c       min     max
#   <chr>    <dbl>   <dbl>
#  1 c1       13.3    80
#  2 c2       30     180

# 13.3 <= c1 <= 80    (el costo unitario del producto 1 puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)
#  30  <= c2 <= 180   (el costo unitario del producto 2 puede cambiar en este intervalo sin que se modifique el plan optimo de produccion)

#(g.3.) Analisis de sensibilidad para los coeficientes bi.

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

tibble(b = c("b1", "b2"), 
       min = sol3_dual$sens.coef.from,
       max = sol3_dual$sens.coef.to)

# A tibble: 2 x 3
#     b       min     max
#   <chr>    <dbl>   <dbl>
#   1 b1       5.33   32 
#   2 b2       8      48.

#   5.33 <= b1 <= 32  (el coeficiente de la primera restriccion puede cambiar en este intervalo sin que se modifique el el precio sombra Y1)
#   8    <= b2 <= 48  (el coeficiente de la segunda restriccion puede cambiar en este intervalo sin que se modifique el el precio sombra Y2)

#(h) Si la empresa puede incrementar la capacidad de ambas máquinas, ¿cuál máquina tendrá la prioridad? Explique fundamentadamente.

# Segun la informacion de los precios sombra, la maquina 1 produce $14 por hora y la maquina 2 produce $2 por la misma hora, la prioridad deberia de ser la maquina 1.

#(i) Se sugiere incrementar las capacidades de las máquinas 1 y 2 al costo adicional de $20/h para cada máquina. ¿Es esto aconsejable? Explique fundamentadamente.

# Si se sube el costo adicional a $20 por hora para cada maquina los resultados seria en la maquina 1 ($14 - $20 = -$6) y en la maquina 2 ($2 - $20 = -$18), 
# lo que dejaria fuera a ambas maquinas de los intervalos recomendados.

#(j) Si la capacidad de la máquina 1 se incrementa de 16 a 26 horas, ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente.

# El intervalo de factibilidad es de 5.33 a 32 para la maquina 1, este incremento se encuentra dentro del intervalo.
# El ingreso optimo se encuetran en $256, al hacer esta modificacion pasaria a $396.

#(k) Suponga que la capacidad de la máquina 1 se incrementa a 40 horas, ¿cómo afectará este incremento al ingreso óptimo? Explique fundamentadamente.

# El intervalo de factibilidad es de 5.33 a 32 para la maquina 1, este incremento se encuentra fuera del intervalo.
# El ingreso optimo se encuetran en $256, al hacer esta modificacion pasaria a $480, con ciertos detalles, como por ejemplo que no se fabricarian productos 2
# ademas se generarian 8 horas de ocio par ala maquina 1 y 0 para la maquina 2... esto sin contar que solo se fabricarian productos 1 (8).

#(l) Suponga que los ingresos unitarios producidos para los productos 1 y 2 cambian a $70 y $50, respectivamente, y de manera independiente. ¿Permanecerá igual 
#    el óptimo actual? Explique fundamentadamente y calcule el valor de la función objetivo en este nuevo escenario.

# Al cambiar de 60 a 70 el ingreso unitario del producto 1 y de 40 a 50 los ingresos del producto 2 aun se mantiene en los dos casos el intervalo para el valor unitario. 
# el valor optimo actual es                      60*(3.2) + 40*(1.6) = $256.
# el valor optimo con el nuevo ingreso unitario  70*(3.2) + 40*(1.6) = $288.
# el valor optimo con el nuevo ingreso unitario  60*(3.2) + 50*(1.6) = $272.
# al hacerlo de forma independiente se nota la frtaleza del producto 1 por sobre el producto 2, en materia de precio.

