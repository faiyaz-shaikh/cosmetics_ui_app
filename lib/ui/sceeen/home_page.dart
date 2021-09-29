import 'package:cosmetic_ui_app/ui/widget/cosmetic_item_widget.dart';
import 'package:cosmetic_ui_app/ui/widget/custom_text_widget.dart';
import 'package:cosmetic_ui_app/ui/widget/search_bar_widget.dart';
import 'package:cosmetic_ui_app/value/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 1.15,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: MyColor.BACKGROUND_COLOR,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(20),
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
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
                    )
                  ],
                ),
                CustomTextWidget(text: 'Choose your', size: 35),
                CustomTextWidget(text: 'mood for toady!', size: 35),
                Padding(
                  padding: const EdgeInsets.only(top: 15.0, bottom: 40),
                  child: SearchBar(),
                ),
                SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: GridView.count(
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20.0,
                      mainAxisSpacing: 50.0,
                      physics: ScrollPhysics(),
                      children: List.generate(
                        10,
                        (index) => AnimationConfiguration.staggeredGrid(
                          position: index,
                          duration: const Duration(milliseconds: 500),
                          columnCount: 2,
                          child: SlideAnimation(
                            child: FadeInAnimation(
                              child: CosmeticItem(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
