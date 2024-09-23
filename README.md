<p style="text-align: center;">
    <img alt="Logo MongoDB GIF" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/mongo_db.gif">
</p>

## { Proyecto MongoDB: Implementación de la BD CV_Jesica_Basile }

Se diseñó una base de datos no relacional que contiene el [curriculum vitae](CV-MongoDB.pdf) de la autora hasta la fecha, la cual se ejecuta exitosamente en el motor de MongoDB. El código fue adaptado para interactuar con la base de datos y hacer correr comandos utilizandos con MongoDB Shell en combinación con JavaScript.

El proceso de ejecución se automatizó mediante la creación de los archivos `Makefile`, `.env`, `docker-compose.yml` y `mongo_wait.sh`, los cuales forman parte de un sistema de automatización y configuración utilizado para el desarrollo y despliegue de la base de datos en el espacio Codespace de GitHub. Este sistema permite la creación de la base de datos junto a sus colecciones, la inserción de datos, así como la realización de pruebas, respaldos y exportación de las colecciones.

Asimismo, se diseñó en el presente README un "paso a paso" sobre el manejo de MongoDB, Mongo Compass, Mongo Shell y Mongo Atlas especificando su utilidad, beneficios y comandos.

## { Comandos para hacer correr el código en Codespace Github: con bash }

Al ingresar en la sección codespaces y en la terminal, utilizar los comandos:

