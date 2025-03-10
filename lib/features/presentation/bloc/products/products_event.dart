abstract class ProductsEvent{
  const ProductsEvent();
}

class GetProducts extends ProductsEvent{
  const GetProducts();
}

class LoadMoreProducts extends ProductsEvent{
  const LoadMoreProducts();
}