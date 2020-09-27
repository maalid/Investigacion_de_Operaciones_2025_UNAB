#Investigacion de operaciones
#solemne n°1
#Riola San Martin


#Ejercicio n°1

library(lpSolve)


# a .Definir correctamente todas las variables de decision

#x1= toneladas producidas de aleacion A
#x1= toneladas producidas de aleacion b

#y1= toneladas de mineral usada en la aleacion A
#y2= toneladas de mineral usada en la aleacion A
#y3= toneladas de mineral usado en la aleacion A

#y4= toneladas de mineral usado en la aleacion B
#y5= toneladas de mineral usado en la aleacion B
#y6= toneladas de mineral usado en la aleacion B


# b. escriba la funsion obejtivo que optimiza para la elaboracion de las eleaciones


 # Max Z = 200x1+300x2 - 30 (y1+y4) - 40(y2-y5) - 50(y3-y6)

# c. escriba las restricciones asociadas al problema


#-0.8x1 + 0.2y1 + 0.1y2 + 0.05y3 <= o toneladas de mineral I,II,III usada usado en la aleacion A
#-0.1y1 + 0.2y2 + 0.2y2 + 0.05x3 <= 0 toneladas de mineral I,II,III usada usado en la aleacion A
#-0.5x1 + 0.3x2 + 0.3x2 + 0.2x3  >= 0 toneladas de mineral I,II,III usada usado en la aleacion A

#-0.4x2 + 0.1y4 + 0.2y5 + 0.05y6 >=0 toneladas de mineral I,II,III usada usado en la aleacion b
#-0.6x2 + 0.1y4 + 0.2y5 + 0.05y6 <=0 toneladas de mineral I,II,III usada usado en la aleacion b
#-0.3x2 + 0.3y4 + 0.3y5 + 0.7y6  >=0 toneladas de mineral I,II,III usada usado en la aleacion b
#-0.7x2 + 0.3y4 + 0.3y5 + 0.2y6  <=0 toneladas de mineral I,II,III usada usado en la aleacion b

#y1+y2 <= 1000 total del mineral 1 para la aleacion de A y b
#y2+y5 <=2000  total del mineral 2 para la aleacion de A y b
#y3+y6 <=3000  total del mineral 3 para la aleacion de A y b

#y1,y2,y3,y4,y5,y6 >= 0 no negatividad


#d.  plantee matematicamente el modelo asociado al problema

#max z= 200x1 + 300x2 - 30(y1+y4)-40(y2+y5)-50(y3+y6)

#s.a.

#-0.8x1 + 0.2y1 + 0.1y2 + 0.05y3 <= 0
#-0.3x1 + 0.1y1 + 0.2y2 + 0.05y3 <=0
#-0.5x1 + 0.3y1 + 0.2y2 + 0.3y3  >=0
#-0.4x2 + 0.1y4 + 0.2y5 + 0.05y6 >=0
#-0.6x2 + 0.1y4 + 0.2y5 + 0.05y6 <=0
#-0.3x3 + 0.3y4 + 0.3y5 + 0.7y6  >=0
#-0.7x2 + 0.3y4 + 0.2y5 +0.3y6  <=0

#y1+y4 <= 1000
#y2+y5 <= 2000
#y3+Y6 <= 3000

#y1,y2,y3,y4,y5,y6 >= 0

#e. encuentra el plan optimo de produccion e interprete los resultados


#coeficiente de la funsion objetivo:

c1<- c(200,300,-30,-40,-50,-30,-40,-50)

#matriz coeficiente de las restricciones

A1 <- matrix(c(-0.8,   0, 0.2, 0.1, 0.05,  0,  0,   0,
               -0.3,   0, 0.1, 0.2, 0.05,  0,  0,   0,
               -0.5,   0, 0.3, 0.3,  0.2,  0,  0,   0,
                  0,-0.4,   0,   0,    0,0.1,0.2,0.05,
                  0,-0.6,   0,   0,    0,0.1,0.2,0.05,
                  0,-0.3,   0,   0,    0,0.3,0.3, 0.7, 
                  0,-0.7,   0,   0,    0,0.3,0.3, 0.2,
                  0,   0,   1,   0,    0,  1,  0,   0,
                  0,   0,   0,   1,    0,  0,  1,   0,
                  0,   0,   0,   0,    1,  0,  0,  1),
                ncol = 8, byrow= TRUE)

#Direccion de las desigualdades de restricciones

D1 <- c("<=","<=",">=",">=","<=",">=","<=","<=","<=","<=")

#coeficiente del lado derecho de las restricciones

B <- c(0,0,0,0,0,0,0,1000,2000,3000)

solucion <- lp(direction="max",
                 const.mat =A,
                 const.dir=D,
                 const.rhs =B,
                 objective.in =c,)

solucion$sol
#[1] 1800   1000   1000   0   3000     2000    0


#plan optimo produccion de las aleaciones
#se tienen que producir
#1800 toneladas producidas por aleacion A
#1000 toneladas producidas por aleacion B

