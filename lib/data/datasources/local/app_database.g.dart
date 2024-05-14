// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ArticlesTable extends Articles
    with TableInfo<$ArticlesTable, ArticleEntity> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ArticlesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _articleIdMeta =
      const VerificationMeta('articleId');
  @override
  late final GeneratedColumn<String> articleId = GeneratedColumn<String>(
      'article_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
      'title', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _pubDateMeta =
      const VerificationMeta('pubDate');
  @override
  late final GeneratedColumn<String> pubDate = GeneratedColumn<String>(
      'pub_date', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _forPageMeta =
      const VerificationMeta('forPage');
  @override
  late final GeneratedColumn<int> forPage = GeneratedColumn<int>(
      'for_page', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, articleId, title, pubDate, description, image, forPage];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'articles';
  @override
  VerificationContext validateIntegrity(Insertable<ArticleEntity> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('article_id')) {
      context.handle(_articleIdMeta,
          articleId.isAcceptableOrUnknown(data['article_id']!, _articleIdMeta));
    } else if (isInserting) {
      context.missing(_articleIdMeta);
    }
    if (data.containsKey('title')) {
      context.handle(
          _titleMeta, title.isAcceptableOrUnknown(data['title']!, _titleMeta));
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('pub_date')) {
      context.handle(_pubDateMeta,
          pubDate.isAcceptableOrUnknown(data['pub_date']!, _pubDateMeta));
    } else if (isInserting) {
      context.missing(_pubDateMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    } else if (isInserting) {
      context.missing(_descriptionMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    } else if (isInserting) {
      context.missing(_imageMeta);
    }
    if (data.containsKey('for_page')) {
      context.handle(_forPageMeta,
          forPage.isAcceptableOrUnknown(data['for_page']!, _forPageMeta));
    } else if (isInserting) {
      context.missing(_forPageMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ArticleEntity map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ArticleEntity(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      articleId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}article_id'])!,
      title: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}title'])!,
      pubDate: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}pub_date'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image'])!,
      forPage: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}for_page'])!,
    );
  }

  @override
  $ArticlesTable createAlias(String alias) {
    return $ArticlesTable(attachedDatabase, alias);
  }
}

