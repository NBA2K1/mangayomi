import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mangayomi/models/manga.dart';
import 'package:mangayomi/models/track.dart';
import 'package:mangayomi/models/track_search.dart';
import 'package:mangayomi/modules/manga/detail/providers/track_state_providers.dart';
import 'package:mangayomi/modules/manga/detail/widgets/tracker_search_widget.dart';
import 'package:mangayomi/modules/more/settings/track/providers/track_providers.dart';
import 'package:mangayomi/providers/l10n_providers.dart';
import 'package:mangayomi/utils/extensions/build_context_extensions.dart';
import 'package:mangayomi/utils/constant.dart';
import 'package:mangayomi/utils/date.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:super_sliver_list/super_sliver_list.dart';

class TrackerWidget extends ConsumerStatefulWidget {
  final ItemType itemType;
  final Track trackRes;
  final int mangaId;
  final int syncId;
  final bool hide;
  const TrackerWidget({
    super.key,
    required this.itemType,
    required this.syncId,
    required this.trackRes,
    required this.mangaId,
    this.hide = false,
  });

  @override
  ConsumerState<TrackerWidget> createState() => _TrackerWidgetState();
}

class _TrackerWidgetState extends ConsumerState<TrackerWidget> {
  @override
  initState() {
    super.initState();
    _init();
  }

  /// Notifier of the [trackStateProvider] for [track] (or none, for
  /// [TrackState.setTrackSearch], which resolves the track itself).
  TrackState _tracker(Track? track) => ref.read(
    trackStateProvider(
      track: track,
      itemType: widget.itemType,
      widgetRef: ref,
    ).notifier,
  );

  TrackState get _track => _tracker(widget.trackRes);

