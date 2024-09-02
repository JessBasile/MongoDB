<img align="right" alt="Logo MongoDB GIF" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/mongo_db.gif">

<br><br><br>

## { Instalación de MongoDB, Mongo Compass y MongoSH }

Para iniciar la utilización de MongoDB, fue necesario no solo la instalación del motor de DB, sino de la interfaz Mongo Compass y de MongoSH para su manejo desde línea de comandos.

<img align="right" alt="Logo MongoDB" width="150" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/hojadb.png">

1. Se procedió a la instalación de ***MongoDB***, que luego de su ejecución fue necesario no solo configurar su incorporación de permisos en las variables del entorno del sistema operativo `C:\Program Files\MongoDB\Server\7.0\bin` en el `PATH`, sino además, crear una carpeta denominada `db` en el directorio que MongoDB tiene predeterminado `C:\data\db` para poder realizar la instalación de forma exitosa. Posteriormente, se ejecuta en el símbolo del sistema `cmd` el comando `mongod`, y si la respuesta del log manifiesta lo siguiente, significa que:
   + "MongoDB starting": MongoDB ha comenzado el proceso de arranque.
   + "WiredTiger opened": El motor de almacenamiento WiredTiger se ha abierto exitosamente.
   + "recovery was completed successfully": La recuperación del registro de transacciones se completó con éxito.

   <img align="right" alt="Logo Compass" width="100" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/compas.png">

2. Luego se efectúa la instalación de ***Mongo Compass***, la cual no requiere modificación en las variables del entorno, dado que es una interfaz gráfica que depende de MongoDB. Solo debe verificarse que el motor corra adecuadamente con el comando `mongod`, y utilizará el localhost puerto 27017 predeterminado en MongoDB.

3. En el caso de ***MongoSH***, es decir, MongoShell debe crearse una carpeta en el siguiente directorio `C:\Program Files\MongoSH`, dado que desde la página web oficinal de Mongo la versión Shell se descarga en un `.zip` y será recomendable extraer los archivos en ese destino para no interferir en la instalación de MongoDB.

<img align="right" alt="Logo MongoDB" width="300" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/mongoshell.png">

Asimismo, dentro de la carpeta `mongosh-2.3.0-win32-x64` creada luego de la extracción del .zip, deberá controlarse que no figure ningún otro documento con extensión .zip, y en caso de identificar alguno, también deberá ser extraído allí mismo, en este caso se ubica uno denominado `mongosh.1` extraído ahí mismo. Esto, a su vez, implica efectuar los pasos para otorgar los permisos necesarios a través de las variables de entorno en el `PATH` adhiriendo la dirección `C:\Program Files\MongoSH\mongosh-2.3.0-win32-x64\bin`. Posteriormente, se deberán ejecutar algunos comandos para conectar MongoDB con MongoSH y poder operar desde la terminal satisfactoriamente:
+ "mongosh --version": que deberá devolver el dato de la versión instalada si fué exitosa, en mi caso respondió: `2.3.0`.
+ "mongosh": si devuelve que la conexión pudo establecerse y arroja el dato de las versiones de ambos Mongos, entonces la instalación concluyó:
```cmd
Using MongoDB:          7.0.14
Using Mongosh:          2.3.0
```
Por último, como prueba final del adecuado funcionamiento de mongosh, puede ejecutarse desde terminal el comando `show dbs`, que arrojará todas las bases de datos que se encuentran creadas por default en el mongodb:
```
admin   40.00 KiB
config  60.00 KiB
local   72.00 KiB
```
De esta manera, se encuentra finalizada la instalación del motor y sus diferentes interfaces para comenzar a interactuar con la herramienta. A continuación se expone captura del resumen de las variables del entorno actualizadas luego de las modificaciones efectuadas:

<img src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/variables_entorno.png" alt="Variables de Entorno">

## { Implementación de MongoDB Atlas }
MongoDB Atlas es un servicio de bases de datos en la nube administrado por MongoDB [principalmente MongoSH]. Este motor NoSQL tiene la particularidad de incluir la sección de "`Schema`" que permite al usuario visualizar y analizar los datos de sus colecciones con gráficos y estadísticas. Estos gráficos te ayudan a entender mejor la estructura y distribución de la información. 

