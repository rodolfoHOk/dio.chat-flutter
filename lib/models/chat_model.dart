// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

class ChatModel {
  String _name = "";
  String _category = "";
  DateTime _createdAt = DateTime.now();

  ChatModel({required String name, required String category}) {
    _name = name;
    _category = category;
  }

  String get name => _name;
  set name(String name) => _name = name;
  String get category => _category;
  set category(String category) => _category = category;
  DateTime get createdAt => _createdAt;
  set createdAt(DateTime createdAt) => _createdAt = createdAt;

  ChatModel.fromJson(Map<String, dynamic> json) {
    _name = json['name'];
    _category = json['category'];
    _createdAt = (json['created_at'] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = _name;
    data['category'] = _category;
    data['created_at'] = Timestamp.fromDate(_createdAt);
    return data;
  }
}
