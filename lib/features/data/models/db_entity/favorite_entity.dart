import 'package:drift/drift.dart';

@DataClassName("Favorite")
class FavoriteEntity extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get productId => integer()();
  TextColumn get name => text()();
}