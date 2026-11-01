import 'package:flutter/material.dart';
import 'package:flutter_qjs/quickjs/ffi.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mangayomi/modules/more/settings/browse/providers/browse_state_provider.dart';
import 'package:mangayomi/models/manga.dart';
import 'package:mangayomi/models/source.dart';
import 'package:mangayomi/modules/browse/extension/providers/extensions_provider.dart';
import 'package:mangayomi/services/fetch_item_sources.dart';
import 'package:mangayomi/modules/widgets/progress_center.dart';
import 'package:mangayomi/providers/l10n_providers.dart';
import 'package:mangayomi/services/fetch_sources_list.dart';
import 'package:mangayomi/utils/language.dart';
import 'package:mangayomi/modules/browse/extension/widgets/extension_list_tile_widget.dart';
import 'package:mangayomi/modules/browse/widgets/browse_list_widgets.dart';
import 'package:mangayomi/utils/platform_utils.dart';

class ExtensionScreen extends ConsumerStatefulWidget {
  final ItemType itemType;
  final String query;
  const ExtensionScreen({
    required this.query,
    required this.itemType,
    super.key,
  });

  @override
  ConsumerState<ExtensionScreen> createState() => _ExtensionScreenState();
}

class _ExtensionScreenState extends ConsumerState<ExtensionScreen> {
  final ScrollController controller = ScrollController();
  bool isUpdating = false;
  Future<void> _refreshSources() {
    return ref.refresh(
      fetchItemSourcesListProvider(
        id: null,
        reFresh: true,
        itemType: widget.itemType,
      ).future,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _updateSource(Source source) {
    final provider = fetchItemSourcesListProvider(
      id: source.id,
      reFresh: true,
      itemType: source.itemType,
    );
    ref.invalidate(provider);
    return ref.read(provider.future);
  }

  @override
  Widget build(BuildContext context) {
    ref.read(
      fetchItemSourcesListProvider(
        id: null,
        reFresh: false,
        itemType: widget.itemType,
      ),
    );

    final streamExtensions = ref.watch(
      getExtensionsStreamProvider(widget.itemType),
    );
    final repositories = ref.watch(
      extensionsRepoStateProvider(widget.itemType),
    );
    final showNSFW = ref.watch(showNSFWStateProvider);

    final l10n = l10nLocalizations(context)!;
    final tvHorizontalInset = tvHorizontalSafeInset(context);

    return RefreshIndicator(
      onRefresh: _refreshSources,
      child: Padding(
        // Match the sources tab's inset so the two Browse tabs line up on TV.
        padding: EdgeInsets.only(
          top: 10,
          left: tvHorizontalInset,
          right: tvHorizontalInset,
        ),
        child: streamExtensions.when(
          data: (data) {
            final filteredData = widget.query.isEmpty
                ? data
                : data
                      .where(
                        (element) =>
                            element.name?.toLowerCase().contains(
                              widget.query.toLowerCase(),
                            ) ??
                            false,
                      )
                      .toList();

            final updateEntries = <Source>[];
            final installedEntries = <Source>[];
            final notInstalledEntries = <Source>[];
            var showWarning = false;

            for (var element in filteredData) {
              if (repositories
                      .firstWhereOrNull((e) => e == element.repo)
                      ?.hidden ??
                  false) {
                continue;
              }
              if (!showNSFW && (element.isNsfw ?? false)) {
                continue;
              }
              if (element.sourceCodeLanguage == SourceCodeLanguage.mihon) {
                showWarning = true;
              }
              final isInstalled = element.isAdded ?? false;
              final hasUpdate =
                  isInstalled &&
                  !(element.isObsolete ?? false) &&
                  compareVersions(
                        element.version ?? '',
                        element.versionLast ?? '',
                      ) <
                      0;

              if (hasUpdate) {
                updateEntries.add(element);
              } else if (isInstalled) {
                installedEntries.add(element);
              } else {
                notInstalledEntries.add(element);
              }
            }

            return BrowseSourceListView(
              controller: controller,
              showWarning: showWarning,
              slivers: [
                if (updateEntries.isNotEmpty)
                  _buildUpdateSection(updateEntries, l10n),
                if (installedEntries.isNotEmpty)
                  _buildInstalledSection(installedEntries, l10n),
                if (notInstalledEntries.isNotEmpty)
                  _buildNotInstalledSection(notInstalledEntries),
              ],
            );
          },
          error: (error, _) => Center(
            child: ElevatedButton(
              onPressed: _refreshSources,
              child: Text(context.l10n.refresh),
            ),
          ),
          loading: () => const ProgressCenter(),
        ),
      ),
    );
  }

  Widget _buildUpdateSection(List<Source> updateEntries, dynamic l10n) {
    return browseSourceSection(
      elements: updateEntries,
      groupBy: (_) => "",
      header: (_) => StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  l10n.update_pending,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                ElevatedButton(
                  onPressed: isUpdating
                      ? null
                      : () async {
                          setState(() => isUpdating = true);
                          try {
                            for (var source in updateEntries) {
                              await _updateSource(source);
                            }
                          } finally {
                            if (context.mounted) {
                              setState(() => isUpdating = false);
                            }
                          }
                        },
                  child: isUpdating
                      ? const SizedBox(
                          width: 16,
                          height: 16,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        )
                      : Text(l10n.update_all),
                ),
              ],
            ),
          );
        },
      ),
      itemBuilder: (context, element) =>
          ExtensionListTileWidget(key: ValueKey(element.id), source: element),
    );
  }

  Widget _buildInstalledSection(List<Source> installedEntries, dynamic l10n) {
    return browseSourceSection(
      elements: installedEntries,
      groupBy: (_) => "",
      header: (_) => BrowseSectionHeader(l10n.installed),
      itemBuilder: (context, element) =>
          ExtensionListTileWidget(key: ValueKey(element.id), source: element),
    );
  }

  Widget _buildNotInstalledSection(List<Source> notInstalledEntries) {
    return browseSourceSection(
      elements: notInstalledEntries,
      groupBy: (element) =>
          completeLanguageName(element.lang?.toLowerCase() ?? ''),
      header: (group) => BrowseSectionHeader(group),
      itemBuilder: (context, element) =>
          ExtensionListTileWidget(key: ValueKey(element.id), source: element),
    );
  }
}
