import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products/features/presentation/bloc/products/products_bloc.dart';
import 'package:products/features/presentation/bloc/products/products_event.dart';
import 'package:products/features/presentation/pages/home/products_list.dart';
import 'package:products/injection_app.dart';

Future<void> main() async{
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ProductsList(),
      );
  }
}