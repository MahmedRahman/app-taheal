// To parse this JSON data, do
//
//     final quetionsCategoryModel = quetionsCategoryModelFromJson(jsonString);

import 'dart:convert';

QuetionsCategoryModel quetionsCategoryModelFromJson(String str) => QuetionsCategoryModel.fromJson(json.decode(str));

String quetionsCategoryModelToJson(QuetionsCategoryModel data) => json.encode(data.toJson());

class QuetionsCategoryModel {
    QuetionsCategoryModel({
        this.success,
        this.data,
        this.code,
    });

    bool success;
    List<Datum> data;
    int code;

    factory QuetionsCategoryModel.fromJson(Map<String, dynamic> json) => QuetionsCategoryModel(
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
        this.subTitle,
        this.details,
        this.image,
    });

    int id;
    String title;
    String subTitle;
    String details;
    String image;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        title: json["title"],
        subTitle: json["sub_title"],
        details: json["details"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "sub_title": subTitle,
        "details": details,
        "image": image,
    };
}
