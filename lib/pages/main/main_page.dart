import 'package:chat_flutter/shared/widgets/chat_item.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({super.key, required this.title});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
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
          child: const Column(
            children: <Widget>[
              ChatItem(),
            ],
          ),
        ),
      ),
    );
  }
}