#primera restriccion

-0.8*solucion$solution[1]+0*solucion$solution[2]+0.2*solucion$solution[3]+0.1*solucion$solucion[4]+0.05*solucion$solucion[5]+0.6*solucion$solucion[6]+0*solucion$solucion[7]+0*solucion$solucion[8]
#|-1090|=1090

#La utilidad maxima a obteneres de 400.000 u monetarias , cuando el plan se mantenga correctamente
#produciendo 1800 toneladas de aleacion A y 1000 de aleacion B






# Ejercicio n°2

#a. definir correctamente todas las variables de desicion

#x1=cantidad de pupitres unipersonales a producir semanalmente
#x2=cantidad de pupitres bipersonales a producir semanalmente
#x3=cantidad de mesas a producir semanal mente


#b.  funsion objetivo


#max z = 30x1+20x2+50x3


#c.   restricciones asociadas

  
#   x1+ 2x2+ x3   <= 4300 mtrs de madera
#  3x1+    + 2x3  <=4600 mtrs de tubos disponibles
#  x1 + 4x2+      <= 4200  mtrs de formica disponible
#    x1,x2,x3     >= 0 no negatividad

#d.   plantee matematicamente el modelo completo asociado al problema

#  max z = 30x1+20x2+50x3
ST

#   x1+ 2x2+ x3   <= 4300
#  3x1+    + 2x3  <=4600
#  x1 + 4x2+      <= 4200
#    x1,x2,x3     >= 0


#e.   Encuentre el plan óptimo de producción e interprete los resultados.

# Transcribimos el modelo anterior a R.

#Coeficientes de la función objetivo:

#C<-c (30,20,50)

#	Matriz de coeficientes de las restricciones:

A  <- matrix(c(1, 2, 1,
               3, 0, 2,
               1, 4, 0), 
             ncol = 3, byrow = TRUE)

#	Dirección de las desigualdades de las restricciones

D <- c("<=","<=","<=")

#	Coeficientes lado derecho de las restricciones

B <-C(4300,4600,4200)

solucion <-lp(direction = "max",
              const.mat = A,
              const.dir = D,
              const.rhs = B,
              objective.in = c,
              compute.sens = 1)

# el plan optimo semanalmente produce 0 pupitres unipersonales a la semana
#1000 pupitres bipersonales y 2300 mesas a producir

#Calculo de Holguras del problema.

#Holgura primera restricción
1*solucion$solution[1] + 2*solucion$solution[2] + 1*solucion$solution[3]
#Se usan  4300 metros de madera disponible, entonces S1=0.

#Holgura segunda restricción
3*solucion$solution[1] + 0*solucion$solution[2] + 2*solucion$solution[3]
#Se usan los 4600 metros de tubo disponible, entonces S2=0.

#Holgura tercera restricción
1*solucion$solution[1] + 4*solucion$solution[2] + 0*solucion$solution[3]
#Se usan 4000 metros de formica, dejando un remanente de 200 metros de formica,entonces S3=200.

#	f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.

solucion

#succes:the objetive function is 135.000

#la elaboración de 0 pupitres unipersonal, 1000 pupitres bipersonales y 2300 mesas
#da una utilidad de 135.000 u monetarias.





# ejercicio n°3


#	a) Defina correctamente todas las variables de decisión.


# x1=unidad del producto 1
# x2=unidad del producto 2

#	b) Escriba la función objetivo que optimiza la utilidad para la elaboración de los productos.


# max Z= 60x1+ 40x2

#       c) Escriba las restricciones asociadas al problema.

# 4x1 + 2x2 <= 16disponilidad de las horas de la maquina a
# 2x1 + 6x2 <= 16 disponilidad de las horas de la maquina b
#  x1 , x2 >= 0 no negatividad

#       d) Plantee matemáticamente el modelo completo asociado al problema.

# max Z= 60x1+ 40x2

#st

# 4x1 + 2x2 <= 16
# 2x1 + 6x2 <= 16 
#  x1 , x2 >= 0 

#       e) Encuentre el plan óptimo de producción e interprete los resultados.

#       Transcribimos el modelo anterior a R.

#	Coeficientes de la función objetivo:

C <- c(60,40)

#	Matriz de coeficientes de las restricciones:

A <- matrix(c(4,2,
              2,6),
            ncol = 2, byrow = TRUE)

#	Dirección de las desigualdades de las restricciones

D<- c("<=","<=")

#	Coeficientes lado derecho de las restricciones

B<-c(16,16)

solucion <- lp(direction = "max",
               objective.in = C,
               const.dir = D,
               const.mat = A,
               const.rhs = B,
               compute.sens = 1)

solucion$sol

#[1]3.2  1.6

#el plan optimo considerando las horas disponibles de cada maquina es
#3.2 u de producto 1 y 1.6 u de producto 2

# de manera de calculo esto si se puede llevar a la practica, pero no es posible 
# frabricar esa cantidad de unidad , asi que por lo tanto seran 3 productos dek 1
# y 2 del producto 2

