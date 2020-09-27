


#Solemne #1 - Método Simples, Metodo de la Gran M, Análisis de Sensibilidad usando lpSolve

#Alumno:   Sebastián Venegas Carrasco
#Fecha:    12.08.2020
#Profesor: Marcelo Alid

###########################################################################

#Ejercicio N°1

# a.- Defina correctamente todas las variables de decisión. Sugerencia: sea X(ik) las toneladas del 
#     mineral (i) asignadas a la aleación (k) , y defina w(k) como las toneladas producidas de la aleación.

#WA: Aleación A (ton)
#WB: Aleación B (ton)

#X1A: Ton. de mineral 1 asignadas a la aleacion A 
#X2A: Ton. de mineral 2 asignadas a la aleacion A
#X3A: Ton. de mineral 3 asignadas a la aleacion A
#X1B: Ton. de mineral 1 asignadas a la aleacion B
#X2B: Ton. de mineral 2 asignadas a la aleacion B
#X3B: Ton. de mineral 3 asignadas a la aleacion B

# b.- Escriba la funcion objetivo que optimiza la utilidad para la elaboración de las aleaciones.

# **Función objetivo compuesta por el precio de Venta de Aleación A + Aleación B - Costo Mineral 1 - Costo Mineral 2 - Costo Mineral 3   

# Zmax: 200WA + 300WB - 30X1A - 40X2A - 50X3A - 30X1B - 40X2B - 50X3B

# Coeficientes de la función objetivo (Función "c" para generar Vector)

C <- c (200,300,-30,-40,-50,-30,-40,-50)

# c.- Escriba las restricciones asociadas al problema.

# Restricción por Especificación de Componentes

# r1 = 0.2X1A + 0.1X2A + 0.05X3A <= 0.8WA  
# r2 = 0.1X1A + 0.2X2A + 0.05X3A <= 0.3WA  
# r3 = 0.3X1A + 0.3X2A + 0.2X3A  >= 0.5WA  

# r4 = 0.1X1B + 0.2X2B + 0.05X3B >= 0.4WB  
# r5 = 0.1X1B + 0.2X2B + 0.05X3B <= 0.6WB  
# r6 = 0.3X1B + 0.3X2B + 0.7X3B  >= 0.3WB  
# r7 = 0.3X1B + 0.3X2B + 0.2X3B  <= 0.7WB  

# Restricción por cantidad de Mineral

# r8  = x1A + X1B <= 1000                     
# r9  = x2A + x2B <= 2000                     
# r10 = x3A + X3B <= 3000                     
# r11 = X1A , X2A ,X3A, X1B , X2B ,X3B >= 0

# d.- Plantee matemáticamente el modelo completo asociado al problema.

# Zmax: 200WA + 300WB - 30X1A - 40X2A - 50X3A - 30X1B - 40X2B - 50X3B

# Resolviendo las restricciones queda:

# r1 = 0.2X1A + 0.1X2A + 0.05X3A - 0.8WA = 0   
# r2 = 0.1X1A + 0.2X2A + 0.05X3A - 0.3WA = 0   
# r3 = 0.3X1A + 0.3X2A + 0.2X3A  - 0.5WA = 0 
# r4 = 0.1X1B + 0.2X2B + 0.05X3B - 0.4WB = 0  
# r5 = 0.1X1B + 0.2X2B + 0.05X3B - 0.6WB = 0  
# r6 = 0.3X1B + 0.3X2B + 0.7X3B  - 0.3WB = 0  
# r7 = 0.3X1B + 0.3X2B + 0.2X3B  - 0.7WB = 0 
# r8  = x1A + X1B = 1000                     
# r9  = x2A + x2B = 2000                     
# r10 = x3A + X3B = 3000                     
# r11 = X1A , X2A ,X3A, X1B , X2B ,X3B >= 0
 
#Matriz de coeficientes de las restricciones (byrow = true, ordena la matriz por filas)

