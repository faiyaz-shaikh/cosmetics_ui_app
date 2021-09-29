import 'package:cosmetic_ui_app/ui/widget/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CosmeticItem extends StatefulWidget {
  @override
  _CosmeticItemState createState() => _CosmeticItemState();
}

class _CosmeticItemState extends State<CosmeticItem>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation _animation;

  String imageUrl =
      'https://cdn.shopify.com/s/files/1/1546/0661/products/Perfect-Setting-Powder_1_2000x600.png?v=1513718610';

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    );
    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
          curve: Curves.fastOutSlowIn, parent: _animationController),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 15.0,
              )
            ],
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(top: 65, left: 15, right: 15, bottom: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextWidget(text: 'Powder', size: 16),
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: Text('with olive oil'),
                ),
                Row(
                  children: [
                    CustomTextWidget(text: r'$10,57', size: 16),
                    Spacer(),
                    AnimatedBuilder(
                      animation: _animation,
                      builder: (BuildContext context, Widget? child) {
                        return GestureDetector(
                          onTap: () => _animationController.forward(),
                          child: Transform.rotate(
                            angle: _animationController.isCompleted
                                ? 0
                                : _animation.value,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: _animationController.isAnimating
                                    ? [
                                        BoxShadow(
                                          color: Colors.pinkAccent,
                                          spreadRadius: 1.0,
                                          blurRadius: 10,
                                        ),
                                      ]
                                    : null,
                                color: _animation.isCompleted
                                    ? Colors.black
                                    : Colors.cyanAccent,
                              ),
                              child: Icon(
                                _animationController.isAnimating ||
                                        _animation.value == 0.0
                                    ? Icons.add
                                    : Icons.done,
                                size: 15,
                                color: _animation.isCompleted
                                    ? Colors.cyanAccent
                                    : Colors.black,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Positioned(
          top: -50,
          left: 20,
          child: Container(
            child: Image.network(
              imageUrl,
              height: 130,
              width: 130,
            ),
          ),
        ),
      ],
    );
  }
}
