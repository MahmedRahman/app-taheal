// To parse this JSON data, do
//
//     final activatyModel = activatyModelFromJson(jsonString);

import 'dart:convert';

ActivatyModel activatyModelFromJson(String str) => ActivatyModel.fromJson(json.decode(str));

String activatyModelToJson(ActivatyModel data) => json.encode(data.toJson());

class ActivatyModel {
    ActivatyModel({
        this.success,
        this.data,
        this.code,
    });

    bool success;
    List<Datum> data;
    int code;

    factory ActivatyModel.fromJson(Map<String, dynamic> json) => ActivatyModel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "code": code,
    };
}

class Datum {
    Datum({
        this.id,
        this.title,
        this.color,
        this.details,
        this.img,
    });

    int id;
    String title;
    String color;
    dynamic details;
    String img;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        color: json["color"],
        details: json["details"],
        img: json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "color": color,
        "details": details,
        "img": img,
    };
}
