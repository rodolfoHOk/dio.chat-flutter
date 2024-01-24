import 'package:chat_flutter/models/chat_model.dart';
import 'package:chat_flutter/services/chat_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseChatService implements ChatService {
  final FirebaseFirestore _db;

  FirebaseChatService(this._db);

  @override
  Future<void> create(String name, String category) async {
    var newChat = ChatModel(name: name, category: category);
    await _db.collection("chats").add(newChat.toJson());
  }

  @override
  Future<List<ChatModel>> list() async {
    var snapshot = await _db.collection("chats").get();
    return snapshot.docs.map((doc) {
      var chat = ChatModel.fromJson(doc.data());
      chat.id = doc.id;
      return chat;
    }).toList();
  }
}
