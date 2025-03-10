import 'package:products/features/domain/entities/favorite_data.dart';

abstract class ProductDetailEvent {
  const ProductDetailEvent();
}

class GetDetailProduct extends ProductDetailEvent{
  int id;
  GetDetailProduct(this.id);
}

class AddFavoriteProduct extends ProductDetailEvent{
  FavoriteData favoriteData;
  AddFavoriteProduct(this.favoriteData);
}