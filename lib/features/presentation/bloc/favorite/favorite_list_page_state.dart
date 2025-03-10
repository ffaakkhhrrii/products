import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:products/features/data/data_sources/local/db/app_database.dart';

abstract class FavoriteListPageState extends Equatable {
  final List<Favorite>? data;
  final DioException? error;
  const FavoriteListPageState({this.error,this.data});

  @override
  List<Object?> get props => [data,error];
}

class FavoriteListLoading extends FavoriteListPageState{
  const FavoriteListLoading();
}

class FavoriteListSuccess extends FavoriteListPageState{
  const FavoriteListSuccess(List<Favorite> data): super(data: data);
}

class FavoriteListError extends FavoriteListPageState{
  const FavoriteListError(DioException error):super(error: error);
}

class DeleteAllFavoriteProductSuccess extends FavoriteListPageState{
  const DeleteAllFavoriteProductSuccess();
}

class DeleteAllFavoriteProductError extends FavoriteListPageState{
  const DeleteAllFavoriteProductError(DioException error): super(error: error);
}