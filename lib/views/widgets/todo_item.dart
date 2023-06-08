import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/modals/modals.dart';
import 'package:notes_app/models/models.dart';
import 'package:notes_app/services/services.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatefulWidget {
  final String? id;
  String description;
  final bool isCompleted;
  int? index;
  final Task task;
  TodoItem({
    super.key,
    this.id,
    this.index,
    required this.description,
    required this.isCompleted,
    required this.task,
  });

  @override
  // ignore: no_logic_in_create_state
  State<TodoItem> createState() => _TodoItemState(isCompleted);
}

class _TodoItemState extends State<TodoItem> {
  late bool activated;

  _TodoItemState(bool isCompleted) {
    activated = isCompleted;
  }

  bool editing = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final todoService = Provider.of<TodoService>(context);
    String firstDescription = widget.description;
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const VerticalDivider(
            color: Colors.grey,
          ),
          Checkbox(
            activeColor: Colors.black,
            value: activated,
            onChanged: (value) async {
              setState(() => activated = !activated);
              await _updateIsCompleted(todoService);
            },
          ),
          const SizedBox(width: 10),
          !editing
              ? Expanded(
                  child: Text(
                    widget.description,
                    style: TextStyle(
                        decoration:
                            activated ? TextDecoration.lineThrough : null),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: TextFormField(
                      initialValue: widget.description,
                      cursorColor: Colors.black,
                      autofocus: true,
                      onEditingComplete: () async {
                        await _updateDescription(todoService, firstDescription);
                        setState(() => editing = false);
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
                      onChanged: (value) => widget.description = value,
                    ),
                  ),
                ),
          if (size.width > 711) ...[
            if (!editing) ...[
              IconButton(
                onPressed: () => setState(() => editing = true),
                splashRadius: 20,
                icon: const Icon(Icons.edit_outlined),
                tooltip: 'Editar',
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => WarningModal(
                        onPressed: () async {
                          await deleteByContentIndex(
                              todoService, widget.task, widget.index!);
                        },
                        description: widget.description),
                  );
                },
                splashRadius: 20,
                icon: const Icon(Icons.delete),
                tooltip: 'Eliminar',
              ),
              IconButton(
                onPressed: () => Utility.copyToClipboard(widget.description),
                splashRadius: 20,
                icon: const Icon(Icons.copy),
                tooltip: 'Copiar Todo',
              ),
            ] else ...[
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
                    await _updateDescription(todoService, firstDescription);
                    setState(() => editing = false);
                  },
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
            const SizedBox(width: 10),
          ] else ...[
            if (!editing) ...[
              PopupMenuButton(
                splashRadius: 18,
                offset: const Offset(0, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onSelected: (value) {
                  if (value == 'eliminar') {
                    showDialog(
                      context: context,
                      builder: (context) => WarningModal(
                          onPressed: () async {
                            await deleteByContentIndex(
                                todoService, widget.task, widget.index!);
                          },
                          description: widget.description),
                    );
                  }
                },
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      onTap: () => setState(() => editing = true),
                      child: Row(
                        children: const [
                          Icon(Icons.edit_outlined),
                          SizedBox(width: 10),
                          Text('Editar'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'eliminar',
                      child: Row(
                        children: const [
                          Icon(Icons.delete),
                          SizedBox(width: 10),
                          Text('Eliminar'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () => Utility.copyToClipboard(widget.description),
                      child: Row(
                        children: const [
                          Icon(Icons.copy),
                          SizedBox(width: 10),
                          Text('Copiar Todo'),
                        ],
                      ),
                    ),
                  ];
                },
              ),
            ] else ...[
              Tooltip(
                message: 'Confirmar',
                waitDuration: const Duration(milliseconds: 800),
                child: GestureDetector(
                  onTap: () async {
                    await _updateDescription(todoService, firstDescription);
                    setState(() => editing = false);
                  },
                  child: Container(
                    margin: const EdgeInsets.only(right: 5),
                    padding: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.green,
                    ),
                    child: const Icon(
                      Icons.done,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
            const SizedBox(width: 5),
          ],
        ],
      ),
    );
  }

  Future deleteByContentIndex(
      TodoService todoService, Task task, int index) async {
    task.content.removeAt(index);
    task.contentCount--;
    await todoService.deleteByContentIndex(task, index);
    NotificationService.showSnackbar(
        'Tarea Eliminada correctamente!', Colors.green, Icons.info_outline);
  }

  Future _updateDescription(
      TodoService todoService, String firstDescription) async {
    if (firstDescription != widget.description) {
      await todoService.updateOnlyDescription(
          widget.task.id!, widget.index!, widget.description);
      NotificationService.showSnackbar(
          'Actualizado con Exito!', Colors.green, Icons.info_outline);
    }
  }

  Future _updateIsCompleted(TodoService todoService) async {
    var task = todoService.tasks
        .where((element) => element.id == widget.task.id)
        .first;
    await todoService.updateOnlyIsCompleted(task, widget.index!, activated);
  }
}
