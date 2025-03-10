import 'package:products/core/resources/data_state.dart';
import 'package:products/features/data/data_sources/local/db/app_database.dart';
import 'package:products/features/data/models/post_request/add_product.dart';
import 'package:products/features/data/models/post_response/basic_post_response.dart';
import 'package:products/features/data/repository/products_repository.dart';
import 'package:products/features/domain/entities/favorite_data.dart';
import 'package:products/features/domain/entities/product_data.dart';
import 'package:products/features/domain/usecase/products/product_interactor.dart';

class ProductUsecase implements ProductInteractor{
  final ProductsRepository productsRepository;

  ProductUsecase(this.productsRepository);

  @override
  Future<DataState<List<ProductData>>> getAllProducts() {
    return productsRepository.getAllProducts();
  }

  @override
  Future<DataState<ProductData>> getDetailProduct(int id) {
    return productsRepository.getDetailProduct(id);
  }

  @override
  Future<DataState<BasicPostResponse>> addProduct(AddProductRequest request) {
    return productsRepository.addProduct(request);
  }

  @override
  Future<DataState<int>> addFavorite(FavoriteData favorite) {
    return productsRepository.addFavorite(favorite);
  }
  
  @override
  Future<DataState<int>> deleteFavorite(int productId) {
    return productsRepository.deleteFavorite(productId);
  }
  
  @override
  Future<DataState<bool>> isFavorite(int productId) {
    return productsRepository.isFavorite(productId);
  }

  @override
  Future<DataState<List<Favorite>>> getAllFavoriteProduct() {
    return productsRepository.getAllFavoriteProduct();
  }
  
  @override
  Future<DataState<int>> deleteAllFavorite() {
    return productsRepository.deleteAllFavorite();
  }

}