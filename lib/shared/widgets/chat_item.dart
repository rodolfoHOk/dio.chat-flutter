import 'package:flutter/material.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({super.key});

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
              const Text(
                "Chat name",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              FilledButton(
                onPressed: () {},
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
