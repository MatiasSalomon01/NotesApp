import 'package:flutter/material.dart';
import 'package:notes_app/modals/modals.dart';
import 'package:notes_app/services/services.dart';
import 'package:provider/provider.dart';

class TitleDateItem extends StatelessWidget {
  final String date;
  String? title;
  String? id;
  TitleDateItem({super.key, required this.date, this.title, this.id});

  @override
  Widget build(BuildContext context) {
    final todoService = Provider.of<TodoService>(context);
    return Expanded(
      child: Tooltip(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        message: title,
        waitDuration: const Duration(milliseconds: 800),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Text(
                " Creado el: $date • $title",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                softWrap: true,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 13),
              child: PopupMenuButton(
                splashRadius: 20,
                padding: const EdgeInsets.all(0),
                offset: const Offset(0, 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                onSelected: (value) {
                  if (value == 'editar') {
                    showDialog(
                        context: context,
                        builder: (context) =>
                            TodoEditTitleModal(id: id!, title: title!));
                  }
                },
                child: const Icon(Icons.settings),
                itemBuilder: (context) {
                  return [
                    PopupMenuItem(
                      value: 'editar',
                      child: Row(
                        children: const [
                          Icon(Icons.edit_outlined),
                          SizedBox(width: 10),
                          Text('Editar Titulo'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () async => await _delete(
                        todoService,
                        id!,
                      ),
                      child: Row(
                        children: const [
                          Icon(Icons.delete),
                          SizedBox(width: 10),
                          Text('Eliminar Todo'),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      onTap: () {},
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
            ),
          ],
        ),
      ),
    );
  }

  Future _delete(TodoService todoService, String id) async {
    await todoService.delete(id);
    NotificationService.showSnackbar(
        'Tarea Eliminada correctamente!', Colors.green, Icons.info_outline);
  }
}
