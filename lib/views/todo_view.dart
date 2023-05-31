import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/todo_item.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 15, left: 5),
        child: Row(
          children: [
            Stack(
              children: [
                Container(
                  color: Colors.grey.withOpacity(0.3),
                  width: 2,
                  margin: const EdgeInsets.symmetric(horizontal: 12),
                ),
                Positioned(
                  right: 2,
                  child: Container(
                    color: const Color(0xffF3F3F3),
                    child: Icon(
                      Icons.commit_outlined,
                      size: 22,
                      color: Colors.black26,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    " Creado el: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                    style: const TextStyle(fontSize: 15, color: Colors.grey),
                  ),
                  const SizedBox(height: 3),
                  Expanded(
                    child: ListView.separated(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      itemCount: Listas.listas.length,
                      itemBuilder: (context, index) => TodoItem(
                          description: Listas.listas[index].descripcion!,
                          isCompleted: Listas.listas[index].isCompleted!),
                      separatorBuilder: (BuildContext context, int index) =>
                          const Divider(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Listas {
  static final listas = [
    PruebaTodo(
        'Descripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacer',
        true),
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