# Columnas:      wa     wb  x1a  x2a   x3a    x1b  x2b    x3b    
A <- matrix(c(  -0.8,   0,  0.2, 0.1, 0.05,    0,    0,    0,    
                -0.3,   0,  0.1, 0.2, 0.05,    0,    0,    0,    
                -0.5,   0,  0.3, 0.3,  0.2,    0,    0,    0,     
                   0,-0.4,    0,   0,    0,  0.1,  0.2, 0.05,     
                   0,-0.6,    0,   0,    0,  0.1,  0.2, 0.05,          
                   0,-0.3,    0,   0,    0,  0.3,  0.3,  0.7,       
                   0,-0.7,    0,   0,    0,  0.3,  0.3,  0.2,        
                   0,   0,    1,   0,    0,    1,    0,    0,        
                   0,   0,    0,   1,    0,    0,    1,    0,        
                   0,   0,    0,   0,    1,    0,    0,    1),
            ncol = 8, 
            byrow = TRUE)

#Dirección de las desigualdades de las restricciones
B <- c("<=","<=",">=",">=","<=",">=","<=","<=","<=","<=")

#Coeficientes lado derecho de las restricciones
D <- c(0, 0, 0, 0, 0, 0, 0,1000,2000,3000)

#Resolver (llamar por única vez a la librería lpsolve)

#objective.in = Coeficientes de la función objetivo (C)
#const.mat    = Matriz de coeficientes de las restricciones (A)
#const.dir    = Dirección de las desigualdades de las restricciones (D)
#const.rhs    = Coeficientes lado derecho de las restricciones (B)

#Solución mediante lpSolve

library(lpSolve)

sol <- lp(direction = "max",
          objective.in = C,
          const.mat = A,
          const.dir = B,
          const.rhs = D,
          compute.sens = 1)

sol$objval
# Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción
#obtenido e interprete los resultados.

# Valor objetivo
#400000 Ganancia obtenida por la venta de aleación A y B

# Encuentre el plan óptimo de producción e interprete los resultados.

sol$solution

#> sol$solution (Se detallan las cantidades en toneladas según definición)

#     wa     wb     x1a    x2a   x3a    x1b   x2b    x3b 
#[1] 1800   1000   1000    0    3000    0    2000    0

# Resolución de Holguras

-0.8*sol$solution[1] + 0*sol$solution[2]    +0.2*sol$solution[3] + 0.1*sol$solution[4] + 0.05*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
-0.3*sol$solution[1] + 0*sol$solution[2]    + 0.1*sol$solution[3] + 0.2*sol$solution[4] + 0.05*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
-0.5*sol$solution[1] + 0*sol$solution[2]    + 0.3*sol$solution[3] + 0.3*sol$solution[4] + 0.2*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
0*sol$solution[1] + -0.4*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.1*sol$solution[6] + 0.2*sol$solution[7] + 0.05*sol$solution[8]
0*sol$solution[1] + -0.6*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.1*sol$solution[6] + 0.2*sol$solution[7] + 0.05*sol$solution[8]
0*sol$solution[1] + -0.3*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.3*sol$solution[6] + 0.3*sol$solution[7] + 0.7*sol$solution[8]   
0*sol$solution[1] + -0.7*sol$solution[2] + 0*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 0.3*sol$solution[6] + 0.3*sol$solution[7] + 0.2*sol$solution[8]
0*sol$solution[1] + 0*sol$solution[2]    + 1*sol$solution[3] + 0*sol$solution[4] + 0*sol$solution[5] + 1*sol$solution[6] + 0*sol$solution[7] + 0*sol$solution[8]
0*sol$solution[1] + 0*sol$solution[2]    + 0*sol$solution[3] + 1*sol$solution[4] + 0*sol$solution[5] + 0*sol$solution[6] + 1*sol$solution[7] + 0*sol$solution[8]
0*sol$solution[1] + 0*sol$solution[2]    + 0*sol$solution[3] + 0*sol$solution[4] + 1*sol$solution[5] + 0*sol$solution[6] + 0*sol$solution[7] + 1*sol$solution[8]

#Holgura r1  =  -1090
#Holgura r2  = -290
#Holgura r3  = 0
#Holgura r4  = 5.684342e-14
#Holgura r5  = -200
#Holgura r6  = 300
#Holgura r7  = -100
#Holgura r8  = 1000
#Holgura r9  = 2000 
#Holgura r10 = 3000

