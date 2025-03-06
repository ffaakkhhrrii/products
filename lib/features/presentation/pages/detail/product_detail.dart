import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:products/features/presentation/bloc/product_detail/product_detail_event.dart';
import 'package:products/features/presentation/bloc/product_detail/product_detail_state.dart';
import 'package:products/injection_app.dart';

class ProductDetail extends StatelessWidget {
  int? id;
  ProductDetail({super.key,required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
      create: (context)=> s1()..add(GetDetailProduct(id!)),
      child: Scaffold(
        body: _buildDetailBody(),
      ),
    );
  }

  _buildDetailBody(){
    return BlocBuilder<ProductDetailBloc,ProductDetailState>(builder: (_,state){
      if(state is ProductsDetailLoading){
        return const Center(child: CircularProgressIndicator(),);
      }

      if(state is ProductsDetailError){
        return Center(child: Text(state.error!.message!),);
      }

      if(state is ProductsDetailSuccess){
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16,),
              Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    state.productData!.thumbnail,
                    width: 200,
                    height: 200,
                    alignment: Alignment.center,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              Text(
                state.productData!.title,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Text(
                state.productData!.description,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        );
      }

      return const SizedBox();
    });
  }
}