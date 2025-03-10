
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:products/features/data/models/db_entity/favorite_entity.dart';
import 'package:products/features/domain/entities/favorite_data.dart';
import 'package:path/path.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [FavoriteEntity])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<int> insertFavorite(FavoriteData favorite) => into(favoriteEntity).insert(
    FavoriteEntityCompanion.insert(
      name: favorite.nameProduct!,
      productId: favorite.id!
    )
  );

  Future<List<Favorite>> getAllFavorite() => select(favoriteEntity).get();

  Future<bool> isFavorite(int productId) async{
    final result = await (select(favoriteEntity)..where((tb)=> tb.productId.equals(productId))).getSingleOrNull();

    return result != null;
  }

  Future<int> deleteFavorite(int productId){
    return (delete(favoriteEntity)..where((tb)=> tb.productId.equals(productId))).go();
  }
}

LazyDatabase _openConnection(){
  return LazyDatabase(()async{
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(join(dbFolder.path,'app.db'));
    return NativeDatabase.createInBackground(file);
  });
}