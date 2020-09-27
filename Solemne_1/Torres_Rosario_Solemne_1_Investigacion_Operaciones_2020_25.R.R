# Solemne 1. 
# Rosario Torres Fernández

#Ejercicio 1 

# A) Variables decición

#  Wa= Toneladas producidas aleación A
#  Wb= Toneladas producidas aleacion B
#  X1a= Toneladas de mineral I para aleacion A
#  X2a= Toneladas de mineral II para aleación A
#  X3a= Toneladas de mineral IV para aleacion A
#  X1b= Toneladas de mineral II para aleación B
#  X2b= Toneladas de mineral III para aleacion B
#  X3b= Toneladas de mineral IV para aleacion B

# B) Funcion objetivo
#               Max Z = 200Wa + 300Wb - 30(X1a+X1b) - 40(X2a+X2b) - 50(X3a+X3b) 

# C) Restricciones 
# 
# Wa = X1a + X2a + X3a
# -0.8Wa + 0.2X1a + 0.1X2a + 0.05X3a <= 0 (Total de mineral I, II, IV usadas en la aleacion A)
# -0.3Wa + 0.1X1a + 0.2X2a + 0.05X3a <= 0 (Total de mineral I, II, IV usadas en la aleacion A)
# -0.5Wa + 0.3X1a + 0.3X2a + 0.2X3a  >= 0 (Total de mineral I, II, IV usadas en la aleacion A)

# Wb = X1b + X2b + X3b
# -0.4Wb + 0.1X1b + 0.2X2b + 0.05X3b >=0 (Total de mineral II, III, IV usadas en la aleacion B)
# -0.6Wb + 0.1X1b + 0.2X2b + 0.05X3b <=0 (Total de mineral II, III, IV usadas en la aleacion B)
# -0.3Wb + 0.3X1b + 0.3X2b + 0.7X3b >=0 (Total de mineral II, III, IV usadas en la aleacion B)
# -0.7Wb + 0.3X1b + 0.3X2b + 0.2X3b <=0 (Total de mineral II, III, IV usadas en la aleacion B)

#             X1a + X1b <= 1000  (Mineral 1 usado para aleación A y B)
#             X1a + X1b <= 2000 (Mineral 2 usado para aleación A y B)
#             X1a + X1b <= 3000  (Mineral 3 usado para aleacion A y B)
# X1a, X2a, X3a, X1b, X2b, X3b >= 0

# D) Modelo matemático

#             Max Z = 200Wa + 300Wb - 30(X1a+X1b) - 40(X2a+X2b) - 50(X3a+X3b)

# E) Plan optimo de prod e interpretacion
#Restricciones
A <- matrix(c(-0.8,    0, 0.2, 0.1, 0.05,   0,   0,    0,
              -0.3,    0, 0.1, 0.2, 0.05,   0,   0,    0,
              -0.5,    0, 0.3, 0.3,  0.2,   0,   0,    0, 
                 0, -0.4,   0,   0,    0, 0.1, 0.2, 0.05,
                 0, -0.6,   0,   0,    0, 0.1, 0.2, 0.05,
                 0, -0.3,   0,   0,    0, 0.3, 0.3,  0.7,
                 0, -0.7,   0,   0,    0, 0.3, 0.3,  0.2,
                 0,    0,   1,   0,    0,   1,   0,    0,
                 0,    0,   0,   1,    0,   0,   1,    0,
                 0,    0,   0,   0,    1,   0,   0,    1), ncol = 8, byrow = TRUE)
#Recursos
B <- c(0, 0, 0, 0, 0, 0, 0, 1000, 2000, 3000)

#funcion objetivo

C <- c(200, 300, -30, -40, -50, -30, -40, -50) 

#Simbologia de desigualdades
D <- c("<=","<=",">=",">=","<=",">=","<=","<=","<=","<=")

solucion <- lp(direction = "max",
               const.mat = A,
               const.rhs = B,
               objective.in = C,
               const.dir = D,
               compute.sens = 1)

solucion$sol
#[1] 1800 1000 1000    0 3000    0 2000    0
# Para aleación A son 1800 toneladas
# Para aleacion B son 1000 toneladas 

#Holgura para primera restricción
-0.8*solucion$solution[1] + 0*solucion$solution[2] + 0.2*solucion$solution [3] + 0.1*solucion$solution[4] + 0.05*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#[1] -1090

