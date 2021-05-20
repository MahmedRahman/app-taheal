// To parse this JSON data, do
//
//     final userlogModel = userlogModelFromJson(jsonString);
import 'package:get/get.dart';
import 'dart:convert';

UserlogModel userlogModelFromJson(String str) =>
    UserlogModel.fromJson(json.decode(str));

String userlogModelToJson(UserlogModel data) => json.encode(data.toJson());

class UserlogModel {
  UserlogModel({
    this.success,
    this.data,
    this.message,
    this.code,
  });

  bool success;
  List<Datum> data;
  String message;
  int code;

  factory UserlogModel.fromJson(Map<String, dynamic> json) => UserlogModel(
        success: json["success"],

        data: GetUtils.isNullOrBlank(json["data"]) ? List<Datum>.empty(growable: true) : List<Datum>.from(
          json["data"].map(
            (x) => Datum.fromJson(x),
          ),
        ),

        message: json["message"],
        code: json["code"],
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(
          data.map(
            (x) => x.toJson(),
          ),
        ),
        "message": message,
        "code": code,
      };
}

class Datum {
  Datum({
    this.id,
    this.firstName,
    this.lastName,
    this.phone,
    this.email,
    this.childName,
    this.childBirthday,
    this.medicalSplints,
    this.surgeries,
    this.diagnos,
    this.motorFunction,
    this.relationChild,
    this.childGender,
    this.status,
    this.accessToken,
  });

  int id;
  String firstName;
  String lastName;
  String phone;
  String email;
  String childName;
  DateTime childBirthday;
  String medicalSplints;
  String surgeries;
  String diagnos;
  String motorFunction;
  String relationChild;
  String childGender;
  String status;
  String accessToken;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        phone: json["phone"],
        email: json["email"],
        childName: json["child_name"],
        childBirthday: DateTime.parse(json["child_birthday"]),
        medicalSplints: json["medical_splints"],
        surgeries: json["surgeries"],
        diagnos: json["diagnos"],
        motorFunction: json["motor_function"],
        relationChild: json["relation_child"],
        childGender: json["child_gender"],
        status: json["status"],
        accessToken: json["access_token"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "first_name": firstName,
        "last_name": lastName,
        "phone": phone,
        "email": email,
        "child_name": childName,
        "child_birthday":
            "${childBirthday.year.toString().padLeft(4, '0')}-${childBirthday.month.toString().padLeft(2, '0')}-${childBirthday.day.toString().padLeft(2, '0')}",
        "medical_splints": medicalSplints,
        "surgeries": surgeries,
        "diagnos": diagnos,
        "motor_function": motorFunction,
        "relation_child": relationChild,
        "child_gender": childGender,
        "status": status,
        "access_token": accessToken,
      };
}
