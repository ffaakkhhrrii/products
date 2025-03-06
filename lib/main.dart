import 'package:flutter/material.dart';
import 'package:products/core/router/router_app.dart';
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
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: router,
    );
  }
}