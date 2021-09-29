import 'package:cosmetic_ui_app/ui/widget/cart_item_widget.dart';
import 'package:cosmetic_ui_app/ui/widget/custom_text_widget.dart';
import 'package:cosmetic_ui_app/value/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;
  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    )..forward();
    _animation = Tween(begin: 60.50, end: 70.50).animate(
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
                            'Hello, Julia!',
                            style: TextStyle(
                              color: Colors.pinkAccent,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Stack(
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                              ),
                              Positioned(
                                top: 0.0,
                                right: 0.0,
                                child: Icon(
                                  Icons.brightness_1,
                                  size: 10.0,
                                  color: Colors.redAccent,
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                      CustomTextWidget(text: 'Cart', size: 35),
                      ListView.builder(
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: 3,
                        itemBuilder: (BuildContext context, int index) {
                          return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 375),
                            child: SlideAnimation(
                              verticalOffset: 50.0,
                              child: FadeInAnimation(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CartItem(),
                                ),
                              ),
                            ),
                          );
                        },
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
                        CustomTextWidget(text: r'$60.50', size: 20),
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
