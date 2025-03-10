import 'dart:io';

import 'package:dio/dio.dart';
import 'package:products/core/resources/data_state.dart';
import 'package:products/features/data/data_sources/local/db/app_database.dart';
import 'package:products/features/data/data_sources/remotes/products_api_service.dart';
import 'package:products/features/data/models/post_request/add_product.dart';
import 'package:products/features/data/models/post_response/basic_post_response.dart';
import 'package:products/features/data/models/products_response.dart';
import 'package:products/features/domain/entities/favorite_data.dart';
import 'package:products/features/domain/entities/product_data.dart';
import 'package:products/features/domain/repository/iproducts_repository.dart';

class ProductsRepository implements IProductsRepository{
  final ProductsApiService apiService;
  final AppDatabase database;

  ProductsRepository({required this.apiService,required this.database});
  
  @override
  Future<DataState<List<ProductData>>> getAllProducts() async {
    try{
      final httpResponse = await apiService.getAllProducts();
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
      final httpResponse = await apiService.getDetailProduct(id);
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

  @override
  Future<DataState<BasicPostResponse>> addProduct(AddProductRequest request) async {
    try{
      final response = await apiService.addProduct(request);
      if(response.response.statusCode == HttpStatus.created){
        final data = response.data;
        print("check data ${data}");
        return DataSuccess(data);
      }else{
        print("check data error ${response.response.statusCode}");
        return DataFailed(DioException(
          error: response.response.statusMessage,
          response: response.response,
          type: DioExceptionType.badResponse,
          requestOptions: response.response.requestOptions
        ));
      }
    }on DioException catch(e){
      return DataFailed(e);
    }
  }

  @override
  Future<DataState<int>> addFavorite(FavoriteData favorite) async{
    try{
      final insert = await database.insertFavorite(favorite);
      return DataSuccess(insert);
    }on DioException catch(e){
      return DataFailed(e);
    }
  }
  
  @override
  Future<DataState<int>> deleteFavorite(int productId) async{
    try{
      final delete = await database.deleteFavorite(productId);
      return DataSuccess(delete);
    }on DioException catch(e){
      return DataFailed(e);
    }
  }
  
  @override
  Future<DataState<bool>> isFavorite(int productId) async {
    try{
      final isFavorite = await database.isFavorite(productId);
      return DataSuccess(isFavorite);
    }on DioException catch(e){
      return DataFailed(e);
    }
  }

}