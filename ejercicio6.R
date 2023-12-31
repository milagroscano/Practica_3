
# Ejercicio 6 - CONSULTAR por el apply, que dim dejar fijas segun lo que pida

# A partir del archivo “tempbsas.Rdata??? con datos de temperatura mensual para diferentes niveles durante el 
# per´ıodo 2000-2005 sobre la provincia de Buenos Aires. (Cargar el archivo utilizando la funci´on “load()???) 
rm(list = ls())
load("/LIANA/Escritorio/LicAtmosfera/Laboratorio de Procesamiento de Información Meteorológica/2C 2023/Clases Pract/Practica_3/temp_bsas.RData")

# a) Obtener el promedio mensual de temperatura en el per´ıodo analizado para cada nivel y cada punto de 
# ret´ıcula. H´agalo por un lado utilizando ciclos y por otro reacomodando el arreglo y utilizando la 
# funci´on “apply()???.

# observo los datos, dim, class, etc
dim(variable)
# 8 = longitud
# 14 = latitud
# 4 = niveles
# 72 = tiempos
class(variable)
# array

####################### COMO SE HACE CON CICLOS ??? 
# los tiempos ya estan acomodados, utilizar algun for

####################### COMO ME PIDE LE PROMEDIO MENSUAL Y LA DIMENSION DEL TIEMPO YA ESTA EN MESES 
####################### HACE FALTA REACOMODAR EL ARRAY ?? 
# si pues, cuando pide promedio mensual, debo hacer el promedio sobre los años,
# por lo tanto voy a necesitar una dim que sean los años, y hacer el apply sobre esa dim
# ya que quiero un promedio sobre todos los eneros y asi con los demas meses

###################### COMO ME PIDE PARA CADA PUNTO DE RETICULA DEBO REACOMODAR ESAS DIM ?? QUE SEA UNA SOLA DIM ?? 
# NO, cada punto de reticula es un valor(punto) para una lat y lon determinada 

prom_mensual = apply(variable, c(1,2,3), mean) # REHACER, ESTA MAL REACOMODADO Y FIJADA LAS DIM
dim(prom_mensual)

# b) Obtener la temperatura media anual en el per´ıodo analizado para cada nivel y cada punto de ret´ıcula. 

# como me pide la temperatura media anual, debo reacomodar el array de tal forma que una de las dim sea años
# el periodo 2000-2005 resultan 6 años, 72/6 = 12 meses
temp = array(variable, dim = c(8,14,4,6,12))  # CORREGIR, las dim deberian ser primero meses y luego años

#################### COMO ES UN PROMEDIO ANUAL, APLICO EL APPLY SOBRE LOS MESES ?? 
# SI, pero corregir, arrastra error del temp mal definido en las dim``
temp_media_anual = apply(temp, c(1,2,3,4), mean) 
dim(temp_media_anual)

# c) Utilizando la indexaci´on l´ogica seleccione el nivel de 850hPa e imprima por pantalla el promedio de 
# temperatura sobre el dominio para cada a˜no. 

# me fijo que datos tienen las dim, ubicaciones, etc
datos_dimensiones
# se que el nivel 850 esta en la segunda posicion de la dim de niveles que corresponde a la 3er dim
nivel_850 = temp[,,2,,]                       
###################### SE TENIA QUE HACER CON WHICH ???

# lo hago con which por si no supiera la posicion, esto habia que hacer cuando dice indexacion logical ????
niveles = datos_dimensiones$isobaricInhPa
pos_nivel850 = which(niveles==850)
nivel2_850 = temp[,,pos_nivel850,,]

# calculo el promedio mensual con la primera forma 
prom_temp = apply(nivel_850, c(1,2,3), mean)
print(prom_temp)
dim(prom_temp)

########################################################################

# d) Utilizando la indexaci´on l´ogica seleccione el punto de ret´ıcula m´as cercano a la localidad de 
# Olavarr´ıa y obtenga la temperatura promedio para cada a˜no en el nivel de 1000hPa. 

# Coordenadas de Olavarria (Argentina) · Longitud: O 60°19'21.14" = -60° O = 300° · Latitud: S 36°53'33.79" = -36°S
long = datos_dimensiones$longitude
lat = datos_dimensiones$latitude

################################################3
# IDEA: tengo que crearme dos vectores, uno con la lat y otro con la lon, solo para el nivel de 1000hPa
# luego debo calcular la norma (es decir la distancia) entre el primer elemento de la lat y la lon de ese nivel con respecto a la lat y lon
# de olavarria, y asi para elemento de los vectores lat y long del nivel, luego calculo min(distancia) y con eso obtengo la posicion donde
# se encuentra y asi obtengo en que lat y long de ese nivel obtuve la menor distancia (punto de reticula mas cercano)
############################################3

pos_long_olav = which(long==300)
pos_lat_olav = which(lat==-36)

# defino un array solo para olavarria
temp_olav = temp[pos_long_olav, pos_lat_olav,,,]
dim(temp_olav)

# fijo el nivel de 1000hPa
pos_nivel1000 = which(niveles==1000)
nivel_1000 = temp_olav[pos_nivel1000,,]
dim(nivel_1000)

# realizo el promedio para cada año
prom = apply(nivel_1000, c(1), mean)
prom
dim(prom)
length(prom)

########### ESTA BIEN ??? NO, la idea era otra, descripta arriba