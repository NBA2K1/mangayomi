import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:mangayomi/modules/more/settings/player/providers/player_state_provider.dart';
import 'package:mangayomi/providers/l10n_providers.dart';
import 'package:mangayomi/providers/storage_provider.dart';
import 'package:mangayomi/utils/extensions/build_context_extensions.dart';
import 'package:mangayomi/utils/mpv_config.dart';
import 'package:mangayomi/utils/platform_utils.dart';

class PlayerAdvancedScreen extends ConsumerStatefulWidget {
  const PlayerAdvancedScreen({super.key});

  @override
  ConsumerState<PlayerAdvancedScreen> createState() =>
      _PlayerAdvancedScreenState();
}

class _PlayerAdvancedScreenState extends ConsumerState<PlayerAdvancedScreen> {
  @override
  Widget build(BuildContext context) {
    final useMpvConfig = ref.watch(useMpvConfigStateProvider);

    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.advanced)),
      body: SingleChildScrollView(
        padding: tvPageInsets,
        child: Column(
          children: [
            SwitchListTile(
              value: useMpvConfig,
              title: Text(context.l10n.enable_mpv),
              subtitle: Text(
                context.l10n.mpv_info,
                style: TextStyle(fontSize: 11, color: context.secondaryColor),
              ),
              onChanged: (value) async {
                if (value && !(await _checkMpvConfig(context))) {
                  return;
                }
                ref.read(useMpvConfigStateProvider.notifier).set(value);
              },
            ),
            ListTile(
              onTap: () {
                _checkMpvConfig(context, redownload: true);
              },
              title: Text(context.l10n.mpv_redownload),
              subtitle: Text(
                context.l10n.mpv_redownload_info,
                style: TextStyle(fontSize: 11, color: context.secondaryColor),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> _checkMpvConfig(
    BuildContext context, {
    bool redownload = false,
  }) async {
    final provider = StorageProvider();
    if (!(await provider.requestPermission())) {
      return false;
    }
    final dir = await provider.getMpvDirectory();
    if (dir == null) return false;
    final filesMissing = await isMpvConfigMissing(dir);
    if ((redownload || filesMissing) && context.mounted) {
      final res = await showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(context.l10n.mpv_download),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(context.l10n.cancel),
                  ),
                  const SizedBox(width: 15),
                  ElevatedButton(
                    onPressed: () async {
                      await installMpvConfig(dir);
                      if (context.mounted) {
                        Navigator.pop(context, "ok");
                      }
                    },
                    child: Text(context.l10n.download),
                  ),
                ],
              ),
            ],
          );
        },
      );
      return res != null && res == "ok";
    }
    return context.mounted;
  }
}