#primera restricción

4*solucion$solution[1] + 2*solucion$solution[2]
# [1] 16
# Se usan las 16 horas de la máquina 1, entonces, S1=0.

#segunda restricción
#[1] 16
2*solucion$solution[1] + 6*solucion$solution[2] 
# Se usan las 16 horas de la máquina 2, entonces, S2=0.

#	f) Encuentre el valor óptimo de la función objetivo de acuerdo al plan óptimo de producción obtenido e interprete los resultados.

solucion
#success: objective function is 256 
# la elaboración de 3,2 u del producto 1 y 1,6 u del producto 2  puede lograr 
#una utilidad de $ 256., no es posible fabricar esas cantidades, asique el valor 
#óptimo a  queda de la siguiente manera

#   Z = 60*3 + 40*1 = $ 220. 

#	g) Realice un análisis de sensibilidad completo.

#       (g.1) Análisis de sensibilidad para los coeficientes de recursos (lado derecho de las restricciones, bi).

solucion$duals[1:2]
#[1] 14  2
#Comentarios de los resultados=

# Y1 = $ 14 Aumento/decremento de Z si b1 aumenta/decrece en una unidad.
# Y2 = $ 2 Aumento/decremento de Z si b2 aumenta/decrece en una unidad.

#       (g.2) Análisis de sensibilidad para coeficientes de la función objetivo.

tibble(c = c("c1","c2"),
       min = solucion$sens.coef.from,
       max = solucion$sens.coef.to)

#    c        min        max
#   <chr>    <dbl>      <dbl>
#1   c1       13.3       80
#2   c2       30         180

#los costos unitarios pueden cambiar en estos intervalos, sin que se modifique 
#el plan de produccion, por lo que los valores de las actividades producto 1
#producto 2 , se pueden modificar su valor unitario , lo que no afecta al plan
#pero si cambiaira z

# $ 13.3 <= c2 <= $ 80

# $ 30 <= c2 <= $ 180

# g.3.   Análisis de sensibilidad para los coeficientes bi.

A_dual <- t(A)
B_dual <- t(C)
C_dual <- t(B)
D_dual <- c(">=",">=")

solucion_dual <- lp(direction = "min",
                    const.dir = D_dual,
                    const.mat = A_dual,
                    const.rhs = B_dual,
                    objective.in = C_dual,
                    compute.sens = 1)

Tibble(b=c("b1","b2"),
       min = solucion_dual$Sens.Coef.From,
       max = solucion_dual$sens.coef.from)

# b      min      max
#<chr>  <dbl>   <dbl> 
#1 b1    5.33    32
#2 b2     8      48


#los coeficientes de la restricciones pueden variar

# 5.33 hrs. <= b1 32 hrs.
# 8 hrs. <= b2 48 hrs.


#h.    Si la empresa puede incrementar la capacidad de ambas máquinas, ¿cuál máquina tendrá la prioridad?
#          Explique fundamentadamente.


# Considerando los precios  obtenidos en el Análisis de sensibilidad 
#para los coeficientes de recursos  [Y1= $14,Y2= #2],
# se puede decir que al aumentar en 1 hora la disponibilidad de la máquina 1
# genera una utilidad de $14, mientras que aumentar en 1 hora
#en la máquina 2, genera  una utilidad de $2. Por lo tanto, la máquina que
# tiene prioridad ante un eventual aumento, debería ser la máquina 1

# i. Se sugiere incrementar las capacidades de las máquinas 1 y 2 al costo adicional de $20/h para cada máquina.
# ¿Es esto aconsejable? Explique fundamentadamente.


#Considerando los precios sombra de las horas máquina, se puede establecer lo 
#siguiente:

# Máquina 1: Cada hora de funcionamiento de la máquina 1 genera una utilidad de $14, si cada hora adicional tubiera
# un costo de $20,la ganancia sería -6, generaría una perdida este ejercicio.
# Máquina 2: Cada hora de funcionamiento de la máquina 2 genera una utilidad de $2, si cada hora adicional tubiera
#            un costo de $20, la ganancia sería -18,  generaría una perdida este ejercicio.
                       
#En conclusión,  no es recomendable el aumento de la producción mientras 
#el costo por hora adicional sea de $20/h.

#j. Si la capacidad de la máquina 1 se incrementa de 16 a 26 horas, ¿cómo impactará este incremento al ingreso óptimo?
# Explique fundamentadamente.

#con los resultados obtenidos en nuestro Análisis 
#para los coeficientes bi, podemos indicarque al aumentar la disponibilidad 
#de horas de la máquina 1, no afectaría nuestro plan óptimo de producción,
# ya que el intervalo de factibilidad es de: [5.33h y 32h],
#entonces el aumento  de disponibilidad nos  produciría un aumento
# de: $14 * (26-16) = $140, si esto se 
# agrega a nuestro Z, el nuevo Z obtenido sería de Z = $396



  







