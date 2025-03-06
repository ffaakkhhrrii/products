import 'package:products/core/resources/data_state.dart';
import 'package:products/features/domain/entities/product_data.dart';

abstract class IProductsRepository{
    Future<DataState<List<ProductData>>> getAllProducts();
}