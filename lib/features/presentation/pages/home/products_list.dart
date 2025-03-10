import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/router/router_app.dart';
import 'package:products/core/utils/format.dart';
import 'package:products/features/domain/entities/product_data.dart';
import 'package:products/features/presentation/bloc/products/products_bloc.dart';
import 'package:products/features/presentation/bloc/products/products_event.dart';
import 'package:products/features/presentation/bloc/products/products_state.dart';
import 'package:products/injection_app.dart';

class ProductsList extends StatefulWidget {
  const ProductsList({super.key});

  @override
  State<ProductsList> createState() => _ProductsListState();
}

class _ProductsListState extends State<ProductsList> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll(){
    if(_scrollController.position.pixels >= _scrollController.position.maxScrollExtent - 200){
      context.read<ProductsBloc>().add(const LoadMoreProducts());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildBody(),
        floatingActionButton: ExpandableFab(
          distance: 50,
          type: ExpandableFabType.up,
          children: [
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.add),
            onPressed: () {
              context.push('/post_product');
            },
          ),
          FloatingActionButton.small(
            heroTag: null,
            child: const Icon(Icons.favorite),
            onPressed: () {
              context.push('/favorite_product');
            },
          ),
        ]),
        floatingActionButtonLocation: ExpandableFab.location,
    );
  }


  _buildBody(){
    return BlocBuilder<ProductsBloc,ProductsState>(builder: (_,state){
      if(state is ProductsLoading){
        return const Center(child: CircularProgressIndicator(),);
      }

      if(state is ProductsError){
        return Center(child: Text(state.error!.message!),);
      }

      if(state is ProductsSuccess){
        return ListView.builder(
          controller: _scrollController,
          itemCount: state.hasMaxReached! ? state.products!.length : state.products!.length + 1,
          itemBuilder: (context,index){
            if (index >= state.products!.length) {
              return const Center(child: CircularProgressIndicator());
            }
            ProductData products = state.products![index];
            return  Padding(
              padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
              child: GestureDetector(
                onTap: ()=> context.push('/detail/${products.id}'),
                child: Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.blue[50],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  padding: const EdgeInsets.all(6),
                  child: Row(
                    children: [
                      Image.network(
                        products.thumbnail,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      const SizedBox(width: 10,),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              products.title,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700
                              ),
                            ),
                            Text(
                              products.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400
                              ),
                            ),
                            Text(
                              formatCurrency.format(products.price),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                fontStyle: FontStyle.italic
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
        });
      }

      return const SizedBox();

    });
  }
}