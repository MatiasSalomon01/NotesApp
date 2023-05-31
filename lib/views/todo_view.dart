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
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.commit_outlined,
                            size: 23,
                            color: Colors.black26,
                          ),
                          Text(
                            " Creado el: ${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
                            style: const TextStyle(
                                fontSize: 15, color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 3),
                      child: ListView.separated(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _Listas.listas.length,
                        itemBuilder: (context, index) => TodoItem(
                            description: _Listas.listas[index].descripcion!,
                            isCompleted: _Listas.listas[index].isCompleted!),
                        separatorBuilder: (BuildContext context, int index) {
                          return IntrinsicHeight(
                            child: Row(
                              children: const [
                                VerticalDivider(color: Colors.grey),
                                Expanded(child: Divider(endIndent: 15)),
                              ],
                            ),
                          );
                        },
                      ),
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

class _Listas {
  static final listas = [
    _PruebaTodo(
        'Descripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacerescripcion de tarea por hacer',
        true),
    _PruebaTodo('Descripcion de tarea por hacer', true),
    _PruebaTodo('Descripcion de tarea por hacer', false),
    _PruebaTodo('Descripcion de tarea por hacer', true),
    _PruebaTodo('Descripcion de tarea por hacer ', false),
    _PruebaTodo('Descripcion de tarea por hacer', true),
    _PruebaTodo('Descripcion de tarea por hacer', true),
  ];
  static final listas2 = [
    _PruebaTodo('Descripcion de tarea por hacer', true),
    _PruebaTodo('Descripcion de tarea por hacer', false),
  ];

  static final List<_DTO> dtoListas = [
    _DTO("31/05/2023", listas.length, listas),
    _DTO("25/05/2023", listas2.length, listas2),
    _DTO("25/05/2023", listas2.length, listas2),
    _DTO("25/05/2023", listas2.length, listas2),
    _DTO("25/05/2023", listas2.length, listas2),
  ];
}

class _PruebaTodo {
  String? descripcion;
  bool? isCompleted;

  _PruebaTodo(this.descripcion, this.isCompleted);
}

class _DTO {
  String? fecha;
  int? totalContenido;
  List<_PruebaTodo> info = [];
  _DTO(this.fecha, this.totalContenido, this.info);
}
