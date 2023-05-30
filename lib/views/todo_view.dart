import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/todo_item.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: ListView.separated(
          shrinkWrap: true,
          itemCount: Listas.listas.length,
          itemBuilder: (context, index) => TodoItem(
              description: Listas.listas[index].descripcion!,
              isCompleted: Listas.listas[index].isCompleted!),
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        ),
      ),
    );
  }
}

class Listas {
  static final listas = [
    PruebaTodo('Descripcion no te puede creer Loren', true),
    PruebaTodo('Descripcion si te puede creer Loren', true),
    PruebaTodo('Descripcion no te puede creer Loren', false),
    PruebaTodo('Descripcion si te puede creer Loren', true),
    PruebaTodo('LOREEEEEEEN ', false),
    PruebaTodo('MI GOLFER', true),
    PruebaTodo('jESSICA MAFIOSA', true),
  ];
}

class PruebaTodo {
  String? descripcion;
  bool? isCompleted;

  PruebaTodo(this.descripcion, this.isCompleted);
}
