import 'package:cosmetic_ui_app/controller/sign_in_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatefulWidget {

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {

  final user = FirebaseAuth.instance.currentUser;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CircleAvatar(
          backgroundColor: Colors.grey,
          backgroundImage: NetworkImage(user!.photoURL ??''),
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
    );
  }
}
