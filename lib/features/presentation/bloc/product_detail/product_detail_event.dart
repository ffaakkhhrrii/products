abstract class ProductDetailEvent {
  const ProductDetailEvent();
}

class GetDetailProduct extends ProductDetailEvent{
  int id;
  GetDetailProduct(this.id);
}