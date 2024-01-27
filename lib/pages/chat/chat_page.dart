import 'package:chat_flutter/main.dart';
import 'package:chat_flutter/models/chat_model.dart';
import 'package:chat_flutter/models/message_model.dart';
import 'package:chat_flutter/services/impl/firebase_message_service.dart';
import 'package:chat_flutter/services/message_service.dart';
import 'package:chat_flutter/shared/widgets/chat_form.dart';
import 'package:chat_flutter/shared/widgets/chat_message.dart';
import 'package:chat_flutter/shared/widgets/chat_message_with_day.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatPage extends StatefulWidget {
  final ChatModel chatModel;
  final String nickname;

  const ChatPage({super.key, required this.chatModel, required this.nickname});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  late FirebaseMessageService messageService;

  @override
  void initState() {
    loadMessages();
    super.initState();
  }

  Future<void> loadMessages() async {
    messageService = getIt.get<MessageService>() as FirebaseMessageService;
  }

  @override
  Widget build(BuildContext context) {
    var chat = widget.chatModel;
    var nick = widget.nickname;
    var preferences = getIt.get<SharedPreferences>();
    var userId = preferences.getString("chat_app:user_id");

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
                child: StreamBuilder<List<MessageModel>>(
                  stream: messageService.streamMessagesByChatId(chat.id!),
                  builder: (context, snapshot) {
                    var lastDate = "";
                    return ListView(
                      children: snapshot.hasData
                          ? snapshot.data!.map((message) {
                              bool isMe = message.userId == userId;
                              var formattedDate = DateFormat.yMMMMd("pt-BR")
                                  .format(message.createdAt);
                              if (formattedDate == lastDate) {
                                return ChatMessage(
                                    messageModel: message, isMe: isMe);
                              } else {
                                lastDate = formattedDate;
                                return ChatMessageWithDay(
                                    messageModel: message, isMe: isMe);
                              }
                            }).toList()
                          : [],
                    );
                  },
                ),
              ),
              ChatForm(
                chatId: chat.id!,
                nickname: nick,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
