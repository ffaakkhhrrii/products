import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/core/resources/data_state.dart';
import 'package:products/features/domain/usecase/products/product_usecase.dart';
import 'package:products/features/presentation/bloc/favorite/favorite_list_page_event.dart';
import 'package:products/features/presentation/bloc/favorite/favorite_list_page_state.dart';

class FavoriteListPageBloc extends Bloc<FavoriteListPageEvent,FavoriteListPageState> {
  final ProductUsecase usecase;

  FavoriteListPageBloc(this.usecase):super(const FavoriteListLoading()){
    on<GetAllFavoriteProduct> (onGetAllFavoriteProduct);
    on<DeleteAllFavoriteProduct> (onDeleteAllFavoriteProduct);
  }

  void onGetAllFavoriteProduct(GetAllFavoriteProduct event,Emitter<FavoriteListPageState> emit) async {
    final data = await usecase.getAllFavoriteProduct();
    if(data is DataSuccess){
      emit(FavoriteListSuccess(data.data!));
    }

    if(data is DataFailed){
      emit(FavoriteListError(data.error!));
    }
  }

  void onDeleteAllFavoriteProduct(DeleteAllFavoriteProduct event,Emitter<FavoriteListPageState> emit) async{
    final result = await usecase.deleteAllFavorite();

    if(result is DataSuccess){
      emit(const DeleteAllFavoriteProductSuccess());
      final currentState = state;
      emit(FavoriteListSuccess(currentState.data??[]));
    }

    if(result is DataFailed){
      emit(DeleteAllFavoriteProductError(result.error!));
    }
  }
}