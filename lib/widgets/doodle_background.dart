import 'dart:math' as math;
import 'package:flutter/material.dart';
import '../theme/app_colors.dart';

/// Paints a subtle repeating pattern of WhatsApp-themed doodle icons
/// (chat bubbles, phones, cameras, mics, smileys) on the dark chat
/// background, mimicking WhatsApp's real wallpaper.
class DoodleBackground extends StatelessWidget {
  final Widget child;

  const DoodleBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.black,
      child: CustomPaint(
        painter: _DoodlePainter(),
        child: child,
      ),
    );
  }
}

class _DoodlePainter extends CustomPainter {
  static const List<IconData> _icons = [
    Icons.chat_bubble_outline,
    Icons.call_outlined,
    Icons.camera_alt_outlined,
    Icons.mic_none,
    Icons.emoji_emotions_outlined,
    Icons.videocam_outlined,
    Icons.image_outlined,
    Icons.location_on_outlined,
  ];

  @override
  void paint(Canvas canvas, Size size) {
    const double cell = 56;
    final paint = Paint()..color = AppColors.doodle;

    final cols = (size.width / cell).ceil() + 1;
    final rows = (size.height / cell).ceil() + 1;

    var iconIndex = 0;
    for (var row = 0; row < rows; row++) {
      for (var col = 0; col < cols; col++) {
        final dx = col * cell + (row.isOdd ? cell / 2 : 0);
        final dy = row * cell * 0.9;

        final icon = _icons[iconIndex % _icons.length];
        iconIndex++;

        final tp = TextPainter(
          text: TextSpan(
            text: String.fromCharCode(icon.codePoint),
            style: TextStyle(
              fontSize: 20,
              fontFamily: icon.fontFamily,
              package: icon.fontPackage,
              color: paint.color,
            ),
          ),
          textDirection: TextDirection.ltr,
        )..layout();

        // Slight rotation per-tile keeps the pattern from feeling too rigid.
        final angle = ((row + col) % 2 == 0) ? -0.1 : 0.1;
        canvas.save();
        canvas.translate(dx + tp.width / 2, dy + tp.height / 2);
        canvas.rotate(angle * math.pi);
        canvas.translate(-tp.width / 2, -tp.height / 2);
        tp.paint(canvas, Offset.zero);
        canvas.restore();
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
