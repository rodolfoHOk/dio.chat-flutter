import 'package:chat_flutter/main.dart';
import 'package:chat_flutter/models/message_model.dart';
import 'package:chat_flutter/services/message_service.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:uuid/uuid.dart';

class ChatForm extends StatelessWidget {
  final String chatId;
  final String nickname;
  const ChatForm({super.key, required this.chatId, required this.nickname});

  @override
  Widget build(BuildContext context) {
    var messageController = TextEditingController(text: "");

    void showErrorMessage(String message) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.red,
          content: Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onInverseSurface,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: messageController,
              decoration: const InputDecoration(
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            onPressed: () async {
              if (messageController.text.trim().isEmpty) {
                showErrorMessage("Mensagem está vazia.");
              }
              var preferences = getIt.get<SharedPreferences>();
              var userId = preferences.getString("chat_app:user_id");
              if (userId == null) {
                var uuid = const Uuid();
                userId = uuid.v4();
                await preferences.setString("chat_app:user_id", userId);
              }
              var messageService = getIt.get<MessageService>();
              var message = MessageModel(
                  chatId: chatId,
                  userId: userId,
                  nickname: nickname,
                  text: messageController.text);
              await messageService.create(message);
              messageController.text = "";
            },
            icon: const Icon(Icons.send),
          ),
        ],
      ),
    );
  }
}
