import 'package:products/core/resources/data_state.dart';
import 'package:products/features/data/models/post_request/add_product.dart';
import 'package:products/features/data/models/post_response/basic_post_response.dart';
import 'package:products/features/data/repository/products_repository.dart';
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

}