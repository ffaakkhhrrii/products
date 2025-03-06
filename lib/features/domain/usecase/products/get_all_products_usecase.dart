import 'package:products/core/resources/data_state.dart';
import 'package:products/core/usecases/usecase.dart';
import 'package:products/features/data/repository/products_repository.dart';
import 'package:products/features/domain/entities/product_data.dart';

class GetAllProductsUsecase implements Usecase<DataState<List<ProductData>>,void> {
  
  final ProductsRepository _productsRepository;

  GetAllProductsUsecase(this._productsRepository);
  
  @override
  Future<DataState<List<ProductData>>> call({void params}) {
    return _productsRepository.getAllProducts();
  }
  
}