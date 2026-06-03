// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'categories_local_data_source.dart';

// ignore_for_file: type=lint
class $CategoriesLocalDataSourceTable extends CategoriesLocalDataSource
    with
        TableInfo<
          $CategoriesLocalDataSourceTable,
          CategoriesLocalDataSourceData
        > {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesLocalDataSourceTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<String> icon = GeneratedColumn<String>(
    'icon',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isSelectedMeta = const VerificationMeta(
    'isSelected',
  );
  @override
  late final GeneratedColumn<bool> isSelected = GeneratedColumn<bool>(
    'is_selected',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_selected" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  @override
  List<GeneratedColumn> get $columns => [id, name, icon, isSelected];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories_local_data_source';
  @override
  VerificationContext validateIntegrity(
    Insertable<CategoriesLocalDataSourceData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('icon')) {
      context.handle(
        _iconMeta,
        icon.isAcceptableOrUnknown(data['icon']!, _iconMeta),
      );
    } else if (isInserting) {
      context.missing(_iconMeta);
    }
    if (data.containsKey('is_selected')) {
      context.handle(
        _isSelectedMeta,
        isSelected.isAcceptableOrUnknown(data['is_selected']!, _isSelectedMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoriesLocalDataSourceData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoriesLocalDataSourceData(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      icon: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}icon'],
      )!,
      isSelected: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_selected'],
      )!,
    );
  }

  @override
  $CategoriesLocalDataSourceTable createAlias(String alias) {
    return $CategoriesLocalDataSourceTable(attachedDatabase, alias);
  }
}

class CategoriesLocalDataSourceData extends DataClass
    implements Insertable<CategoriesLocalDataSourceData> {
  final int id;
  final String name;
  final String icon;
  final bool isSelected;
  const CategoriesLocalDataSourceData({
    required this.id,
    required this.name,
    required this.icon,
    required this.isSelected,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['icon'] = Variable<String>(icon);
    map['is_selected'] = Variable<bool>(isSelected);
    return map;
  }

  CategoriesLocalDataSourceCompanion toCompanion(bool nullToAbsent) {
    return CategoriesLocalDataSourceCompanion(
      id: Value(id),
      name: Value(name),
      icon: Value(icon),
      isSelected: Value(isSelected),
    );
  }

  factory CategoriesLocalDataSourceData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriesLocalDataSourceData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      icon: serializer.fromJson<String>(json['icon']),
      isSelected: serializer.fromJson<bool>(json['isSelected']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'icon': serializer.toJson<String>(icon),
      'isSelected': serializer.toJson<bool>(isSelected),
    };
  }

  CategoriesLocalDataSourceData copyWith({
    int? id,
    String? name,
    String? icon,
    bool? isSelected,
  }) => CategoriesLocalDataSourceData(
    id: id ?? this.id,
    name: name ?? this.name,
    icon: icon ?? this.icon,
    isSelected: isSelected ?? this.isSelected,
  );
  CategoriesLocalDataSourceData copyWithCompanion(
    CategoriesLocalDataSourceCompanion data,
  ) {
    return CategoriesLocalDataSourceData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      icon: data.icon.present ? data.icon.value : this.icon,
      isSelected: data.isSelected.present
          ? data.isSelected.value
          : this.isSelected,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesLocalDataSourceData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('isSelected: $isSelected')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, icon, isSelected);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriesLocalDataSourceData &&
          other.id == this.id &&
          other.name == this.name &&
          other.icon == this.icon &&
          other.isSelected == this.isSelected);
}

