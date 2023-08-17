import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';

class BmiData {
  final String name;
  final String address;
  final String ageText;
  final double bmi;
  final String selectedGender;
  final String bmiComment;
  final Timestamp? timestamp;

  BmiData({
    required this.name,
    required this.address,
    required this.ageText,
    required this.bmi,
    required this.selectedGender,
    required this.bmiComment,
    required this.timestamp,
  });

  factory BmiData.fromRawJson(String str) => BmiData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BmiData.fromJson(Map<String, dynamic> json) => BmiData(
    name: json["name"] ?? '',
    address: json["address"]?? '',
    ageText: json["ageText"]?? '',
    bmi: json["bmi"]?? 0.0,
    selectedGender: json["selectedGender"]?? '',
    bmiComment: json["bmiComment"]?? '',
    timestamp: json["timestamp"] as Timestamp?,
  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "ageText": ageText,
    "bmi": bmi,
    "selectedGender": selectedGender,
    "bmiComment": bmiComment,
    "timestamp": FieldValue.serverTimestamp(),
  };
}
