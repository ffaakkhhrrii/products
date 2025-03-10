import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products/features/presentation/bloc/products/products_bloc.dart';
import 'package:products/features/presentation/bloc/products/products_event.dart';
import 'package:products/features/presentation/pages/add_product/add_product_page.dart';
import 'package:products/features/presentation/pages/detail/product_detail.dart';
import 'package:products/features/presentation/pages/favorite/favorite_list_page.dart';
import 'package:products/features/presentation/pages/home/products_list.dart';
import 'package:products/injection_app.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context,state) {
        return BlocProvider<ProductsBloc>(
          create: (context)=> s1()..add(const GetProducts()),
          child: const ProductsList(),
        );
      }
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
    ),
    GoRoute(
      path: '/favorite_product',
      builder: (context,state) => const FavoriteListPage()
    )
  ]
);