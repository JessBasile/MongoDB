<p style="text-align: center;">
    <img alt="Logo MongoDB GIF" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/mongo_db.gif">
</p>

## { Instalación de MongoDB, Mongo Compass y MongoSH }

Para iniciar la utilización de MongoDB, fue necesario no solo la instalación del motor de DB, sino de la interfaz Mongo Compass y de MongoSH, éste último para su manejo desde línea de comandos.

<img align="right" alt="Logo MongoDB" width="150" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/hojadb.png">

1. Se procedió a la instalación de ***MongoDB***, que luego de su ejecución fue necesario no solo configurar su incorporación de permisos en las variables del entorno del sistema operativo `C:\Program Files\MongoDB\Server\7.0\bin` en el `PATH`, sino además, crear una carpeta denominada `db` en el directorio que MongoDB tiene predeterminado: `C:\data\db` para poder realizar la instalación de forma exitosa. Posteriormente, se ejecuta en el símbolo del sistema `cmd` el comando `mongod`, y si la respuesta del log manifiesta lo siguiente, significa que:
   + "`MongoDB starting`": MongoDB ha comenzado el proceso de arranque.
   + "`WiredTiger opened`": El motor de almacenamiento WiredTiger se ha abierto exitosamente.
   + "`recovery was completed successfully`": La recuperación del registro de transacciones se completó con éxito.

   <img align="right" alt="Logo Compass" width="100" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/compas.png">

2. Luego se efectúa la instalación de ***Mongo Compass***, la cual no requiere modificación en las variables del entorno, dado que es una interfaz gráfica que depende de MongoDB. Solo debe verificarse que el motor corra adecuadamente con el comando `mongod`, y utilizará el _localhost puerto 27017_ predeterminado en MongoDB.

3. En el caso de ***MongoSH***, es decir, MongoShell debe crearse una carpeta en el siguiente directorio `C:\Program Files\MongoSH`, dado que desde la página web oficinal de Mongo la versión Shell se descarga en un `.zip` y será recomendable extraer los archivos en ese destino para no interferir en la instalación de MongoDB.

<img align="right" alt="Logo MongoDB" width="300" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/mongoshell.png">

Asimismo, dentro de la carpeta `mongosh-2.3.0-win32-x64` creada luego de la extracción del .zip, deberá controlarse que no figure ningún otro documento con extensión .zip, y en caso de identificar alguno, también deberá ser extraído allí mismo, en este caso se ubica uno denominado `mongosh.1` extraído ahí mismo. Esto, a su vez, implica efectuar los pasos para otorgar los permisos necesarios a través de las variables de entorno en el `PATH` adhiriendo la dirección `C:\Program Files\MongoSH\mongosh-2.3.0-win32-x64\bin`. Posteriormente, se deberán ejecutar algunos comandos para conectar MongoDB con MongoSH y poder operar desde la terminal satisfactoriamente:
+ "`mongosh --version`": que deberá devolver el dato de la versión instalada si fué exitosa, en mi caso respondió: `2.3.0`.
+ "`mongosh`": si devuelve que la conexión pudo establecerse y arroja el dato de las versiones de ambos Mongos, entonces la instalación concluyó:
```sql
Using MongoDB:          7.0.14
Using Mongosh:          2.3.0
```
Por último, como prueba final del adecuado funcionamiento de mongosh, puede ejecutarse desde terminal el comando `show dbs`, que arrojará todas las bases de datos que se encuentran creadas por default en el mongodb:
```sql
admin   40.00 KiB
config  60.00 KiB
local   72.00 KiB
```
De esta manera, se encuentra finalizada la instalación del motor y sus diferentes interfaces para comenzar a interactuar con la herramienta. A continuación se expone captura del resumen de las variables del entorno actualizadas luego de las modificaciones efectuadas:

<img src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/variables_entorno.png" alt="Variables de Entorno">

## { Implementación de MongoDB Atlas }

<img align="right" alt="Logo MongoDB" width="300" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/mongodb_atlas.png">

MongoDB Atlas es un servicio de bases de datos en la nube administrado por MongoDB [principalmente MongoSH]. Este motor NoSQL tiene la particularidad de incluir la sección de "`Schema`" que permite al usuario visualizar y analizar los datos de sus colecciones con gráficos y estadísticas. Estos gráficos ayudan a comprender mejor la estructura y distribución de la información. Por último, es el único de los MongosDB disponibles que permite el diseño e implementación de [triggers] (usualmente configurados en motores de base de datos SQL).

