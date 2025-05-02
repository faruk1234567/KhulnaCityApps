// To parse this JSON data, do
//
//     final bikeInformation = bikeInformationFromJson(jsonString);

import 'dart:convert';

List<BikeInformation> bikeInformationFromJson(String str) => List<BikeInformation>.from(json.decode(str).map((x) => BikeInformation.fromJson(x)));

String bikeInformationToJson(List<BikeInformation> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class BikeInformation {
<<<<<<< HEAD
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
=======
  String ?registrationNo;
  int? rfidNo;
  String? ownerFullName;
  String ?fatherName;
  String? wordName;
  String? nidNo;
  String? contactNo;
  String? permanentAddress;
  String? presentAddress;
  String ?fiscalYearName;
  String ?imagePath;
>>>>>>> da5f52e185fa361f7686758d25b0dbaf1639d504

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
<<<<<<< HEAD
    this.dueYear,
    this.dueAmount,
=======
>>>>>>> da5f52e185fa361f7686758d25b0dbaf1639d504
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
<<<<<<< HEAD
    dueYear: json["dueYear"],
    dueAmount: json["dueAmount"],
=======
>>>>>>> da5f52e185fa361f7686758d25b0dbaf1639d504
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
<<<<<<< HEAD
    "dueYear": dueYear,
    "dueAmount": dueAmount,
=======
>>>>>>> da5f52e185fa361f7686758d25b0dbaf1639d504
    "imagePath": imagePath,
  };
}
