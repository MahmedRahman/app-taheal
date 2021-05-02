// To parse this JSON data, do
//
//     final vedioListModel = vedioListModelFromJson(jsonString);

import 'dart:convert';

VedioListModel vedioListModelFromJson(String str) => VedioListModel.fromJson(json.decode(str));

String vedioListModelToJson(VedioListModel data) => json.encode(data.toJson());

class VedioListModel {
    VedioListModel({
        this.success,
        this.data,
        this.code,
    });

    bool success;
    List<Datum> data;
    int code;

    factory VedioListModel.fromJson(Map<String, dynamic> json) => VedioListModel(
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
        this.details,
        this.img,
    });

    int id;
    String title;
    dynamic details;
    String img;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"] == null ? '' :json["title"] ,
        details: json["details"]== null ? '' :json["details"],
        img: json["img"]== null ? '' :json["img"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "details": details,
        "img": img,
    };
}
