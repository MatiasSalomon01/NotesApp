import 'package:flutter/material.dart';
import 'package:notes_app/modals/modals.dart';
import 'package:notes_app/models/models.dart';
import 'package:notes_app/services/todo_service.dart';
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
  final Task task;
  const CustomTextButton2({
    super.key,
    required this.task,
  });

  @override
  State<CustomTextButton2> createState() => _CustomTextButton2State();
}

class _CustomTextButton2State extends State<CustomTextButton2> {
  bool change = false;
  bool isHover = false;
  String description = "";
  @override
  Widget build(BuildContext context) {
    final todoService = Provider.of<TodoService>(context);
    return change == false
        ? Row(
            children: [
              MouseRegion(
                onEnter: (event) => setState(() => isHover = true),
                onExit: (event) => setState(() => isHover = false),
                child: GestureDetector(
                  onTap: () => setState(() => change = true),
                  child: Container(
                    margin: const EdgeInsets.only(
                      left: 2,
                    ),
                    padding: const EdgeInsets.only(
                        right: 8, left: 2, bottom: 2, top: 2),
                    decoration: BoxDecoration(
                        color: isHover
                            ? Colors.green.withOpacity(0.6)
                            : Colors.green.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(4)),
                    child: Row(
                      children: const [
                        Icon(Icons.add),
                        Text('Nueva Tarea'),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )
        : Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: TextFormField(
                      cursorColor: Colors.black,
                      autofocus: true,
                      onEditingComplete: () async =>
                          await _updateContent(todoService, description),
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
                      onChanged: (value) => description = value,
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
                    onPressed: () async =>
                        await _updateContent(todoService, description),
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

  _updateContent(TodoService todoService, String description) async {
    setState(() {
      isHover = false;
      change = false;
    });
    if (description.isNotEmpty) {
      widget.task.content.add(
        Content(description: description, isCompleted: false),
      );
      widget.task.contentCount++;
      await todoService.updateContentData(widget.task);
    }
  }
}
