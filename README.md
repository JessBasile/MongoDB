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

## { Índice }

1. [{ Instalación de MongoDB, Mongo Compass y MongoSH }](#-instalación-de-mongodb-mongo-compass-y-mongosh-)
2. [{ Implementación de MongoDB Atlas }](#-implementación-de-mongodb-atlas-)
3. [{ Consideraciones importantes en MongoDB }](#-consideraciones-importantes-en-mongodb-)
4. [{ Primeros comandos en MongoDB Shell }](#-primeros-comandos-en-mongodb-shell-)
5. [{ Tipos de datos en MongoDB }](#-tipos-de-datos-en-mongodb-)
6. [{ Tipos de dato MongoDB vs Tipos de dato SQL }](#-tipos-de-dato-mongodb-vs-tipos-de-dato-sql-)
7. [{ Operaciones CRUD dentro de MongoDB Shell }](#-operaciones-crud-dentro-de-mongodb-shell-)
8. { Operaciones CRUD desde MondoDB Compass }
9. { Importación en MongoDB }
10. { Comandos para manipular consultas en MongoDB }
11. { Operadores de filtrado, comparación o lógicos }
12. { Implementación de Javascript en interacción con MongoSH }
13. { Objetos y métodos utilizados en JavaScript }
14. { Propiedades de objetos en Javascript }
15. { Operadores utilizados en JavaScript }
16. { Sentencias }
17. { Combinación de MongoDB con Javascript }

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
+ Siempre que se inserten datos en un documentos, MongoDB asignará un ObjetcId, es decir, que ***siempre habrá claves primarias***.

| Concepto SQL       | Concepto MongoDB  |
|--------------------|-------------------|
| Base de datos      | Base de datos      |
| Tabla              | Colección          |
| Fila               | Documento          |
| Columna            | Campo              |
| Índice             | Índice             |

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

MongoDB, al ser una base de datos NoSQL, maneja una estructura de datos flexible donde almacena la información. Esto permite trabajar con una amplia variedad de tipos de datos que se adaptan a diferentes necesidades. Los mismos se resumen en una [Tabla](imagenes/tipodatoMD.png)

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
| **ObjectId**               | PRIMARY KEY (AUTO_INCREMENT) | Almacena id únicos, generados automáticamente. |
| **Binary Data**            | BLOB, BYTEA             | Almacena datos binarios, como imágenes o archivos.           |
| **Decimal128**             | DECIMAL, NUMERIC        | Almacena números decimales de alta precisión.                |
| **Null**                   | NULL                   | Representa un valor nulo o no asignado.                      |
| **Timestamp**              | TIMESTAMP               | Almacena un valor de tiempo con precisión.         |
| **Regular Expression**     | No equivalente directo  | Almacena patrones para búsquedas avanzadas.        |
| **Geolocalización/GeoJSON**| No equivalente directo  | Almacena coordenadas geográficas GeoJSON.         |

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

+ _Reemplazo de un documento_: Se utiliza para reemplazar un documento o registro completo por otro distinto. La operación reemplaza todo el contenido del documento o registro que coincida con una condición establecida, y ***mantendrá el mismo Nº de _id que ese documento tenía previo al cambio***, por lo tanto no se ven afectados los índices de la colección. Solo existe el comando `replaceOne` dentro de MongoDB, si se pretenden efectuar reemplazos masivos, deberá recurrirse al apoyo de Javascript. A continuación, ejemplo de un reemplazo: 
```sql 
db.mycoleccion.replaceOne({nombre:"Juan"}, {nombre: "Jesy",edad: 36,ocupacion:"Contadora"})  //reemplaza los nuevos datos de Jesy en el documento Juan
```

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
  
+ _Lectura de documentos con determinados criterios_: Se recurre en el margen superior derecho a `Options` y se escribe la instrucción: {year:2014} y luego click en ----> `Find` es mucho más sintético el comando respecto MongoDB Shell, y se repite la utilización de los otros comandos como: {year:{$gt:2014}}

<img src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/findCompass.png" alt="FindCompass">

+ _Lectura con proyección de campos específicos en los documentos_: Al igual que en caso de MongoDB Shell, se puede efectuar en Compass a través de `Options` y luego, `Project` indicando específicamente los campos a visualizar, y luego confirmando con ---- > `Find`

<img src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/project.png" alt="Project">

`Información Adicional:` Podrán utilizarse Options con filtros y además projects para limitar los campos de los resultados en las consultas de los documentos.
En el caso del sort, se puede aplicar una proyección con los valores 1 y -1.

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

## { Comandos para manipular consultas en MongoDB }

+ ***LIMIT:*** Comando utilizado para que la consulta solo devuelva una determinada cantidad de valores especificados previamente.
```sql
db.collection.find({}).limit(5); // Devuelve solo los primeros 5 documentos.
```

+ ***SKIP:*** Se implementa junto al limit, y efectua un desplazamiento de cierta cantidad de registros. Se suele utilizar en las páginas web para mostrar una cantidad limitada de artículos, y dar posibilidad al usuario, que continúe mirando los siguientes.
```sql
db.pelis.find().sort({ year: -1 }).skip(5).limit(5) // Omite los primeros 5 documentos, ordena los resultados edad descendente y devuelve solo 5 documentos.
```

+ ***SORT:*** Es un comando que se suele utilizar en conjunto al limit, cuya función es ordenar los resultados de forma ascendente:1 y descendente:-1.
```sql
db.pelis.find().sort({ year: -1 }).limit(5) // Ordena los resultados por el campo "age" de forma ascendente y solo trae 5 documentos.
```

+ ***GROUP:*** El comando $group permite agrupar documentos por un campo específico y realizar operaciones agregadas en esos grupos.
```sql
db.productos.aggregate([{$group: { _id: "$categoria"  // Agrupa por el campo 'categoria'}}])
```

+ ****PROJECT:*** Lectura con proyección de campos específicos en los documentos: Para este tipo de consultas se utiliza el comando $project un framework de agregación de MongoDB para seleccionar, transformar, o proyectar campos específicos de los documentos que se están leyendo de una colección. Aunque project no es un operador de consulta directa, se usa en pipelines de agregación para definir los campos que se deben incluir o excluir en los resultados cuando se leen datos, un ejemplo a continuación:
```sql 
db.mycoleccion.aggregate([{$project: {nombre: 1, edad: 1, _id: 0}}]) //el N° 1 indica los campos que se desean visualizar y el 0 para excluir el _id que por default siempre aparece en la consulta.
```
`Información Adicional:` Podrán utilizarse filtros y además projects para limitar los campos de los resultados en las consultas de los documentos.

+ ***AGGREGATE:*** Es utilizado para realizar operaciones avanzadas de procesamiento de datos a través del pipeline de agregación. Varios operadores y comandos solo pueden usarse dentro del contexto de un pipeline de agregación, tales como: `$match` (el where en SQL), `$group` (group by en SQL), `$project` (un SELECT que realiza transformaciones), `$sort` (order by en SQL), `$limit` (establece un límite en la cantidad de valores que devuelve, acorde a lo especificado previamente), `$skip` (OFFSET en SQL), `$lookup` (left join en SQL).
Ejemplo simple de aggregate a continuación:
```sql
db.collection.aggregate([{ $match: { status: "active" } },          // Etapa 1: Filtrar documentos con $match (equivalente a WHERE)
{ $group: { _id: "$category", total: { $sum: "$amount" } } },  // Etapa 2: Agrupar por "category" y sumar los "amount"
{ $sort: { total: -1 } },                  // Etapa 3: Ordenar los resultados por "total" en orden descendente
{ $limit: 5 }]);                          // Etapa 4: Limitar a los 5 resultados principales
```

+ ***LOOKUP:*** Dentro de MongoDB existe la posibilidad de realizar un LEFT JOIN mediante la utilización del comando $lookup, aunque vuelve la base de datos relacional dentro de MongoDB, un ejemplo a continuación:
```sql 
db.clientes.aggregate([{
    $lookup: {
      from: "facturas",        // Colección con la que deseas hacer el "join"
      localField: "_id",       // Campo en la colección "clientes" (clave primaria)
      foreignField: "id_cliente", // Campo en la colección "facturas" (clave externa)
      as: "facturas"           // Alias donde se almacenarán las facturas relacionadas
    }}])
```

## { Operadores de filtrado, comparación o lógicos } 

Existe distintos tipos de operadores que sirven para efectuar filtrados, actualizaciones, etc. A continuación se expone un cuadro que especifica las principales, y luego aplicación de c/u de ellas en ejemplos concretos:

| **Operador** | **Tipo**        | **Descripción**                                       |
|--------------|-----------------|-------------------------------------------------------|
| `$eq`        | Comparación     | Compara si un valor es igual a otro.                  |
| `$ne`        | Comparación     | Compara si un valor **no** es igual a otro.           |
| `$gt`        | Comparación     | Verifica si un valor es **mayor que** otro.           |
| `$gte`       | Comparación     | Verifica si un valor es **mayor o igual que** otro.   |
| `$lt`        | Comparación     | Verifica si un valor es **menor que** otro.           |
| `$lte`       | Comparación     | Verifica si un valor es **menor o igual que** otro.   |
| `$in`        | Comparación     | Verifica si un valor está **dentro de un conjunto**.  |
| `$nin`       | Comparación     | Verifica si un valor **no está** en un conjunto.      |
| `$exists`    | Elemento        | Verifica si un campo **existe** en el documento.      |
| `$type`      | Elemento        | Verifica el **tipo de dato** de un campo.             |
| `$all`       | Array           | Verifica si un array contiene **todos** los valores.  |
| `$size`      | Array           | Verifica el **tamaño** de un array.                   |
| `$and`       | Lógico          | Verifica si **todas** las condiciones son verdaderas. |
| `$or`        | Lógico          | Verifica si **alguna** de las condiciones es verdadera.|

La lectura de documentos con filtro, puede abordarse en el siguiente caso en el que se solicita ver el listado de documentos que contienen películas del año 2014:
```sql
db.pelis.find({year:2014})
```
En el caso que además desee saber el total de registros de películas que componen esa colección en el año 2014, se utiliza el comando:
```sql
db.pelis.find({year:2014}).count()
db.pelis.countDocuments({ year: 2014 })  //otra alternativa con un comando más moderno
```
Luego, pueden incorporarse operadores relacionales o de comparación en las consultas que permitan ser más específicas:
```sql 
db.pelis.find({ year: { $eq: 2014 } }).count()  //$eq compara si es igual – significa Equal
db.pelis.find({ year: { $ne: 2014 } }).count()  //$ne compara que no es igual al valor especificado – significa Not Equal
```
A continuación se especifican una variedad amplia de operadores de filtrado o comparación en ejemplos concretos:
```sql 
db.pelis.find({ year: { $gt: 2014 } }).count()  //$gt número de documentos con año mayor a 2014 – significa Greater Than
db.pelis.countDocuments({ year: { $gt: 2014 } }) //versión más moderna
db.pelis.find({ year: { $gte: 2014 } }).count()  //$gte número de documentos iguales o mayores al año 2014 – significa Greater Than or Equal
db.pelis.find({ year: { $lte: 2014 } }).count()  //$let número de documentos menores o igual al año 2014 – significa Less Than or Equal
db.pelis.countDocuments({ year: { $lte: 2014 } })  // versión más moderna
db.pelis.find({ year: { $lt: 2014 } }).count()  //$lt número de documentos menores al año 2014 – significa Less Than
db.pelis.find({ year: { $in: [2014, 2015, 2016] } })  //$in busca peliculas del año 2014/15/16 – significa In
db.pelis.find({ year: { $nin: [2014, 2015, 2016] } })  //$nin busca peliculas donde el año no sea 2014/15/16 – significa Not In
db.pelis.find({ year: { $exists: true } })  //$exists busca documentos donde el campo year existe – significa Exists
db.pelis.find({ year: { $type: "int" } })  //$type busca documentos donde el campo year es de tipo entero – significa Type
db.pelis.find({ year: { $all: [2014, 2015] } })  //$all busca documentos donde el array year contiene tanto 2014 como 2015 – significa All
db.pelis.find({ "year": { $size: 1 } }) // $size busca documentos donde el array year tiene exactamente 1 elemento
db.pelis.find({$and: [{ year: { $gt: 2013 } },  // El año debe ser mayor que 2013
{ rating: { $gte: 8.0 } }]}) // El rating debe ser mayor o igual a 8.0 - busca ambas condiciones en simultáneo.
db.pelis.countDocuments({$or: [{ year: 2014 }, { year: 2015 }]})
```

## { Implementación de Javascript en interacción con MongoSH }

<img align="right" alt="Logo Javascript" width="250" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/JS-Logo.png">

Se decide operar con Visual Studio Code desde terminal para Javascript y se conecta a MongoDB Shell con el comando  `mongosh`. Desde la terminal de Mongo Shell también pueden ejecutarse comandos de Javascript dado que es interprete de ese lenguaje de programación.
La sección de Visual Studio Code a través de la cual se accede a la terminal, se detalla en la imagen a continuación:

<img src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/terminalVisual.png" alt="TerminalVisual">

---
***Salida de datos en un script de shell MongoDB***

Para efectuar la salida de datos a través de la terminal, será importante utilizar en el archivo .js el comando `print("Hola Mundo JS-Mongo")` de tipo string que permitirá leer en la terminal cuando se utilice el comando
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
_Respuesta:_
```sql
es un texto nuevo esto es otro texto de prueba 
true
```
`Particularidad:`En el caso de la concatenación de números será más recomendable el comando `.concat`, se ejemplificará más adelante.
Si la concatenación con el signo `+` se efectúa entre número y strings, el comportamiento se modifica, como se observa a continuación:
```sql
print(3 + "1")
print(3 - "1")
```
_Respuesta:_
```sql
31
2
```
Donde en el caso de un número que se concatena con un texto (string) se une los valores, pero en el caso de la resta no aplica y realiza la operación aritmética.

---
## { Objetos y métodos utilizados en JavaScript }

***Arreglos***

Los arreglos son un conjunto de datos que se generan bajo una determinadas estructura. Si bien, los arreglos permiten la combinación de distintos tipos de datos, NO es lo recomendable.
```sql
var miarreglo = ["uno","dos","tres"]
print(miarreglo)
```
_Respuesta:_
```sql
[ 'uno', 'dos', 'tres' ]
```
`Importante:` En el caso de desear imprimir solo un valor del arreglo deberá indicarse su número, tomando como 0 el valor de la primera clave:
```sql
var miarreglo = ["uno","dos","tres"]
print(miarreglo[1])
```
_Respuesta:_
```sql
dos
```
En el caso de una variable que posea un objeto y dentro del mismo un arreglo `[]` en el cual se desee hacer una impresión específica, se deberá elaborar la línea de código, dentro de la cual es especifica el valor que se desea obtener dentro del índice del arreglo:
```sql 
var obj = {"nombre":"Carlos", "ocupacion":["medico","musico","abogado"], "edad":"Desconocida"};
print(obj.nombre, obj.ocupacion[1]);
```
_Respuesta:_
```sql
Carlos músico
```

---
***Objeto Literal***

Se trata de un bojeto que contiene pares `clave-valor`. Estos pares permiten que almacenar múltiples valores dentro de un solo objeto, cada uno asociado a una clave. A continuación un ejemplo de su creación, su impresión general y específica sobre la edad:
```sql
var miObjeto = {"nombre":"Juan", "edad":33, "activo":true}
print(miObjeto)
print(miObjeto.edad)
```
_Respuesta_
```sql
{ nombre: 'Juan', edad: 33, activo: true }
33
```

---
***Formato JSON***

El siguiente comando muestra un objeto en formato json pero expantido y no en una sola línea (en relación a un entorno MongoDB):
```sql
printjson(miObjeto)
```
_Respuesta:_
```sql 
{
  nombre: 'Juan',
  edad: 33,
  activo: true
}
```
En cambio, el siguiente comando, devuelve la impresión pero en string, es decir, convierte el json en string:
```sql 
print(JSON.stringify(miObjeto))
```
_Respuesta:_
```sql
{"nombre":"Juan","edad":33,"activo":true}
```

---
***Funciones***

Son piezas de código que no se ejecutan de manera instantánea, si no que deben ser invocadas para poder ejecutarse. Se deben determinar parámetros de la función, a fin de poder realizar una operación en particular, y luego retornarla. En el caso de la base de datos de mi CV, se crearon funciones para determinar la cantidad de tiempo desde que obtuve mis certificaciones. En este ejemplo, el código `itera` sobre cada documento en la colección certificaciones de MongoDB utilizando el método find() combinado con forEach(), de ese modo, find recupera los documentos e itera con forEach() que recorre cada documento uno por uno. En síntesis, el código itera sobre los documentos de la colección certificaciones utilizando la función creada (calcularTiempoDesdeCertificacion):
```sql
function calcularTiempoDesdeCertificacion(fecha_finalizacion) {const fechaFin = new Date(fecha_finalizacion);const fechaActual = new Date();let años = fechaActual.getFullYear() - fechaFin.getFullYear();let meses = fechaActual.getMonth() - fechaFin.getMonth();if (meses < 0) {años--;meses += 12;}return { años, meses };}

db.certificaciones.find().forEach(function(doc) {const { años, meses } = calcularTiempoDesdeCertificacion(doc.fecha_finalizacion);print(`Certificación: ${doc.titulo}, Años: ${años}, Meses: ${meses}`);});
```
_Respuesta:_
```sql
Certificación: Introduccion a MongoDB, Años: 0, Meses: 0
Certificación: SQL, Años: 0, Meses: 1
Certificación: Data Analytics, Años: 0, Meses: 6
Certificación: Curso de Excel Avanzado Superior, Años: 0, Meses: 10
Certificación: Mandataria del Automotor, Años: 9, Meses: 1
```
***Función Ternaria***

Existe una `función ternaria` (contiene operador ternario) que aplicada a la base de datos CV, puede usarse sobre las fechas que responden con tipo de dato string “Actualidad”, como por ejemplo:
```sql 
function TitulosEnCurso(fecha_finalizacion){return fecha_finalizacion === "Actualidad" ? "No Completado 100%" : "Finalizado"}
db.formacion_academica.find().forEach(function(doc) {const estado = TitulosEnCurso(doc.fecha_finalizacion);print(`Título: ${doc.titulo}, Estado: ${estado}`);});
```
_Respuesta:_
```sql
Título: Maestría en Dirección y Gestión de RRHH, Estado: No Completado 100%
Título: Contador Público, Estado: Finalizado
Título: Técnica Universitaria en Ciencias Económicas, Estado: Finalizado
Título: Técnico Superior en Administración de Empresas, Estado: Finalizado
```
***Función con concatenación sobre objeto string***

Se suele utilizar cuando se declaran variables con tipo de dato string, ejemplo:
```sql 
var nombre = "Jesi";
var apellido = "Basile";
var nombreCompleto = nombre.concat(" ", apellido);
print(nombreCompleto);
```
_Respuesta:_
```sql 
test> load ("1funciones.js") //llamado del archivo que contiene la función
Jesi Basile
true
```
***Función del comando indexOf***

En el caso de utilizar el comando indexOf, contará la posición en la que se encuentra la letra que indicamos dentro de la cadena de texto del string, ejemplo a continuación:
```sql 
var nombreyapellido = "Jesica Basile";
print(nombreyapellido.indexOf('i'));
```
_Respuesta:_
```sql 
test> load ("1funciones.js") //llamado del archivo que contiene la función
3
true
```
***Función del comando slice***

En el caso del comando slice, cortará una porción de texto acorde a las indicaciones especificadas, ejemplo:
```sql 
var nombreyapellido = "Jesica Basile";
print(nombreyapellido.slice(0 , 4));
```
_Respuesta:_
```sql
test> load ("1funciones.js") //llamado del archivo que contiene la función
Jesi
true
```
Existen muchas más funciones que pueden experimentarse, sobre las que no se efectuaron ejemplos en este repositorio.

---
***Array***

Se trata de un arreglo que representa una estructura de datos que permite almacenar múltiples valores en una sola variable. En JavaScript, los arrays son muy flexibles y se pueden usar para almacenar diferentes tipos de datos. Un ejemplo a continuación con un array que contiene índice:
```sql
var arr = new Array()
arr[0] = "Volkswagen"
arr[1] = "Toyota"
arr[2] = "Audi"
print(arr)
print(arr[0])
```
_Respuesta:_
```sql
test> load ("1funciones.js")  //llamado del archivo que contiene la función
[ 'Volkswagen', 'Toyota', 'Audi' ]
Volkswagen
true
```
***Método PUSH en Array***

Es un método del array que consiste en asignar un valor al parámetro determinado con el comando `.push`, y ese valor a su vez queda asociado al arreglo. La particularidad de este método es que NO ordena los valores (en este caso si los números estuvieran desordenados, los imprimiría textuales, incluso se trata de números enteros y no escritos en letras).
```sql
var arr2 = new Array()
arr2.push("uno")
arr2.push("dos")
arr2.push("tres")
print(arr2)
```
_Respuesta:_
```sql
test> load ("1funciones.js")  //Nombre del archivo que es cargado
[ 'uno', 'dos', 'tres' ]
true
```

---
***Listado de métodos en Javascript***

| **Método**       | **Descripción**                                                                 | **Tipo de Objeto**      |
|------------------|---------------------------------------------------------------------------------|-------------------------|
| `push()`         | Añade uno o más elementos al final de un array y devuelve la nueva longitud.     | Arrays                  |
| `pop()`          | Elimina el último elemento de un array y lo devuelve.                           | Arrays                  |
| `shift()`        | Elimina el primer elemento de un array y lo devuelve.                           | Arrays                  |
| `unshift()`      | Añade uno o más elementos al inicio de un array.                                | Arrays                  |
| `concat()`       | Combina dos o más arrays y devuelve un nuevo array.                             | Arrays, Strings         |
| `slice()`        | Devuelve una copia de una porción de un array en un nuevo array.                | Arrays, Strings         |
| `splice()`       | Añade, quita o reemplaza elementos en un array.                                 | Arrays                  |
| `indexOf()`      | Devuelve el índice de la primera ocurrencia de un valor en un array o string.   | Arrays, Strings         |
| `join()`         | Une todos los elementos de un array en una cadena de texto.                     | Arrays                  |
| `reverse()`      | Invierte el orden de los elementos de un array.                                 | Arrays                  |
| `sort()`         | Ordena los elementos de un array en su lugar.                                   | Arrays                  |
| `forEach()`      | Ejecuta una función para cada elemento de un array.                             | Arrays                  |
| `map()`          | Crea un nuevo array con los resultados de aplicar una función a cada elemento.  | Arrays                  |
| `filter()`       | Crea un nuevo array con todos los elementos que cumplen una condición.          | Arrays                  |
| `reduce()`       | Aplica una función a cada elemento del array para reducirlo a un solo valor.    | Arrays                  |
| `split()`        | Divide un string en un array de subcadenas, utilizando un separador.            | Strings                 |
| `trim()`         | Elimina los espacios en blanco de los extremos de un string.                    | Strings                 |
| `toUpperCase()`  | Convierte un string a mayúsculas.                                               | Strings                 |
| `toLowerCase()`  | Convierte un string a minúsculas.                                               | Strings                 |
| `charAt()`       | Devuelve el carácter en un índice específico de un string.                      | Strings                 |
| `replace()`      | Reemplaza un valor dentro de un string con otro valor.                          | Strings                 |
| `includes()`     | Devuelve `true` si un array o string contiene un valor específico.              | Arrays, Strings         |
| `toFixed()`      | Formatea un número con un número fijo de decimales.                             | Numbers                 |
| `toString()`     | Convierte un número en una cadena de texto.                                     | Numbers, Arrays         |
| `isNaN()`        | Determina si un valor no es un número.                                          | Numbers, Global          |
| `parseInt()`     | Convierte un string a un número entero.                                         | Global, Numbers          |
| `parseFloat()`   | Convierte un string a un número decimal.                                        | Global, Numbers          |

---
## { Propiedades de objetos en Javascript }

| **Propiedad**    | **Descripción**                                                                 | **Tipo de Objeto**      |
|------------------|---------------------------------------------------------------------------------|-------------------------|
| `length`         | Devuelve el número de elementos en un array o el número de caracteres en un string. | Arrays, Strings          |
| `constructor`    | Devuelve la función que creó la instancia del objeto.                           | Todos los objetos        |
| `__proto__`      | Hace referencia al prototipo del objeto.                                         | Todos los objetos        |
| `prototype`      | Permite agregar propiedades y métodos a un constructor de objetos.              | Funciones                |
| `name`           | Nombre de la función (solo aplicable a funciones).                              | Funciones                |
| `message`        | Contiene el mensaje de un error (propiedad de los objetos `Error`).             | Error                    |
| `stack`          | Contiene el stack trace de un error (propiedad de los objetos `Error`).         | Error                    |

## { Operadores utilizados en JavaScript }

***OPERADORES MATEMÁTICOS:***

Los operadores efectúan todos los tipos de operaciones matemáticas y permiten concatenar con el símbolo + o .concat a valores string, ejemplo:
```sql
x=6+5
print(x)
z=x-8
print(z)
a=z*2
print("resultado " + a)
w=a/3
print(w)
```
_Respuesta:_
```sql
test> load ("1Operadores.js")  //Nombre del archivo que es cargado
11
3 
resultado 6
2
true
```
---

***OPERADORES DE INCREMENTO Y DECREMENTO:***

En el caso de este tipo de operadores deberán colocarse dos veces el signo que pretende decrementar o incrementar, por ejemplo:
```sql
w = 7
print(++w)
print(w)
print(--w)
print(w--)  //imprime el valor de w que venía siendo 8 y luego lo resta, pero no lo muestra
print(w)  //ahora muestra el nuevo valor de w con la resta anterior incorporada
```
_Respuesta:_
```sql
test> load ("1Operadores.js")
8
8
7
7
6
true
```
---

***OPERADORES CON MÓDULOS***

Los módulos en los operadores sirven para obtener el resto de una división entre dos números. En lugar de devolver el resultado de la división (el cociente), el operador de módulo (%) devuelve lo que sobra después de dividir el número. Ejemplo práctico:
```sql
print("modulo")
print(11%2)
print(6%2)
print(17%3)
```
_Respuesta:_
```sql
test> load ("1Operadores.js")
modulo
1     
0
2
true
```
_Es un algoritmo que se suele utilizar para determinar si es par o impar el número._

---

***OPERADORES DE ASIGNACIÓN COMPUESTA:***

Es una combinación de operadores aritméticos (+, -, *, /, %)con operadores de asignación (el =). Los operadores aritméticos de asignación (o de asignación compuesta) son:  +=, -=, *=, /=, %=, **=, &=, |=, ^=, >>=, <<= .En programación son utilizados para asignar valores a las variables. El operador más común es el =, que asigna el valor de la derecha a la variable de la izquierda. En el siguiente ejemplo, también se utilizan 2 casos de operadores de incremente y decremento:
```sql
x = 5
x += 2 //=> x = x + 2 resultado 7
x -= 2 //=> x = x – 2 resultado 5
x *= 2 //=> x = x * 2 resultado 10
x /= 2 //=> x = x / 2 resultado 5
x %= 2 //=> x = x % 2 el resto es 1
x++ // x = x + 1 resultado 2
x-- // x = x – 1 resultado 1
t = 2
y = 2 * ((3 + x) - t) / 7 
print(y)
```
_Respuesta:_
```sql
test> load ("1Operadores.js")
0.5714285714285714
true
```
`Aclaración:` Existen prioridades de operaciones, y si dos operaciones tienen igual prioridad (como por ej. la multiplicación y la división), resuelve primero el de la izquierda. En el ejemplo ut supra, primero multiplica y divide.

---
***OPERADORES DE COMPARACIÓN:***

Son aquellos que efectúan una comparación y siempre devolverán la respuesta true o false, algunos ejemplos:
```sql
print("operadores comparacion")
x=3 // este es un caso de una asignación
print(x=="3")
print(x==="3") //compara no solo el dato, sino el tipo de dato
```
_Respuesta:_
```sql
test> load ("1Operadores.js")
operadores comparacion
true
false
true
```
En el siguiente caso:
```sql
y=5 //este es el caso de una asignación
print(y!="5") // el != significa distinto y es False, porque el valor es el mismo, aunque el tipo de dato sea diferente.
print(y!==5) // True, porque es el mismo valor y tipo de dato
print(y>=10)
print(y<=10)
```
_Respuesta:_
```sql
test> load ("1Operadores.js")
false
true 
false
true
true
```
---

***OPERADORES LÓGICOS:***

Se utilizan para combinar condiciones booleanas (que devuelven true o false), son && (representa and), || (“pipes” representa or) y ! (representa not). Estos operadores permiten realizar evaluaciones más complejas basadas en múltiples condiciones y cuentan con tablas de verdad, ejemplos a continuación:
```sql
print("Operadores logico")
y=5  //continuando ejemplo anterior

m = true
n = (y=="5")
l = m && n && (6 < 8)
print("result: " + l)
//TABLA DE VERDAD DEL OPERADOR AND 
// true = true && true
// false = true && false
// false = false && true
// false = false && false
print("Invertido "  + !l)

l = m || n || (6 < 8)
print("result: " + l) 
//TABLA DE VERDAD SOBRE EL OPERADOR OR
// true = true || true
// true = true || false
// true = false || true
// false = false || false
print("Invertido " + !l)
```
_Respuesta:_
```sql
test> load ("1Operadores.js")
Operadores logico
result: true     
Invertido false
result: true
Invertido false
true
```

## { Sentencias }

Son instrucciones que se ejecutan en el código. Pueden incluir operadores, pero no son lo mismo.

---

***“if” y “else if”***

Son estructuras de control que permiten ejecutar diferentes bloques de código en función de si una condición es verdadera o falsa. Ejemplo a continuación:
```sql
print("inicio del script")

x = 38
z= "A"
if(x==5){  //es falsa porque X es igual a 38
    print("Hola Mundo")
    print("condicion verdadera")
} else if(z != "A") {  //es falta porque z es igual a A
     print("Z no es A")
} else {  //es verdadera porque z es igual A
    print("Z es A")
    print("condicion falsa")
}
```
_Respuesta:_
```sql
test> load ("1Sentencias.js")
inicio del script
Z es A
condicion falsa
true
```
---

***"switch"***

Es una estructura de control que permite ejecutar diferentes bloques de código según el valor de una expresión. Es una alternativa al uso de múltiples sentencias if...else if, y se utiliza cuando se tienen varias posibles condiciones o casos a evaluar. Es útil cuando se necesita comparar una expresión con varios posibles valores y ejecutar diferentes bloques de código según el resultado. Ayuda a hacer el código más corto, limpio y legible cuando se tienen muchas condiciones. El siguiente ejemplo fue aplicado sobre la cantidad de días de todos los meses del año. Se ingresa el N° del mes en el valor x, e imprime la cantidad de días que corresponde a ese mes:
```sql
print("inicio del script")
x=7
switch(x){
    case 1:
    case 3:
    case 5:
    case 7:
    case 8:
    case 10:
    case 12:
        print("31")
        break
    case 2: 
        print("28")
        break
    case 4:
    case 6:
    case 9:
    case 11:
        print("30")
        break
    default:
        print("Valor incorrecto")
}
print("fin del script")
```
_Respuesta:_
```sql
test> load ("1Sentencias.js")
inicio del script
31
fin del script
true
```
---

***"while"***

Es una estructura de control en programación que se utiliza para crear bucles. Un bucle es una secuencia de instrucciones que se repiten hasta que se cumple una condición específica.
```sql
//Bucles
//while
var i = 1 //representa la inicialización o declaración
while(i < 10) { //representa la condición
    print("Iteracion " + i) //representa la actualización
    i++ //la actualización de esa variable, siempre debe estar para NO ser infinita
}
```
_Respuesta:_
```sql
test> load ("1Sentencias.js")
Iteracion 1
Iteracion 2
Iteracion 3
Iteracion 4
Iteracion 5
Iteracion 6
Iteracion 7
Iteracion 8
Iteracion 9
true
```
`Característica particular de este bloque:` se ejecuta cero o más veces (de 1 a n veces).

---

***"do while"***

`Característica particular del bloque:` se ejecuta al menos una vez (de 1 a n veces).
```sql
var i = 1
do {
    print("Iteracion " + i)
    i++
} while (i <= 10)
```
_Respuesta:_
```sql
test> load ("1Sentencias.js")
Iteracion 1
Iteracion 2
Iteracion 3
Iteracion 4
Iteracion 5
Iteracion 6
Iteracion 7
Iteracion 8
Iteracion 9
Iteracion 10
true
```
Pero si suponemos que a x le asignamos el valor 11, imprimirá “Iteracion 11”.

---
***"for"***

```sql
for(var i=1; i<=3; i++){
    for(var j=1; j<=10; j++){
        print(i + " X " + j + " = " + (i*j))
}
}
print("fin del script")
```
_Respuesta:_
```sql
test> load ("1Sentencias.js")
1 X 1 = 1
1 X 2 = 2
1 X 3 = 3
1 X 4 = 4
1 X 5 = 5
1 X 6 = 6
1 X 7 = 7
1 X 8 = 8
1 X 9 = 9
1 X 10 = 10
2 X 1 = 2
2 X 2 = 4
2 X 3 = 6
2 X 4 = 8
2 X 5 = 10
2 X 6 = 12
2 X 7 = 14
2 X 8 = 16
2 X 9 = 18
2 X 10 = 20
3 X 1 = 3
3 X 2 = 6
3 X 3 = 9
3 X 4 = 12
3 X 5 = 15
3 X 6 = 18
3 X 7 = 21
3 X 8 = 24
3 X 9 = 27
3 X 10 = 30
fin del script
true
```
La sentencia for también resulta útil utilizarse dentro de arreglos, como por ejemplo:
```sql
var autos = ["Ford", "Mercedes", "Fiat", "Chevrolet", "Ferrari", "Volvo", "Volkswagen"]
for(var i=3; i < autos.length; i++){ //variable pivot: i=3
    print(autos[i] + " vendido") //con el índice i se accede a cada elemento
}
```
_Respuesta:_
```sql
test> load ("1Sentencias.js")
Chevrolet vendido
Ferrari vendido  
Volvo vendido
Volkswagen vendido
true
```
---

***“for” con “if”***

```sql
var autos = ["Ford", "Mercedes", "Fiat", "Chevrolet", "Ferrari", "Volvo", "Volkswagen"]
for(var idx in autos){
    if(idx > 2)
        print(autos[idx] + " alquilado")  //el índice del elemento, se lo asigna a la variable [idx]
}
```
_Respuesta:_
```sql
test> load ("1Sentencias.js")
Chevrolet alquilado
Ferrari alquilado  
Volvo alquilado
Volkswagen alquilado
true
```
---

***“forEach”***

```sql 
var autos = ["Ford", "Mercedes", "Fiat", "Chevrolet", "Ferrari", "Volvo", "Volkswagen"]
autos.forEach(function(elemento){  //es una funcion anónima, porque no se le asigna un nombre
        print(elemento + " limpio")
})
```
_Respuesta:_
```sql
test> load ("1Sentencias.js")
Ford limpio    
Mercedes limpio
Fiat limpio
Chevrolet limpio
Ferrari limpio
Volvo limpio
Volkswagen limpio
true
```
---

## { Combinación de MongoDB con Javascript }

A continuación se detallan la creación de bases de datos con iteración de ambos motores. Script utilizado para tal fin:
```sql
db = db.getSiblingDB('base1');

for(i = 1; i <= 10; i++) {
    db.articulos.insertOne ( 
    { 
        _id: i, 
        nombre: 'nombre ' + i,
        stock: 100
    } 
  ) 
}
print("Se insertaron los 10 articulos")
```
_Respuesta:_
```sql
test> load ("2creacion.js")
Se insertaron los 10 articulos
true
```
La siguiente imagen con movimiento muestra la creación sobre la extensión MondoDB en Visual Studio Code con incorporación directo y simultánea en el motor MongoDB Compass.

<img src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/CreacionBase-MByJS.gif" alt="CreacionBase-MByJS">

---
***CURSORES***

***Creación con Cursores:*** Los cursores representan el conjunto de resultados de una consulta y proporciona un mecanismo para desplazarse a través de esos resultados, uno por uno o en bloques, permitiendo un uso más eficiente de la memoria y el procesamiento.
```sql
database = db.getSiblingDB('base1');
printjson(database.getCollectionNames());
database.articulos.drop();

for(i = 1; i <= 15; i++){
    database.articulos.insertOne({
        _id: i,
        nombre: 'articulo ' + i
    })
}

var cursor = database.articulos.find()

while(cursor.hasNext()){
    //printjson(cursor.next());
    print(cursor.next())
}
print ("finalizo la ejecucion")
```
_Respuesta:_
```sql
base1> load ("2creacion2.js")
[
  'articulos'
]
{ _id: 1, nombre: 'articulo 1' }
{ _id: 2, nombre: 'articulo 2' }
{ _id: 3, nombre: 'articulo 3' }
{ _id: 4, nombre: 'articulo 4' }
{ _id: 5, nombre: 'articulo 5' }
{ _id: 6, nombre: 'articulo 6' }
{ _id: 7, nombre: 'articulo 7' }
{ _id: 8, nombre: 'articulo 8' }
{ _id: 9, nombre: 'articulo 9' }
{ _id: 10, nombre: 'articulo 10' }
{ _id: 11, nombre: 'articulo 11' }
{ _id: 12, nombre: 'articulo 12' }
{ _id: 13, nombre: 'articulo 13' }
{ _id: 14, nombre: 'articulo 14' }
{ _id: 15, nombre: 'articulo 15' }
finalizo la ejecucion
true
```
***Creación con cursores con “hasNext” y “next”:***

```sql
print('/*------- Uso del método hasNext y next --------*/')
db = db.getSiblingDB('base1');

cursor = db.articulos.find();

while(cursor.hasNext()) {  //verifica si hay más documentos
    var actual = cursor.next() //devuelve el siguiente documento y avanza el cursor
    print(actual.nombre)
}
```
_Respuesta:_
```sql
base1> load ("3cursores1.js")
/*------- Uso del método hasNext y next --------*/
articulo 1
articulo 2
articulo 3
articulo 4
articulo 5
articulo 6
articulo 7
articulo 8
articulo 9
articulo 10
articulo 11
articulo 12
articulo 13
articulo 14
articulo 15
true
```
***Creación con cursores con “for”:***

```sql
print('/*------- Uso for para recorrer una coleccion --------*/')
db = db.getSiblingDB('base1');

db.test.drop();

for(var i=1; i<=100; i++) {
    db.test.insertOne({valor: i}) 
}

printjson(db.getCollectionNames());
print ("La coleccion fue cargada ok.")
```
_Respuesta:_
```sql
base1> load ("3cursores2.js")
/*------- Uso for para recorrer una coleccion --------*/
[
  'test',
  'articulos'
]
La coleccion fue cargada ok.
true
```
`Aclaración:` Se expusieron los principales métodos de inserción a través de cursores, aunque pueden utilizarse otros, tales como: foreach, toArray, etc. Incluso con insertMany (en lugar de insertOne).

***Cursores con proyecciones (projection):***

Es una forma de limitar los campos que se devuelven en los resultados de una consulta. Es decir, permite seleccionar qué campos (propiedades) de los documentos quieres incluir o excluir en la respuesta, en lugar de devolver todos los campos.

```sql
print('/* ------- find query projection --------*/')
db = db.getSiblingDB("base1");

print('\n')  //salto de linea

var cursor = db.personas 
    .find( 
        { edad: {$lt:50} }, // filtro query, personas con edad menores a 50 años
        { nombre: 1, edad: 1, _id:0 } // projection -> 1: sale, 0: no sale 
    ) 

    // Información devuelta por el cursor
while(cursor.hasNext()){
    var d = cursor.next()
    print(d)
    print(d.nombre + " + " + d.edad)
}
```
_Respuesta:_
```sql
test> load("3cursores7.js")
/* ------- find query projection --------*/


{ nombre: 'Lulu', edad: 48 }
Lulu + 48
{ nombre: 'Nedra', edad: 12 }
Nedra + 12
{ nombre: 'Greg', edad: 16 }
Greg + 16
{ nombre: 'Piper', edad: 18 }
Piper + 18
{ nombre: 'Piper', edad: 18 }
Piper + 18
{ nombre: 'Gunner', edad: 30 }
Gunner + 30
{ nombre: 'Arthur', edad: 3 }
Arthur + 3
{ nombre: 'Angelina', edad: 35 }
Angelina + 35
true
```
`Información adicional:` Los cursores también pueden utilizarse para consultas con filtrado que implementen: sort, limit, skip, NocursorTimeout, etc.

---
***BULK***

Son operaciones masivas. Tiene un límite del lote.

batchSize: determina la cantidad de documentos por lote. Se suele utilizar en conexiones lentas, para no sobrecargar.
```sql
objsLeftInBatch
```
Indica cuantos documentos pendientes tengo por procesar en ese batch, y cuando el batch se renueva, lo hace también el objsLeftBatch.

--- 


