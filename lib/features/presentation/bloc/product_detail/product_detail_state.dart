import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:products/features/domain/entities/product_data.dart';

abstract class ProductDetailState extends Equatable {
  final ProductData? productData;
  final DioException? error;
  const ProductDetailState({this.productData,this.error});

  @override
  List<Object> get props => [productData!,error!];
}

class ProductsDetailLoading extends ProductDetailState{
  const ProductsDetailLoading();
}

class ProductsDetailSuccess extends ProductDetailState{
  const ProductsDetailSuccess(ProductData data): super(productData: data);
}

class ProductsDetailError extends ProductDetailState{
  const ProductsDetailError(DioException error): super(error: error);
}