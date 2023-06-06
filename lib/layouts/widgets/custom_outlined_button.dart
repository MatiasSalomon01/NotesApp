import 'package:flutter/material.dart';
import 'package:notes_app/modals/modals.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
        overlayColor: MaterialStateProperty.all(Colors.grey[400]),
        side: MaterialStateProperty.all(BorderSide.none),
        shape: MaterialStateProperty.all(const CircleBorder()),
      ),
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            return const TodoCreationModal();
          },
        );
      },
      child: const Icon(
        Icons.add,
        color: Colors.black,
      ),
    );
  }
}
