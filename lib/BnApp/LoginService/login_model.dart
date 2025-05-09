// To parse this JSON data, do
//
//     final loginModel = loginModelFromJson(jsonString);

import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  String? id;
  String? username;
  String? email;
  String? token;
  String ?role;
  String? branchId;
  String ?traineeId;

  LoginModel({
    this.id,
    this.username,
    this.email,
    this.token,
    this.role,
    this.branchId,
    this.traineeId,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    id: json["id"],
    username: json["username"],
    email: json["email"],
    token: json["token"],
    role: json["role"],
    branchId: json["branchId"],
    traineeId: json["traineeId"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "username": username,
    "email": email,
    "token": token,
    "role": role,
    "branchId": branchId,
    "traineeId": traineeId,
  };
}
