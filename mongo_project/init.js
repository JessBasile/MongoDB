print("Creando colecciones...");

// Conecta a la base de datos usando autenticación
const db = connect("mongodb://root:jess123@localhost:27017/CV_Jesica_Basile");

// Crear colecciones
db.createCollection("datos_personales");
print("Colección 'datos_personales' creada");

db.createCollection("experiencia_profesional");
print("Collection 'experiencia_profesional' created");

db.createCollection("formacion_academica");
print("Collection 'formacion_academica' created");

db.createCollection("certificaciones");
print("Collection 'certificaciones' created");

db.createCollection("formacion_docente");
print("Collection 'formacion_docente' created");

db.createCollection("experiencia_docente");
print("Collection 'experiencia_docente' created");

print("All collections created successfully");
