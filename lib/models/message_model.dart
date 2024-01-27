// ignore_for_file: unnecessary_getters_setters

import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  String? _id;
  String _chatId = "";
  String _userId = "";
  String _nickname = "";
  String _text = "";
  DateTime _createdAt = DateTime.now();

  MessageModel({
    required String chatId,
    required String userId,
    required String nickname,
    required String text,
  }) {
    _chatId = chatId;
    _userId = userId;
    _nickname = nickname;
    _text = text;
  }

  String? get id => _id;
  set id(String? id) => _id = id;
  String get chatId => _chatId;
  set chatId(String chatId) => _chatId = chatId;
  String get userId => _userId;
  set userId(String userId) => _userId = userId;
  String get nickname => _nickname;
  set nickname(String nickname) => _nickname = nickname;
  String get text => _text;
  set text(String text) => _text = text;
  DateTime get createdAt => _createdAt;
  set createdAt(DateTime createdAt) => _createdAt = createdAt;

  MessageModel.fromJson(Map<String, dynamic> json) {
    _chatId = json['chatId'];
    _userId = json['userId'];
    _nickname = json['nickname'];
    _text = json['text'];
    _createdAt = (json['created_at'] as Timestamp).toDate();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['chatId'] = _chatId;
    data['userId'] = _userId;
    data['nickname'] = _nickname;
    data['text'] = _text;
    data['created_at'] = Timestamp.fromDate(_createdAt);
    return data;
  }
}
