import 'package:flutter/material.dart';
import 'package:notes_app/services/services.dart';
import 'package:provider/provider.dart';

class TodoItem extends StatefulWidget {
  final String? id;
  final String description;
  final bool isCompleted;
  const TodoItem({
    super.key,
    this.id,
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

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final todoService = Provider.of<TodoService>(context);

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
            onChanged: (value) => setState(() => activated = !activated),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              widget.description,
              style: TextStyle(
                  decoration: activated ? TextDecoration.lineThrough : null),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ),
          if (size.width > 711) ...[
            IconButton(
              onPressed: () {},
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
              onPressed: () {},
              splashRadius: 20,
              icon: const Icon(Icons.copy),
              tooltip: 'Copiar Todo',
            ),
            const SizedBox(width: 10),
          ] else ...[
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
                    onTap: () => print('asdasdsadsa'),
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
                    onTap: () => print('asdasdsadsa'),
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
            const SizedBox(width: 5),
          ],
        ],
      ),
    );
  }

  Future _delete(TodoService todoService) async {
    await todoService.delete(widget.id!);
    NotificationService.showSnackbar(
        'Tarea Eliminada correctamente!', Colors.green);
    await todoService.getAll();
  }
}
