import 'package:flutter/material.dart';

class MyCourage extends StatelessWidget {
  const MyCourage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      child: Image.asset(
        'lib/images/courage_is_a_bird.png'
      ),
    );
  }
}