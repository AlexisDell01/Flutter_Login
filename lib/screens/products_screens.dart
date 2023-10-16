import 'package:flutter/material.dart';
import 'package:flutter_application_2/screens/loading_screen.dart';
import 'package:flutter_application_2/services/products_service.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final productsServices = Provider.of<ProductsServices>(context);

    if (productsServices.isLoading) {
      return const LoadingScreen();
    }

    return Container();
  }
}
