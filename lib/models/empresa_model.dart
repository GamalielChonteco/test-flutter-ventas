// To parse this JSON data, do
//
//     final empresaResponse = empresaResponseFromJson(jsonString);

import 'dart:convert';

List<EmpresaResponse> empresaResponseFromJson(String str) => List<EmpresaResponse>.from(json.decode(str).map((x) => EmpresaResponse.fromJson(x)));

String empresaResponseToJson(List<EmpresaResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmpresaResponse {
    EmpresaResponse({
        this.empresa,
        this.costos,
        this.gastos,
        this.ventasEfectivo,
        this.ventasCredito,
        this.ventas,
        this.pagos,
        this.utilidad,
    });

    Empresa empresa;
    double costos;
    double gastos;
    double ventasEfectivo;
    double ventasCredito;
    double ventas;
    double pagos;
    double utilidad;

    factory EmpresaResponse.fromJson(Map<String, dynamic> json) => EmpresaResponse(
        empresa: Empresa.fromJson(json["empresa"]),
        costos: json["costos"].toDouble(),
        gastos: json["gastos"],
        ventasEfectivo: json["ventasEfectivo"].toDouble(),
        ventasCredito: json["ventasCredito"].toDouble(),
        ventas: json["ventas"].toDouble(),
        pagos: json["pagos"],
        utilidad: json["utilidad"],
    );

    Map<String, dynamic> toJson() => {
        "empresa": empresa.toJson(),
        "costos": costos,
        "gastos": gastos,
        "ventasEfectivo": ventasEfectivo,
        "ventasCredito": ventasCredito,
        "ventas": ventas,
        "pagos": pagos,
        "utilidad": utilidad,
    };
}

class Empresa {
    Empresa({
        this.id,
        this.version,
        this.clave,
        this.nombre,
        this.usuario,
    });

    String id;
    int version;
    String clave;
    String nombre;
    Usuario usuario;

    factory Empresa.fromJson(Map<String, dynamic> json) => Empresa(
        id: json["id"],
        version: json["version"],
        clave: json["clave"],
        nombre: json["nombre"],
        usuario: Usuario.fromJson(json["usuario"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "version": version,
        "clave": clave,
        "nombre": nombre,
        "usuario": usuario.toJson(),
    };
}

class Usuario {
    Usuario({
        this.id,
        this.username,
    });

    String id;
    String username;

    factory Usuario.fromJson(Map<String, dynamic> json) => Usuario(
        id: json["id"],
        username: json["username"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
    };
}
