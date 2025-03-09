import 'package:d_info/d_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:products/core/router/router_app.dart';
import 'package:products/features/data/models/post_request/add_product.dart';
import 'package:products/features/presentation/bloc/add_product/add_product_bloc.dart';
import 'package:products/features/presentation/bloc/add_product/add_product_event.dart';
import 'package:products/features/presentation/bloc/add_product/add_product_state.dart';
import 'package:products/injection_app.dart';

class AddProductPage extends StatelessWidget {
  AddProductPage({super.key});

  final TextEditingController titleController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddProductBloc(s1()),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          foregroundColor: Colors.black,
          title: const Text(
            'Test Post',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        body: _bodyPostProduct(context),
      ),
    );
  }

  _bodyPostProduct(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            controller: titleController,
            decoration: InputDecoration(
              isDense: true,
              filled: true,
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              hintText: 'Nama Produk',
              hintStyle: const TextStyle(color: Colors.grey),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.black),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        BlocConsumer<AddProductBloc, AddProductState>(
          listener: (context, state) {
            if (state is AddProductLoading) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) => const Dialog(
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            CircularProgressIndicator(),
                            SizedBox(height: 16),
                            Text("Loading...")
                          ],
                        ),
                      ),
                    ),
                  );
                }
              });
            }

            if (state is AddProductSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  Navigator.pop(context);
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      Future.delayed(const Duration(seconds: 1), () {
                        if (context.mounted) {
                          context.go('/');
                        }
                      });
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text("${state.response!.title} Berhasil ditambahkan"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
            }

            if (state is AddProductError) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (context.mounted) {
                  Navigator.pop(context);
                  showDialog(
                    barrierDismissible: false,
                    context: context,
                    builder: (context) {
                      Future.delayed(const Duration(seconds: 1), () {
                        if (context.mounted) {
                          Navigator.pop(context);
                        }
                      });
                      return Dialog(
                        child: Padding(
                          padding: const EdgeInsets.all(20),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(state.error?.message ?? "Gagal menambahkan produk"),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                }
              });
            }
          },
          builder: (context, state) {
            return ElevatedButton(
              onPressed: () {
                AddProductRequest request =
                    AddProductRequest(title: titleController.text);
                context.read<AddProductBloc>().add(PostProduct(request));
              },
              child: const Text("Tambah Produk"),
            );
          },
        ),
      ],
    );
  }
}