###########################################################################

#Ejercicio N°2  

# a.- Defina correctamente todas las variables de decisión.

#X1: Pupitres unipersonal (und.) 
#X2: Pupitres biperosonales (und.) 
#X3: Mesas (und.) 

# b.- Escriba la función objetivo que optimiza la utilidad para la elaboración de los productos.

# **Función objetivo compuesta por la utilidad generada por la venta de Pupitres unipersonal + Pupitres biperosonales + Mesas   

# Zmax: 30X1 + 20X2 + 50X3

# Coeficientes de la función objetivo (Función "c" para generar Vector)

C <- c (30, 20, 50)

# c.- Escriba las restricciones asociadas al problema.

# Restricción por Materiales

# r1 = X1  + 2X2 +  X3  <= 4300  (Metros de Madera)  
# r2 = 3X1 +       2X3  <= 4600  (Metros de Tubo)
# r3 = X1  + 4X2        <= 4200  (Metros de Fórmica)

# d.- Plantee matemáticamente el modelo completo asociado al problema.

# Zmax: 30X1 + 20X2 + 50X3

# Resolviendo las restricciones queda:

# X1  + 2X2 +  X3  <= 4300   
# 3X1 +       2X3  <= 4600  
# X1  + 4X2        <= 4200

#Matriz de coeficientes de las restricciones (byrow = true, ordena la matriz por filas)

# Columnas:      x1   x2   x3    
A <- matrix(c(    1,   2,   1,  
                  3,   0,   2,
                  1,   4,   0),
            
            ncol = 3, 
            byrow = TRUE)

#Dirección de las desigualdades de las restricciones

B <- c("<=","<=","<=")

#Coeficientes lado derecho de las restricciones

D <- c(4300, 4600, 4200)

#Resolver (llamar por única vez a la librería lpsolve)

#objective.in = Coeficientes de la función objetivo (C)
#const.mat    = Matriz de coeficientes de las restricciones (A)
#const.dir    = Dirección de las desigualdades de las restricciones (D)
#const.rhs    = Coeficientes lado derecho de las restricciones (B)

#Solución mediante lpSolve

library(lpSolve)

sol <- lp(direction = "max",
          objective.in = C,
          const.mat = A,
          const.dir = B,
          const.rhs = D,
          compute.sens = 1)

sol
#the objective function is 135000 Ganancia por venta de pupitres unipérsonales, bipersonales y mesas

sol$solution

#> sol$solution (Se detallan las cantidades de productos a producir)
# x1   x2     x3 
# 0   1000   2300

# Resolución de Holguras

1*sol$solution[1] + 2*sol$solution[2] + 1*sol$solution[3]
3*sol$solution[1] + 0*sol$solution[2] + 2*sol$solution[3]
1*sol$solution[1] + 4*sol$solution[2] + 0*sol$solution[3]

#Cantidades utilizadas 

#4300 de Madera (Holgura = 0)
#4600 de Tubo (Holgura = 0)
#4000 de Formíca (Holgura = 200)

#Análisis de sensibilidad 

sol$duals[1:3]
#> sol$duals[1:3]
#  10 20  0

# Si aumento la disponibilidad de madera a 4301 mi ganancia original dada por la función objetivo aumenta en 10 unidades monetarias de forma contraria si disminuo en 1 cantidad.
# Si aumento la disponibilidad de fierro a 4601 mi ganancia original dada por la función objetivo aumenta en 20 unidades monetarias de forma contraria si disminuo en 1 cantidad.
# Si aumento la disponibilidad de Formica a 4301 mi ganancia original dada por la función objetivo aumenta en 0 unidades monetarias de forma contraria si disminuo en 1 cantidad.


#h. Si la empresa pudiese incrementar la cantidad de materia prima a usar, ¿cuál tendrá la prioridad? Explique fundamentadamente

#R.- Se debe incrementar la cantidad de fierro ya que produce una mayor ganancia por capacidad adicional de este material

