import 'package:flutter/material.dart';

class CustomTitle extends StatelessWidget {
  final EdgeInsetsGeometry? margin;

  const CustomTitle({super.key, this.margin});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      child: const Center(
        child: Text(
          'Notes App',
          style: TextStyle(
            fontSize: 25,
          ),
        ),
      ),
    );
  }
}
