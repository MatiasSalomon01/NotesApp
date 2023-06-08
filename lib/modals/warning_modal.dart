import 'package:flutter/material.dart';

class WarningModal extends StatelessWidget {
  final String description;
  final Function onPressed;
  const WarningModal(
      {super.key, required this.onPressed, required this.description});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: Row(
        children: [
          const Icon(Icons.warning_rounded, color: Colors.red),
          const SizedBox(width: 10),
          Text('Seguro que quieres eliminar $description?'),
        ],
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.grey[400]),
            backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
          ),
          onPressed: () {
            Navigator.of(context).pop();
            onPressed();
          },
          child: const Text('Confirmar',
              style: TextStyle(color: Colors.black, fontSize: 15)),
        ),
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.grey[400]),
            backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text(
            'Cancelar',
            style: TextStyle(color: Colors.black),
          ),
        )
      ],
    );
  }
}
