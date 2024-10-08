db.datos_personales.insertOne({
    nombre_apellido: "Jesica Brenda Basile",
    residencia: "Gualeguaychú, Entre Ríos - Argentina",
    correo_electronico: "jessbrenba@gmail.com",
    linkedin: "Linkedin",
    portaflio: "GitHub",
    skills: "Contadora Publica | Data Analytics | Power Bi | SQLServer | MySQL | Docente universitaria"
});

db.experiencia_profesional.insertOne({
    empresa: "Agro Gestion del Litoral S.A.",
    puesto: "Responsable Finanzas",
    fecha_inicio: ISODate("2014-06-03T08:00:00Z"),
    fecha_finalizacion: "Actualidad",
    estado: "Activo",
    descripcion: "Conciliaciones bancarias, Conciliaciones cta cte proveedores bimonetarios ($ y usd), Caja chica, Arqueos, Cheques, e-cheqs, Tarjetas business, Facturación compras, Liquidaciones CyO, Pagos con retenciones bimonetarios y Emisión informes financieros cashflow"
});

db.formacion_academica.insertMany([
    { fecha_inicio: ISODate("2022-03-01T00:00:00Z"), fecha_finalizacion: "Actualidad", estado: "En elaboración de tesis", institucion: "UBP", titulo: "Maestría en Dirección y Gestión de RRHH" },
    { fecha_inicio: ISODate("2007-03-01T00:00:00Z"), fecha_finalizacion: ISODate("2014-12-01T00:00:00Z"), estado: "Finalizado", institucion: "UCALP", titulo: "Contador Público" },
    { fecha_inicio: ISODate("2007-03-01T00:00:00Z"), fecha_finalizacion: ISODate("2011-12-01T00:00:00Z"), estado: "Finalizado", institucion: "UCALP", titulo: "Técnica Universitaria en Ciencias Económicas" },
    { fecha_inicio: ISODate("2007-03-01T00:00:00Z"), fecha_finalizacion: ISODate("2010-12-01T00:00:00Z"), estado: "Finalizado", institucion: "Sedes Sapientiae", titulo: "Técnico Superior en Administración de Empresas" }
]);

db.certificaciones.insertMany([
    { fecha_inicio: ISODate("2024-08-19T00:00:00Z"), fecha_finalizacion: ISODate("2024-09-16T00:00:00Z"), estado: "Finalizado", institucion: "EducacionIT", titulo: "Introduccion a MongoDB" },
    { fecha_inicio: ISODate("2024-05-21T00:00:00Z"), fecha_finalizacion: ISODate("2024-08-20T00:00:00Z"), estado: "Finalizado – TOP10", institucion: "CODERHOUSE", titulo: "SQL" },
    { fecha_inicio: ISODate("2023-12-09T00:00:00Z"), fecha_finalizacion: ISODate("2024-03-09T00:00:00Z"), estado: "Finalizado - TOP 10", institucion: "CODERHOUSE", titulo: "Data Analytics" },
    { fecha_inicio: ISODate("2023-11-01T00:00:00Z"), fecha_finalizacion: ISODate("2023-11-30T00:00:00Z"), estado: "Finalizado", institucion: "CAPACITARTE UBA", titulo: "Curso de Excel Avanzado Superior" },
    { fecha_inicio: ISODate("2014-08-01T00:00:00Z"), fecha_finalizacion: ISODate("2015-08-31T00:00:00Z"), estado: "Finalizado", institucion: "Fundación San Onofre", titulo: "Mandataria del Automotor" }
]);

db.formacion_docente.insertMany([
    { fecha_inicio: ISODate("2023-03-01T00:00:00Z"), fecha_finalizacion: ISODate("2023-12-15T00:00:00Z"), estado: "En elaboración de Trabajo Final", institucion: "UBA", titulo: "Especialización en Tecnología Educativa", descripcion: "En elaboración de Trabajo Final" },
    { fecha_inicio: ISODate("2022-08-01T00:00:00Z"), fecha_finalizacion: ISODate("2023-08-30T00:00:00Z"), estado: "Finalizado", institucion: "UAI", titulo: "Diplomatura Superior Universitaria en Educación Emocional", descripcion: "Promedio 10 (Diez)" },
    { fecha_inicio: ISODate("2020-03-01T00:00:00Z"), fecha_finalizacion: ISODate("2022-12-15T00:00:00Z"), estado: "Finalizado", institucion: "UBA", titulo: "Especialización en Docencia Universitaria en Ciencias Económicas", descripcion: "Promedio 10 (Diez)" }
]);

db.experiencia_docente.insertMany([
    { institucion: "UCSF", cargo: "Docente Universitaria en Ciencias Económicas", asignatura: "Seminario de Investigación Científica - 5° Año", fecha_inicio: ISODate("2024-03-01T00:00:00Z"), fecha_finalizacion: "En Actividad" },
    { institucion: "Sedes Sapientiae", cargo: "Docente Terciaria en Sistemas", asignatura: "Administración y Gestión I - 1° Año", fecha_inicio: ISODate("2023-03-01T00:00:00Z"), fecha_finalizacion: "En Actividad" },
    { institucion: "Sedes Sapientiae", cargo: "Docente Terciaria en Sistemas", asignatura: "Administración y Gestión II - 2° Año", fecha_inicio: ISODate("2023-03-01T00:00:00Z"), fecha_finalizacion: "En Actividad" },
    { institucion: "UADER", cargo: "Docente Terciaria en Tecnicatura en Hotelería", asignatura: "Recursos Humanos - 2° Año", fecha_inicio: ISODate("2021-08-01T00:00:00Z"), fecha_finalizacion: "En Actividad" },
    { institucion: "UADER", cargo: "Docente Terciaria en Tecnicatura en Hotelería", asignatura: "Contabilidad General - 1° Año", fecha_inicio: ISODate("2021-08-01T00:00:00Z"), fecha_finalizacion: "En Actividad" }
]);
