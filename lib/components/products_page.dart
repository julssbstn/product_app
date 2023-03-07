import 'package:flutter/material.dart';
import 'package:product_app/bloc/bloc_provider.dart';
import 'package:product_app/bloc/product_bloc.dart';
import 'package:product_app/components/product_list_widget.dart';
import 'package:product_app/models/product_details.dart';

class ProductPage extends StatefulWidget {
  ProductPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  late ProductBloc productBloc;

  @override
  void initState() {
    super.initState();
    productBloc = BlocProvider.of<ProductBloc>(context);
  }

  Future<void> _handleGetProductList(num skip) async {
    await productBloc.getProducts(skip: skip);
  }

  Future<ProductDetails> _handleGetProductDetail(num id) async {
    return await productBloc.getProductDetails(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: const Key("ProductsPage"),
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ProductListWidget(
        getProductList: (num skip) => _handleGetProductList(skip),
        getProductDetail: (num id) => _handleGetProductDetail(id),
        stream: productBloc.productStream,
      ),
    );
  }
}
