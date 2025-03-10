import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:products/core/constants/constants.dart';
import 'package:products/features/data/data_sources/local/db/app_database.dart';
import 'package:products/features/data/data_sources/remotes/products_api_service.dart';
import 'package:products/features/data/repository/products_repository.dart';
import 'package:products/features/domain/usecase/products/product_usecase.dart';
import 'package:products/features/presentation/bloc/add_product/add_product_bloc.dart';
import 'package:products/features/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:products/features/presentation/bloc/products/products_bloc.dart';

final s1 = GetIt.instance;

Future<void> initializeDependencies() async{
  final dio = Dio(
    BaseOptions(
      baseUrl: url
    )
  );
  
  s1.registerSingleton<Dio>(dio);

  s1.registerSingleton<AppDatabase>(AppDatabase());

  s1.registerSingleton<ProductsApiService>(ProductsApiService(s1()));

  s1.registerSingleton<ProductsRepository>(ProductsRepository(
    apiService: s1(),
    database: s1()
  ));

  s1.registerSingleton<ProductUsecase>(ProductUsecase(s1()));

  s1.registerFactory<ProductsBloc>(()=>ProductsBloc(s1()));

  s1.registerFactory<ProductDetailBloc>(()=>ProductDetailBloc(s1()));
  
  s1.registerFactory<AddProductBloc>(()=>AddProductBloc(s1()));
}