#i. Se sugiere aumentar la cantidad de madera y tubo al costo adicional de  para cada una. ¿Es esto aconsejable? Explique fundamentadamente.

#R.- No se aconseja ya que el costo por incrementar ambos materiales es de 30$ y la ganancia obtenida son 30$ por lo cual no produce ganancia adicional.

#j. Si la cantidad de fórmica se reduce en  metros, ¿cómo impactará este incremento al ingreso óptimo? Explique fundamentadamente.

#R.- No genera impacto ya que tenemos una holgura de 200m


###########################################################################

#Ejercicio N°3  

# a.- Defina correctamente todas las variables de decisión.

#X1: Producto 1 (und.) 
#X2: Producto 2 (und.) 

# b.- Escriba la función objetivo que optimiza la utilidad para la elaboración de los productos.

# **Función objetivo compuesta por los ingresos recibidos por unidades de Producto 1 + Producto 2   

# Zmax: 60X1 + 40X2

# Coeficientes de la función objetivo (Función "c" para generar Vector)

C <- c (60, 40)

# Restricción por Tiempo

# r1 = 4X1 + 2X2  <= 16  (Máquina 1)  
# r2 = 2X1 + 6x2  <= 16  (Máquina 2)

# d.- Plantee matemáticamente el modelo completo asociado al problema.

# Zmax: 60X1 + 40X2

# Resolviendo las restricciones queda:

# r1 = 4X1 + 2X2  <= 16  (Máquina 1)  
# r2 = 2X1 + 6x2  <= 16  (Máquina 2)

#Matriz de coeficientes de las restricciones (byrow = true, ordena la matriz por filas)

# Columnas:      x1   x2       
A <- matrix(c(    4,   2,    
                  2,   6),
            
            ncol = 2, 
            byrow = TRUE)

#Dirección de las desigualdades de las restricciones

B <- c("<=","<=")

#Coeficientes lado derecho de las restricciones

D <- c(16, 16)

#Resolver (llamar por única vez a la librería lpsolve)

#objective.in = Coeficientes de la función objetivo (C)
#const.mat    = Matriz de coeficientes de las restricciones (A)
#const.dir    = Dirección de las desigualdades de las restricciones (D)
#const.rhs    = Coeficientes lado derecho de las restricciones (B)

#Solución mediante lpSolve

library(lpSolve)

sol <- lp(direction = "max",
          objective.in = C,
          const.mat = A,
          const.dir = B,
          const.rhs = D,
          compute.sens = 1)

#Resultado Función Objetivo
sol$objval

#[1] 256 Ingresos por ventas de unidades 1 y 2

#(e) Plan optimo de solucion

sol$solution

# 3.2 unidades de producto x1
# 1.6 undades de productos x2

# Resolución de Holguras

sol$solution

4*sol$solution[1] + 2*sol$solution[2] 
2*sol$solution[1] + 6*sol$solution[2] 

#[1] 16 Horas utilizadas en máquina #1 (Holgura 0)
#[1] 16 Horas utilizadas en máquina #2 (Holgura 0)

#Analisis de sensibilidad para los coeficientes de recursos (Horas máquinas)

sol$duals[1:2]

#[1] 14  2

# Si aumento la disponibilidad de de la máquina #1 en 1 hora mi ingreso original dada por la función objetivo aumenta en 14$ unidades monetarias o disminuye en la misma si disminuyo en 1 hora.
# Si aumento la disponibilidad de de la máquina #2 en 1 hora mi ingreso original dada por la función objetivo aumenta en 20$ unidades monetarias o disminuye en la misma si disminuyo en 1 hora.

# h. Si la empresa puede incrementar la capacidad de ambas máquinas, ¿cuál máquina tendrá la prioridad? Explique fundamentadamente. 

#R.- Se debe dar prioridad a la máquina 2 ya que produce un mayor ingreso por hora adicional de trabajo.

# i. Se sugiere incrementar las capacidades de las máquinas  y  al costo adicional de 20$/h para cada máquina. ¿Es esto aconsejable? Explique fundamentadamente. 

#R.- No se recomienda porque en ambas máquinas el costo es superior a la gananacia por hora adicional de trabajo.
