import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:notes_app/services/services.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatefulWidget {
  final String? id;
  String description;
  final bool isCompleted;
  int? index;
  TodoItem({
    super.key,
    this.id,
    this.index,
    required this.description,
    required this.isCompleted,
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
              await todoService.updateOnlyIsCompleted(
                  widget.id!, widget.index!, activated);
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
                        await _update(todoService, firstDescription);
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
                onPressed: () async => await _delete(todoService),
                splashRadius: 20,
                icon: const Icon(Icons.delete),
                tooltip: 'Eliminar',
              ),
              IconButton(
                onPressed: () => _copiarAlPortapeles(widget.description),
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
                    await _update(todoService, firstDescription);
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
                padding: const EdgeInsets.all(0),
                offset: const Offset(0, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
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
                      onTap: () async => await _delete(todoService),
                      child: Row(
                        children: const [
                          Icon(Icons.delete),
                          SizedBox(width: 10),
                          Text('Eliminar'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () => _copiarAlPortapeles(widget.description),
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
                child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.green,
                    shape: const CircleBorder(),
                    padding: const EdgeInsets.all(10),
                  ),
                  onPressed: () async {
                    await _update(todoService, firstDescription);
                    setState(() => editing = false);
                  },
                  child: const Icon(
                    Icons.done,
                    color: Colors.white,
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

  Future _delete(TodoService todoService) async {
    await todoService.delete(widget.id!);
    NotificationService.showSnackbar(
        'Tarea Eliminada correctamente!', Colors.green, Icons.info_outline);
    await todoService.getAll();
  }

  Future _update(TodoService todoService, String firstDescription) async {
    if (firstDescription != widget.description) {
      await todoService.updateOnlyDescription(
          widget.id!, widget.index!, widget.description);
      NotificationService.showSnackbar(
          'Actualizado con Exito!', Colors.green, Icons.info_outline);
    }
  }

  _copiarAlPortapeles(String descripcion) {
    Clipboard.setData(ClipboardData(text: widget.description));
    NotificationService.showSnackbar(
        'Copiado al portapapeles', Colors.green, Icons.info_outline);
  }
}
