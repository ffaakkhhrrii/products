import 'package:products/features/data/models/post_request/add_product.dart';

abstract class AddProductEvent {
  const AddProductEvent();
}

class PostProduct extends AddProductEvent{
  AddProductRequest request;
  PostProduct(this.request);
}