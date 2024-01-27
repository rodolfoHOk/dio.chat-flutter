import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:get_it/get_it.dart';
import 'package:chat_flutter/main_app.dart';
import 'package:chat_flutter/firebase_options.dart';
import 'package:chat_flutter/services/chat_service.dart';
import 'package:chat_flutter/services/impl/firebase_chat_service.dart';
import 'package:chat_flutter/services/impl/firebase_message_service.dart';
import 'package:chat_flutter/services/message_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  initializeDateFormatting();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  _setup();

  runApp(const MainApp());
}

void _setup() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<ChatService>(
      FirebaseChatService(getIt.get<FirebaseFirestore>()));
  getIt.registerSingleton<MessageService>(
      FirebaseMessageService(getIt.get<FirebaseFirestore>()));
  getIt.registerSingletonAsync<SharedPreferences>(
      () async => await SharedPreferences.getInstance());
}
