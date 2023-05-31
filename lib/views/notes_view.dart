import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/todo_item.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(top: 8, bottom: 15, left: 5),
        child: Row(
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: _Listas.dtoListas.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // color: Colors.red,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(right: 5),
                            color: const Color(0xffF3F3F3),
                            child: const Icon(
                              Icons.commit_outlined,
                              size: 22,
                              color: Colors.black26,
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                    "Creado el: ${_Listas.dtoListas[index].fecha}",
                                    style: const TextStyle(
                                        fontSize: 15, color: Colors.grey)),
                                ListView.separated(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount:
                                      _Listas.dtoListas[index].info.length,
                                  itemBuilder: (context, index2) => TodoItem(
                                    description:
                                        "${_Listas.dtoListas[index].info[index2].descripcion}",
                                    isCompleted: _Listas.dtoListas[index]
                                        .info[index2].isCompleted!,
                                  ),
                                  separatorBuilder: (context, index) =>
                                      const Divider(),
                                )
                              ],
                            ),
                          ),
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
