import 'package:chat_flutter/models/chat_model.dart';
import 'package:chat_flutter/shared/widgets/enter_chat_modal.dart';
import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  final ChatModel chatModel;

  const ChatItem({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        child: SizedBox(
          width: double.maxFinite,
          height: 64,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.chat,
                    color: Colors.teal,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        chatModel.name,
                        style: const TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      Text(
                        chatModel.category,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
              FilledButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (builder) => EnterChatModal(chatModel: chatModel),
                  );
                },
                style: FilledButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.input),
                    SizedBox(width: 8),
                    Text("Entrar"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