class ArticleEntity extends DataClass implements Insertable<ArticleEntity> {
  final int id;
  final String articleId;
  final String title;
  final String pubDate;
  final String description;
  final String image;
  final int forPage;
  const ArticleEntity(
      {required this.id,
      required this.articleId,
      required this.title,
      required this.pubDate,
      required this.description,
      required this.image,
      required this.forPage});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['article_id'] = Variable<String>(articleId);
    map['title'] = Variable<String>(title);
    map['pub_date'] = Variable<String>(pubDate);
    map['description'] = Variable<String>(description);
    map['image'] = Variable<String>(image);
    map['for_page'] = Variable<int>(forPage);
    return map;
  }

  ArticlesCompanion toCompanion(bool nullToAbsent) {
    return ArticlesCompanion(
      id: Value(id),
      articleId: Value(articleId),
      title: Value(title),
      pubDate: Value(pubDate),
      description: Value(description),
      image: Value(image),
      forPage: Value(forPage),
    );
  }

  factory ArticleEntity.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ArticleEntity(
      id: serializer.fromJson<int>(json['id']),
      articleId: serializer.fromJson<String>(json['articleId']),
      title: serializer.fromJson<String>(json['title']),
      pubDate: serializer.fromJson<String>(json['pubDate']),
      description: serializer.fromJson<String>(json['description']),
      image: serializer.fromJson<String>(json['image']),
      forPage: serializer.fromJson<int>(json['forPage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'articleId': serializer.toJson<String>(articleId),
      'title': serializer.toJson<String>(title),
      'pubDate': serializer.toJson<String>(pubDate),
      'description': serializer.toJson<String>(description),
      'image': serializer.toJson<String>(image),
      'forPage': serializer.toJson<int>(forPage),
    };
  }

  ArticleEntity copyWith(
          {int? id,
          String? articleId,
          String? title,
          String? pubDate,
          String? description,
          String? image,
          int? forPage}) =>
      ArticleEntity(
        id: id ?? this.id,
        articleId: articleId ?? this.articleId,
        title: title ?? this.title,
        pubDate: pubDate ?? this.pubDate,
        description: description ?? this.description,
        image: image ?? this.image,
        forPage: forPage ?? this.forPage,
      );
  @override
  String toString() {
    return (StringBuffer('ArticleEntity(')
          ..write('id: $id, ')
          ..write('articleId: $articleId, ')
          ..write('title: $title, ')
          ..write('pubDate: $pubDate, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('forPage: $forPage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, articleId, title, pubDate, description, image, forPage);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ArticleEntity &&
          other.id == this.id &&
          other.articleId == this.articleId &&
          other.title == this.title &&
          other.pubDate == this.pubDate &&
          other.description == this.description &&
          other.image == this.image &&
          other.forPage == this.forPage);
}

class ArticlesCompanion extends UpdateCompanion<ArticleEntity> {
  final Value<int> id;
  final Value<String> articleId;
  final Value<String> title;
  final Value<String> pubDate;
  final Value<String> description;
  final Value<String> image;
  final Value<int> forPage;
  const ArticlesCompanion({
    this.id = const Value.absent(),
    this.articleId = const Value.absent(),
    this.title = const Value.absent(),
    this.pubDate = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.forPage = const Value.absent(),
  });
  ArticlesCompanion.insert({
    this.id = const Value.absent(),
    required String articleId,
    required String title,
    required String pubDate,
    required String description,
    required String image,
    required int forPage,
  })  : articleId = Value(articleId),
        title = Value(title),
        pubDate = Value(pubDate),
        description = Value(description),
        image = Value(image),
        forPage = Value(forPage);
  static Insertable<ArticleEntity> custom({
    Expression<int>? id,
    Expression<String>? articleId,
    Expression<String>? title,
    Expression<String>? pubDate,
    Expression<String>? description,
    Expression<String>? image,
    Expression<int>? forPage,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (articleId != null) 'article_id': articleId,
      if (title != null) 'title': title,
      if (pubDate != null) 'pub_date': pubDate,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (forPage != null) 'for_page': forPage,
    });
  }

  ArticlesCompanion copyWith(
      {Value<int>? id,
      Value<String>? articleId,
      Value<String>? title,
      Value<String>? pubDate,
      Value<String>? description,
      Value<String>? image,
      Value<int>? forPage}) {
    return ArticlesCompanion(
      id: id ?? this.id,
      articleId: articleId ?? this.articleId,
      title: title ?? this.title,
      pubDate: pubDate ?? this.pubDate,
      description: description ?? this.description,
      image: image ?? this.image,
      forPage: forPage ?? this.forPage,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (articleId.present) {
      map['article_id'] = Variable<String>(articleId.value);
    }
    if (title.present) {
      map['title'] = Variable<String>(title.value);
    }
    if (pubDate.present) {
      map['pub_date'] = Variable<String>(pubDate.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (forPage.present) {
      map['for_page'] = Variable<int>(forPage.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ArticlesCompanion(')
          ..write('id: $id, ')
          ..write('articleId: $articleId, ')
          ..write('title: $title, ')
          ..write('pubDate: $pubDate, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('forPage: $forPage')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  _$AppDatabaseManager get managers => _$AppDatabaseManager(this);
  late final $ArticlesTable articles = $ArticlesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [articles];
}

typedef $$ArticlesTableInsertCompanionBuilder = ArticlesCompanion Function({
  Value<int> id,
  required String articleId,
  required String title,
  required String pubDate,
  required String description,
  required String image,
  required int forPage,
});
typedef $$ArticlesTableUpdateCompanionBuilder = ArticlesCompanion Function({
  Value<int> id,
  Value<String> articleId,
  Value<String> title,
  Value<String> pubDate,
  Value<String> description,
  Value<String> image,
  Value<int> forPage,
});

class $$ArticlesTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ArticlesTable,
    ArticleEntity,
    $$ArticlesTableFilterComposer,
    $$ArticlesTableOrderingComposer,
    $$ArticlesTableProcessedTableManager,
    $$ArticlesTableInsertCompanionBuilder,
    $$ArticlesTableUpdateCompanionBuilder> {
  $$ArticlesTableTableManager(_$AppDatabase db, $ArticlesTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          filteringComposer:
              $$ArticlesTableFilterComposer(ComposerState(db, table)),
          orderingComposer:
              $$ArticlesTableOrderingComposer(ComposerState(db, table)),
          getChildManagerBuilder: (p) =>
              $$ArticlesTableProcessedTableManager(p),
          getUpdateCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            Value<String> articleId = const Value.absent(),
            Value<String> title = const Value.absent(),
            Value<String> pubDate = const Value.absent(),
            Value<String> description = const Value.absent(),
            Value<String> image = const Value.absent(),
            Value<int> forPage = const Value.absent(),
          }) =>
              ArticlesCompanion(
            id: id,
            articleId: articleId,
            title: title,
            pubDate: pubDate,
            description: description,
            image: image,
            forPage: forPage,
          ),
          getInsertCompanionBuilder: ({
            Value<int> id = const Value.absent(),
            required String articleId,
            required String title,
            required String pubDate,
            required String description,
            required String image,
            required int forPage,
          }) =>
              ArticlesCompanion.insert(
            id: id,
            articleId: articleId,
            title: title,
            pubDate: pubDate,
            description: description,
            image: image,
            forPage: forPage,
          ),
        ));
}

class $$ArticlesTableProcessedTableManager extends ProcessedTableManager<
    _$AppDatabase,
    $ArticlesTable,
    ArticleEntity,
    $$ArticlesTableFilterComposer,
    $$ArticlesTableOrderingComposer,
    $$ArticlesTableProcessedTableManager,
    $$ArticlesTableInsertCompanionBuilder,
    $$ArticlesTableUpdateCompanionBuilder> {
  $$ArticlesTableProcessedTableManager(super.$state);
}

class $$ArticlesTableFilterComposer
    extends FilterComposer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableFilterComposer(super.$state);
  ColumnFilters<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get articleId => $state.composableBuilder(
      column: $state.table.articleId,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get pubDate => $state.composableBuilder(
      column: $state.table.pubDate,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));

  ColumnFilters<int> get forPage => $state.composableBuilder(
      column: $state.table.forPage,
      builder: (column, joinBuilders) =>
          ColumnFilters(column, joinBuilders: joinBuilders));
}

class $$ArticlesTableOrderingComposer
    extends OrderingComposer<_$AppDatabase, $ArticlesTable> {
  $$ArticlesTableOrderingComposer(super.$state);
  ColumnOrderings<int> get id => $state.composableBuilder(
      column: $state.table.id,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get articleId => $state.composableBuilder(
      column: $state.table.articleId,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get title => $state.composableBuilder(
      column: $state.table.title,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get pubDate => $state.composableBuilder(
      column: $state.table.pubDate,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get description => $state.composableBuilder(
      column: $state.table.description,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<String> get image => $state.composableBuilder(
      column: $state.table.image,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));

  ColumnOrderings<int> get forPage => $state.composableBuilder(
      column: $state.table.forPage,
      builder: (column, joinBuilders) =>
          ColumnOrderings(column, joinBuilders: joinBuilders));
}

class _$AppDatabaseManager {
  final _$AppDatabase _db;
  _$AppDatabaseManager(this._db);
  $$ArticlesTableTableManager get articles =>
      $$ArticlesTableTableManager(_db, _db.articles);
}
