import 'package:products/core/resources/data_state.dart';
import 'package:products/features/domain/entities/product_data.dart';

abstract class ProductInteractor{
    Future<DataState<List<ProductData>>> getAllProducts();
    Future<DataState<ProductData>> getDetailProduct(int id);
}