_Implementación:_Para poder operar en la nube se requerirá ingresar en la página oficinal de [MongoAtlas](https://www.mongodb.com/es/lp/cloud/atlas/try4?utm_source=google&utm_campaign=search_gs_pl_evergreen_atlas_core_retarget-brand_gic-null_amers-all_ps-all_desktop_eng_lead&utm_term=mongo%20atlas&utm_medium=cpc_paid_search&utm_ad=p&utm_ad_campaign_id=14412646314&adgroup=131761122132&cq_cmp=14412646314&gad_source=1&gclid=CjwKCAjwodC2BhAHEiwAE67hJDRfjxYun1nUkhWok21s13G5QVpJ9HkoLSYmb_tT6p_lxIFeXE1SuhoCBHMQAvD_BwE?utm_source=google&utm_campaign=search_gs_pl_evergreen_atlas_core_retarget-brand_gic-null_amers-all_ps-all_desktop_eng_lead&utm_term=mongo%20atlas&utm_medium=cpc_paid_search&utm_ad=p&utm_ad_campaign_id=14412646314&adgroup=131761122132&cq_cmp=14412646314&gad_source=1&gclid=CjwKCAjwodC2BhAHEiwAE67hJDRfjxYun1nUkhWok21s13G5QVpJ9HkoLSYmb_tT6p_lxIFeXE1SuhoCBHMQAvD_BwE) para registrar una cuenta. Inicialmente, se deberán responder las preguntas sobre el objetivo para su uso, el tiempo que se lleva utilizando la herramienta, etc. Luego se procederá a crear un ***Cluster***, para lo cual será recomendable seleccionar el servicio gratuito de `M0 Free`, y posteriormente elegir un nombre al cluster que luego NO PODRÁ SER MODIFICADO, y en caso de querer cambiarlo no será posible, habrá que generar un cluster nuevo. A su vez, en mi caso particular permití la opción ***"Preload sample dataset"*** que proporciona datos de ejemplo para la familiarización con la aplicación. Posteriormente, si por cuestiones de espacio no se desea conservarlos, deberán ser eliminados manualmente. Para poder continuar, se debe elegir la ubicación, como Argentina no esta en las opciones por cuestiones de latencia y cercanía se recomienda elegir `N. Virginia (us-east-1)` y el proveedor, que en mi caso seleccioné `AWS`. Una vez completados todos los pasos previos, se CREA EL USUARIO DE BASE DE DATOS, todo a través de
![Botón Create](https://github.com/JessBasile/MongoDB/raw/main/imagenes/create.png)
Finalmente, se debe elegir un metodo de conexión que será recomendable seleccionar la opción "Conductores". Luego se procederá a configurar esa conexión a través de línea de comando cmd, tipeando inicialmente:
```
mongosh "mongodb+srv://JessBasile:contraseña@reportcluster.f0vgx.mongodb.net/?retryWrites=true&w=majority"
```
`Aclaración:`En mi caso todavía no se hace a través de Node.js debido a que no tengo instalado el software en la pc.

La respuesta es exitosa cuando prporciona el log ID, las credenciales de conexion y las versiones de MongoDB y Mongosh. Luego puede "testearse" esa conexión exitosa utilizando los comandos:
```
show dbs
```
En mi caso particular, la línea de comando respondió:
```
sample_mflix  110.59 MiB
admin         368.00 KiB
local           6.88 GiB
```
Cada respuesta tiene un significado específico detallado a continuación:
+ sample_mflix: Esta es una base de datos de muestra proporcionada por MongoDB Atlas, que contiene datos de ejemplo para que puedas practicar consultas y explorar la estructura de datos.
+ admin: Es la base de datos administrativa que MongoDB utiliza para manejar operaciones administrativas del clúster.
+ local: Es una base de datos interna utilizada por MongoDB para almacenar información sobre el estado del clúster y el registro de operaciones.

Finalmente la cuenta de MongoDB Atlas quedó exitosamente creada, y vinculada a MondoShell para comenzar a trabajar :computer:
