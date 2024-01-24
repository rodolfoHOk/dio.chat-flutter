import 'package:chat_flutter/shared/widgets/custom_form_field.dart';
import 'package:flutter/material.dart';

class AddRoomModal extends StatelessWidget {
  const AddRoomModal({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController(text: "");
    var categoryController = TextEditingController(text: "");

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
          onPressed: () {},
          child: const Text("Criar"),
        ),
      ],
    );
  }
}
