import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/core/resources/data_state.dart';
import 'package:products/features/domain/usecase/products/product_usecase.dart';
import 'package:products/features/presentation/bloc/product_detail/product_detail_event.dart';
import 'package:products/features/presentation/bloc/product_detail/product_detail_state.dart';

class ProductDetailBloc extends Bloc<ProductDetailEvent,ProductDetailState> {
  final ProductUsecase _usecase;
  ProductDetailBloc(this._usecase): super(const ProductsDetailIdle()){
    on<GetDetailProduct> (onGetDetailProduct);
    on<AddFavoriteProduct> (onAddFavoriteProduct);
  }

  void onGetDetailProduct(GetDetailProduct event, Emitter<ProductDetailState> emit)async{
    emit(const ProductsDetailLoading());
    final dataState = await _usecase.getDetailProduct(event.id);
    if(dataState is DataSuccess){
      final isFavorite = await _usecase.isFavorite(dataState.data!.id);
      emit(ProductsDetailSuccess(dataState.data!,isFavorite.data));
    }
    if(dataState is DataFailed){
      emit(ProductsDetailError(dataState.error!));
    }
  }

  void onAddFavoriteProduct(AddFavoriteProduct event, Emitter<ProductDetailState> emit)async{
    final currentState = state;
    
    //add
    if(currentState.isFavorite == true){
      final result = await _usecase.deleteFavorite(state.productData!.id);
      if(result is DataSuccess){
        emit(const FavoriteActionSuccess(false));
        emit(ProductsDetailSuccess(currentState.productData!,false));
      }

      if(result is DataFailed){
        emit(FavoriteActionError(result.error!));
      }
    }

    //remove
    if(currentState.isFavorite != true){  
      final result = await _usecase.addFavorite(event.favoriteData);
      if(result is DataSuccess){
        emit(const FavoriteActionSuccess(true));
        emit(ProductsDetailSuccess(currentState.productData!,true));
      }

      if(result is DataFailed){
        emit(FavoriteActionError(result.error!));
      }
    }

  }

}