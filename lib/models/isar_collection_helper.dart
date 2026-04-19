import 'package:isar_community/isar.dart';
import 'package:mangayomi/models/isar_link_saver.dart';

/// Helper extension that mimics the old `putSync` behaviour in async mode.
///
/// `putSync` automatically called `.save()` on all IsarLinks/IsarLinks.
/// In async mode this does **not** happen automatically, so this helper
/// does it for you in a single transaction.
extension IsarCollectionX<T extends IsarLinkSaver> on IsarCollection<T> {
  /// Puts an object and automatically saves all its IsarLinks / IsarLinks
  /// (exactly like `putSync` used to do).
  ///
  /// Use this everywhere instead of `isar.xxx.put(...)`.
  /// Works on models with links **and** on models without links.
  Future<int> putAndSave(T object) async {
    return await isar.writeTxn(() async {
      final id = await put(object);
      await object.saveLinks(); // <- automatically does what putSync did
      return id;
    });
  }

  /// Bulk version of `putAndSave`.
  ///
  /// Use this for `putAll` operations when you want automatic link saving.
  Future<List<int>> putAllAndSave(List<T> objects) async {
    return await isar.writeTxn(() async {
      final ids = await putAll(objects);
      for (final obj in objects) {
        await obj.saveLinks();
      }
      return ids;
    });
  }
}
