import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../theme/app_colors.dart';
import '../widgets/chat_app_bar.dart';
import '../widgets/chat_input_bar.dart';
import '../widgets/doodle_background.dart';
import '../widgets/message_bubble.dart';

/// The screen has 3 main components, exactly per spec:
///  1. App bar
///  2. Body — the messages list, over a dark doodle-patterned background
///  3. Bottom bar — text field + mic button
class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController _controller = TextEditingController();

  final List<ChatMessage> _messages = const [
    ChatMessage(text: 'Hello!', isMe: false),
    ChatMessage(text: 'Reply?', isMe: true),
    ChatMessage(
      text: "Hey! Have you ever thought about how random moments can "
          "sometimes turn into the best memories? It's like the universe "
          "loves to surprise us when we least expect it!",
      isMe: false,
    ),
    ChatMessage(
      text: '',
      isMe: false,
      hasImage: true,
      imageCaption: 'What a great content! Tips to learn Mobile App',
    ),
    ChatMessage(text: 'What about the Content System Prefer?', isMe: true),
  ];

  void _handleSend() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    setState(() {
      _messages.add(ChatMessage(text: text, isMe: true));
    });
    _controller.clear();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      appBar: const ChatAppBar(userName: 'Ahmed Ali'),
      body: DoodleBackground(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            padding: const EdgeInsets.only(top: 12, bottom: 12),
            itemCount: _messages.length,
            itemBuilder: (context, index) {
              return MessageBubble(message: _messages[index]);
            },
          ),
        ),
      ),
      bottomNavigationBar: ChatInputBar(
        controller: _controller,
        onSend: _handleSend,
        onMic: () {},
        onAttach: () {},
      ),
    );
  }
}
