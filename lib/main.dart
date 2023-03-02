import 'package:flutter/material.dart';
import 'package:product_app/bloc/bloc_provider.dart';
import 'package:product_app/bloc/product_bloc.dart';
import 'package:product_app/components/products_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      bloc: ProductBloc(),
      child: MaterialApp(
        title: 'Product View',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: ProductPage(title: 'Product Page'),
      ),
    );
  }
}
