import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:products/features/data/models/post_response/basic_post_response.dart';

abstract class AddProductState extends Equatable {
  final BasicPostResponse? response;
  final DioException? error;

  const AddProductState({this.response,this.error});

  @override
  List<Object?> get props => [response!,error!];
}

class AddProductIdle extends AddProductState{
  const AddProductIdle();
}

class AddProductLoading extends AddProductState{
  const AddProductLoading();
}

class AddProductSuccess extends AddProductState{
  const AddProductSuccess(BasicPostResponse response): super(response: response);
}

class AddProductError extends AddProductState{
  const AddProductError(DioException error):super(error: error);
}