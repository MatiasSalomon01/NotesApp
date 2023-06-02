import 'package:flutter/material.dart';

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
                title: const Text('Creacion de Tarea'),
                content: Container(
                  height: 150,
                  child: Column(
                    children: [
                      TextFormField(
                        enabled: false,
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          hintText:
                              '${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}',
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
                    onPressed: () {
                      if (controllerTitle.text.isEmpty ||
                          controllerDescription.text.isEmpty) {
                        print("ERROR LOS INPUTS ESTAN VACIOS");
                      } else {
                        print(
                            "INFORMACION: ${controllerTitle.text} - ${controllerDescription.text}");
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
