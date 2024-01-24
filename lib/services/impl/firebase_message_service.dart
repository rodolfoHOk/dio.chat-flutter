import 'package:chat_flutter/models/message_model.dart';
import 'package:chat_flutter/services/message_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
        .where("chatId", isEqualTo: chatId)
        .orderBy("created_at")
        .get();
    return chatMessages.docs.map((doc) {
      var message = MessageModel.fromJson(doc.data());
      message.id = doc.id;
      return message;
    }).toList();
  }
}
