import 'package:isar_community/isar.dart';
import 'package:mangayomi/models/chapter.dart';
import 'package:mangayomi/models/isar_link_saver.dart';

part 'download.g.dart';

@collection
@Name("Download")
class Download with IsarLinkSaver {
  Id? id;

  int? succeeded;

  int? failed;

  int? total;

  bool? isDownload;

  bool? isStartDownload;

  final chapter = IsarLink<Chapter>();

  Download({
    this.id = 0,
    required this.succeeded,
    required this.failed,
    required this.total,
    required this.isDownload,
    required this.isStartDownload,
  });
  Download.fromJson(Map<String, dynamic> json) {
    failed = json['failed'];
    id = json['id'];
    isDownload = json['isDownload'];
    isStartDownload = json['isStartDownload'];
    succeeded = json['succeeded'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() => {
    'failed': failed,
    'id': id,
    'isDownload': isDownload,
    'isStartDownload': isStartDownload,
    'succeeded': succeeded,
    'total': total,
  };

  @override
  Future<void> saveLinks() async {
    await chapter.save();
  }
}
