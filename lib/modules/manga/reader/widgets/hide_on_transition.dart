import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

/// Hides [child] while [isTransitionPage] is true.
///
/// Shared by the page counters (overlay and bottom bar) so that none of them
/// shows a page number while a chapter transition page is on screen. [child]
/// is built once and only swapped in and out, not rebuilt, on each change.
class HideOnTransition extends StatelessWidget {
  final ValueListenable<bool> isTransitionPage;
  final Widget child;

  const HideOnTransition({
    super.key,
    required this.isTransitionPage,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: isTransitionPage,
      builder: (context, onTransition, child) =>
          onTransition ? const SizedBox.shrink() : child!,
      child: child,
    );
  }
}
