import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:products/features/domain/entities/product_data.dart';

abstract class ProductsState extends Equatable {
  final List<ProductData>? products;
  final DioException? error;
  final bool? hasMaxReached;
  const ProductsState({this.error,this.products,this.hasMaxReached});

  @override
  List<Object?> get props => [products,error,hasMaxReached];
}

class ProductsLoading extends ProductsState{
  const ProductsLoading();
}

class ProductsSuccess extends ProductsState{
  const ProductsSuccess(List<ProductData> data,bool hasMaxReached): super(products: data,hasMaxReached: hasMaxReached);
}

class ProductsError extends ProductsState{
  const ProductsError(DioException error): super(error: error);
}