print("Creando colecciones...");

// Define el nombre de la base de datos directamente en el script
const db = connect("mongodb://localhost:27017/CV_Jesica_Basile");

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
