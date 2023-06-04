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
              onPressed: () async {
                await todoService.delete(widget.id!);
                NotificationService.showSnackbar(
                    'Tarea Eliminada correctamente!', Colors.green);
                await todoService.getAll();
              },
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
              itemBuilder: (context) {
                return [
                  PopupMenuItem<String>(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          splashRadius: 20,
                          icon: const Icon(Icons.call),
                          tooltip: 'GetAll',
                        ),
                        const Text('GetAll')
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          splashRadius: 20,
                          icon: const Icon(Icons.edit_outlined),
                          tooltip: 'Editar',
                        ),
                        const Text('Editar'),
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          splashRadius: 20,
                          icon: const Icon(Icons.delete),
                          tooltip: 'Eliminar',
                        ),
                        const Text('Eliminar')
                      ],
                    ),
                  ),
                  PopupMenuItem<String>(
                    child: Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          splashRadius: 20,
                          icon: const Icon(Icons.copy),
                          tooltip: 'Copiar Todo',
                        ),
                        const Text('Copiar Todo')
                      ],
                    ),
                  ),
                ];
              },
            ),
            // IconButton(
            //   onPressed: () {},
            //   splashRadius: 20,
            //   icon: const Icon(Icons.more_vert_outlined),
            //   tooltip: 'Opciones',
            // ),
            const SizedBox(width: 5),
          ],
        ],
      ),
    );
  }
}
