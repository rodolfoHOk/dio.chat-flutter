import 'package:flutter/material.dart';
import 'package:chat_flutter/main.dart';
import 'package:chat_flutter/services/chat_service.dart';
import 'package:chat_flutter/shared/widgets/custom_form_field.dart';

class AddRoomModal extends StatelessWidget {
  const AddRoomModal({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController(text: "");
    var categoryController = TextEditingController(text: "");

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

    return AlertDialog(
      title: const Text("Adicionar sala"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomFormField(
            label: "Nome",
            controller: nameController,
          ),
          const SizedBox(height: 12),
          CustomFormField(
            controller: categoryController,
            label: "Categoria",
          ),
        ],
      ),
      actions: [
        FilledButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Cancelar"),
        ),
        FilledButton(
          onPressed: () async {
            if (nameController.text.trim().length < 3) {
              showErrorMessage("Nome deve ter ao menos 3 caracteres");
              return;
            }
            if (categoryController.text.trim().length < 3) {
              showErrorMessage("Categoria deve ter ao menos 3 caracteres");
              return;
            }
            var chatService = getIt.get<ChatService>();
            await chatService.create(
                nameController.text, categoryController.text);
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
          child: const Text("Criar"),
        ),
      ],
    );
  }
}
