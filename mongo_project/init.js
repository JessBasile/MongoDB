print("Creating collections...");

use CV_Jesica_Basile;
db.createCollection("datos_personales");
print("Collection 'datos_personales' created");

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
