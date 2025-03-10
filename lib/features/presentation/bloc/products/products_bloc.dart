import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/core/resources/data_state.dart';
import 'package:products/features/domain/usecase/products/product_usecase.dart';
import 'package:products/features/presentation/bloc/products/products_event.dart';
import 'package:products/features/presentation/bloc/products/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent,ProductsState> {
  final ProductUsecase _productUsecase;
  final int limit = 10;
  int skip = 0;
  bool isFetching = false;

  ProductsBloc(this._productUsecase): super(const ProductsLoading()) {
    on<GetProducts> (onGetProducts);
    on<LoadMoreProducts> (onLoadMoreProducts);
  }

  void onGetProducts(GetProducts event,Emitter<ProductsState> emit) async{
    if(isFetching) return;

    isFetching = true;
    final dataState = await _productUsecase.getAllProducts(limit,skip);
    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      skip += limit;
      emit(ProductsSuccess(dataState.data!,false));
    }else{
      emit(const ProductsSuccess([],true));
    }

    if(dataState is DataFailed){
      emit(ProductsError(dataState.error!));
    }

    isFetching = false;
  }

  void onLoadMoreProducts(LoadMoreProducts event,Emitter<ProductsState> emit) async{
    if(isFetching || state is! ProductsSuccess) return;

    isFetching = true;
    final currentState = state as ProductsSuccess;
    final dataState = await _productUsecase.getAllProducts(limit, skip);

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      skip += limit;
      emit(ProductsSuccess(
        currentState.products! + dataState.data!,
        false,
      ));
    } else {
      emit(ProductsSuccess(currentState.products!, true));
    }

    isFetching = false;
  }
}