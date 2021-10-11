import 'package:cosmetic_ui_app/controller/cart_controller.dart';
import 'package:cosmetic_ui_app/model/product_model.dart';
import 'package:cosmetic_ui_app/ui/sceeen/cart_page.dart';
import 'package:cosmetic_ui_app/ui/sceeen/favourite_page.dart';
import 'package:cosmetic_ui_app/ui/sceeen/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;
  List<Widget>? tabs;

  _MainPageState() {
    tabs = [
      HomePage(ProductModel.dummyData),
      FavouritePage(),
      CartPage(),
    ];
  }

  CartController? cartController;
  @override
  void initState() {
    cartController = Get.find<CartController>();
    super.initState();
  }

  void _incrementTab(index) => setState(() => _currentIndex = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black54,
      body: tabs![_currentIndex],
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: BottomNavigationBar(
          unselectedItemColor: Colors.grey,
          selectedItemColor: Colors.cyan,
          backgroundColor: Colors.transparent,
          elevation: 0,
          currentIndex: _currentIndex,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Stack(
                children: [
                  Icon(Icons.favorite),
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Icon(
                      Icons.brightness_1,
                      size: 8.0,
                      color: Colors.pinkAccent,
                    ),
                  )
                ],
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: DragTarget<ProductModel>(
                builder: (BuildContext context, List<Object?> candidateData,
                    List<dynamic> rejectedData) {
                  return Icon(Icons.shopping_bag);
                },
                onWillAccept: (productModel) {
                  cartController!.addItem(productModel!);
                  return true;
                },
              ),
              label: '',
            ),
          ],
          onTap: (index) => _incrementTab(index),
        ),
      ),
    );
  }
}
