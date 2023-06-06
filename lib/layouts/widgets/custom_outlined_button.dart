import 'package:flutter/material.dart';
import 'package:notes_app/modals/modals.dart';

class CustomOutlinedButton extends StatelessWidget {
  final IconData icon;
  final Function onPressed;
  const CustomOutlinedButton(
      {super.key, required this.onPressed, required this.icon});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
        overlayColor: MaterialStateProperty.all(Colors.grey[400]),
        side: MaterialStateProperty.all(BorderSide.none),
        shape: MaterialStateProperty.all(const CircleBorder()),
      ),
      onPressed: () => onPressed(),
      child: Icon(
        icon,
        color: Colors.black,
      ),
    );
  }
}
