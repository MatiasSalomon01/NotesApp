import 'package:flutter/material.dart';
import 'package:notes_app/views/widgets/todo_item.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.only(left: 5, bottom: 15),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                padding: const EdgeInsets.only(top: 10),
                physics: const BouncingScrollPhysics(
                  decelerationRate: ScrollDecelerationRate.fast,
                ),
                shrinkWrap: true,
                itemCount: _Listas.dtoListas.length,
                itemBuilder: (context, index1) {
                  return Column(
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.commit_outlined,
                            size: 23,
                            color: Colors.black26,
                          ),
                          Expanded(
                            child: Text(
                              " Creado el: ${_Listas.dtoListas[index1].fecha} - ${_Listas.dtoListas[index1].titulo}",
                              maxLines: 2,
                              style: const TextStyle(
                                  fontSize: 15, color: Colors.grey),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 3),
                        child: ListView.builder(
                          padding: const EdgeInsets.all(0),
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _Listas.dtoListas[index1].totalContenido,
                          itemBuilder: (context, index2) {
                            return TodoItem(
                              description: _Listas
                                  .dtoListas[index1].info[index2].descripcion!,
                              isCompleted: _Listas
                                  .dtoListas[index1].info[index2].isCompleted!,
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 3),
                      child: Row(
                        children: const [
                          VerticalDivider(color: Colors.grey),
                          SizedBox(height: 15)
                        ],
                      ),
                    ),
                  );
                },
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
    _DTO("CRM CUSTOM", "31/05/2023", listas.length, listas),
    _DTO("CASA", "25/05/2023", listas2.length, listas2),
    _DTO("UNIVERSIDAD", "25/05/2023", listas2.length, listas2),
    _DTO("CRM CUSTOM", "31/05/2023", listas.length, listas),
  ];
}

class _PruebaTodo {
  String? descripcion;
  bool? isCompleted;

  _PruebaTodo(this.descripcion, this.isCompleted);
}

class _DTO {
  String? fecha;
  String? titulo;
  int? totalContenido;
  List<_PruebaTodo> info = [];
  _DTO(this.titulo, this.fecha, this.totalContenido, this.info);
}
