import 'package:chat_flutter/models/message_model.dart';
import 'package:flutter/material.dart';

class ChatMessage extends StatelessWidget {
  final MessageModel messageModel;
  final bool isMe;

  const ChatMessage(
      {super.key, required this.messageModel, required this.isMe});

  @override
  Widget build(BuildContext context) {
    var date = messageModel.createdAt;
    var formattedTime = "${date.hour}:${date.minute}";

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isMe
              ? Theme.of(context).colorScheme.inversePrimary
              : Theme.of(context).colorScheme.onInverseSurface,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    messageModel.nickname,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    messageModel.text,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              Text(
                formattedTime,
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.w300),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
