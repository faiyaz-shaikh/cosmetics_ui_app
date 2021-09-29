import 'package:cosmetic_ui_app/ui/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CartItem extends StatefulWidget {
  @override
  _CartItemState createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  int _counter = 1;

  String imageUrl =
      'https://cdn.shopify.com/s/files/1/1546/0661/products/Perfect-Setting-Powder_1_2000x600.png?v=1513718610';

  void _increment() {
    _counter++;
    setState(() {});
  }

  void _decrement() {
    if (_counter <= 0) return;
    _counter--;
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
              child: Image.network(imageUrl),
            ),
          ),
          Expanded(
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(text: 'Powder', size: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 4),
                      child: Text('with olive oil'),
                    ),
                    CustomTextWidget(text: r'$10,57', size: 16),
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
                        child: Text('$_counter'),
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
