import 'package:flutter/material.dart';
import 'package:notes_app/services/services.dart';
import 'package:provider/provider.dart';

class SearchBar extends StatelessWidget {
  final double? width;
  const SearchBar({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    final todoService = Provider.of<TodoService>(context);
    return Container(
      width: width,
      height:
          (platform == TargetPlatform.android || platform == TargetPlatform.iOS)
              ? 40
              : 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        scrollPadding: const EdgeInsets.all(0),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Buscar',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          hintStyle: TextStyle(color: Colors.grey),
        ),
        onChanged: (value) async {
          if (value.isEmpty) {
            await todoService.getAllFiltered(todoService.tasksCopy);
          }
          var newTasks = todoService.tasks
              .where((element) => element.title.startsWith(value))
              .toList();
          if (newTasks.isEmpty) {
            todoService.isEmptyText = 'No hay tareas que empiecen con $value';
          }
          await todoService.getAllFiltered(newTasks);
        },
      ),
    );
  }
}
