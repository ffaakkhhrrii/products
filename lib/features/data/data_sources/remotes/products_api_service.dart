import 'package:dio/dio.dart';
import 'package:products/core/constants/constants.dart';
import 'package:products/features/data/models/products_response.dart';
import 'package:retrofit/retrofit.dart';
part 'products_api_service.g.dart';

@RestApi(baseUrl: url)
abstract class ProductsApiService {
  factory ProductsApiService(Dio dio) = _ProductsApiService;

  @GET("products")
  Future<HttpResponse<ProductsResponse>> getAllProducts();

  @GET("products/{id}")
  Future<HttpResponse<Product>> getDetailProduct(@Path("id") int id);
}