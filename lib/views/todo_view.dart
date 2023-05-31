import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/todo_item.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Creado el: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
              style: const TextStyle(fontSize: 15, color: Colors.grey),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemCount: Listas.listas.length,
              itemBuilder: (context, index) => TodoItem(
                  description: Listas.listas[index].descripcion!,
                  isCompleted: Listas.listas[index].isCompleted!),
              separatorBuilder: (BuildContext context, int index) =>
                  const Divider(),
            ),
          ],
        ),
      ),
    );
  }
}

class Listas {
  static final listas = [
    PruebaTodo('Descripcion de tarea por hacer', true),
    PruebaTodo('Descripcion de tarea por hacer', true),
    PruebaTodo('Descripcion de tarea por hacer', false),
    PruebaTodo('Descripcion de tarea por hacer', true),
    PruebaTodo('Descripcion de tarea por hacer ', false),
    PruebaTodo('Descripcion de tarea por hacer', true),
    PruebaTodo('Descripcion de tarea por hacer', true),
  ];
}

class PruebaTodo {
  String? descripcion;
  bool? isCompleted;

  PruebaTodo(this.descripcion, this.isCompleted);
}
