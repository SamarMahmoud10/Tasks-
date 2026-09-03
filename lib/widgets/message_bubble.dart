import 'package:flutter/material.dart';
import '../models/chat_message.dart';
import '../theme/app_colors.dart';

/// A single chat bubble.
///
/// Incoming messages: green background, aligned left, radius 16 on every
/// corner except top-left (0).
/// Outgoing messages: dark gray (#232D3D) background, aligned right,
/// radius 16 on every corner except top-right (0).
class MessageBubble extends StatelessWidget {
  final ChatMessage message;

  const MessageBubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    final isMe = message.isMe;
    final bubbleColor = isMe ? AppColors.outgoingBubble : AppColors.green;

    final radius = BorderRadius.only(
      topLeft: Radius.circular(isMe ? 16 : 0),
      topRight: Radius.circular(isMe ? 0 : 16),
      bottomLeft: const Radius.circular(16),
      bottomRight: const Radius.circular(16),
    );

    return Align(
      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        constraints: BoxConstraints(
          maxWidth: MediaQuery.of(context).size.width * 0.75,
        ),
        margin: const EdgeInsets.symmetric(vertical: 4),
        padding: message.hasImage
            ? const EdgeInsets.all(6)
            : const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: bubbleColor,
          borderRadius: radius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (message.hasImage) ...[
              if (message.imageCaption != null)
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 4, 6, 6),
                  child: Text(
                    message.imageCaption!,
                    style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Container(
                  height: 140,
                  width: double.infinity,
                  color: Colors.black26,
                  alignment: Alignment.center,
                  child: const Icon(
                    Icons.image_outlined,
                    color: Colors.white70,
                    size: 40,
                  ),
                ),
              ),
            ] else
              Text(
                message.text,
                style: const TextStyle(
                  color: AppColors.white,
                  fontSize: 16,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
