import 'package:flutter/material.dart';
import 'package:chat_flutter/main.dart';
import 'package:chat_flutter/models/chat_model.dart';
import 'package:chat_flutter/services/chat_service.dart';
import 'package:chat_flutter/services/impl/firebase_chat_service.dart';
import 'package:chat_flutter/shared/widgets/add_room_modal.dart';
import 'package:chat_flutter/shared/widgets/chat_item.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late FirebaseChatService chatService;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  void loadData() async {
    chatService = getIt.get<ChatService>() as FirebaseChatService;
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
                child: StreamBuilder<List<ChatModel>>(
                  stream: chatService.streamChats(),
                  builder: (context, snapshot) {
                    return snapshot.hasData
                        ? ListView(
                            children: snapshot.data!
                                .map((chat) => ChatItem(chatModel: chat))
                                .toList(),
                          )
                        : const CircularProgressIndicator();
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
