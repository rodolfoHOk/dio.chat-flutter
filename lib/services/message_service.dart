import 'package:chat_flutter/models/message_model.dart';

abstract class MessageService {
  Future<void> create(MessageModel messageModel);

  Future<List<MessageModel>> listByChatId(String chatId);
}
