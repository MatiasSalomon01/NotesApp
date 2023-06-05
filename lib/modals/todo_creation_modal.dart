import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/content.dart';
import 'package:notes_app/models/task.dart';
import 'package:notes_app/services/notification_service.dart';
import 'package:notes_app/services/todo_service.dart';
import 'package:provider/provider.dart';

class TodoCreationModal extends StatefulWidget {
  const TodoCreationModal({super.key});

  @override
  State<TodoCreationModal> createState() => _TodoCreationModalState();
}

class _TodoCreationModalState extends State<TodoCreationModal> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final todoService = Provider.of<TodoService>(context);
    return AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      title: const Text('Creacion de Tarea'),
      content: SizedBox(
        height: 150,
        child: Column(
          children: [
            TextFormField(
              enabled: false,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                hintText: Constants.currentDate,
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            TextFormField(
              controller: controllerTitle,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: 'Titulo',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
            ),
            TextFormField(
              controller: controllerDescription,
              cursorColor: Colors.black,
              decoration: const InputDecoration(
                hintText: 'Descripcion',
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
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
          onPressed: () async {
            if (controllerTitle.text.isEmpty ||
                controllerDescription.text.isEmpty) {
              NotificationService.showSnackbar("ERROR LOS INPUTS ESTAN VACIOS",
                  Colors.red, Icons.info_outline);
            } else {
              final task = Task(
                content: [
                  Content(
                    description: controllerDescription.text,
                    isCompleted: false,
                  )
                ],
                contentCount: 1,
                date: Constants.currentDate,
                title: controllerTitle.text,
              );

              await todoService.create(task);

              // ignore: use_build_context_synchronously
              Navigator.of(context).pop();
              NotificationService.showSnackbar('Tarea Creada correctamente!',
                  Colors.green, Icons.info_outline);
              await todoService.getAll();
            }
          },
          child: const Text('Crear',
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
