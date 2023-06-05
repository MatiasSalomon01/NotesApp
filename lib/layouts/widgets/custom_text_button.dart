import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/models/models.dart';
import 'package:notes_app/services/services.dart';
import 'package:provider/provider.dart';

class CustomTextButton extends StatefulWidget {
  CustomTextButton({super.key});

  @override
  State<CustomTextButton> createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  TextEditingController controllerTitle = TextEditingController();
  TextEditingController controllerDescription = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final todoService = Provider.of<TodoService>(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
          overlayColor: MaterialStateProperty.all(Colors.grey[400]),
        ),
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
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
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey[300]),
                    ),
                    onPressed: () async {
                      if (controllerTitle.text.isEmpty ||
                          controllerDescription.text.isEmpty) {
                        print("ERROR LOS INPUTS ESTAN VACIOS");
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
                        NotificationService.showSnackbar(
                            'Tarea Creada correctamente!', Colors.green);
                        await todoService.getAll();
                      }
                    },
                    child: const Text('Crear',
                        style: TextStyle(color: Colors.black, fontSize: 15)),
                  ),
                  TextButton(
                    style: ButtonStyle(
                      overlayColor: MaterialStateProperty.all(Colors.grey[400]),
                      backgroundColor:
                          MaterialStateProperty.all(Colors.grey[300]),
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
            },
          );
        },
        child: Row(
          children: const [
            Icon(
              Icons.add,
              color: Colors.black,
            ),
            Text(
              "Añadir",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
