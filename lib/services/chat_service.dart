import 'package:chat_flutter/models/chat_model.dart';

abstract class ChatService {
  Future<void> create(String name, String category);

  Future<List<ChatModel>> list();

  Stream<List<ChatModel>> streamChats();
}
