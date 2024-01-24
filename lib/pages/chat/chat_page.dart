import 'package:chat_flutter/models/chat_model.dart';
import 'package:chat_flutter/models/message_model.dart';
import 'package:chat_flutter/shared/widgets/chat_form.dart';
import 'package:chat_flutter/shared/widgets/chat_message.dart';
import 'package:chat_flutter/shared/widgets/day_separator.dart';
import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  final ChatModel chatModel;

  const ChatPage({super.key, required this.chatModel});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    var chat = widget.chatModel;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Chat: ${chat.name}"),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ChatMessage(
                      messageModel: MessageModel(
                        chatId: "abc123",
                        userId: "123456",
                        nickname: "Nickname 1",
                        text: "Message 1 Test",
                      ),
                      isMe: false,
                    ),
                    DaySeparator(
                      date: DateTime.tryParse("2024-01-23T09:30:00") ??
                          DateTime.now(),
                    ),
                    ChatMessage(
                      messageModel: MessageModel(
                        chatId: "abc123",
                        userId: "567890",
                        nickname: "Nickname 2",
                        text: "Message 2 Test",
                      ),
                      isMe: true,
                    ),
                  ],
                ),
              ),
              const ChatForm(),
            ],
          ),
        ),
      ),
    );
  }
}
