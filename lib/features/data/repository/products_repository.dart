import 'dart:io';

import 'package:dio/dio.dart';
import 'package:products/core/resources/data_state.dart';
import 'package:products/features/data/data_sources/remotes/products_api_service.dart';
import 'package:products/features/data/models/products_response.dart';
import 'package:products/features/domain/entities/product_data.dart';
import 'package:products/features/domain/repository/iproducts_repository.dart';

class ProductsRepository implements IProductsRepository{
  final ProductsApiService _apiService;

  ProductsRepository(this._apiService);
  
  @override
  Future<DataState<List<ProductData>>> getAllProducts() async {
    try{
      final httpResponse = await _apiService.getAllProducts();
      if(httpResponse.response.statusCode == HttpStatus.ok){
        final List<Product> response = httpResponse.data.products;
        final productList = response.map((product) => product.toEntity()).toList();
        return DataSuccess(productList);
      }else{
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions
          ));
      }
    }on DioException catch(e){
      return DataFailed(e);
    }
  }
  
  @override
  Future<DataState<ProductData>> getDetailProduct(int id) async {
    try{
      final httpResponse = await _apiService.getDetailProduct(id);
      if(httpResponse.response.statusCode == HttpStatus.ok){
          final productData = httpResponse.data;
          return DataSuccess(productData.toEntity());
      }else{
        return DataFailed(DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions
          ));
      }
    }on DioException catch(e){
      return DataFailed(e);
    }
  }

}