  Future<void> _init() async {
    // Yield to microtask queue so initState completes before async work
    await Future(() {});
    final findManga = await _track.findManga();
    if (mounted) {
      ref
          .read(tracksProvider(syncId: widget.syncId).notifier)
          .updateTrackManga(findManga!, widget.itemType);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = l10nLocalizations(context)!;
    final l10nLocale = ref.watch(l10nLocaleStateProvider);
    return Container(
      decoration: BoxDecoration(
        color: context.isLight
            ? Theme.of(context).scaffoldBackgroundColor
            : Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          Row(
            children: [
              if (!widget.hide)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: trackInfos(widget.syncId).$3,
                    ),
                    width: 50,
                    height: 45,
                    child: Image.asset(
                      trackInfos(widget.syncId).$1,
                      height: 30,
                    ),
                  ),
                ),
              Expanded(
                child: _elevatedButton(
                  context,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(20),
                    topLeft: Radius.circular(20),
                  ),
                  onPressed: !widget.hide
                      ? () async {
                          final trackSearch = await trackersSearchDraggableMenu(
                            context,
                            itemType: widget.itemType,
                            track: widget.trackRes,
                          ) as TrackSearch?;
                          if (trackSearch != null) {
                            await _tracker(null).setTrackSearch(
                              trackSearch,
                              widget.mangaId,
                              widget.syncId,
                            );
                          }
                        }
                      : null,
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            widget.trackRes.title!,
                            style: TextStyle(
                              color: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          ref
                              .read(
                                tracksProvider(syncId: widget.syncId).notifier,
                              )
                              .deleteTrackManga(widget.trackRes);
                        },
                        icon: const Icon(Icons.cancel_outlined),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _elevatedButton(
                  context,
                  onPressed: () => _showStatusDialog(context),
                  text: getTrackStatus(
                    toTrackStatus(
                      widget.trackRes.status,
                      widget.itemType,
                      widget.trackRes.syncId!,
                    ),
                    context,
                  ),
                ),
              ),
              Expanded(
                child: _elevatedButton(
                  context,
                  onPressed: () => _showNumberPickerDialog(
                    context,
                    title: widget.itemType == ItemType.manga
                        ? l10n.chapters
                        : l10n.episodes,
                    initialValue: widget.trackRes.lastChapterRead!,
                    maxValue: widget.trackRes.totalChapter != 0
                        ? widget.trackRes.totalChapter!
                        : 10000,
                    onConfirm: (value) =>
                        widget.trackRes.lastChapterRead = value,
                  ),
                  text: widget.trackRes.totalChapter != 0
                      ? "${widget.trackRes.lastChapterRead}/${widget.trackRes.totalChapter}"
                      : "${widget.trackRes.lastChapterRead == 0 ? l10n.not_started : widget.trackRes.lastChapterRead}",
                ),
              ),
              Expanded(
                child: _elevatedButton(
                  context,
                  onPressed: () => _showNumberPickerDialog(
                    context,
                    title: l10n.score,
                    initialValue: widget.trackRes.score!,
                    maxValue: _track.getScoreMaxValue(),
                    step: _track.getScoreStep(),
                    textMapper: (numberText) =>
                        _track.getTextMapper(numberText),
                    onConfirm: (value) => widget.trackRes.score = value,
                  ),
                  text: widget.trackRes.score != 0
                      ? _track.displayScore(widget.trackRes.score!)
                      : l10n.score,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: _elevatedButton(
                  context,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                  ),
                  onPressed: () => _pickDate(
                    l10n.start_date,
                    l10nLocale,
                    (millis) => widget.trackRes.startedReadingDate = millis,
                  ),
                  text: _dateText(
                    widget.trackRes.startedReadingDate,
                    l10n.start_date,
                  ),
                ),
              ),
              Expanded(
                child: _elevatedButton(
                  context,
                  borderRadius: const BorderRadius.only(
                    bottomRight: Radius.circular(20),
                  ),
                  onPressed: () => _pickDate(
                    l10n.finish_date,
                    l10nLocale,
                    (millis) => widget.trackRes.finishedReadingDate = millis,
                  ),
                  text: _dateText(
                    widget.trackRes.finishedReadingDate,
                    l10n.finish_date,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  /// Formats a stored track date, or returns [fallback] when it is unset.
  String _dateText(int? date, String fallback) {
    if (date != null && date > DateTime.utc(1970).millisecondsSinceEpoch) {
      return dateFormat(
        date.toString(),
        ref: ref,
        useRelativeTimesTamps: false,
        context: context,
      );
    }
    return fallback;
  }

  /// Asks for a date and, if one is chosen, stores it through [apply] and
  /// syncs the track.
  Future<void> _pickDate(
    String helpText,
    Locale locale,
    void Function(int millis) apply,
  ) async {
    final newDate = await showDatePicker(
      helpText: helpText,
      locale: locale,
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );
    if (newDate == null) return;
    apply(newDate.millisecondsSinceEpoch);
    _track.updateManga();
  }

  /// Cancel button, plus an OK button when [onOk] is given. [onOk] runs before
  /// the dialog is closed.
  Widget _dialogActions(BuildContext context, {VoidCallback? onOk}) {
    final l10n = l10nLocalizations(context)!;
    Widget button(String label, VoidCallback onPressed) => TextButton(
      onPressed: onPressed,
      child: Text(label, style: TextStyle(color: context.primaryColor)),
    );
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        button(l10n.cancel, () => Navigator.pop(context)),
        if (onOk != null)
          button(l10n.ok, () {
            onOk();
            Navigator.pop(context);
          }),
      ],
    );
  }

  void _showStatusDialog(BuildContext context) {
    final l10n = l10nLocalizations(context)!;
    showDialog(
      context: context,
      builder: (context) {
        final statusList = _track.getStatusList();
        return AlertDialog(
          title: Text(l10n.status),
          content: SizedBox(
            width: context.width(0.8),
            child: RadioGroup(
              groupValue: toTrackStatus(
                widget.trackRes.status,
                widget.itemType,
                widget.trackRes.syncId!,
              ),
              onChanged: (value) {
                // Individual RadioListTile will handle the change
              },
              child: SuperListView.builder(
                shrinkWrap: true,
                itemCount: statusList.length,
                itemBuilder: (context, index) {
                  final status = statusList[index];
                  return RadioListTile(
                    dense: true,
                    contentPadding: const EdgeInsets.all(0),
                    value: status,
                    // ignore: deprecated_member_use
                    onChanged: (value) {
                      _tracker(widget.trackRes..status = status).updateManga();
                      Navigator.pop(context);
                    },
                    title: Text(getTrackStatus(status, context)),
                  );
                },
              ),
            ),
          ),
          actions: [_dialogActions(context)],
        );
      },
    );
  }

  /// Number picker dialog shared by the chapter/episode and score buttons.
  /// [onConfirm] must store the picked value on [Track]; the track is then
  /// synced.
  void _showNumberPickerDialog(
    BuildContext context, {
    required String title,
    required int initialValue,
    required int maxValue,
    required void Function(int value) onConfirm,
    int step = 1,
    String Function(String numberText)? textMapper,
  }) {
    int currentIntValue = initialValue;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: StatefulBuilder(
            builder: (context, setState) => SizedBox(
              height: 200,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  NumberPicker(
                    value: currentIntValue,
                    minValue: 0,
                    maxValue: maxValue,
                    textMapper: textMapper,
                    step: step,
                    haptics: true,
                    onChanged: (value) =>
                        setState(() => currentIntValue = value),
                  ),
                ],
              ),
            ),
          ),
          actions: [
            _dialogActions(
              context,
              onOk: () {
                onConfirm(currentIntValue);
                _track.updateManga();
              },
            ),
          ],
        );
      },
    );
  }
}

Widget _elevatedButton(
  BuildContext context, {
  required Function()? onPressed,
  String text = "",
  Widget? child,
  BorderRadiusGeometry? borderRadius,
}) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.all(0),
      backgroundColor: context.isLight
          ? Theme.of(context).scaffoldBackgroundColor
          : Colors.black,
      elevation: 0,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        side: BorderSide(
          width: 0,
          color: context.secondaryColor.withValues(alpha: 0.1),
        ),
        borderRadius: borderRadius ?? BorderRadius.circular(0),
      ),
    ),
    onPressed: onPressed,
    child:
        child ??
        Text(
          text,
          style: TextStyle(
            color: Theme.of(context).textTheme.bodyMedium!.color!
                .withValues(alpha: 0.9),
          ),
        ),
  );
}
