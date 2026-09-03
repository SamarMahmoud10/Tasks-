/// Simple data model representing a single chat bubble.
class ChatMessage {
  final String text;
  final bool isMe;
  final bool hasImage;
  final String? imageCaption;

  const ChatMessage({
    required this.text,
    required this.isMe,
    this.hasImage = false,
    this.imageCaption,
  });
}
