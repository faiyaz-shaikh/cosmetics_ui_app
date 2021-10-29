import 'package:cosmetic_ui_app/controller/cart_controller.dart';
import 'package:cosmetic_ui_app/ui/widget/cart_item_widget.dart';
import 'package:cosmetic_ui_app/ui/widget/custom_text_widget.dart';
import 'package:cosmetic_ui_app/ui/widget/profile_widget.dart';
import 'package:cosmetic_ui_app/value/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';

class CartPage extends StatefulWidget {

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  CartController? cartController;
  final user = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    cartController = Get.find<CartController>();
    cartController!.getTotalCost();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();
    _animation = Tween(begin: cartController!.totalCost.toDouble(), end: cartController!.totalCost.toDouble()+10).animate(
      CurvedAnimation(
          curve: Curves.fastOutSlowIn, parent: _animationController),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      height: MediaQuery.of(context).size.height / 1.15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MyColor.BACKGROUND_COLOR,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20),
              ),
            ),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Hello, ${user!.displayName}',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          ProfileWidget(),
                        ],
                      ),
                      CustomTextWidget(text: 'Cart', size: 35),
                      GetBuilder<CartController>(
                        builder: (_cartController) {
                          return ListView.builder(
                            physics: ScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: _cartController.cartItems.length,
                            itemBuilder: (BuildContext context, int index) {
                              return AnimationConfiguration.staggeredList(
                                position: index,
                                duration: const Duration(milliseconds: 375),
                                child: SlideAnimation(
                                  verticalOffset: 50.0,
                                  child: FadeInAnimation(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CartItem(_cartController.cartItems[index]),
                                    ),
                                  ),
                                ),
                              );
                            },
                          );
                        }
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 25),
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomTextWidget(text: 'Subtotal:', size: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: CustomTextWidget(text: 'Delivery:', size: 20),
                    ),
                    CustomTextWidget(text: 'Total:', size: 20),
                  ],
                ),
                Spacer(),
                AnimatedBuilder(
                  animation: _animation,
                  builder: (BuildContext context, Widget? child) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        CustomTextWidget(text: "\$${cartController!.totalCost}", size: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8),
                          child: CustomTextWidget(text: r'$10', size: 20),
                        ),
                        CustomTextWidget(
                          text: "\$${_animation.value.toStringAsFixed(2)}",
                          size: 21,
                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
