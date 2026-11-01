import 'package:flutter/material.dart';
import 'package:marquee/marquee.dart';

/// Single-line text that scrolls horizontally instead of being cut off.
class MarqueeText extends StatelessWidget {
  final String text;
  final TextStyle style;
  const MarqueeText({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: Marquee(
        text: text,
        style: style,
        blankSpace: 40.0,
        velocity: 30.0,
        pauseAfterRound: const Duration(seconds: 1),
        startPadding: 10.0,
      ),
    );
  }
}

/// Single-line text that is ellipsized when it fits and scrolls
/// ([MarqueeText]) when it does not.
class OverflowMarqueeText extends StatelessWidget {
  final String text;
  final TextStyle style;

  /// Width next to the text that is not part of the available width, for
  /// example a trailing icon: the text is measured against the available
  /// width minus this.
  final double reservedWidth;

  /// Narrower than this, the text is ellipsized even when it overflows, since
  /// a marquee in a few pixels is unreadable.
  final double minMarqueeWidth;

  const OverflowMarqueeText({
    super.key,
    required this.text,
    required this.style,
    this.reservedWidth = 0,
    this.minMarqueeWidth = 0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (width <= 0) return const SizedBox.shrink();
        final measureWidth = width - reservedWidth;
        final textPainter = TextPainter(
          text: TextSpan(text: text, style: style),
          maxLines: 1,
          textDirection: TextDirection.ltr,
        )..layout(maxWidth: measureWidth > 0 ? measureWidth : 1.0);

        if (textPainter.didExceedMaxLines && width > minMarqueeWidth) {
          return MarqueeText(text: text, style: style);
        }
        return Text(text, style: style, overflow: TextOverflow.ellipsis);
      },
    );
  }
}