+ `make` si da un error en la conexion al socket, volver al correr el comando.
+ `make test-db` para observar la cantidad de documentos en cada colección.
+ `make test-collections` muestra los datos que posee cada documento de cada colección.
+ `make access-db` para acceder a la base de datos.
+ `make backup` para realizar un backup de la base de datos, dentro de una carpeta denominada "dump".
+ `make export` para efectuar la exportación de todas las colecciones en distintos archivos tipo .json, dentro de una carpeta denominada "export".
+ `make clean-db` limpiar la base de datos.
+ `make down` está diseñado para detener el servicio de MongoDB y eliminar los contenedores relacionados usando docker-compose, elimina los contenedores pero no los volúmenes de datos a menos que se especifique, por lo que es seguro usarlo para detener el entorno sin perder datos almacenados en volúmenes.

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
[MongoAtlas](https://www.mongodb.com/es/lp/cloud/atlas/try4?utm_source=google&utm_campaign=search_gs_pl_evergreen_atlas_core_retarget-brand_gic-null_amers-all_ps-all_desktop_eng_lead&utm_term=mongo%20atlas&utm_medium=cpc_paid_search&utm_ad=p&utm_ad_campaign_id=14412646314&adgroup=131761122132&cq_cmp=14412646314&gad_source=1&gclid=CjwKCAjwodC2BhAHEiwAE67hJDRfjxYun1nUkhWok21s13G5QVpJ9HkoLSYmb_tT6p_lxIFeXE1SuhoCBHMQAvD_BwE?utm_source=google&utm_campaign=search_gs_pl_evergreen_atlas_core_retarget-brand_gic-null_amers-all_ps-all_desktop_eng_lead&utm_term=mongo%20atlas&utm_medium=cpc_paid_search&utm_ad=p&utm_ad_campaign_id=14412646314&adgroup=131761122132&cq_cmp=14412646314&gad_source=1&gclid=CjwKCAjwodC2BhAHEiwAE67hJDRfjxYun1nUkhWok21s13G5QVpJ9HkoLSYmb_tT6p_lxIFeXE1SuhoCBHMQAvD_BwE)

<img align="right" alt="Mundo girando" width="300" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/mundo_girando.gif">

Una de las características más interesantes de MongoDB Altas es su capacidad de gestionar y visualizar datos geoespaciales a través del schema. Esto permite representar ubicaciones geográficas y distribuciones espaciales de manera intuitiva. La plataforma facilita la creación de índices geoespaciales, que optimizan las consultas sobre datos de ubicación y permiten realizar búsquedas de proximidad o encontrar puntos dentro de áreas específicas.
Atlas no solo simplifica la administración de datos geoespaciales, sino que también proporciona herramientas visuales para representar estos datos en mapas interactivos. Puede observarse cómo se distribuyen las ubicaciones en un mapa, identificar patrones espaciales y tomar decisiones basadas en la visualización geográfica.
La integración de estas capacidades en MongoDB Atlas convierte a la plataforma en una solución ideal para aplicaciones que requieren análisis y representación geoespacial, desde la distribución geográfica de algo en particular o hasta la planificación logística.

_Implementación:_ Para poder operar en la nube se requerirá ingresar en la página oficinal de para registrar una cuenta. Inicialmente, se deberán responder las preguntas sobre el objetivo para su uso, el tiempo que se lleva utilizando la herramienta, etc. Luego se procederá a crear un ***CLUSTER***, para lo cual será recomendable seleccionar el servicio gratuito de `M0 Free`, y posteriormente elegir un nombre al cluster que luego _NO PODRÁ SER MODIFICADO_ , y en caso de querer cambiarlo no será posible, habrá que generar un cluster nuevo. A su vez, en mi caso particular permití la opción ***"Preload sample dataset"*** que proporciona datos de ejemplo para la familiarización con la aplicación. En caso que por cuestiones de espacio no se desee conservarlos, deberán ser eliminados manualmente. Para poder continuar, se debe elegir la ubicación, pero como Argentina no se encuentra dentro de las opciones predeterminadas, por cuestiones de latencia y cercanía se recomienda seleccionar `N. Virginia (us-east-1)` y el proveedor, que en este caso se seleccionó `AWS`. Una vez completados todos los pasos previos, se ***CREA EL USUARIO DE BASE DE DATOS*** , todo a través del siguiente botón de acción:

![Botón Create](https://github.com/JessBasile/MongoDB/raw/main/imagenes/create.png)

Finalmente, se debe elegir un metodo de conexión sobre el cual será recomendable seleccionar la opción "_Conductores_". Luego se procederá a configurar esa conexión a través de línea de comando cmd, tipeando inicialmente:
```sql
mongosh "mongodb+srv://JessBasile:contraseña@reportcluster.f0vgx.mongodb.net/?retryWrites=true&w=majority"
```
`Aclaración:`En este caso todavía no se hace a través de Node.js debido a que no se instaló el software en el ordenador.

La respuesta es exitosa cuando proporciona el log ID, las credenciales de conexión y las versiones de MongoDB y Mongosh. Luego puede "testearse" esa conexión exitosa utilizando los comandos:
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

A continuación se muestra la base de datos citibike con documentos que incluyen campos de geolocalización, y a través del schema pueden visualizarse el mapa y sus puntos de ubicación. Para acceder a ella desde MongoAtlas previamente se utilizó la URI que se detalla a continuación efectuando su conexión a través de MongoDB Compass:
```sql
mongosh "mongodb+srv://m001-student:m001-mongodb-basics@cluster0-jxeqq.mongodb.net/test?authMechanism=DEFAULT"
```

<img src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/MongoDB-Atlas-Geolocalizacion.gif" alt="MongoAtlas-Mapa">

## { Consideraciones importantes en MongoDB }

+ Una colección es un conjunto de documentos, similar a una tabla en una base de datos relacional.
+ Un documento es un registro individual en una colección, similar a una fila en una tabla relacional.
Por consiguiente, una colección puede contener muchos documentos. Cada documento puede tener una estructura diferente, aunque generalmente se sigue una estructura común dentro de una colección para mantener la coherencia de los datos.
+ Siempre que se inserten datos en un documentos, MongoDB asignará un ObjetcId.

## { Primeros comandos en MongoDB Shell }

El primer comando en MongoDB Shell que se suele utilizar es `db.help` que proporciona información sobre las funciones básicas que se pueden utilizar dentro de la base de datos en la que se encuentra posicionado a la hora de ejecutar el comando.

Con `show dbs` o `show databases` se pueden observar todas las bases de datos que posee el motor de Mongo en el momento de la consulta. Otra alternativa que proporciona un detalle con mayor información en un formato de estructura json es: `db.adminCommand({listDatabases: 1})`

Para ubicarse dentro de una base de datos específica en MongoDB Shell se realiza utilizando el comando `use nombre_base_de_datos` y aparecerá en terminal Shell el nombre de la base.
En caso de ubicarnos dentro de una base de datos y desconocer de cuál se trata, puede utilizarse el comando `db` y proporcionará la información del nombre de la base de datos en la que estamos posicionados.

El comando `db.stats()` muestra una estadística de la base de datos en la que nos encontramos alojados, la cantidad de colecciones, los tipos de datos, cantidad de objetos, índices, tamaño, etc.

El comando `db.dropdatabase()` borra defintivamente una base de datos en específico (en la que me encuentre alojado al momento de ejecutar el comando). También es posible dropear una colección que el comando de MongoDB Shell es: `db.collectionName.drop()`, cuando la respuestas es “true” significa que se borró exitosamente.

Para ver las colecciones que conforman la BD se ejecuta el comando `show collections`.

Si se desea renombrar una colección en particular sobre una base de datos determinadas el comando que se utiliza es: `db["my collection"].renameCollection("myNewCollection")` otra alternativa es: `db.myCollection.renameCollection("myNewCollection")` siempre y cuando el nombre de la colección no tenga espacios, lo cual no es recomendable.

## { Tipos de datos en MongoDB }


| Tipo de Dato              | Utilidad                                                      | Ejemplo de Uso                          | Comentario                                                                 |
|---------------------------|---------------------------------------------------------------|-----------------------------------------|---------------------------------------------------------------------------|
| **_id**                   | Identificador único por documento.                            | `"_id": ObjectId("507f191e810c19729de860ea")` | Cada documento debe tener un campo `_id`. Puede ser generado automáticamente o definido manualmente. |
| **String**                | Almacena texto o cadenas de caracteres.                        | `"nombre": "Jesica Basile"`             | Siempre se encierra entre comillas dobles.                                 |
| **Number**                | Almacena valores numéricos, ya sean enteros o decimales.       | `"edad": 30`                            | Puede ser `int`, `long`, `double`, dependiendo del valor numérico.         |
| **Float**                 | Almacena números de punto flotante (decimales).                | `"precio": 19.99`                       | Usado para cálculos que requieren números decimales.                       |
| **Int**                   | Almacena valores numéricos enteros.                            | `"cantidad": 100`                       | Útil cuando se trabaja con números sin decimales.                          |
| **Boolean**               | Almacena valores de verdad (true/false).                       | `"es_activo": true`                     | Representa banderas lógicas, como estados o condiciones.                   |
| **Array**                 | Almacena listas de elementos, que pueden ser de cualquier tipo.| `"cursos": ["MongoDB", "SQL", "Excel"]` | Útil para almacenar conjuntos de datos relacionados.                       |
| **Object**                | Almacena documentos incrustados, es decir, objetos anidados.   | `"direccion": {"ciudad": "Buenos Aires", "pais": "Argentina"}` | Se usa para modelar estructuras más complejas en un solo campo.            |
| **ObjectId**              | Almacena un identificador único para cada documento.           | `"id": ObjectId("507f191e810c19729de860ea")` | MongoDB genera automáticamente un `ObjectId` único por defecto.            |
| **Date**                  | Almacena fechas en un formato de tiempo (timestamp).           | `"fecha_creacion": ISODate("2022-09-18T10:00:00Z")` | Útil para almacenar fechas y horas con precisión en formato ISO 8601.      |
| **ISODate**               | Variante específica del tipo `Date`, en formato ISO 8601.      | `"fecha_nacimiento": ISODate("1990-12-01T00:00:00Z")` | Se usa para manejar fechas estandarizadas internacionalmente.              |
| **Null**                  | Representa un valor nulo o inexistente.                        | `"observaciones": null`                 | Se usa cuando un campo no tiene valor asignado.                            |
| **Binary Data**           | Almacena datos binarios, como imágenes o archivos.             | `"archivo": BinData(0, "aGVsbG8gd29ybGQ=")` | Ideal para almacenar contenido binario como imágenes, videos, etc.         |
| **Decimal128**            | Almacena números de punto flotante de alta precisión.          | `"precio": NumberDecimal("19.99")`      | Útil para cálculos financieros donde la precisión es crítica.              |
| **Regular Expression**    | Almacena expresiones regulares para búsquedas avanzadas.       | `db.productos.find({nombre: {$regex: /camiseta/i}})` | Útil para buscar patrones en cadenas de texto.                             |
| **Geolocalización/GeoJSON** | Almacena datos de ubicación geográfica en formato GeoJSON.    | `"ubicacion": {"type": "Point", "coordinates": [-69.8983, 18.4725]}` | Se utiliza para almacenar coordenadas geográficas (latitud/longitud).      |
| **Timestamp**             | Almacena valores de tiempo con una resolución mayor que `Date`.| `"registro": Timestamp(1630001234, 1)`  | Usado internamente por MongoDB para operaciones de replicación.            |
| **MinKey**                | Valor especial para comparar valores menores que cualquier otro.| `"clave_min": MinKey()`                | Usado en operaciones de ordenación.                                        |
| **MaxKey**                | Valor especial para comparar valores mayores que cualquier otro.| `"clave_max": MaxKey()`                | Usado en operaciones de ordenación.                                        |

`Aclaración Importante:` En el caso del ObejectId, se trata de una cadena hexadecimal de 12 bytes, que contienen información sobre la fecha de creación del documento (4 bytes), el identificador del servidor (5 bytes) y un contrador incremental (3 bytes). Se genera automáticamente si no se especifica un valor _id. En caso de determinar al momento de insertar los datos el _id, MongoDB respetará la estructura y podrá tratarse de cualquier tipo de dato, como un número, una cadena de texto, o incluso un valor personalizado.

`Bonus Track:` A continuación se adjunta una captura con el listado completo que en la actualidad muestra MondoDB Compass, cuando se accede al modo "edición" (click en el lápiz de un dato del documento), donde posteriormente permite desplegar todos los tipos de datos posbibles por lo que se puede cambiar.

<img src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/tipos_de_datosmdb.png" alt="Tipos-dato-MongoDB">

## { Tipos de dato MongoDB vs Tipos de dato SQL } 

| Tipo de Dato en MongoDB    | Equivalente en SQL      | Descripción                                                 |
|----------------------------|------------------------|-------------------------------------------------------------|
| **String**                 | VARCHAR, TEXT           | Almacena cadenas de texto.                                   |
| **Number**                 | INT, BIGINT, FLOAT      | Almacena números enteros o decimales.                        |
| **Double**                 | DOUBLE, FLOAT           | Almacena números de punto flotante.                          |
| **Int32**                  | INT                    | Almacena enteros de 32 bits.                                 |
| **Int64**                  | BIGINT                 | Almacena enteros de 64 bits.                                 |
| **Boolean**                | BOOLEAN                | Almacena valores de verdad (`true` o `false`).               |
| **Date**                   | DATE, DATETIME          | Almacena fechas y horas.                                     |
| **Array**                  | No equivalente directo | Almacena listas de valores, similar a una tabla de valores.  |
| **Object**                 | No equivalente directo | Almacena documentos anidados (similar a JSON en SQL).        |
| **ObjectId**               | PRIMARY KEY (AUTO_INCREMENT) | Almacena identificadores únicos, generados automáticamente. |
| **Binary Data**            | BLOB, BYTEA             | Almacena datos binarios, como imágenes o archivos.           |
| **Decimal128**             | DECIMAL, NUMERIC        | Almacena números decimales de alta precisión.                |
| **Null**                   | NULL                   | Representa un valor nulo o no asignado.                      |
| **Timestamp**              | TIMESTAMP               | Almacena un valor de tiempo con precisión adicional.         |
| **Regular Expression**     | No equivalente directo  | Almacena patrones para búsquedas textuales avanzadas.        |
| **Geolocalización/GeoJSON**| No equivalente directo  | Almacena coordenadas geográficas en formato GeoJSON.         |

## { Operaciones CRUD dentro de MongoDB Shell }

+ _Creación de base de datos y colecciónes_: En el caso de MongoDB no se crea una base de datos sola, su incorporación se concreta cuando se crea al menos una colección. Para ello, primero se indica el uso de la base de datos con el nombre que se le desea asignar (aunque no exista), y posteriormente, al crear una colección, el motor incorpora ambas en simultáneo: la base de datos y dentro su colección, ejemplo de su implementación:
```sql
use nombre_base_de_datos                  //comando para indicar el nombre de la base de datos
db.createCollection("nombre_coleccion")   //creación de una colección, previamente situados en la base de datos
```

+ _Inserción manual de un documento individual_: Es utilizado para insertar documentos en la colección indicada.
```sql
db.mycoleccion.insertOne({"nombre": "Juan","edad": 32,"activo":true,"fecha": ISODate("2024-08-26T19:49:25.197Z")})
```
La típica respuesta exitosa seria: 
```sql
{"acknowledged" : true,
  "insertedId" : ObjectId("64f5b2a8e1234567890abcdef")}
```
La cual indica el N° de ObjectId generado. 

+ _Inserción manual de múltiples documentos_: 
```sql
db.mycoleccion.insertMany([{nombre:"Juan", edad: 31,activo:true},{nombre:"Sofia",edad:24},{nombre:"Luis"},{ _id: 1,nombre:"Lusy",edad:50}])
```
En ese caso los corchetes `[]` indican que se trabaja con un arreglo de documentos, y las llaves `{}` delimitan los elementos de objeto json.  Para corroborar si la actualización en compass es lo mismo que en Shell se puede ejecutar el comando: 
```sql
db.mycoleccion.find().pretty() //que muestra todos los documentos de una colección
```
En ese ejemplo la base de datos es "educacionit", su colección "mycoleccion" y sus documentos son "Juan", "Sofía", "Luis", etc. con sus correspondientes claves/valor. En el último registro incorporado, se asigna un _id determinado, por lo tanto, todos los registros anteriores tendrán ObjectId y Lusy será la única con un _id diferente Nº 1.

+ _Lectura de documentos en una colección_: En MongoDB no existe SELECT como en SQL, sino `find` que sirve para consultar los documentos que componen una colección, ejemplo de su utilización:
```sql
db.mycoleccion.find()
```
+ _Lectura con condiciones y comentarios_: El operador `$comment` se utiliza para agregar comentarios a una consulta en MongoDB que no afecta los resultados de la misma. Se suele utilizar para luego rastrear las consultas efectuadas y su finalidad (auditoria).
```sql
db.mycoleccion.find({“nombre”:”Juan”}, $comment: “Buscar documentos con el nombre “Juan”})
```

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

`Importante:` En caso de colocar el filtro y ***utilizar solo las llaves sin ninguna clave `{}` se modificarán todas las claves y valores de todos los documentos, y si ese valor no existe en un documento lo incorporará.***

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

## { Operaciones CRUD desde MondoDB Compass }

+ _Creación de base de datos y colecciones_: Desde MongoDB Compass se puede efectuar la creación de una base de datos en la opción `Create Database` especificando el nombre de la base de datos y de la colección, y confirmando la misma. Una vez creada la base de datos con una o más colecciones, se puede agregar nuevas haciendo click sobre la base de datos, y seleccionando la opción `Create Collection` y especificando el nombre de la nueva colección.

+ _Inserción de un documento json_: Se posiciona sobre la colección y se selecciona la opción `ADD DATA` ---> `Insert document` incorporará automáticamente el ObjectId y se debe agregar luego de la llave } las claves y valores.

+ _Lectura de documentos en una colección_: Debe abrirse la colección, en la que puede escrolearse y observar visualmente su composición si efectuar ningún comando. Asimismo, en la parte superior derecha existe un bontón `find` que permite aplicar determinados criterios para consultar documentos.

+ _Modificación/Actualización individual de un solo documento_: Se debe posicionar sobre el documento a modificar, se da click sobre el lapiz, y se activa el modo edición habilitándose en la derecha la información de los tipos de datos. Se puede posicionar directo sobre el valor que se desea modificar, se borra y reemplaza por el dato que se requiere, siempre concluyendo la operación clickeando en `Update` a la derecha inferior.

+ _Eliminación de un registro_: Sobre el documento que se desea elimninar, se deberá hacer click en cesto de residuos que figura en la parte superior derecha, y se confirma.

## { Importación en MongoDB }

En el caso de MongoDB la importación puede efectuarse desde interface de Mongo Compass o desde terminal cmd. No existe alternativa desde MongoDB Shell.

+ _Caso Especial: Importación desde línea de comandos para archivos csv_ : Este tipo de operaciones deben efectuarse desde terminal de Windows `cmd`, dado que MongoShell no la admite, y el comando utilizado para tal fin es:
```sql
mongoimport --uri "mongodb://localhost:27017/mi_base" --collection clientes --type csv --headerline --file "C:\ruta\clientes.csv"
```
+ _Importación desde interface MongoDB Compass_: Se debe posicionar sobre la colección, y dar click en `Import`, luego seleccionar el archivo tipo json y se efectua automáticamente a través de interface, sin intervención de compandos.

+ _Importación de un documento csv desde interface MongoDB Compass_: Opera igual que el caso de json, se deberán posicionar sobre la colección que se desea importar datos, se da click en `Import`, se pueden moficar los tipos de datos, y efectuar la importación.

## Implementación de Javascript en interacción con MongoSH

<img align="right" alt="Logo Javascript" width="250" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/JS-Logo.png">

Se decide operar con Visual Studio Code desde terminal para Javascript y se conecta a MongoDB Shell con el comando  `mongosh`. Desde la terminal de Mongo Shell también pueden ejecutarse comandos de Javascript dado que es interprete de ese lenguaje de programación.
La sección de Visual Studio Code a través de la cual se accede a la terminal, se detalla en la imagen a continuación:

<img src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/terminalVisual.png" alt="TerminalVisual">

---
***Salida de datos en un script de shell MongoDB***

Para efectuar la salida de datos a través de la terminal, será importante utilizar en el archivo .js el comando `print("Hola Mundo JS-Mongo")` que permitirá leer en la terminal cuando se utilice el comando
```sql
load ("nombre_archivo")
```
Lo cual arrojará la leyenda "Hola Mundo JS-Mongo" (sin las comillas).

---
***Definición de Variables***

Partiendo del supuesto que se cuenta con la siguiente linea de código en el archivo .js print, la cual NO es una variable, puede 
asignarse una variable con otro texto, un ejemplo a continuación:
```sql
print("Hola mundo JS-Mongo")  // NO es una variable
mivariable = "Otro hola mundo"
print(mivariable)
```
Cuya respuesta serán ambos textos en renglores diferentes, pero los diferencia es que uno fué creado a través de una lectura y otro desde una variable que luego se leerán consecutivamente.

Pueden sumarse variables para arrojar un valor compuesto, donde el símbolo `+` concatena las variables de tipo texto (string), ejemplificado a continuación:
```sql
var minuevotexto = "es un texto nuevo"
var mastexto = "esto es otro texto de prueba"
var resultado = minuevotexto + mastexto
print(resultado)
```
Respuesta:
```sql
es un texto nuevo esto es otro texto de prueba 
true
```
`Particularidad:`En el caso de la concatenación de números será más recomendable el comando `.concat`, se ejemplificará más adelante.
Si la concatenación con el signo `+` se efectúa ente número y strings, el comportamiento se modifica, como se observa a continuación:
```sql
print(3 + "1")
print(3 - "1")
```
Respuesta:
```sql
31
2
```
Donde en el caso de un número que se concatena con un texto (string) se une los valores, pero en el caso de la resta no aplica y realiza la operación aritmética.

---
## Objetos utilizados en JavaScript

***Arreglos***
Los arreglos son un conjunto de datos que se generan bajo una determinadas estructura. Si bien, los arreglo permiten la combinación de distintos tipos de datos, NO es lo recomendable.
```sql
var miarreglo = ["uno","dos","tres"]
print(miarreglo)
```
Respuesta
```sql
[ 'uno', 'dos', 'tres' ]
```
`Importante:` En el caso de desear imprimir solo un valor del arreglo deberá indicarse su número, tomando como 0 el valor de la primera clave:
```sql
var miarreglo = ["uno","dos","tres"]
print(miarreglo[1])
```
Respuesta
```sql
dos
```
