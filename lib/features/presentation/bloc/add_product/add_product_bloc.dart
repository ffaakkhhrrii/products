import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/core/resources/data_state.dart';
import 'package:products/features/domain/usecase/products/product_usecase.dart';
import 'package:products/features/presentation/bloc/add_product/add_product_event.dart';
import 'package:products/features/presentation/bloc/add_product/add_product_state.dart';

class AddProductBloc extends Bloc<AddProductEvent,AddProductState> {
  final ProductUsecase usecase;
  
  AddProductBloc(this.usecase):super(const AddProductIdle()){
    on<PostProduct> (onPostProduct);
  }

  void onPostProduct(PostProduct event,Emitter<AddProductState> emit) async{
    emit(const AddProductLoading());
    final data = await usecase.addProduct(event.request);
    
    if(data is DataSuccess){
      emit(AddProductSuccess(data.data!));
    }

    if(data is DataFailed){
      emit(AddProductError(data.error!));
    }

  }
}