import 'package:chat_flutter/models/chat_model.dart';
import 'package:chat_flutter/shared/widgets/add_room_modal.dart';
import 'package:chat_flutter/shared/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<ChatModel> chats = <ChatModel>[];

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    ChatModel chat1 = ChatModel(
      name: "Sala 1 teste",
      category: "Categoria 1 teste",
    );
    ChatModel chat2 = ChatModel(
      name: "Sala 2 teste",
      category: "Categoria 2 teste",
    );
    chats.addAll([chat1, chat2]);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: chats.length,
                  itemBuilder: (builder, index) {
                    return ChatItem(chatModel: chats[index]);
                  },
                ),
              ),
              SizedBox(
                width: 150,
                child: FilledButton(
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (builder) {
                          return const AddRoomModal();
                        });
                  },
                  style: FilledButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.add_circle),
                      SizedBox(width: 4),
                      Text(
                        "Criar sala",
                        style: TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
