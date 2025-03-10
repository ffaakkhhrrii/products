import 'package:products/core/resources/data_state.dart';
import 'package:products/features/data/data_sources/local/db/app_database.dart';
import 'package:products/features/data/models/post_request/add_product.dart';
import 'package:products/features/data/models/post_response/basic_post_response.dart';
import 'package:products/features/domain/entities/favorite_data.dart';
import 'package:products/features/domain/entities/product_data.dart';

abstract class ProductInteractor{
    Future<DataState<List<ProductData>>> getAllProducts();
    Future<DataState<ProductData>> getDetailProduct(int id);
    Future<DataState<BasicPostResponse>> addProduct(AddProductRequest request);
    Future<DataState<int>> addFavorite(FavoriteData favorite);
    Future<DataState<bool>> isFavorite(int productId);
    Future<DataState<int>> deleteFavorite(int productId);
    Future<DataState<List<Favorite>>> getAllFavoriteProduct();
    Future<DataState<int>> deleteAllFavorite();
}