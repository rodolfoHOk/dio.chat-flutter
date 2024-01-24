import 'package:chat_flutter/models/chat_model.dart';
import 'package:chat_flutter/pages/chat/chat_page.dart';
import 'package:chat_flutter/shared/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class EnterChatModal extends StatelessWidget {
  final ChatModel chatModel;

  const EnterChatModal({super.key, required this.chatModel});

  @override
  Widget build(BuildContext context) {
    var nicknameController = TextEditingController(text: "");

    return AlertDialog(
      title: Text(
        "Entrar na sala: ${chatModel.name}",
        style: const TextStyle(fontSize: 18),
      ),
      content: CustomFormField(
        label: "Digite o nome ou apelido",
        controller: nicknameController,
      ),
      actions: [
        ElevatedButton(
          style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(2),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
        ElevatedButton(
          style: const ButtonStyle(
            elevation: MaterialStatePropertyAll(2),
          ),
          onPressed: () {
            if (nicknameController.text.trim().length > 3) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) => ChatPage(
                      chatModel: chatModel, nickname: nicknameController.text),
                ),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(
                    "Apelido deve ter ao menos 3 caracteres",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            }
          },
          child: const Text("Entrar"),
        ),
      ],
    );
  }
}
