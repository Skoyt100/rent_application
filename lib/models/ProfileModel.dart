import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ProfileModel {
  String uid;
  String name; //имя

  ProfileModel({
    required this.uid,
    required this.name,
  });

  factory ProfileModel.fromJson(Map jcon) => ProfileModel(
        uid: jcon['uid'] ?? Icons.signal_cellular_null,
        name: jcon['name'] ?? null,
      );
}
