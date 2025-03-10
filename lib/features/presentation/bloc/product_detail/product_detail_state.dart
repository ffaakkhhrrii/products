import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:products/features/domain/entities/product_data.dart';

abstract class ProductDetailState extends Equatable {
  final ProductData? productData;
  final bool? isFavorite;
  final DioException? error;
  const ProductDetailState({this.productData,this.error,this.isFavorite});

  @override
  List<Object?> get props => [productData,error,isFavorite];
}

class ProductsDetailIdle extends ProductDetailState{
  const ProductsDetailIdle();
}

class ProductsDetailLoading extends ProductDetailState{
  const ProductsDetailLoading();
}

class ProductsDetailSuccess extends ProductDetailState{
  const ProductsDetailSuccess(ProductData data,bool? isFavorite): super(productData: data,isFavorite: isFavorite);
}

class ProductsDetailError extends ProductDetailState{
  const ProductsDetailError(DioException error): super(error: error);
}

class FavoriteActionSuccess extends ProductDetailState{
  const FavoriteActionSuccess(bool? isFavorite): super(isFavorite: isFavorite);
}

class FavoriteActionError extends ProductDetailState{
  const FavoriteActionError(DioException error): super(error: error);
}