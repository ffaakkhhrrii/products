import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products/features/data/data_sources/local/db/app_database.dart';
import 'package:products/features/presentation/bloc/favorite/favorite_list_page_bloc.dart';
import 'package:products/features/presentation/bloc/favorite/favorite_list_page_event.dart';
import 'package:products/features/presentation/bloc/favorite/favorite_list_page_state.dart';
import 'package:products/injection_app.dart';

class FavoriteListPage extends StatelessWidget {
  const FavoriteListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<FavoriteListPageBloc>(
      create: (context) => s1()..add(const GetAllFavoriteProduct()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text(
          'Favorite Products',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          actions: [
            BlocConsumer<FavoriteListPageBloc,FavoriteListPageState>(
              builder: (context,state){
                return IconButton(
                  onPressed: (){
                    showDialog(context: context, builder: (dialogContext){
                      return AlertDialog(
                        title: const Text("Delete All Product"),
                        content: const Text('Anda yakin ingin menghapus semua favorite product?'),
                        actions: [
                          TextButton(onPressed: (){
                            Navigator.of(dialogContext).pop();
                          }, child: const Text("Cancel")),
                          TextButton(onPressed: (){
                            context.read<FavoriteListPageBloc>().add(const DeleteAllFavoriteProduct());
                            Navigator.of(dialogContext).pop();
                          }, child: const Text("Yes"))
                        ],
                      );
                    });
                  }, icon: const Icon(Icons.delete));
              }, 
              listener: (context,state){
                if(state is DeleteAllFavoriteProductSuccess){
                  DInfo.dialogSuccess(context, "Semua favorite product berhasil dihapus");
                  DInfo.closeDialog(context);
                }

                if(state is DeleteAllFavoriteProductError){
                  DInfo.dialogError(context, state.error!.message!);
                  DInfo.closeDialog(context);
                }
              }
            )
          ],
        ),
        body: _bodyFavoriteList(),
      ),
    );
  }

  _bodyFavoriteList(){
    return BlocBuilder<FavoriteListPageBloc,FavoriteListPageState>(
      builder: (_,state){
        if(state is FavoriteListLoading){
          return const Center(child: CircularProgressIndicator(),);
        }

        if(state is FavoriteListError){
          return Center(child: Text(state.error!.message!),);
        }

        if(state is FavoriteListSuccess){
          if(state.data!.isNotEmpty){
            return ListView.builder(
              itemCount: state.data!.length,
              itemBuilder: (context,index){
                Favorite favorite = state.data![index];
                return Padding(
                  padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
                  child: GestureDetector(
                    onTap: ()=> context.push('/detail/${favorite.productId}'),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.blue[50],
                        borderRadius: BorderRadius.circular(10)
                      ),
                      padding: const EdgeInsets.all(6),
                      child: Row(
                        children: [
                          const SizedBox(width: 10,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  favorite.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.w700
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
              }
            );
          }else{
            return Center(child: Text("Tidak ada favorite product"),);
          }
        }

        return const SizedBox();
      }
    );
  }
}