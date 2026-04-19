import 'package:isar_community/isar.dart';
import 'package:mangayomi/models/isar_link_saver.dart';
part 'changed.g.dart';

@collection
@Name("ChangedPart")
class ChangedPart with IsarLinkSaver {
  Id? id;
  @enumerated
  late ActionType actionType;
  int? isarId;
  String data;
  int clientDate;

  ChangedPart({
    this.id = Isar.autoIncrement,
    required this.actionType,
    this.isarId,
    required this.data,
    required this.clientDate,
  });

  Map<String, dynamic> toJson() => {
    'action': actionType.name,
    'isarId': isarId,
    'data': data,
    'clientDate': clientDate,
  };

  @override
  Future<void> saveLinks() async {
    // No IsarLinks to save. Only for compatibility.
  }
}

enum ActionType {
  removeItem,
  removeCategory,
  removeChapter,
  removeHistory,
  removeUpdate,
  removeExtension,
  removeTrack,
}
