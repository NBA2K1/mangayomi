import 'package:flutter/material.dart';
import 'package:mangayomi/models/source.dart';
import 'package:mangayomi/modules/widgets/custom_sliver_grouped_list_view.dart';
import 'package:mangayomi/modules/widgets/extension_server_warning_banner.dart';
import 'package:mangayomi/utils/platform_utils.dart';

/// Bold group title above a section of sources or extensions.
class BrowseSectionHeader extends StatelessWidget {
  final String title;
  const BrowseSectionHeader(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    // The Row keeps the title at the start edge even inside a Column, which
    // would otherwise center a bare Text.
    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Row(
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

/// A section of the Browse lists: [elements] grouped by [groupBy], each group
/// under a [header], sources sorted by name.
Widget browseSourceSection({
  required List<Source> elements,
  required String Function(Source source) groupBy,
  required Widget Function(String group) header,
  required Widget Function(BuildContext context, Source source) itemBuilder,
}) {
  return CustomSliverGroupedListView<Source, String>(
    elements: elements,
    groupBy: groupBy,
    groupSeparatorBuilder: header,
    itemBuilder: itemBuilder,
    groupComparator: (group1, group2) => group1.compareTo(group2),
    itemComparator: (item1, item2) =>
        item1.name?.compareTo(item2.name ?? '') ?? 0,
    order: GroupedListOrder.ASC,
  );
}

/// The scrolling list of a Browse tab: [slivers] under the optional extension
/// server warning, with room at the end for the bottom bar.
class BrowseSourceListView extends StatelessWidget {
  final ScrollController controller;
  final bool showWarning;
  final List<Widget> slivers;

  const BrowseSourceListView({
    super.key,
    required this.controller,
    required this.showWarning,
    required this.slivers,
  });

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      interactive: true,
      controller: controller,
      thickness: 12,
      radius: const Radius.circular(10),
      child: CustomScrollView(
        controller: controller,
        slivers: [
          if (showWarning)
            const SliverToBoxAdapter(child: ExtensionServerWarningBanner()),
          ...slivers,
          // Trailing room rather than padding around the viewport, so rows
          // scroll under the translucent bar (which is what gives it
          // something to blur) and only the last one clears it.
          SliverToBoxAdapter(
            child: SizedBox(height: pageBottomInsets(context).bottom),
          ),
        ],
      ),
    );
  }
}
