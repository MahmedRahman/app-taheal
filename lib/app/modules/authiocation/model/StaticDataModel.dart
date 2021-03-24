// To parse this JSON data, do
//
//     final staticDataModel = staticDataModelFromJson(jsonString);

import 'dart:convert';

StaticDataModel staticDataModelFromJson(String str) => StaticDataModel.fromJson(json.decode(str));

String staticDataModelToJson(StaticDataModel data) => json.encode(data.toJson());

class StaticDataModel {
    StaticDataModel({
        this.success,
        this.data,
        this.message,
        this.code,
    });

    bool success;
    List<Datum> data;
    String message;
    int code;

    factory StaticDataModel.fromJson(Map<String, dynamic> json) => StaticDataModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        message: json["message"],
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "message": message,
        "code": code,
    };
}

class Datum {
    Datum({
        this.diagnostics,
        this.surgeries,
        this.medicalSplints,
        this.listRlationShips,
        this.motorFunctions,
    });

    List<Diagnostic> diagnostics;
    List<Diagnostic> surgeries;
    List<Diagnostic> medicalSplints;
    List<Diagnostic> listRlationShips;
    List<MotorFunction> motorFunctions;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        diagnostics: List<Diagnostic>.from(json["diagnostics"].map((x) => Diagnostic.fromJson(x))),
        surgeries: List<Diagnostic>.from(json["surgeries"].map((x) => Diagnostic.fromJson(x))),
        medicalSplints: List<Diagnostic>.from(json["medical_splints"].map((x) => Diagnostic.fromJson(x))),
        listRlationShips: List<Diagnostic>.from(json["list_rlation_ships"].map((x) => Diagnostic.fromJson(x))),
        motorFunctions: List<MotorFunction>.from(json["MotorFunctions"].map((x) => MotorFunction.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "diagnostics": List<dynamic>.from(diagnostics.map((x) => x.toJson())),
        "surgeries": List<dynamic>.from(surgeries.map((x) => x.toJson())),
        "medical_splints": List<dynamic>.from(medicalSplints.map((x) => x.toJson())),
        "list_rlation_ships": List<dynamic>.from(listRlationShips.map((x) => x.toJson())),
        "MotorFunctions": List<dynamic>.from(motorFunctions.map((x) => x.toJson())),
    };
}

class Diagnostic {
    Diagnostic({
        this.id,
        this.title,
    });

    int id;
    String title;

    factory Diagnostic.fromJson(Map<String, dynamic> json) => Diagnostic(
        id: json["id"],
        title: json["title"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
    };
}

class MotorFunction {
    MotorFunction({
        this.id,
        this.title,
        this.image,
    });

    int id;
    String title;
    String image;

    factory MotorFunction.fromJson(Map<String, dynamic> json) => MotorFunction(
        id: json["id"],
        title: json["title"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "image": image,
    };
}
