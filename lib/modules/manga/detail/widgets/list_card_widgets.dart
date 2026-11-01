import 'package:flutter/material.dart';
import 'package:mangayomi/utils/cached_network.dart';
import 'package:mangayomi/utils/constant.dart';
import 'package:mangayomi/utils/design_tokens.dart';
import 'package:mangayomi/utils/extensions/build_context_extensions.dart';

/// A tappable row with a cover on the left and [child] (the text column) next
/// to it. Shared by the recommendation and related-titles lists so the two
/// read as one kind of list.
class ListCoverCard extends StatelessWidget {
  /// Raw cover url. [toImgUrl] stands a blank in for an entry with no poster,
  /// so a missing cover leaves a gap of the right shape instead of collapsing
  /// the row.
  final String coverUrl;
  final VoidCallback onTap;

  /// Nothing is focusable on entry otherwise, so on a TV a remote does nothing
  /// until the user guesses a direction. The first card claims focus.
  final bool autofocus;
  final Widget child;

  const ListCoverCard({
    super.key,
    required this.coverUrl,
    required this.onTap,
    required this.child,
    this.autofocus = false,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        autofocus: autofocus,
        focusColor: context.primaryColor.withValues(alpha: Alphas.focus),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: Image(
                  image: coverProvider(toImgUrl(coverUrl)),
                  width: listCoverWidth,
                  height: listCoverHeight,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(child: child),
            ],
          ),
        ),
      ),
    );
  }
}

/// One tag.
///
/// Filled with the accent when it is the thing the row is here for, tinted
/// otherwise, so a glance down the list finds the medium changes without
/// reading any of the words.
class ListTag extends StatelessWidget {
  final String label;
  final bool filled;
  final bool bold;

  const ListTag({
    super.key,
    required this.label,
    this.filled = false,
    this.bold = false,
  });

  @override
  Widget build(BuildContext context) {
    final accent = context.primaryColor;
    // Computed against the accent rather than the theme, so it stays readable
    // whichever hue the user picked and in either brightness.
    final onAccent = accent.computeLuminance() > 0.5
        ? Colors.black
        : Colors.white;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
      decoration: BoxDecoration(
        color: filled
            ? accent
            : context.textColor.withValues(alpha: Alphas.tint),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: bold ? FontWeight.w800 : FontWeight.w400,
          color: filled
              ? onAccent
              : context.textColor.withValues(alpha: Alphas.secondary),
        ),
      ),
    );
  }
}
