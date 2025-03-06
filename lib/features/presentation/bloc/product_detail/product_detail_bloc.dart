import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/core/resources/data_state.dart';
import 'package:products/features/domain/usecase/products/product_usecase.dart';
import 'package:products/features/presentation/bloc/product_detail/product_detail_event.dart';
import 'package:products/features/presentation/bloc/product_detail/product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent,ProductDetailState> {
  final ProductUsecase _usecase;

  ProductDetailBloc(this._usecase): super(const ProductsDetailLoading()){
    on<GetDetailProduct> (onGetDetailProduct);
  }

  void onGetDetailProduct(GetDetailProduct event, Emitter<ProductDetailState> emit)async{
    final dataState = await _usecase.getDetailProduct(event.id);
    if(dataState is DataSuccess){
      emit(ProductsDetailSuccess(dataState.data!));
    }
    if(dataState is DataFailed){
      emit(ProductsDetailError(dataState.error!));
    }
  }

}