import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mangayomi/modules/manga/reader/providers/reader_controller_provider.dart';
import 'package:mangayomi/modules/manga/reader/u_chap_data_preload.dart';
import 'package:mangayomi/modules/manga/reader/widgets/chapter_transition_page.dart';
import 'package:mangayomi/utils/extensions/build_context_extensions.dart';

/// Shows the chapter transition page for a transition entry of the page list.
///
/// Paged readers already give each page the full viewport. Scrolling readers
/// (webtoon, continuous) lay pages out in a list, so they pass
/// [fillScreenHeight] to make the transition page as tall as the screen.
class TransitionView extends ConsumerWidget {
  final UChapDataPreload data;
  final bool fillScreenHeight;

  const TransitionView({
    super.key,
    required this.data,
    this.fillScreenHeight = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (!data.isTransitionPage) return const SizedBox.shrink();

    final readerMode = ref
        .read(readerControllerProvider(chapter: data.chapter!).notifier)
        .getReaderMode();

    final page = ChapterTransitionPage(
      currentChapter: data.chapter!,
      nextChapter: data.nextChapter,
      mangaName: data.mangaName ?? '',
      readerMode: readerMode,
    );

    return fillScreenHeight
        ? SizedBox(height: context.height(1), child: page)
        : page;
  }
}
