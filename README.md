# MongoDB
## Instalación de MongoDB, Mongo Comprass y MongoSH
Para iniciar el recorrio en MongoDB, fué necesario no solo la instalación del motor de DB, sino de la interface Mongo Compass y de MongoSH para su manejo desde línea de comandos.
1. Se procedió a la instalación de MongoDB, que luego de su ejecusión fué necesario no solo configurar su incorporación de permisos en la variables del entorno del sistema operativo `C:\Program Files\MongoDB\Server\7.0\bin` en el `PATH`, sino además, crear una carpeta denominada `db` en el directorio que MongoDB tiene predeterminado `C:\data\db` para poder realizar la instalación de forma exitosa. Posteriormente, se ejecutar en el simbolo del sistema `cmd` el comando `mongod`, y si la respuesta del log contempla, significa:
+ "MongoDB starting": MongoDB ha comenzado el proceso de arranque.
+ "WiredTiger opened": El motor de almacenamiento WiredTiger se ha abierto exitosamente.
+ "recovery was completed successfully": La recuperación del registro de transacciones se completó con éxito.
2. Luego se efectua la instalación de Mongo Compass, la cual que no requiere modificación en las variables del entorno, dado que es una inteface gráfica que depende de MongoDB. Solo debe verificarse que el motor corra adecuadamente con el comando mongod, y utilizará el localhost puerto 27017 predeterminado en MongoDB.
3. Se intala MonsgoSH, es decir, MongoShell para habilitar la ejecución del motor a través de línea de comandos. 
 
