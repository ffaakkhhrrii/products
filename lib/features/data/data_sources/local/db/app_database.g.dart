// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $FavoriteEntityTable extends FavoriteEntity
    with TableInfo<$FavoriteEntityTable, Favorite> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $FavoriteEntityTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<int> productId = GeneratedColumn<int>(
      'product_id', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [id, productId, name];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'favorite_entity';
  @override
  VerificationContext validateIntegrity(Insertable<Favorite> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Favorite map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Favorite(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
    );
  }

  @override
  $FavoriteEntityTable createAlias(String alias) {
    return $FavoriteEntityTable(attachedDatabase, alias);
  }
}

class Favorite extends DataClass implements Insertable<Favorite> {
  final int id;
  final int productId;
  final String name;
  const Favorite(
      {required this.id, required this.productId, required this.name});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['product_id'] = Variable<int>(productId);
    map['name'] = Variable<String>(name);
    return map;
  }

  FavoriteEntityCompanion toCompanion(bool nullToAbsent) {
    return FavoriteEntityCompanion(
      id: Value(id),
      productId: Value(productId),
      name: Value(name),
    );
  }

  factory Favorite.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Favorite(
      id: serializer.fromJson<int>(json['id']),
      productId: serializer.fromJson<int>(json['productId']),
      name: serializer.fromJson<String>(json['name']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'productId': serializer.toJson<int>(productId),
      'name': serializer.toJson<String>(name),
    };
  }

  Favorite copyWith({int? id, int? productId, String? name}) => Favorite(
        id: id ?? this.id,
        productId: productId ?? this.productId,
        name: name ?? this.name,
      );
  Favorite copyWithCompanion(FavoriteEntityCompanion data) {
    return Favorite(
      id: data.id.present ? data.id.value : this.id,
      productId: data.productId.present ? data.productId.value : this.productId,
      name: data.name.present ? data.name.value : this.name,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Favorite(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, productId, name);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Favorite &&
          other.id == this.id &&
          other.productId == this.productId &&
          other.name == this.name);
}

class FavoriteEntityCompanion extends UpdateCompanion<Favorite> {
  final Value<int> id;
  final Value<int> productId;
  final Value<String> name;
  const FavoriteEntityCompanion({
    this.id = const Value.absent(),
    this.productId = const Value.absent(),
    this.name = const Value.absent(),
  });
  FavoriteEntityCompanion.insert({
    this.id = const Value.absent(),
    required int productId,
    required String name,
  })  : productId = Value(productId),
        name = Value(name);
  static Insertable<Favorite> custom({
    Expression<int>? id,
    Expression<int>? productId,
    Expression<String>? name,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (productId != null) 'product_id': productId,
      if (name != null) 'name': name,
    });
  }

  FavoriteEntityCompanion copyWith(
      {Value<int>? id, Value<int>? productId, Value<String>? name}) {
    return FavoriteEntityCompanion(
      id: id ?? this.id,
      productId: productId ?? this.productId,
      name: name ?? this.name,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<int>(productId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('FavoriteEntityCompanion(')
          ..write('id: $id, ')
          ..write('productId: $productId, ')
          ..write('name: $name')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $FavoriteEntityTable favoriteEntity = $FavoriteEntityTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [favoriteEntity];
}

typedef $$FavoriteEntityTableCreateCompanionBuilder = FavoriteEntityCompanion
    Function({
  Value<int> id,
  required int productId,
  required String name,
});
typedef $$FavoriteEntityTableUpdateCompanionBuilder = FavoriteEntityCompanion
    Function({
  Value<int> id,
  Value<int> productId,
  Value<String> name,
});

class $$FavoriteEntityTableFilterComposer
    extends Composer<_$AppDatabase, $FavoriteEntityTable> {
  $$FavoriteEntityTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));
}

class $$FavoriteEntityTableOrderingComposer
    extends Composer<_$AppDatabase, $FavoriteEntityTable> {
  $$FavoriteEntityTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));
}

class $$FavoriteEntityTableAnnotationComposer
    extends Composer<_$AppDatabase, $FavoriteEntityTable> {
  $$FavoriteEntityTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<int> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);
}

class $$FavoriteEntityTableTableManager extends RootTableManager<
    _$AppDatabase,
    $FavoriteEntityTable,
    Favorite,
    $$FavoriteEntityTableFilterComposer,
    $$FavoriteEntityTableOrderingComposer,
    $$FavoriteEntityTableAnnotationComposer,
    $$FavoriteEntityTableCreateCompanionBuilder,
    $$FavoriteEntityTableUpdateCompanionBuilder,
    (Favorite, BaseReferences<_$AppDatabase, $FavoriteEntityTable, Favorite>),
    Favorite,
    PrefetchHooks Function()> {
  $$FavoriteEntityTableTableManager(
      _$AppDatabase db, $FavoriteEntityTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$FavoriteEntityTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$FavoriteEntityTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$FavoriteEntityTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<int> productId = const Value.absent(),
            Value<String> name = const Value.absent(),
          }) =>
              FavoriteEntityCompanion(
            id: id,
            productId: productId,
            name: name,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required int productId,
            required String name,
          }) =>
              FavoriteEntityCompanion.insert(
            id: id,
            productId: productId,
            name: name,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$FavoriteEntityTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $FavoriteEntityTable,
    Favorite,
    $$FavoriteEntityTableFilterComposer,
    $$FavoriteEntityTableOrderingComposer,
    $$FavoriteEntityTableAnnotationComposer,
    $$FavoriteEntityTableCreateCompanionBuilder,
    $$FavoriteEntityTableUpdateCompanionBuilder,
    (Favorite, BaseReferences<_$AppDatabase, $FavoriteEntityTable, Favorite>),
    Favorite,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$FavoriteEntityTableTableManager get favoriteEntity =>
      $$FavoriteEntityTableTableManager(_db, _db.favoriteEntity);
}
