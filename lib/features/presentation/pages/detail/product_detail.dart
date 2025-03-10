import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/domain/entities/favorite_data.dart';
import 'package:products/features/presentation/bloc/product_detail/product_detail_bloc.dart';
import 'package:products/features/presentation/bloc/product_detail/product_detail_event.dart';
import 'package:products/features/presentation/bloc/product_detail/product_detail_state.dart';
import 'package:products/injection_app.dart';

class ProductDetail extends StatefulWidget {
  final int id;
  const ProductDetail({super.key,required this.id});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  bool? isFavorite;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProductDetailBloc>(
      create: (context)=> s1()..add(GetDetailProduct(widget.id)),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: Text(
            'Detail Products',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            BlocConsumer<ProductDetailBloc,ProductDetailState>(
              builder: (context,state){
                return IconButton(onPressed: (){
                  FavoriteData data = FavoriteData(
                    id: widget.id,
                    nameProduct: state.productData!.title
                  );
                  context.read<ProductDetailBloc>().add(AddFavoriteProduct(data));
                }, icon: isFavorite == true ? const Icon(Icons.favorite): const Icon(Icons.favorite_border));
              }, 
              listener: (context,state){
                if(state is FavoriteActionSuccess){
                  if(state.isFavorite == true){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Remove Success")));
                  }
                }
                if(state is FavoriteActionError){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error!.message!)));
                }
              })
          ],
        ),
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
        if(state.isFavorite != null){
          WidgetsBinding.instance.addPostFrameCallback((_) {
            setState(() {
              isFavorite = state.isFavorite;
            });
          });
        }
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