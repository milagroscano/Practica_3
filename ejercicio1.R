# Ejercicio 1 

rm(list=ls())

# a) Generar un vector que contenga los n´umeros del 1 al 1000. Generarlo utilizando
# un ciclo “for” y utilizando la notaci´on abreviada de R. 

v = c()
for (i in 1:1000) {
  v[i] = i
}

v1 = 1:1000

# b) Generar un array de dos dimensiones que tenga 20 columnas y 30 filas. 

# ?? La componente correspondiente a la fila i, columna j del array debe tener el resultado del producto de i*j. 
# preguntar por la 2da parte

matriz = matrix(NA, nrow = 30, ncol = 20)
matriz

# agregar for para la multiplicacion

# c) Generar la misma matriz del punto anterior pero como producto punto a punto de dos matrices. 

matriz1 <- matrix(runif(600), nrow=30, ncol=20)
matriz2 <- matrix(runif(600), nrow=30, ncol=20)
producto <- matriz1*matriz2
dim(producto)
class(producto)

# d) Guardar la quinta columna del array mencionado en el punto anterior en un vector B. 

vector_B = producto[, 5]
vector_B 

# e) Generar un array de tres dimensiones. Si i, j y k son los sub´ındices que identifican la posici´on 
# de cada componente del array, el valor de cada componente debe ser igual al producto de i*j*k. 
# Generar un array de dos dimensiones que contenga la componente k=4 del array de tres dimensiones.
# (El tama˜no de la matriz en cada una de las dimensiones debe ser 20, 30 y 10 respectivamente).

array_e <- array(data=c(1:600),dim=c(20,30,10))
dim(array_e)

# preguntar por el item en sí ???