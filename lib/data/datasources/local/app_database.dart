import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

part 'app_database.g.dart';

@DataClassName('ArticleEntity')
class Articles extends Table {
  IntColumn get id => integer().autoIncrement()();

  TextColumn get articleId => text()();

  TextColumn get title => text()();

  TextColumn get pubDate => text()();

  TextColumn get description => text()();

  TextColumn get image => text()();

  IntColumn get forPage => integer()();
}

@DriftDatabase(tables: [Articles])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));
    return NativeDatabase(file);
  });
}
