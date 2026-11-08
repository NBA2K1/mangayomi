import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/// Text that is cut off after [maxLines] and toggles between collapsed and
/// expanded when it, or the arrow below it, is tapped.
class ExpandableText extends StatefulWidget {
  const ExpandableText(
    this.text, {
    super.key,
    this.expanded = false,
    this.onExpandedChanged,
    this.maxLines = 2,
    this.animationDuration = const Duration(milliseconds: 200),
  }) : assert(maxLines > 0);

  final String text;
  final bool expanded;
  final ValueChanged<bool>? onExpandedChanged;
  final int maxLines;
  final Duration animationDuration;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  late bool _expanded = widget.expanded;
  late final TapGestureRecognizer _toggleRecognizer = TapGestureRecognizer()
    ..onTap = _toggle;

  @override
  void dispose() {
    _toggleRecognizer.dispose();
    super.dispose();
  }

  void _toggle() {
    final toggledExpanded = !_expanded;

    setState(() => _expanded = toggledExpanded);

    widget.onExpandedChanged?.call(toggledExpanded);
  }

  @override
  Widget build(BuildContext context) {
    final defaultTextStyle = DefaultTextStyle.of(context);
    final textStyle = defaultTextStyle.style;

    // Follows the cut-off text. It is laid out but invisible: it only reserves
    // the room the cut has to leave.
    final link = TextSpan(
      children: [
        if (!_expanded)
          TextSpan(
            text: '\u2026 ',
            style: textStyle.copyWith(color: Colors.transparent),
            recognizer: _toggleRecognizer,
          ),
      ],
    );

    final content = TextSpan(text: widget.text, style: textStyle);

    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        assert(constraints.hasBoundedWidth);
        final double maxWidth = constraints.maxWidth;

        final textAlign = defaultTextStyle.textAlign ?? TextAlign.start;
        final textDirection = Directionality.of(context);
        final textScaler = MediaQuery.textScalerOf(context);
        final locale = Localizations.maybeLocaleOf(context);

        final textPainter = TextPainter(
          text: link,
          textAlign: textAlign,
          textDirection: textDirection,
          textScaler: textScaler,
          maxLines: widget.maxLines,
          locale: locale,
        );
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final linkSize = textPainter.size;

        textPainter.text = content;
        textPainter.layout(minWidth: constraints.minWidth, maxWidth: maxWidth);
        final textSize = textPainter.size;

        final bool hasExceededMaxLines = textPainter.didExceedMaxLines;

        TextSpan textSpan;
        if (hasExceededMaxLines) {
          final position = textPainter.getPositionForOffset(
            Offset(textSize.width - linkSize.width, textSize.height),
          );
          final endOffset = textPainter.getOffsetBefore(position.offset) ?? 0;

          textSpan = TextSpan(
            style: textStyle,
            children: <TextSpan>[
              TextSpan(
                text: _expanded
                    ? widget.text
                    : widget.text.substring(0, max(endOffset, 0)),
                recognizer: _toggleRecognizer,
              ),
              link,
            ],
          );
        } else {
          textSpan = content;
        }

        final textWidget = AnimatedSize(
          duration: widget.animationDuration,
          curve: Curves.fastLinearToSlowEaseIn,
          alignment: Alignment.topLeft,
          child: SelectableText.rich(
            textSpan,
            textDirection: textDirection,
            textAlign: textAlign,
            textScaler: textScaler,
            onTap: _toggle,
          ),
        );

        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            textWidget,
            if (hasExceededMaxLines)
              GestureDetector(
                onTap: _toggle,
                child: SizedBox(
                  height: 20,
                  child: Icon(
                    _expanded
                        ? Icons.keyboard_arrow_up_sharp
                        : Icons.keyboard_arrow_down_sharp,
                    color: Theme.of(context).iconTheme.color,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
