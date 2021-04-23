// To parse this JSON data, do
//
//     final sucursalResponse = sucursalResponseFromJson(jsonString);

import 'dart:convert';

List<SucursalResponse> sucursalResponseFromJson(String str) => List<SucursalResponse>.from(json.decode(str).map((x) => SucursalResponse.fromJson(x)));

String sucursalResponseToJson(List<SucursalResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SucursalResponse {
    SucursalResponse({
        this.sucursal,
        this.costos,
        this.gastos,
        this.ventasEfectivo,
        this.ventasCredito,
        this.ventas,
        this.pagos,
        this.utilidad,
    });

    Sucursal sucursal;
    double costos;
    double gastos;
    double ventasEfectivo;
    double ventasCredito;
    double ventas;
    double pagos;
    double utilidad;

    factory SucursalResponse.fromJson(Map<String, dynamic> json) => SucursalResponse(
        sucursal: Sucursal.fromJson(json["sucursal"]),
        costos: json["costos"].toDouble(),
        gastos: json["gastos"].toDouble(),
        ventasEfectivo: json["ventasEfectivo"].toDouble(),
        ventasCredito: json["ventasCredito"].toDouble(),
        ventas: json["ventas"].toDouble(),
        pagos: json["pagos"].toDouble(),
        utilidad: json["utilidad"].toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "sucursal": sucursal.toJson(),
        "costos": costos,
        "gastos": gastos,
        "ventasEfectivo": ventasEfectivo,
        "ventasCredito": ventasCredito,
        "ventas": ventas,
        "pagos": pagos,
        "utilidad": utilidad,
    };
}

class Sucursal {
    Sucursal({
        this.id,
        this.version,
        this.clave,
        this.nombre,
        this.almacenes,
    });

    String id;
    int version;
    String clave;
    String nombre;
    List<String> almacenes;

    factory Sucursal.fromJson(Map<String, dynamic> json) => Sucursal(
        id: json["id"],
        version: json["version"],
        clave: json["clave"],
        nombre: json["nombre"],
        almacenes: List<String>.from(json["almacenes"].map((x) => x)),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "clave": clave,
        "nombre": nombre,
        "almacenes": List<dynamic>.from(almacenes.map((x) => x)),
    };
}
