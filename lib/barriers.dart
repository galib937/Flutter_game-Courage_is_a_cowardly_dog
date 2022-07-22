import 'package:flutter/material.dart';

class MyBarrier extends StatelessWidget {
  // const MyBarrier({Key? key}) : super(key: key);

  final size;

  MyBarrier({this.size});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: size,
      decoration: BoxDecoration(
        color: Colors.black87,
        border: Border.all(width: 10, color: Color.fromARGB(255, 0, 6, 95)),
        borderRadius: BorderRadius.circular(15),
        // image: Image.asset('lib/images/eustace_barrier.png'),
      ),
    );
  }
}
