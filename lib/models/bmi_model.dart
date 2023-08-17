import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'dart:convert';

class BmiData {
  final String name;
  final String address;
  final String age;
  final double bmi;
  final String bmiComment;


  BmiData({

    required this.name,
    required this.address,
    required this.age,
    required this.bmi,
    required this.bmiComment,

  });

  factory BmiData.fromRawJson(String str) => BmiData.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory BmiData.fromJson(Map<String, dynamic> json) => BmiData(

    name: json["name"] ?? '',
    address: json["address"]?? '',
    age: json["age"]?? '',
    bmi: json["bmi"]?? 0.0,
    bmiComment: json["bmiComment"]?? '',

  );

  Map<String, dynamic> toJson() => {
    "name": name,
    "address": address,
    "age": age,
    "bmi": bmi,
    "bmiComment": bmiComment,
  };
}
