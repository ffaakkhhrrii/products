import 'package:go_router/go_router.dart';
import 'package:products/features/presentation/pages/add_product/add_product_page.dart';
import 'package:products/features/presentation/pages/detail/product_detail.dart';
import 'package:products/features/presentation/pages/home/products_list.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context,state) => const ProductsList()
    ),
    GoRoute(
      path: '/detail/:id',
      builder: (context,state) {
        final idProduct = state.pathParameters['id'];
        return ProductDetail(id: int.parse(idProduct!));
      }
    ),
    GoRoute(
      path: '/post_product',
      builder: (context,state)=> AddProductPage()
    )
  ]
);