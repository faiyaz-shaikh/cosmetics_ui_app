import 'package:cosmetic_ui_app/model/product_model.dart';
import 'package:cosmetic_ui_app/ui/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  final ProductModel productModel;
  CartItem(this.productModel);
  @override
  _CartItemState createState() => _CartItemState(productModel);
}

class _CartItemState extends State<CartItem> {
  int _counter = 1;

  ProductModel productModel;
  _CartItemState(this.productModel);

  String imageUrl =
      'https://cdn.shopify.com/s/files/1/1546/0661/products/Perfect-Setting-Powder_1_2000x600.png?v=1513718610';

  void _increment() {
    productModel.itemCount++;
    setState(() {});
  }

  void _decrement() {
    if (_counter <= 0) return;
    productModel.itemCount--;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black12),
              child: Image.network(productModel.imageUrl),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(text: productModel.productName, size: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text(productModel.description),
                    ),
                    CustomTextWidget(text: "\$${productModel.price}", size: 16),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(80),
                  color: Colors.black12),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: _decrement,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white60,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Text('${productModel.itemCount}'),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: _increment,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.cyanAccent,
                          ),
                          child: Icon(
                            Icons.add,
                            size: 15,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
