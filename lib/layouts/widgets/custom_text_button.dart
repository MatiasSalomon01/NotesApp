import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/modals/modals.dart';
import 'package:notes_app/models/models.dart';
import 'package:notes_app/services/todo_service.dart';
import 'package:notes_app/views/widgets/todo_item.dart';
import 'package:provider/provider.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key});

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
              return const TodoCreationModal();
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

class CustomTextButton2 extends StatefulWidget {
  final String description;
  final int index;
  const CustomTextButton2(
      {super.key, required this.description, required this.index});

  @override
  State<CustomTextButton2> createState() => _CustomTextButton2State();
}

class _CustomTextButton2State extends State<CustomTextButton2> {
  bool change = false;
  @override
  Widget build(BuildContext context) {
    final todoService = Provider.of<TodoService>(context);
    return change == false
        ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: TextButton(
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.grey[300]),
              ),
              onPressed: () {
                setState(() => change = true);
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  Text(
                    "Nueva Tarea",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                    ),
                  ),
                ],
              ),
            ),
          )
        : Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5, left: 5),
                    child: TextFormField(
                      initialValue: widget.description,
                      cursorColor: Colors.black,
                      autofocus: true,
                      onEditingComplete: () async {
                        setState(() => change = false);

                        // final task = Task(
                        //   content: [
                        //     Content(
                        //       description: widget.description,
                        //       isCompleted: false,
                        //     )
                        //   ],
                        //   contentCount: 1,
                        //   date: Constants.currentDate,
                        //   title: widget.id!,
                        // );
                      },
                      style: const TextStyle(fontSize: 14),
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 12),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 1.2,
                          ),
                        ),
                        isCollapsed: true,
                      ),
                      onChanged: (value) {},
                    ),
                  ),
                ),
                Tooltip(
                  message: 'Confirmar',
                  waitDuration: const Duration(milliseconds: 800),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(14),
                    ),
                    onPressed: () async {
                      setState(() => change = false);
                      print(todoService.indexMap[widget.index]);
                      // await _updateDescription(todoService, firstDescription);
                      // setState(() => editing = false);
                    },
                    child: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
  }
}
