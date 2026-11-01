import 'package:flutter/material.dart';
import 'package:mangayomi/modules/manga/reader/widgets/reader_interactive_region.dart';
import 'package:mangayomi/providers/l10n_providers.dart';
import 'package:mangayomi/utils/extensions/build_context_extensions.dart';

/// Error message with a Retry button, shown in place of a page that failed to
/// load. The caller provides the surrounding container (color and size).
class ReaderImageError extends StatelessWidget {
  final VoidCallback onRetry;
  const ReaderImageError({super.key, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    final l10n = l10nLocalizations(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          l10n.image_loading_error,
          style: TextStyle(color: Colors.white.withValues(alpha: 0.7)),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ReaderInteractiveRegion(
            child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: context.primaryColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
              ),
              onPressed: onRetry,
              icon: const Icon(Icons.refresh, size: 18),
              label: Text(l10n.retry),
            ),
          ),
        ),
      ],
    );
  }
}
