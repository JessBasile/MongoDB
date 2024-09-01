<img align="right" alt="Logo MongoDB GIF" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/mongo_db.gif">

<br><br><br>

## { Instalación de MongoDB, Mongo Compass y MongoSH }

Para iniciar el recorrido en MongoDB, fue necesario no solo la instalación del motor de DB, sino de la interfaz Mongo Compass y de MongoSH para su manejo desde línea de comandos.

<img align="right" alt="Logo MongoDB" width="80" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/hojadb.png">

1. Se procedió a la instalación de ***MongoDB***, que luego de su ejecución fue necesario no solo configurar su incorporación de permisos en las variables del entorno del sistema operativo `C:\Program Files\MongoDB\Server\7.0\bin` en el `PATH`, sino además, crear una carpeta denominada `db` en el directorio que MongoDB tiene predeterminado `C:\data\db` para poder realizar la instalación de forma exitosa. Posteriormente, se ejecuta en el símbolo del sistema `cmd` el comando `mongod`, y si la respuesta del log manifiesta lo siguiente, significa que:
   + "MongoDB starting": MongoDB ha comenzado el proceso de arranque.
   + "WiredTiger opened": El motor de almacenamiento WiredTiger se ha abierto exitosamente.
   + "recovery was completed successfully": La recuperación del registro de transacciones se completó con éxito.

   <img align="right" alt="Logo Compass" width="200" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/compas.png">

2. Luego se efectúa la instalación de ***Mongo Compass***, la cual no requiere modificación en las variables del entorno, dado que es una interfaz gráfica que depende de MongoDB. Solo debe verificarse que el motor corra adecuadamente con el comando `mongod`, y utilizará el localhost puerto 27017 predeterminado en MongoDB.

3. En el caso de ***MongoSH***, es decir, MongoShell debe crearse una carpeta en el siguiente directorio `C:\Program Files\MongoSH`, dado que desde la página web oficinal de Mongo la versión Shell se descarga en un `.zip` y será recomendable extraer los archivos en ese destino para no interferir en la instalación de MongoDB. Asimismo, dentro de la carpeta `mongosh-2.3.0-win32-x64` creada luego de la extracción del .zip, deberá controlarse que no figure ningún otro documento con extensión .zip, y en caso de identificar alguno, también deberá ser extrahído allí mismo, en este caso de ubica uno denominado `mongosh.1`, que es extrahído ahí mismo.
   
<img align="right" alt="Logo MongoDB" width="300" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/mongoshell.png">

Esto, a su vez, implica efectuar los pasos para otorgar los permisos necesarios a través de las variables de entorno en el `PATH` adhiriendo la dirección `C:\Program Files\MongoSH\mongosh-2.3.0-win32-x64\bin`. Posteriormente, se deberán ejecutar algunos comandos para conectar MongoDB con MongoSH y poder operar desde la terminal satisfactoriamente:
+ "mongosh --version": que deberá devolver el dato de la versión instalada si fué exitosa, en mi caso respondió: `2.3.0`.
+ "mongosh": si devuelve que la conexión pudo establecerse y arroja el dato de las versiones de ambos Mongos, entonces la instalación concluyó:
```cmd
Using MongoDB:          7.0.14
Using Mongosh:          2.3.0
```
