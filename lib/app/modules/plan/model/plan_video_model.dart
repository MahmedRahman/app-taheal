// To parse this JSON data, do
//
//     final videoPlanModel = videoPlanModelFromJson(jsonString);

import 'dart:convert';

VideoPlanModel videoPlanModelFromJson(String str) => VideoPlanModel.fromJson(json.decode(str));

String videoPlanModelToJson(VideoPlanModel data) => json.encode(data.toJson());

class VideoPlanModel {
    VideoPlanModel({
        this.success,
        this.data,
        this.code,
    });

    bool success;
    Data data;
    int code;

    factory VideoPlanModel.fromJson(Map<String, dynamic> json) => VideoPlanModel(
        success: json["success"],
        data: Data.fromJson(json["data"]),
        code: json["code"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "data": data.toJson(),
        "code": code,
    };
}

class Data {
    Data({
        this.vediosMotorFunction,
        this.myVedio,
    });

    List<MyVedio> vediosMotorFunction;
    List<MyVedio> myVedio;

    factory Data.fromJson(Map<String, dynamic> json) => Data(
        vediosMotorFunction: List<MyVedio>.from(json["vedios_motor_function"].map((x) => MyVedio.fromJson(x))),
        myVedio: List<MyVedio>.from(json["my_vedio"].map((x) => MyVedio.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "vedios_motor_function": List<dynamic>.from(vediosMotorFunction.map((x) => x.toJson())),
        "my_vedio": List<dynamic>.from(myVedio.map((x) => x.toJson())),
    };
}

class MyVedio {
    MyVedio({
        this.id,
        this.rate,
        this.complate,
        this.title,
        this.meta,
        this.details,
        this.catTitle,
        this.descCat,
        this.vedio,
        this.img,
        this.color,
    });

    int id;
    String rate;
    String complate;
    String title;
    String meta;
    String details;
    String catTitle;
    String descCat;
    String vedio;
    String img;
 String color;

    factory MyVedio.fromJson(Map<String, dynamic> json) => MyVedio(
        id: json["id"],
        rate: json["rate"] == null ? null : json["rate"],
        complate: json["complate"] == null ? null : json["complate"],
        title: json["title"]== null ? '' : json["title"],
        meta: json["meta"]== null ? '' : json["meta"],
        details: json["details"]== null ? '' : json["details"],
        catTitle: json["cat_title"]== null ? '' : json["cat_title"],
        descCat: json["desc_cat"]== null ? '' : json["desc_cat"],
        vedio: json["vedio"]== null ? '' : json["vedio"],
        img: json["img"]== null ? '' : json["img"],
        color: json["color"]== null ? '' : json["color"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "rate": rate == null ? null : rate,
        "complate": complate == null ? null : complate,
        "title": title,
        "meta": meta,
        "details": details,
        "cat_title": catTitle,
        "desc_cat": descCat,
        "vedio": vedio,
        "img": img, "color": color,
    };
}
