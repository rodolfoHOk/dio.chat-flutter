import 'package:chat_flutter/models/message_model.dart';
import 'package:chat_flutter/services/message_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirebaseMessageService implements MessageService {
  final FirebaseFirestore _db;

  FirebaseMessageService(this._db);

  @override
  Future<void> create(MessageModel messageModel) async {
    await _db.collection("messages").add(messageModel.toJson());
  }

  @override
  Future<List<MessageModel>> listByChatId(String chatId) async {
    var chatMessages = await _db
        .collection("messages")
        .orderBy("created_at")
        .where("chatId", isEqualTo: chatId)
        .get();
    return chatMessages.docs.map((doc) {
      var message = MessageModel.fromJson(doc.data());
      message.id = doc.id;
      return message;
    }).toList();
  }

  @override
  Stream<List<MessageModel>> streamMessagesByChatId(String chatId) {
    return _db
        .collection("messages")
        .orderBy("created_at")
        .where("chatId", isEqualTo: chatId)
        .snapshots()
        .map((snap) => snap.docs.map((doc) {
              var message = MessageModel.fromJson(doc.data());
              message.id = doc.id;
              debugPrint(message.id);
              return message;
            }).toList());
  }
}
