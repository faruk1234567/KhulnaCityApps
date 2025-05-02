// To parse this JSON data, do
//
//     final bikeInformation = bikeInformationFromJson(jsonString);

import 'dart:convert';

List<BikeInformation> bikeInformationFromJson(String str) => List<BikeInformation>.from(json.decode(str).map((x) => BikeInformation.fromJson(x)));

String bikeInformationToJson(List<BikeInformation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BikeInformation {
  String? registrationNo;
  String ? rfidNo;
  String ? ownerFullName;
  String ? fatherName;
  String ? wordName;
  String ? nidNo;
  String ? contactNo;
  String ? permanentAddress;
  String ? presentAddress;
  dynamic ?fiscalYearName;
  int ?dueYear;
  int ? dueAmount;
  String ? imagePath;

  BikeInformation({
    this.registrationNo,
    this.rfidNo,
    this.ownerFullName,
    this.fatherName,
    this.wordName,
    this.nidNo,
    this.contactNo,
    this.permanentAddress,
    this.presentAddress,
    this.fiscalYearName,
    this.dueYear,
    this.dueAmount,
    this.imagePath,
  });

  factory BikeInformation.fromJson(Map<String, dynamic> json) => BikeInformation(
    registrationNo: json["registrationNo"],
    rfidNo: json["rfidNo"],
    ownerFullName: json["ownerFullName"],
    fatherName: json["fatherName"],
    wordName: json["wordName"],
    nidNo: json["nidNo"],
    contactNo: json["contactNo"],
    permanentAddress: json["permanentAddress"],
    presentAddress: json["presentAddress"],
    fiscalYearName: json["fiscalYearName"],
    dueYear: json["dueYear"],
    dueAmount: json["dueAmount"],
    imagePath: json["imagePath"],
  );

  Map<String, dynamic> toJson() => {
    "registrationNo": registrationNo,
    "rfidNo": rfidNo,
    "ownerFullName": ownerFullName,
    "fatherName": fatherName,
    "wordName": wordName,
    "nidNo": nidNo,
    "contactNo": contactNo,
    "permanentAddress": permanentAddress,
    "presentAddress": presentAddress,
    "fiscalYearName": fiscalYearName,
    "dueYear": dueYear,
    "dueAmount": dueAmount,
    "imagePath": imagePath,
  };
}
