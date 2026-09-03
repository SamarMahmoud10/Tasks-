import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';
import 'theme/app_colors.dart';

void main() {
  runApp(const WhatsAppChatApp());
}

class WhatsAppChatApp extends StatelessWidget {
  const WhatsAppChatApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp Chat UI',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.green,
          brightness: Brightness.dark,
        ),
        scaffoldBackgroundColor: AppColors.black,
        fontFamily: 'Roboto',
      ),
      home: const ChatScreen(),
    );
  }
}
