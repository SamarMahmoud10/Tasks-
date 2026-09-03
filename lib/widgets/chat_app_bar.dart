import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Top bar: leading back icon, circular profile picture, bold user name,
/// call / video icons and an overflow menu — all on WhatsApp's green.
class ChatAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String userName;
  final String status;

  const ChatAppBar({
    super.key,
    required this.userName,
    this.status = 'online',
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.green,
      elevation: 0,
      leadingWidth: 40,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back, color: AppColors.white),
        onPressed: () => Navigator.of(context).maybePop(),
      ),
      titleSpacing: 0,
      title: Row(
        children: [
          // Profile picture: circular image placeholder.
          const CircleAvatar(
            radius: 18,
            backgroundColor: AppColors.white,
            child: Icon(Icons.person, color: AppColors.green, size: 22),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  userName,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: AppColors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  status,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.call, color: AppColors.white, size: 20),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.videocam, color: AppColors.white, size: 22),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.more_vert, color: AppColors.white),
          onPressed: () {},
        ),
      ],
    );
  }
}
