
# Para copiar archivos de una carpeta a otra carpeta recien creada

dir_salida = "D:/ENADIS/Tabs/pubs_2022/"
archivos = list.files(dir_salida)
dir_llegada = "D:/ENADIS/Tabs/pubs_2022_ASP/" 

#-----
seleccionados <- function(dir_salida){
  archivos <- list.files(salida)
  archivos_total <- purrr::map(.x = 1:length(archivos), 
                               .f =~ archivos[.x])
  archivos_x <- unlist(archivos_total) 
 
  return(archivos_x)
}

#-----

copia_a_nueva <- function(dir_salida, dir_llegada){
  dir.create(dir_llegada)
  
  salto<-"\n"
  cat(
    "Indica el número de la opción que quieres:",salto, salto,
    "1) Todos los archivos",salto,
    "2) Solo algunos archivos",salto)
  op_0 <- scan(file = "", what = integer(),nmax = 1)
  
  while (!op_0%in%as.integer(c(1,2))) {
    cat(
      "Indica el número de la opción que quieres:",salto, salto,
      "1) Todos los archivos",salto,
      "2) Solo algunos archivos",salto)
    op_0 <- scan(file = "",what = integer(),nmax = 1)
    next}
    
    if(op_0==1L){
       print("Se copiaron todos los archivos del fichero")#source(paste0(dd,"01_SEC_I/01_EJECUTABLE_SEC_I.R"))
       a <- list.files(dir_salida)
       file.copy(paste0(dir_salida, a), 
                 paste0(dir_llegada,a))
    }else if(op_0==2L){
       cat("Elige los archivos que quieres. Pulsa dos veces enter para terminar: ", salto, salto)
       print(seleccionados(dir_salida))
       
       x <- scan("",what=integer())
       
       while(sum(!seleccionados(dir_salida)[x]%in%seleccionados(dir_salida))>0){
         cat("Seas mamón, no estoy jugando!!!", salto,
             "Elige los archivos que quieres. Pulsa dos veces enter para terminar: ", salto, salto)
         print(seleccionados(dir_salida))
         
         x <- scan("", what=integer())
         next}
       
         print(x)
         
         file.copy(paste0(dir_salida, seleccionados(dir_salida)[x]), 
                   paste0(dir_llegada,seleccionados(dir_salida)[x]))
       }
       
       
    }

  
