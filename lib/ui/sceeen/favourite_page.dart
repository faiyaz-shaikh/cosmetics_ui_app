import 'package:cosmetic_ui_app/ui/widget/text_animation.dart';
import 'package:flutter/material.dart';

class FavouritePage extends StatefulWidget {
  @override
  _FavouritePageState createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage>
    with TickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 500),
    vsync: this,
  );
  late final Animation<double> _animation =
      Tween<double>(begin: 130, end: 160).animate(
    CurvedAnimation(curve: Curves.fastOutSlowIn, parent: _controller),
  );

  bool isSecondSwitchOn = false;
  double secondSwitchX = 1;
  bool selected = false;

  void animateOffButton() {
    setState(
      () {
        _controller.forward();
        selected = false;
      },
    );
  }

  void animateOnButton() {
    setState(
      () {
        _controller.forward();
        selected = true;
      },
    );
  }

  void secondSwitchChangeToOn() {
    setState(
      () {
        isSecondSwitchOn = true;
        secondSwitchX = -1;
      },
    );
  }

  void secondSwitchChangeToOff() {
    setState(
      () {
        isSecondSwitchOn = false;
        secondSwitchX = 1;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                color: !selected ? Colors.white : Colors.black,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Stack(
                children: [
                  Positioned(
                    child: AnimatedAlign(
                      alignment: selected
                          ? Alignment.centerLeft
                          : Alignment.centerRight,
                      duration: const Duration(seconds: 1),
                      curve: Curves.fastOutSlowIn,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: AnimatedBuilder(
                          animation: _animation,
                          builder: (BuildContext context, Widget? child) {
                            if (_animation.isCompleted) {
                              _controller.reverse();
                            }
                            return Container(
                              height: 40,
                              width: _animation.value,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: selected ? Colors.white : Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                        onPressed: () => animateOnButton(),
                        child: Text(
                          'ON',
                          style: TextStyle(
                            color: selected ? Colors.black : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => animateOffButton(),
                        child: Text(
                          'OFF',
                          style: TextStyle(
                            color: !selected ? Colors.black : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                color: isSecondSwitchOn ? Colors.black : Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Stack(
                  children: [
                    Positioned(
                      child: AnimatedSwitcher(
                        duration: Duration(milliseconds: 300),
                        transitionBuilder: (child, animation) {
                          return SlideTransition(
                            position: Tween<Offset>(
                              begin: Offset(secondSwitchX, 0),
                              end: Offset(0, 0),
                            ).animate(animation),
                            child: child,
                          );
                        },
                        child: isSecondSwitchOn
                            ? Container(
                                key: Key('1'),
                                width: 300,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              )
                            : Container(
                                key: Key('2'),
                                width: 300,
                                height: 80,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20.0),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: GestureDetector(
                          onTap: () => secondSwitchChangeToOff(),
                          child: TextAnimationWidget(
                            text: 'OFF',
                            moveValue: -0.4,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20.0),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          onTap: () => secondSwitchChangeToOn(),
                          child: TextAnimationWidget(
                            text: 'ON',
                            moveValue: 0.4,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
