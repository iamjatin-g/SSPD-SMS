import 'package:flutter/material.dart';

class BackButtonWidget extends StatelessWidget {
  final Color color;
  final double size;

  const BackButtonWidget({
    super.key,
    this.color = Colors.black,
    this.size = 24.0,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back, color: color, size: size),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
