import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/core/resources/data_state.dart';
import 'package:products/features/domain/usecase/products/product_usecase.dart';
import 'package:products/features/presentation/bloc/products/products_event.dart';
import 'package:products/features/presentation/bloc/products/products_state.dart';

class ProductsBloc extends Bloc<ProductsEvent,ProductsState> {
  final ProductUsecase _productUsecase;

  ProductsBloc(this._productUsecase): super(const ProductsLoading()) {
    on<GetProducts> (onGetProducts);
  }

  void onGetProducts(GetProducts event,Emitter<ProductsState> emit) async{
    final dataState = await _productUsecase.getAllProducts();
    if(dataState is DataSuccess && dataState.data!.isNotEmpty){
      emit(ProductsSuccess(dataState.data!));
    }

    if(dataState is DataFailed){
      emit(ProductsError(dataState.error!));
    }
  }
}