_Implementación:_ Para poder operar en la nube se requerirá ingresar en la página oficinal de [MongoAtlas](https://www.mongodb.com/es/lp/cloud/atlas/try4?utm_source=google&utm_campaign=search_gs_pl_evergreen_atlas_core_retarget-brand_gic-null_amers-all_ps-all_desktop_eng_lead&utm_term=mongo%20atlas&utm_medium=cpc_paid_search&utm_ad=p&utm_ad_campaign_id=14412646314&adgroup=131761122132&cq_cmp=14412646314&gad_source=1&gclid=CjwKCAjwodC2BhAHEiwAE67hJDRfjxYun1nUkhWok21s13G5QVpJ9HkoLSYmb_tT6p_lxIFeXE1SuhoCBHMQAvD_BwE?utm_source=google&utm_campaign=search_gs_pl_evergreen_atlas_core_retarget-brand_gic-null_amers-all_ps-all_desktop_eng_lead&utm_term=mongo%20atlas&utm_medium=cpc_paid_search&utm_ad=p&utm_ad_campaign_id=14412646314&adgroup=131761122132&cq_cmp=14412646314&gad_source=1&gclid=CjwKCAjwodC2BhAHEiwAE67hJDRfjxYun1nUkhWok21s13G5QVpJ9HkoLSYmb_tT6p_lxIFeXE1SuhoCBHMQAvD_BwE) para registrar una cuenta. Inicialmente, se deberán responder las preguntas sobre el objetivo para su uso, el tiempo que se lleva utilizando la herramienta, etc. Luego se procederá a crear un ***CLUSTER***, para lo cual será recomendable seleccionar el servicio gratuito de `M0 Free`, y posteriormente elegir un nombre al cluster que luego _NO PODRÁ SER MODIFICADO_ , y en caso de querer cambiarlo no será posible, habrá que generar un cluster nuevo. A su vez, en mi caso particular permití la opción ***"Preload sample dataset"*** que proporciona datos de ejemplo para la familiarización con la aplicación. En caso que por cuestiones de espacio no se desee conservarlos, deberán ser eliminados manualmente. Para poder continuar, se debe elegir la ubicación, pero como Argentina no se encuentra dentro de las opciones predeterminadas, por cuestiones de latencia y cercanía se recomienda seleccionar `N. Virginia (us-east-1)` y el proveedor, que en este caso se seleccionó `AWS`. Una vez completados todos los pasos previos, se ***CREA EL USUARIO DE BASE DE DATOS*** , todo a través del siguiente botón de acción:

![Botón Create](https://github.com/JessBasile/MongoDB/raw/main/imagenes/create.png)

Finalmente, se debe elegir un metodo de conexión sobre el cual será recomendable seleccionar la opción "_Conductores_". Luego se procederá a configurar esa conexión a través de línea de comando cmd, tipeando inicialmente:
```sql
mongosh "mongodb+srv://JessBasile:contraseña@reportcluster.f0vgx.mongodb.net/?retryWrites=true&w=majority"
```
`Aclaración:`En este caso todavía no se hace a través de Node.js debido a que no se instaló el software en el ordenador.

La respuesta es exitosa cuando prporciona el log ID, las credenciales de conexión y las versiones de MongoDB y Mongosh. Luego puede "testearse" esa conexión exitosa utilizando los comandos:
```sql
show dbs
```
En este caso particular, la línea de comando respondió:
```sql
sample_mflix  110.59 MiB
admin         368.00 KiB
local           6.88 GiB
```
Cada respuesta tiene un significado específico justificado a continuación:
+ `sample_mflix` Esta es una base de datos de muestra proporcionada por MongoDB Atlas, que contiene datos de ejemplo para que puedas practicar consultas y explorar la estructura de datos.
+ `admin:` Es la base de datos administrativa que MongoDB utiliza para manejar operaciones administrativas del clúster.
+ `local:` Es una base de datos interna utilizada por MongoDB para almacenar información sobre el estado del clúster y el registro de operaciones.

Finalmente la cuenta de MongoDB Atlas quedó exitosamente creada, y vinculada a MongoDBShell para comenzar a trabajar :computer:

## { Consideraciones importantes en MongoDB }

+ Una colección es un conjunto de documentos, similar a una tabla en una base de datos relacional.
+ Un documento es un registro individual en una colección, similar a una fila en una tabla relacional.
Por consiguiente, una colección puede contener muchos documentos. Cada documento puede tener una estructura diferente, aunque generalmente se sigue una estructura común dentro de una colección para mantener la coherencia de los datos.

## { Primeros comandos en MongoDB Shell }

El primer comando en MongoDB Shell que se suele utilizar es `db.help` que proporciona información sobre las funciones básicas que se pueden utilizar dentro de la base de datos en la que se encuentra posicionado a la hora de ejecutar el comando.

Con `show dbs` o `show databases` se pueden observar todas las bases de datos que posee el motor de Mongo en el momento de la consulta. Otra alternativa que proporciona un detalle con mayor información en un formato de estructura json es: `db.adminCommand({ listDatabases: 1 })`

Para ubicarse dentro de una base de datos específica en MongoDB Shell se realiza utilizando el comando `use nombre_base_de_datos` y aparecerá en terminal el nombre de la base.
En caso de ubicarnos dentro de una base de datos, y desconocer de cuál se trata, puede utilizarse el comando `db.nombre_base_datos` y proporcionará la información del nombre de la base de datos en la que estamos posicionados.

El comando `db.stats()` muestra una estadística de la base de datos en la que nos encontramos alojados, la cantidad de colecciones, los tipos de datos, cantidad de objetos, índices, tamaño, etc.

El comando `db.dropdatabase()` borra defintivamente una base de datos en específico (en la que me encuentre alojado al momento de ejecutar el comando). También es posible dropear una colección que el comando de MongoDB Shell es: `db.collectionName.drop()`, cuando la respuestas es “true” significa que se borró exitosamente.

Para ver las colecciones que conforman la BD se ejecuta el comando `show collections`.

Si se desea renombrar una colección en particular sobre una base de datos determinadas el comando que se utiliza es: `db["my collection"].renameCollection("myNewCollection")` otra alternativa es: `db.myCollection.renameCollection("myNewCollection")` siempre y cuando el nombre de la colección no tenga espacios, lo cual no es recomendable.

Para crear una colección el comando es: `db.createCollection("nombre")` siempre situado anteriormente en la base de datos que deseo crear esa nueva colección.

## { Operaciones CRUD dentro de MondoDB Shell }

+ _Inserción de un documento individual_: Es utilizado para insertar documentos en la colección indicada.
```sql
db.mycoleccion.insertOne({"nombre": "Juan","edad": 32,"activo":true,"fecha": ISODate("2024-08-26T19:49:25.197Z")})
```
La típica respuesta exitosa seria: 
```sql
{"acknowledged" : true,
  "insertedId" : ObjectId("64f5b2a8e1234567890abcdef")}
```
La cual indica el N° de ObjectId generado. 

+ _Inserción masiva_: 
```sql
db.mycoleccion.insertMany([{nombre:"Juan", edad: 31,activo:true},{nombre:"Sofia",edad:24},{nombre:"Luis"},{ _id: 1,nombre:"Lusy",edad:50}])
```
En ese caso los corchetes `[]` indican que se trabaja con un arreglo de documentos, y las llaves `{}` delimitan los elementos de objeto json.  Para corroborar si la actualización en compass es lo mismo que en Shell se puede ejecutar el comando: 
```sql
db.mycoleccion.find().pretty() //que muestra todos los documentos de una colección
```
En ese ejemplo la colección es educacionit y sus documentos son Jess, Juan, etc. con sus correspondientes claves/valor.

+ _Modificación/Actualización individual de un solo documento_: Se realiza utilizando un filtro (lo que sería where en SQL). Para un solo dato, en esta caso la edad cuando el nombre sea Juan:
```sql
db.mycollection.updateOne(
  {name: "Juan"},               // Filtro
  {$set: {edad: 32}}            // Actualización
)
```
`Aclaración:` Si se ejecuta una actualización sobre una clave que no existe y le deseo asignar un valor, incorporará la clave y el valor. En ese caso, para revertirlo deberá ser utilizado el comando “unset” con la siguiente estructura de ejemplo:
```sql
db.mycollection.updateOne(
  {name: "Juan"},               // Filtro para encontrar el documento
  {$unset: {edad: ""}}          // Elimina el campo 'edad'
)
```
Para modificar dos datos cuando el nombre es Juan: cambia la edad e incrementar el id con un número más:
```sql
db.mycollection.updateOne(
  {name: "Juan"},               // Filtro
  {$set: {edad: 33},           // Actualización del campo 'edad'
    $inc: {id: 1}               // Incremento del campo 'id' en 1
  }
)
```

+ _Modificación/Actualización de varios documentos en función de un filtro_: En este caso el filtro será el nombre (suponiendo que esa colección tiene más de un documento con el nombre María), y modificaría todas las edades de las personas que se llamen de ese modo:
```sql
db.collection.updateMany(
  {nombre: "Juan"},            // Filtro
  { $set: {edad: 35} }          // Actualización
)
```
+ _Caso especial de modificación/actualización con potencial inserción_: En el caso que se desee modificar un registro que cumpla con ciertos filtros, pero ningún documento que compone la colección cumpla con esas caracteristicas, podrá ser incorporado si en la línea de comando se incluye la sintaxis “upsert:true” que insertará si no logra encontrar coincidencias, y generará un nuevo ObjectId.
```sql
db.mycoleccion.updateMany({nombre: "Juan"},{$set:{edad: 25}},{upsert: true})
```
En conclusión, con la utilización del comando upsert, ***la base de datos va a cambiar ya sea por actualización o por insersión.***

`Importante:` En caso de colocar el filtro y ***utilizar solo las llaves sin ninguna clave `{“”}` se modificarán todas las claves y valores de todos los documentos, y si ese valor no existe en un documento lo incorporará.***

+ _Eliminación de un registro_: Solo se elimina el primer registro que cumpla con las características del filtro, si existen más registros con las mismas condiciones no serán adulterados puesto que el comando es **One**. 
```sql
db.mycoleccion.deleteOne({nombre: "Juan"})
```
Para mayor especificidad podría filtrarse según ObjectId, de todos modos, existe otra alternativa para brindar especificidad incorporando operadores lógicos/condicionales, tales como: `$and`, `$or`, `$not`, `$nor`, a continuación, un ejemplo:
```sql
db.mycoleccion.deleteOne({$and:[{nombre: "Juan"},{edad: 25}]})
```
+ _Eliminación de varios registros simultáneos_: Se eliminarán todos los registros que cumplan las condiciones del filtro aplicado, un ejemplo del comando:
```sql
db.mycoleccion.deleteMany({$and:[{nombre: "Juan"},{edad: 25}]})
```

+ _Lectura de documentos en una colección_: En MongoDB no existe SELECT como en SQL, sino `find` que sirve para consultar los documentos que componen una colección, ejemplo de su utilización:
```sql
db.mycoleccion.find()
```
+ _Lectura con condiciones y comentarios_: El operador `$comment` se utiliza para agregar comentarios a una consulta en MongoDB que no afecta los resultados de la misma. Se suele utilizar para luego rastrear las consultas efectuadas y su finalidad (auditoria).
```sql
db.mycoleccion.find({“nombre”:”Juan”}, $comment: “Buscar documentos con el nombre “Juan”})
```

+ _Caso Especial: Importación desde línea de comandos para archivos csv_ : Este tipo de operaciones deben efectuarse desde terminal de Windows `cmd`, dado que MongoShell no la admite, y el comando utilizado para tal fin es:
```sql
mongoimport --uri "mongodb://localhost:27017/mi_base" --collection clientes --type csv --headerline --file "C:\ruta\clientes.csv"
```

## { Operaciones CRUD desde MondoDB Compass }

+ _Inserción de un documento json_: Se posiciona sobre la colección y se selecciona la opción `ADD DATA` ---> `Insert document` incorporará automáticamente el ObjectId y se debe agregar luego de la llave } las claves y valores.

+ _Inserción masiva_: Se debe posicionar sobre la colección, y dar click en `Import`, luego seleccionar el archivo tipo json y se efectua automáticamente a través de interface, sin intervención de compandos.

+ _Inserción/Importación de un documento csv_: Opera igual que el caso de json, se deberán posicionar sobre la colección que se desea importar datos, se da click en `Import`, se pueden moficar los tipos de datos, y efectuar la importación.

+ _Modificación/Actualización individual de un solo documento_: Se debe posicionar sobre el documento a modificar, se da click sobre el lapiz, y se activa el modo edición habilitándose en la derecha la información de los tipos de datos. Se puede posicionar directo sobre el valor que se desea modificar, se borra y reemplaza por el dato que se requiere, siempre concluyendo la operación clickeando en `Update` a la derecha inferior.

+ _Eliminación de un registro_: Sobre el documento que se desea elimninar, se deberá hacer click en cesto de residuos que figura en la parte superior derecha, y se confirma.

+ _Lectura de documentos en una colección_: Debe abrirse la colección, en la que puede escrolearse y observar visualmente su composición si efectuar ningún comando.
