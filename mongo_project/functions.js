function calcularTiempoDesdeCertificacion(fecha_finalizacion) {
    const fechaFin = new Date(fecha_finalizacion);
    const fechaActual = new Date();
    let años = fechaActual.getFullYear() - fechaFin.getFullYear();
    let meses = fechaActual.getMonth() - fechaFin.getMonth();
    
    if (meses < 0) {
        años--;
        meses += 12;
    }
    
    return { años, meses };
}

db.certificaciones.find().forEach(function(doc) {
    const { años, meses } = calcularTiempoDesdeCertificacion(doc.fecha_finalizacion);
    print(`Certificación: ${doc.titulo}, Años: ${años}, Meses: ${meses}`);
});

function TitulosEnCurso(fecha_finalizacion) {
    return fecha_finalizacion === "Actualidad" ? "No Completado 100%" : "Finalizado";
}

db.formacion_academica.find().forEach(function(doc) {
    const estado = TitulosEnCurso(doc.fecha_finalizacion);
    print(`Título: ${doc.titulo}, Estado: ${estado}`);
});