#Holgura para segunda restricción
-0.3*solucion$solution[1] + 0*solucion$solution[2] + 0.1*solucion$solution [3] + 0.2*solucion$solution[4] + 0.05*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#[1] -290

#Holgura para tercera restriccion
-0.5*solucion$solution[1] + 0*solucion$solution[2] + 0.3*solucion$solution [3] + 0.3*solucion$solution[4] + 0.2*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#[1] 0

#Holgura cuarta restriccion
0*solucion$solution[1] + -0.4*solucion$solution[2] + 0*solucion$solution [3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.1*solucion$solution[6] + 0.2*solucion$solution[7] + 0.05*solucion$solution[8]
#[1] 5.684342e-14

#Holgura quinta restriccion
0*solucion$solution[1] + -0.6*solucion$solution[2] + 0*solucion$solution [3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.1*solucion$solution[6] + 0.2*solucion$solution[7] + 0.05*solucion$solution[8]
#[1] -200

#Holgura sexta restriccion
0*solucion$solution[1] + -0.3*solucion$solution[2] + 0*solucion$solution [3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.3*solucion$solution[6] + 0.3*solucion$solution[7] + 0.7*solucion$solution[8]
#[1] 300

#Holgura séptima restriccion
0*solucion$solution[1] + -0.7*solucion$solution[2] + 0*solucion$solution [3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 0.3*solucion$solution[6] + 0.3*solucion$solution[7] + 0.2*solucion$solution[8]
#[1] -100

#Holgura octava restriccion
0*solucion$solution[1] + 0*solucion$solution[2] + 1*solucion$solution [3] + 0*solucion$solution[4] + 0*solucion$solution[5] + 1*solucion$solution[6] + 0*solucion$solution[7] + 0*solucion$solution[8]
#[1] 1000

#Holgura novena restriccion
0*solucion$solution[1] + 0*solucion$solution[2] + 0*solucion$solution [3] + 1*solucion$solution[4] + 0*solucion$solution[5] + 0*solucion$solution[6] + 1*solucion$solution[7] + 0*solucion$solution[8]
#[1] 2000

#Holgura décima restriccion
0*solucion$solution[1] + 0*solucion$solution[2] + 0*solucion$solution [3] + 0*solucion$solution[4] + 1*solucion$solution[5] + 0*solucion$solution[6] + 0*solucion$solution[7] + 1*solucion$solution[8]
#[1] 3000

#F)Valor optimo de la funcion obejtivo

sol
#Success: the objective function is 4e+05 (osea se obtiene un total de $400.000 de utilidad)

######################################################################################################################################################################################################################

# Ejercicio 2

#A) Variables de decision

#  X1= Cantidad de pupitres unipersonales para su produccion semanal
#  X2= Cantidad de pupitres bipersonales para su produccion semanal
#  X3= Cantidad de mesas para su produccion semanal

#B) Funcion objetivo

#Max Z= 30X1 + 20X2 + 50X3

#C) Restricciones

#            1X1 + 2X2 + 1X3 <=4300 (m madera disponible)
#            3X1 + 0X2 + 2X3 <=4600  (m tubos disponibles)
#            1X1 + 4X2 + 0X3 <=4200 (m fórmica disponibles)
#             X1, X2, X3 >=0 

#D) Modelo matemático 
 
#            Max Z= 30X1 + 20X2 + 50X3

#            1X1 + 2X2 + 1X3 <=4300 
#            3X1 + 0X2 + 2X3 <=4600  
#            1X1 + 4X2 + 0X3 <=4200 
#             X1, X2, X3 >=0 

#E) 
#Función objetivo

C1 <- c(30, 20, 50)

#Restricciones en matriz

A1 <- matrix(c(1, 2, 1,
               3, 0, 2,
               1, 4, 0), ncol = 3, byrow = TRUE)

#Disp de recursos
B1 <- c(4300, 4600, 4200)

#desigualdes

D1 <- c("<=","<=","<=")

solucion <- lp(direction = "max",
               const.mat = A1,
               const.rhs = B1,
               objective.in = C1,
               const.dir = D1,
               compute.sens = 1)

solucion$sol
#[1]    0 1000 2300

#se deben producir 0 pupitres unipersonales a la semana
#se deben producir 1000 pupitres bipersonales a la semana
#se deben producir 2300 mesas a la semana

#Holgura primera restriccion
1*solucion$solution[1] + 2*solucion$solution[2] + 1*solucion$solution[3]
#[1] 4300
#siendo S1=0

#Holgura segunda restriccion
3*solucion$solution[1] + 0*solucion$solution[2] + 2*solucion$solution[3]
#[1] 4600
#siendo S2=0

#Holgura tercera restriccion
1*solucion$solution[1] + 4*solucion$solution[2] + 0*solucion$solution[3]
#[1] 4000
#siendo S2= 4200-4000 -> S2=200, por tanto sobran 200 metros de fórmica

#F) Valor óptimo de la funcion obj.

solucion
#Success: the objective function is 135000, por tanto la el valor optimo corresponde a 135.000 unidades monetarias.

#G) Análisis de sensibility
#G1)  Analisis de sensibilidad para coeficientes de recursos 

solucion$duals[1:3]
#[1] 10 20  0

#Y1= 10 (Aumento/Decrecimiento de Z si b1 aumenta/decrece en 1 unidad de madera)
#Y2= 20 (Aumento/Decrecimiento de Z si b2 aumenta/decrece en 1 unidad de tubo)
#Y3= 0  (Aumento/Decrecimiento de Z si b3 aumenta/decrece en 1 unidad de fórmica)

#G2) Analisis de sensibilidad para coef de funcion obj.

tibble(c = c("c1", "c2", "c3"),
       min = solucion$sens.coef.from,
       max = solucion$sens.coef.to)


# A tibble: 3 x 3
#c          min     max
#<chr>    <dbl>   <dbl>
#1 c1    -1.00e30 7.00e 1  (costo unitario de los pupitres unipersonal puede variar en este intervalo, sin alterar el plan optimo de prod)
#2 c2     0.      1.00e 2  (costo unitario de los pupitres bipersonal puede variar en este intervalo, sin alterar el plan optimo de prod)
#3 c3     2.33e 1  1.00e30  (costo unitario de las mesas puede variar en este intervalo, sin alterar el plan optimo de prod)

#G3) Analisis de sens. para coef. bi.

A_dual <- t(A)

B_dual <- C

C_dual <- B

D_dual <- c(">=",">=",">=")

solucion_dual <- lp(direction = "min",
                    const.mat = A_dual,
                    const.rhs = B_dual,
                    objective.in = C_dual,
                    const.dir = D_dual,
                    compute.sens = 1)

tibble(b = c("b1", "b2", "b3"),
       min = solucion_dual$sens.coef.from,
       max = solucion_dual$sens.coef.to)

# A tibble: 3 x 3
#b       min     max
#<chr> <dbl>   <dbl>
#1 b1    4300  1.00e30 (El coef de la primera restriccion puede cambiar en esta restriccion sin que se modifique el precio sombra Y1)
#2 b2    4600  1.00e30 (El coef de la segunda restriccion puede cambiar en esta restriccion sin que se modifique el precio sombra Y2)
#3 b3    4200. 1.00e30 (El coef de la tercera restriccion puede cambiar en esta restriccion sin que se modifique el precio sombra Y3)

#H)
#De acuerdo a los precios sombra, la prioridad sería para el metro de Tubo, ya que este aumenta 20 por metro, mientras que el de madera 
#aumentanta 10 por cada metro y el de formica no aumenta.

#I)
#Para el de madera no es aconsejable, ya que el ingreso adicional por esta sería negativo ($10-$15= $-5), mientras que en el caso de los
#tubos sería positivo ($20-$15= $5). por tanto solo se aconsejaria aumentar sólo la cantidad de tubos.

#J)
#Se sabe que S3=200, sobrando 200 metros de fórmica, por tanto no variaría una reducción de 100 metros de este material.

#K)

#I)Si incorporamos estos nuevos valores a las nuevas funciones de optimizacion se tendria que:
60*(0)+20*(1000)+50*(2300)
#[1] 135000

30*(0)+30*(1000)+50*(2300)
#[1] 145000

#En conclusión seguiría siendo óptima dado a que los nuevos precios unitarios se mueven dentro de los intervalos permitidos.

###########################################################################################################################################################################

#Ejercicio 3

#A) Variable de desicion
# X1= unidad de prod. 1
# X2= unidad de prod 2

#B) Funcion obj.

#    Max Z = 60x1+ 40X2

#C) Restricciones 

# 4X1 + 2X2 <= 16 (H disponibles máq. A)
# 2X1 + 6X2 <= 16 (H disponibles máq B)
# X1, X2 >= 0    (H disponibles máq C)

#D) modelo matemático

#    Max Z = 60x1+ 40X2
#restricciones
# 4X1 + 2X2 <= 16 
# 2X1 + 6X2 <= 16 
# X1, X2 >= 0   

#E)  Plan óptimo de prod.
#funcion obj.

C <- c(60, 40)

A <- matrix(c(4,2,
              2,6), ncol = 2, byrow = TRUE)
#Recursos disponibles
B <- c(16,16)
#desigualdades
D <- c("<=","<=")

solucion <- lp(direction = "max",
               const.mat = A,
               const.rhs = B,
               objective.in = C,
               const.dir = D,
               compute.sens = 1)

solucion$sol

#[1] 3.2 1.6
#por tanto sera 3.2 unidades de prod 1 a producir y 1.6 unidades de prod 2 a producir.

#Holgura primera restriccion
4*solucion$solution[1]+2*solucion$solution[2]
#[1] 16
#Por tanto S1=0

#Holgura segunda restriccion
2*solucion$solution[1]+6*solucion$solution[2]
#[1] 16
#Por tanto S2=0

#F) 

solucion
#Success: the objective function is 256 

#G) analisis de sensibility

#G1) Analisis de sensibilidad para los coef. de recursos

solucion$duals[1:2]
#[1] 14  2

#Y1=14  (Aumento/Decrecimiento de Z si b1 aumenta/decrece en 1 unidad)
#Y2=2   (Aumento/Decrecimiento de Z si b2 aumenta/decrece en 1 unidad)

#G2) análisis de sensibilidad para coef. de la funcion objetivo.

tibble(c = c("c1","c2"),
       min = solucion$sens.coef.from,
       max = solucion$sens.coef.to)

# A tibble: 2 x 3
# c       min   max
# <chr> <dbl>  <dbl>
# c1     13.3    80 (El costo unitario del prod 1 puede cambier en el intervalo  13.3<=c1<=80, sin que varie el plan optimo de prod)
# c2     30     180 (El costo unitario del prod 1 puede cambier en el intervalo  30<=c2<=180, sin que varie el plan optimo de prod)

#G3) Analisis de sensibilidad para los coeficientes bi

A_dual <- t(A)

B_dual <- C

C_dual <- B

D_dual <- c(">=",">=")

solucion_dual <- lp(direction = "min",
                    const.mat = A_dual,
                    const.rhs = B_dual,
                    objective.in = C_dual,
                    const.dir = D_dual,
                    compute.sens = 1)

tibble(b = c("b1", "b2"),
       min = solucion_dual$sens.coef.from,
       max = solucion_dual$sens.coef.to)


# A tibble: 2 x 3
#b       min   max
#<chr>  <dbl>  <dbl>
# b1     5.33   32  (El coef de la primera restriccion puede cambiar en esta restriccion sin que se modifique el precio sombra Y1)
# b2     8      48. (El coef de la primera restriccion puede cambiar en esta restriccion sin que se modifique el precio sombra Y2)

#H)
#De acuerdo a los precios sombra, la prioridad sería para la maquina 1, ya que este aumenta en $14 por hora añadida, y la máquina 2,
#sólo aumenta $2 la hora adicional.

#I)
#tanto para la maquina 1, como para la 2, esto no es aconsejable, ya que el ingreso adicional para ambas sería negativo (maquina 1 -> $14-$20= $-6 // maquina 2 -> $2-$20= $-18), 


#J)
#De acuerdo al intervalo de factibilidad , la máquina quedaría dentro del rango de 5,33 a 32 horas, no afectando el aumento de 26 horas. Ademas el incremento de ingreso será de $140
#ya que, $14($26-$16)= 140., aumentando el ingreso total en $256 a $396 ($256 + $140) 

#K)
#Las 40 horas quedarían fuera del rango de factibilidad (como máximo 32 horas), pudiese llegar a afectar la operatividad de la maquina 1 y por tanto afectar al ingreso óptimo.

#I)Si incorporamos estos nuevos valores a las nuevas funciones de optimizacion se tendria que:
70*(3.2)+40*(1.6)
#[1] 288

60*(3.2)+50*(1.6)
#[1] 272

#En conclusión, con ambos aumentaria el ingreso total, siendo mas conveniente el aumento del producto 1 



