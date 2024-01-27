import 'package:chat_flutter/models/message_model.dart';
import 'package:chat_flutter/shared/widgets/chat_message.dart';
import 'package:chat_flutter/shared/widgets/day_separator.dart';
import 'package:flutter/material.dart';

class ChatMessageWithDay extends StatelessWidget {
  final MessageModel messageModel;
  final bool isMe;

  const ChatMessageWithDay(
      {super.key, required this.messageModel, required this.isMe});

  @override
  Widget build(BuildContext context) {
    var date = messageModel.createdAt;

    return Column(
      children: [
        DaySeparator(date: date),
        ChatMessage(messageModel: messageModel, isMe: isMe),
      ],
    );
  }
}
