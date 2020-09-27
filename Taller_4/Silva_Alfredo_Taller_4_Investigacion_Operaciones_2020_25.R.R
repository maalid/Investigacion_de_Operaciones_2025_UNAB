#
#-----------------------"TALLER 4"-------------------------------------------#
#NOMBRE: ALFREDO SILVA BURGOS
#RUT: 18.291.662-5
#                                                                               
##ASIGNACION DE PROYECTOS A CONTRATISTAS DE LA ALCALDIA##                                    
#                                                                                
#             ALFA   BETA   GAMA  LANDA  
#              x1     x2     x3     x4    
# PUENTE       96     96    100     88       
#
# ESCUELA     112    120    120    136
#
# PARQUE      192    188    180    170
#
# HOSPITAL     84     88    108     92
#
# A) Formule matemáticamente este problema de Asignación, definiendo las variables de decisión, la función objetivo y las restricciones.
#
#----DEFINICION DE VARIABLES-----------------------------##
#
#x11 : Proyecto de Puente asignado al contratista ALFA
#x12 : Proyecto de Puente asignado al contratista BETA
#x13 : Proyecto de Puente asignado al contratista GAMA
#x14 : Proyecto de Puente asignado al contratista LANDA
#x21 : Proyecto de Escuela asignado al contratista ALFA
#x22 : Proyecto de Escuela asignado al contratista BETA
#x23 : Proyecto de Escuela asignado al contratista GAMA
#x24 : Proyecto de Escuela asignado al contratista LANDA
#x31 : Proyecto de Parque asignado al contratista ALFA
#x32 : Proyecto de Parque asignado al contratista BETA
#x33 : Proyecto de Parque asignado al contratista GAMA
#x34 : Proyecto de Parque asignado al contratista LANDA
#x41 : Proyecto de Hospital asignado al contratista ALFA
#x42 : Proyecto de Hospital asignado al contratista BETA
#x43 : Proyecto de Hospital asignado al contratista GAMA
#x44 : Proyecto de Hospital asignado al contratista LANDA
#
#-------MODELO MATEMATICO DEL PROBLEMA DE ASIGNACION---------##
#
#MIN Z :   96x11 +  96x12 + 100x13 +  88x14
#       + 112x21 + 120x22 + 120x23 + 136x24 
#       + 192x31 + 188x32 + 180x33 + 170x34
#       +  84x41 +  88x42 + 108x43 +  92x44
#
#
#----RESTRICCIONES----------------------------## 
#
#   x11 + x12 + x13 + x14 = 1 Proyecto Puente.
#   x21 + x22 + x23 + x24 = 1 Proyecto Escuela.
#   x31 + x32 + x33 + x34 = 1 Proyecto Parque.
#   x41 + x42 + x43 + x44 = 1 Proyecto Hospital.
#   x11 + x21 + x31 + x41 = 1 contratista Alfa.         
#   x12 + x22 + x32 + x42 = 1 contratista Beta.
#   x13 + x23 + x33 + x43 = 1 contratista Gama.
#   x14 + x24 + x34 + x44 = 1 contratista Landa.
#
#-------MATRIZ DE COSTOS -------------------------------##
#
#
cost_mat_1 <- matrix(c( 96,  96, 100,  88,
                        112, 120, 120, 136,
                        192, 188, 180, 170,
                        84,  88, 108, 92), ncol = 4, byrow = TRUE)

cost_mat_1

solucion_2 <- lp.assign (cost.mat = cost_mat_1, 
                         direction = "min", 
                         presolve = 0, 
                         compute.sens = 0)


solucion_2["solution"]
solucion_2

# b) Encuentre el plan óptimo de asignación, que minimiza los costos.

#$solution
#
#     [,1] [,2] [,3] [,4]
#[1,]    0    0    0    1
#[2,]    1    0    0    0
#[3,]    0    0    1    0
#[4,]    0    1    0    0
#
#PARAMETROS OPTIMOS PARA EL MODELO DE ASIGNACION
#
# No se asigna proyecto PUENTE al costratista ALFA 
# No se asigna proyecto PUENTE al costratista BETA
# No se asigna proyecto PUENTE al costratista GAMA 
# Si se asigna proyecto PUENTE al costratista LANDA 
# 
# Si se asigan proyecto Escuela al contratista ALFA
# No se asigna proyecto ESCUELA al contratista BETA
# No se asigna proyecto ESCUELA al contratista GAMA
# No se asigna proyecto ESCUELA al contratista LANDA
#
# No se asigna proyecto PARQUE al contratista ALFA
# No se asigna proyecto PARQUE al contratista BETA
# Si se asigna proyecto PARQUE al contratista GAMA
# No se asigna proyecto PARQUE al contratista LANDA
#
# No se asigna proyecto HOSPITAL al contratista ALFA
# Si se asigna proyecto HOSPITAL al contratista BETA
# No se asigna proyecto HOSPITAL al contratista GAMA
# No se asigna proyecto HOSPITAL al contratista LANDA
#

#c) Interprete los resultados.
#
# DEL MODELO DE ASIGNACION SE OBTIENE LA OPTIMIZACION, DE MODO QUE EL COSTO SEA EL MINIMO PARA LA ALCALDIA
# PARA OBTENER EL MENOR COSTO AL ASIGNAR LOS PROYECTOS A LOS CONTRATISTAS SE DEBE HACER LO SIGUIENTE
#SE DEBE ASIGNAR EL PROYECTO PUENTE AL CONTRATISTA LANDA VALOR EN UM 88
#SE DEBE ASIGNAR EL PROYECTO ESCUELA AL CONTRATISTA ALFA VALOR EN UM 112
#SE DEBE ASIGNAR EL PROYECTO PARQUE AL CONTRATISTA GAMA VALOR EN UM 180
#SE DEBE ASIGNAR EL PROYECTO HOSPITAL AL CONTRATISTA BETA VALOR EN UM 88
# AL REALIZAR ESTAS ACCIONES LA ALCALDIA DE LA CIUDAD GARANTIZA UN COSTO MINIMO DE ASIGNACION DE LOS PROYECTOS A LOS CONTRATISTAS.
#
#REEMPLAZANDO EN LA F.O.
#
##MIN Z :   96(0) +  96(0) + 100(0) +  88(1)
#       + 112(1) + 120(0) + 120(0) + 136(0) 
#       + 192(0) + 188(0) + 180(1) + 170(0)
#       +  84(0) +  88(1) + 108(0) +  92(0)
#
#EL MODELO OPTIMIZADO NOS INDICA QUE EL MENOR COSTO DE ASIGNACION DE PROYECTOS PARA LA ALCALDIA ES DE 468 UM.
#

