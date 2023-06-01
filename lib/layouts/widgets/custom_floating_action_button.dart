import 'package:flutter/material.dart';

class CustomFloatingActionButton extends StatelessWidget {
  const CustomFloatingActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 10,
      right: 10,
      child: FloatingActionButton(
        backgroundColor: const Color(0xffC8C8C8),
        onPressed: () {},
        child: const Icon(
          Icons.search,
          color: Colors.black,
        ),
      ),
    );
  }
}
