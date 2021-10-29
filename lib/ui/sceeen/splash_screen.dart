import 'package:cosmetic_ui_app/controller/cart_controller.dart';
import 'package:cosmetic_ui_app/ui/sceeen/sign_in_screen.dart';
import 'package:cosmetic_ui_app/ui/widget/custom_text_widget.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _buttonController;

  late Animation _buttonAnimation;

  @override
  void initState() {
    Get.put(
      CartController(),
    );
    super.initState();
    _buttonController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    _buttonAnimation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(curve: Curves.fastOutSlowIn, parent: _buttonController),
    );

    FirebaseMessaging.instance.getInitialMessage().then(
      (message) {
        if (message != null) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignIn(),
            ),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.cyanAccent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2.1,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Text(
                    'Meet new era of',
                    style: TextStyle(
                      color: Colors.pinkAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(text: 'Natural', size: 60),
                        CustomTextWidget(text: 'Beauty', size: 60),
                      ],
                    ),
                    Spacer(),
                    AnimatedBuilder(
                      builder: (context, child) {
                        if (_buttonAnimation.isCompleted) {
                          _buttonController.reverse().then(
                                (value) => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignIn(),
                                  ),
                                ),
                              );
                        }
                        return GestureDetector(
                          onTap: () {
                            _buttonController.forward();
                          },
                          child: Transform.rotate(
                            angle: _buttonAnimation.value,
                            child: Container(
                              height: 80,
                              width: 80,
                              decoration: BoxDecoration(
                                boxShadow: _buttonController.isAnimating
                                    ? [
                                        BoxShadow(
                                          color: Colors.cyanAccent,
                                          spreadRadius: 5.0,
                                        ),
                                      ]
                                    : null,
                                color: _buttonController.isAnimating
                                    ? Colors.pinkAccent
                                    : Colors.cyanAccent,
                                borderRadius: BorderRadius.circular(80),
                              ),
                              child: Icon(
                                Icons.arrow_forward,
                                size: 30,
                              ),
                            ),
                          ),
                        );
                      },
                      animation: _buttonAnimation,
                    )
                  ],
                ),
                CustomTextWidget(text: 'Cosmetics', size: 60),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
