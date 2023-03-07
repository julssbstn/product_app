import 'package:flutter/material.dart';
import 'package:product_app/components/product_details_widget.dart';
import 'package:product_app/models/product.dart';
import 'package:product_app/models/product_details.dart';
import 'package:product_app/models/products.dart';

class ProductListWidget extends StatefulWidget {
  ProductListWidget({
    Key? key,
    required this.getProductList,
    required this.getProductDetail,
    required this.stream,
  }) : super(key: key);

  final Future Function(num skip) getProductList;
  final Future<ProductDetails> Function(num id) getProductDetail;
  final Stream<Products> stream;

  @override
  _ProductListWidgetState createState() => _ProductListWidgetState();
}

class _ProductListWidgetState extends State<ProductListWidget> {
  late ScrollController controller;
  num skip = 0;

  List<Product> _products = [];

  @override
  void initState() {
    super.initState();
    widget.getProductList(skip);

    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  void _scrollListener() async {
    if (controller.position.maxScrollExtent == controller.offset) {
      final skipPage = skip + 10;

      if (skipPage <= 100) {
        await widget.getProductList(skip);
        setState(() {
          skip = skipPage;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: StreamBuilder<Products>(
        stream: widget.stream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final results = snapshot.data as Products;
            final doesExist =
                _products.any((e) => e.id == results.products.last.id);

            if (!doesExist) {
              _products.addAll(results.products);
            }

            return _buildList(_products);
          } else {
            return const Center(
                key: const Key("LoadingWidget"), child: Text('Loading ...'));
          }
        },
      ),
    );
  }

  Widget _buildList(List<Product> list) {
    return ListView.builder(
      controller: controller,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () async {
            final details = await widget.getProductDetail(list[index].id);
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => ProductDetailsWidget(
                  details: details,
                ),
              ),
            );
          },
          child: Container(
            margin: const EdgeInsets.all(8),
            child: ListTile(
              tileColor: Colors.grey[300],
              contentPadding: const EdgeInsets.all(8),
              leading: SizedBox(
                height: 50.0,
                width: 50.0,
                child: list[index].thumbnail != null
                    ? Image.network(
                        list[index].thumbnail.toString(),
                        fit: BoxFit.fill,
                      )
                    : Container(),
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: Text(
                      "${list[index].discountPercentage}% OFF",
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "${list[index].stock} left",
                    style: TextStyle(color: Colors.grey[700], fontSize: 12),
                  ),
                ],
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("${list[index].title}"),
                  SizedBox(height: 8),
                  Text(
                    "\$${list[index].price}",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
