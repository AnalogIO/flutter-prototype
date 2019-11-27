import 'package:flutter/material.dart';

// TODO: When page == LoginPages.password, change image to profile picture
class LoginImage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Container(height: 80, child: Image.asset('assets/logo.png'));
  }
}