class CategoriesLocalDataSourceCompanion
    extends UpdateCompanion<CategoriesLocalDataSourceData> {
  final Value<int> id;
  final Value<String> name;
  final Value<String> icon;
  final Value<bool> isSelected;
  const CategoriesLocalDataSourceCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.icon = const Value.absent(),
    this.isSelected = const Value.absent(),
  });
  CategoriesLocalDataSourceCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required String icon,
    this.isSelected = const Value.absent(),
  }) : name = Value(name),
       icon = Value(icon);
  static Insertable<CategoriesLocalDataSourceData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<String>? icon,
    Expression<bool>? isSelected,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (icon != null) 'icon': icon,
      if (isSelected != null) 'is_selected': isSelected,
    });
  }

  CategoriesLocalDataSourceCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<String>? icon,
    Value<bool>? isSelected,
  }) {
    return CategoriesLocalDataSourceCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      icon: icon ?? this.icon,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (icon.present) {
      map['icon'] = Variable<String>(icon.value);
    }
    if (isSelected.present) {
      map['is_selected'] = Variable<bool>(isSelected.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesLocalDataSourceCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('icon: $icon, ')
          ..write('isSelected: $isSelected')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesLocalDataSourceTable categoriesLocalDataSource =
      $CategoriesLocalDataSourceTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    categoriesLocalDataSource,
  ];
}

typedef $$CategoriesLocalDataSourceTableCreateCompanionBuilder =
    CategoriesLocalDataSourceCompanion Function({
      Value<int> id,
      required String name,
      required String icon,
      Value<bool> isSelected,
    });
typedef $$CategoriesLocalDataSourceTableUpdateCompanionBuilder =
    CategoriesLocalDataSourceCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<String> icon,
      Value<bool> isSelected,
    });

class $$CategoriesLocalDataSourceTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesLocalDataSourceTable> {
  $$CategoriesLocalDataSourceTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => ColumnFilters(column),
  );
}

class $$CategoriesLocalDataSourceTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesLocalDataSourceTable> {
  $$CategoriesLocalDataSourceTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get icon => $composableBuilder(
    column: $table.icon,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$CategoriesLocalDataSourceTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesLocalDataSourceTable> {
  $$CategoriesLocalDataSourceTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<bool> get isSelected => $composableBuilder(
    column: $table.isSelected,
    builder: (column) => column,
  );
}

class $$CategoriesLocalDataSourceTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CategoriesLocalDataSourceTable,
          CategoriesLocalDataSourceData,
          $$CategoriesLocalDataSourceTableFilterComposer,
          $$CategoriesLocalDataSourceTableOrderingComposer,
          $$CategoriesLocalDataSourceTableAnnotationComposer,
          $$CategoriesLocalDataSourceTableCreateCompanionBuilder,
          $$CategoriesLocalDataSourceTableUpdateCompanionBuilder,
          (
            CategoriesLocalDataSourceData,
            BaseReferences<
              _$AppDatabase,
              $CategoriesLocalDataSourceTable,
              CategoriesLocalDataSourceData
            >,
          ),
          CategoriesLocalDataSourceData,
          PrefetchHooks Function()
        > {
  $$CategoriesLocalDataSourceTableTableManager(
    _$AppDatabase db,
    $CategoriesLocalDataSourceTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesLocalDataSourceTableFilterComposer(
                $db: db,
                $table: table,
              ),
          createOrderingComposer: () =>
              $$CategoriesLocalDataSourceTableOrderingComposer(
                $db: db,
                $table: table,
              ),
          createComputedFieldComposer: () =>
              $$CategoriesLocalDataSourceTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> icon = const Value.absent(),
                Value<bool> isSelected = const Value.absent(),
              }) => CategoriesLocalDataSourceCompanion(
                id: id,
                name: name,
                icon: icon,
                isSelected: isSelected,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required String icon,
                Value<bool> isSelected = const Value.absent(),
              }) => CategoriesLocalDataSourceCompanion.insert(
                id: id,
                name: name,
                icon: icon,
                isSelected: isSelected,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$CategoriesLocalDataSourceTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CategoriesLocalDataSourceTable,
      CategoriesLocalDataSourceData,
      $$CategoriesLocalDataSourceTableFilterComposer,
      $$CategoriesLocalDataSourceTableOrderingComposer,
      $$CategoriesLocalDataSourceTableAnnotationComposer,
      $$CategoriesLocalDataSourceTableCreateCompanionBuilder,
      $$CategoriesLocalDataSourceTableUpdateCompanionBuilder,
      (
        CategoriesLocalDataSourceData,
        BaseReferences<
          _$AppDatabase,
          $CategoriesLocalDataSourceTable,
          CategoriesLocalDataSourceData
        >,
      ),
      CategoriesLocalDataSourceData,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesLocalDataSourceTableTableManager get categoriesLocalDataSource =>
      $$CategoriesLocalDataSourceTableTableManager(
        _db,
        _db.categoriesLocalDataSource,
      );
}
