import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Bottom bar: pill-shaped text field with a green 1px outline, a camera
/// prefix icon, a paper-plane suffix icon and hint text "Type a message...",
/// plus a circular elevated green mic button on the right.
class ChatInputBar extends StatelessWidget {
  final TextEditingController controller;
  final VoidCallback? onSend;
  final VoidCallback? onMic;
  final VoidCallback? onAttach;

  const ChatInputBar({
    super.key,
    required this.controller,
    this.onSend,
    this.onMic,
    this.onAttach,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: SafeArea(
        top: false,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  border: Border.all(color: AppColors.green, width: 1),
                ),
                child: TextField(
                  controller: controller,
                  style: const TextStyle(color: AppColors.white, fontSize: 14),
                  cursorColor: AppColors.green,
                  decoration: InputDecoration(
                    hintText: 'Type a message...',
                    hintStyle: const TextStyle(
                      color: AppColors.white,
                      fontSize: 12,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 12, horizontal: 4),
                    prefixIcon: IconButton(
                      icon: const Icon(Icons.camera_alt_outlined,
                          color: AppColors.white, size: 20),
                      onPressed: onAttach,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send,
                          color: AppColors.white, size: 20),
                      onPressed: onSend,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(width: 8),
            Material(
              color: AppColors.green,
              shape: const CircleBorder(),
              elevation: 3,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: onMic,
                child: const Padding(
                  padding: EdgeInsets.all(12),
                  child: Icon(Icons.mic, color: AppColors.white, size: 22),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
