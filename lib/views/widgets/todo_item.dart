import 'package:flutter/material.dart';

class TodoItem extends StatefulWidget {
  final String description;
  final bool isCompleted;
  const TodoItem({
    super.key,
    required this.description,
    required this.isCompleted,
  });

  @override
  State<TodoItem> createState() => _TodoItemState(isCompleted);
}

class _TodoItemState extends State<TodoItem> {
  late bool activated;

  _TodoItemState(bool isCompleted) {
    activated = isCompleted;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
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
              maxLines: 2,
            ),
          ),
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            icon: const Icon(Icons.edit_outlined),
          ),
          IconButton(
            onPressed: () {},
            splashRadius: 20,
            icon: const Icon(Icons.delete),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
