// To parse this JSON data, do
//
//     final elemento = elementoFromJson(jsonString);

import 'dart:convert';

Elemento elementoFromJson(String str) => Elemento.fromJson(json.decode(str));

String elementoToJson(Elemento data) => json.encode(data.toJson());

class Elemento {
    Elemento({
        this.id,
        this.locationX = 1,
        this.locationY = 0,
        this.locationZs = 0,
        this.locationZi = 0,
    });

    int id;
    int locationX;
    int locationY;
    int locationZs;
    int locationZi;

    factory Elemento.fromJson(Map<String, dynamic> json) => Elemento(
        id: json["id"],
        locationX: json["_location_x"],
        locationY: json["_location_y"],
        locationZs: json["_location_zs"],
        locationZi: json["_location_zi"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "_location_x": locationX,
        "_location_y": locationY,
        "_location_zs": locationZs,
        "_location_zi": locationZi,
    };
}
