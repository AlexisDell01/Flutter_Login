import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/products_screens.dart';
import 'package:flutter_application_2/screens/screens.dart';
import 'package:flutter_application_2/services/products_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => ProductsServices(),
          lazy: false,
        )
      ],
      child: MainApp(),
    );
  }
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      initialRoute: 'products',
      routes: {
        'home': (_) => const HomeScreen(),
        'login': (_) => const LoginScreen(),
        'products': (_) => const ProductsScreen()
      },
    );
  }
}
