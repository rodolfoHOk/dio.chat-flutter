import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chat_flutter/main_app.dart';
import 'package:chat_flutter/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MainApp());
}
