<img align="right" alt="Logo MongoDB GIF" width="100" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/mongo_db.gif">

# MongoDB

## Instalación de MongoDB, Mongo Compass y MongoSH

Para iniciar el recorrido en MongoDB, fue necesario no solo la instalación del motor de DB, sino de la interfaz Mongo Compass y de MongoSH para su manejo desde línea de comandos.

<img align="right" alt="Logo MongoDB" width="100" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/logo_mongodb.jpg">

1. Se procedió a la instalación de MongoDB, que luego de su ejecución fue necesario no solo configurar su incorporación de permisos en las variables del entorno del sistema operativo `C:\Program Files\MongoDB\Server\7.0\bin` en el `PATH`, sino además, crear una carpeta denominada `db` en el directorio que MongoDB tiene predeterminado `C:\data\db` para poder realizar la instalación de forma exitosa. Posteriormente, se ejecuta en el símbolo del sistema `cmd` el comando `mongod`, y si la respuesta del log contempla, significa:
   + "MongoDB starting": MongoDB ha comenzado el proceso de arranque.
   + "WiredTiger opened": El motor de almacenamiento WiredTiger se ha abierto exitosamente.
   + "recovery was completed successfully": La recuperación del registro de transacciones se completó con éxito.

   <img align="right" alt="Logo Compass" width="100" src="https://github.com/JessBasile/MongoDB/raw/main/imagenes/compass.png">

2. Luego se efectúa la instalación de Mongo Compass, la cual no requiere modificación en las variables del entorno, dado que es una interfaz gráfica que depende de MongoDB. Solo debe verificarse que el motor corra adecuadamente con el comando `mongod`, y utilizará el localhost puerto 27017 predeterminado en MongoDB.

3. Se instala MongoSH, es decir, MongoShell para habilitar la ejecución del motor a través de línea de comandos.

