// To parse this JSON data, do
//
//     final quetionsModel = quetionsModelFromJson(jsonString);

import 'dart:convert';

QuetionsModel quetionsModelFromJson(String str) => QuetionsModel.fromJson(json.decode(str));

String quetionsModelToJson(QuetionsModel data) => json.encode(data.toJson());

class QuetionsModel {
    QuetionsModel({
        this.success,
        this.data,
        this.code,
    });

    bool success;
    List<Datum> data;
    int code;

    factory QuetionsModel.fromJson(Map<String, dynamic> json) => QuetionsModel(
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
        this.category,
        this.complate,
        this.title,
        this.subTitle,
        this.details,
    });

    int id;
    String category;
    String complate;
    String title;
    dynamic subTitle;
    dynamic details;

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        category: json["category"],
        complate: json["complate"] == null ? null : json["complate"],
        title: json["title"],
        subTitle: json["sub_title"],
        details: json["details"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "complate": complate == null ? null : complate,
        "title": title,
        "sub_title": subTitle,
        "details": details,
    };
}
