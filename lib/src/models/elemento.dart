// To parse this JSON data, do
//
//     final elemento = elementoFromJson(jsonString);

import 'dart:convert';

Elemento elementoFromJson(String str) => Elemento.fromJson(json.decode(str));

String elementoToJson(Elemento data) => json.encode(data.toJson());

class Elemento {
  Elemento({
    this.ancho,
    this.consolidacion,
    this.coordAprox,
    this.cuadro,
    this.elemento,
    this.especie,
    this.espesor,
    this.estado,
    this.excavador,
    this.extraccion,
    this.familia,
    this.foto,
    this.genero,
    this.id,
    this.largo,
    this.localizacionX,
    this.localizacionY,
    this.localizacionZi,
    this.localizacionZs,
    this.material,
    this.nivel,
    this.observacionesIdentificacion,
    this.observacionesRestauracion,
    this.registro,
    this.rotX,
    this.rotY,
    this.rotZ,
    this.talla,
    this.uuee,
  });

  int observaciones_restauracionancho;
  String consolidacion;
  int coordAprox;
  String cuadro;
  String elemento;
  String especie;
  int espesor;
  String estado;
  String excavador;
  int extraccion;
  String familia;
  int ancho;
  int foto;
  String genero;
  int id;
  int largo;
  int localizacionX = 0;
  int localizacionY;
  int localizacionZi;
  int localizacionZs;
  String material;
  String nivel;
  String observacionesIdentificacion;
  String observacionesRestauracion;
  DateTime registro;
  int rotX;
  int rotY;
  int rotZ;
  String talla;
  String uuee;

  factory Elemento.fromJson(Map<String, dynamic> json) => Elemento(
        ancho: json["ancho"],
        consolidacion: json["consolidacion"],
        coordAprox: json["coord_aprox"],
        cuadro: json["cuadro"],
        elemento: json["elemento"],
        especie: json["especie"],
        espesor: json["espesor"],
        estado: json["estado"],
        excavador: json["excavador"],
        extraccion: json["extraccion"],
        familia: json["familia"],
        foto: json["foto"],
        genero: json["genero"],
        id: json["id"],
        largo: json["largo"],
        localizacionX: json["localizacionX"],
        localizacionY: json["localizacionY"],
        localizacionZi: json["localizacionZi"],
        localizacionZs: json["localizacionZs"],
        material: json["material"],
        nivel: json["nivel"],
        observacionesIdentificacion: json["observaciones_identificacion"],
        observacionesRestauracion: json["observaciones_restauracion"],
        registro: DateTime.parse(json["registro"]),
        rotX: json["rotX"],
        rotY: json["rotY"],
        rotZ: json["rotZ"],
        talla: json["talla"],
        uuee: json["uuee"],
      );

  Map<String, dynamic> toJson() => {
        "ancho": ancho,
        "consolidacion": consolidacion,
        "coord_aprox": coordAprox,
        "cuadro": cuadro,
        "elemento": elemento,
        "especie": especie,
        "espesor": espesor,
        "estado": estado,
        "excavador": excavador,
        "extraccion": extraccion,
        "familia": familia,
        "foto": foto,
        "genero": genero,
        "id": id,
        "largo": largo,
        "localizacionX": localizacionX,
        "localizacionY": localizacionY,
        "localizacionZi": localizacionZi,
        "localizacionZs": localizacionZs,
        "material": material,
        "nivel": nivel,
        "observaciones_identificacion": observacionesIdentificacion,
        "observaciones_restauracion": observacionesRestauracion,
        "registro": registro.toIso8601String(),
        "rotX": rotX,
        "rotY": rotY,
        "rotZ": rotZ,
        "talla": talla,
        "uuee": uuee,
      };
}
