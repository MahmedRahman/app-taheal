// To parse this JSON data, do
//
//     final categoryvedioModel = categoryvedioModelFromJson(jsonString);

import 'dart:convert';

CategoryvedioModel categoryvedioModelFromJson(String str) => CategoryvedioModel.fromJson(json.decode(str));

String categoryvedioModelToJson(CategoryvedioModel data) => json.encode(data.toJson());

class CategoryvedioModel {
    CategoryvedioModel({
        this.success,
        this.data,
        this.code,
    });

    bool success;
    List<Datum> data;
    int code;

    factory CategoryvedioModel.fromJson(Map<String, dynamic> json) => CategoryvedioModel(
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
        this.meta,
        this.details,
        this.vedio,
        this.category,
    });

    int id;
    String title;
    String meta;
    String details;
    String vedio;
    String category;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        meta: json["meta"],
        details: json["details"],
        vedio: json["vedio"],
        category: json["category"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "meta": meta,
        "details": details,
        "vedio": vedio,
        "category": category,
    };
}
