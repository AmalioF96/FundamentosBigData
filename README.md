# FundamentosBigData
Repositorio con los ejercicios del máster en Ingeniería del Software: Cloud, Datos y Gestión TI, para la asignatura de BigData.

## Descripción del repositorio

En primer lugar, para ejecutar el proyecto, es necesario tener descargada la imagen linux de hortonworks. Podemos descargarla y ejecutarla mediante el siguiente comando:

```Bash
docker run --hostname=quickstart.cloudera --privileged=true -t -i --mount type=bind,source=/BigData/wordCount,target=/tmp/wordCount -p 10001:7180 -p 10002:8888 cloudera/quickstart:latest /usr/bin/docker-quickstart
```
 Podemos ver que montamos un volumen con la carpeta wordCount, esta carpeta está en el repositorio y contiene los ficheros necesarios para ejecutar las distintas partes del proyecto.
 
 ## Ejecución del proyecto
 
 En este apartado vamos a tratar las distintas partes del proyecto, una vez instanciada la imagen anterior, entraremos automáticamente en la consola del contenedor. Desde esta consola operaremos la mayor parte del tiempo.

Debemos iniciar el servidor de cloudera.

```bash
/home/cloudera/cloudera-manager --express
```
 
 ## MapReduce
 
 Para ejecutar el map reduce tenemos las siguientes instrucciones:
 
 ```bash
cd /tmp/wordCount
```
En la carpeta encontramos:

```bash
> ls
cyrusprint.txt   mapper.py   mi_mr.sh   pig   reducer.py
```

Ahora ejecutamos el script que está dentro:

```bash
./mi_mr.sh dirInput dirOutput # Le pasamos como parametros directorios de entrada y salida para que no pete al reejecutar.
# ó
/tmp/wordCount/mi_mr.sh dirInput dirOutput #mi_mr significa 'mi mapreduce'
```

Este script se encarga de ejecutar automáticamente el mapReduce sobre un fichero txt que hemos situado también en el mismo volumen.
--- 

## 2. Pig

Para ejecutar el script de pig nos vamos a:

```bash
cd /tmp/wordCount/pig
```

En la carpeta encontramos:

```bash
> ls
script_pig  truck_event_text_partition.csv
```


y ejecutamos 

```sh
pig -f script_pig
```

## 3. Hive

https://www.youtube.com/watch?v=yebZCbHidLw

```bash
cd /usr/share/doc/hive-1.1.0+cdh5.7.0+522
```
