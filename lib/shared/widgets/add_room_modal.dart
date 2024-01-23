import 'package:flutter/material.dart';

class AddRoomModal extends StatelessWidget {
  const AddRoomModal({super.key});

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController(text: "");
    var categoryController = TextEditingController(text: "");

    return AlertDialog(
      title: const Text("Adicionar sala"),
      content: Wrap(
        children: [
          TextFormField(
            controller: nameController,
            decoration: const InputDecoration(
              labelText: "Nome:",
            ),
          ),
          TextFormField(
            controller: categoryController,
            decoration: const InputDecoration(
              labelText: "Categoria:",
            ),
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
