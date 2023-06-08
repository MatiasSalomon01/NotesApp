import 'package:flutter/material.dart';
import 'package:notes_app/services/services.dart';
import 'package:provider/provider.dart';

class TodoEditTitleModal extends StatefulWidget {
  final String id;
  final String title;
  const TodoEditTitleModal({super.key, required this.id, required this.title});

  @override
  State<TodoEditTitleModal> createState() => _TodoEditTitleModalState();
}

class _TodoEditTitleModalState extends State<TodoEditTitleModal> {
  @override
  Widget build(BuildContext context) {
    TextEditingController controllerTitle =
        TextEditingController(text: widget.title);
    final todoService = Provider.of<TodoService>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text('Edición de Titulo'),
      content: SizedBox(
        height: 50,
        child: Column(
          children: [
            TextFormField(
              controller: controllerTitle,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: widget.title,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              onEditingComplete: () async =>
                  await _saveTitle(todoService, controllerTitle.text),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all(Colors.grey[400]),
            backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
          ),
          onPressed: () async =>
              await _saveTitle(todoService, controllerTitle.text),
          child: const Text('Guardar',
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

  _saveTitle(TodoService todoService, String title) async {
    if (title == widget.title) return Navigator.of(context).pop();

    await todoService.updateOnlyTitle(widget.id, title);
    // ignore: use_build_context_synchronously
    Navigator.of(context).pop();
    NotificationService.showSnackbar(
        'Titulo actualizado con exito!', Colors.green, Icons.info_outline);
  }
}
