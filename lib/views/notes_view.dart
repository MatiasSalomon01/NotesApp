import 'package:flutter/material.dart';
import 'package:notes_app/services/services.dart';
import 'package:provider/provider.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final notesService = Provider.of<NotesService>(context);
    final width = MediaQuery.of(context).size.width;
    return notesService.isLoading
        ? const Padding(
            padding: EdgeInsets.all(30),
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          )
        : Expanded(
            child: GridView.builder(
              shrinkWrap: true,
              itemCount: notesService.notes.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > 1162
                    ? 4
                    : width > 713
                        ? 3
                        : width > 483
                            ? 2
                            : 1,
              ),
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(notesService.notes[index].color),
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.black38,
                            blurRadius: 4,
                            offset: Offset(4, 4)),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    notesService.notes[index].title,
                                    style: const TextStyle(
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                                PopupMenuButton(
                                  tooltip: '',
                                  offset: const Offset(0, 30),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(Icons.more_vert_outlined),
                                  itemBuilder: (context) {
                                    return [
                                      PopupMenuItem(
                                        onTap: () {},
                                        child: Row(
                                          children: const [
                                            Icon(Icons.delete),
                                            SizedBox(width: 10),
                                            Text('Eliminar'),
                                          ],
                                        ),
                                      ),
                                      PopupMenuItem(
                                        onTap: () {},
                                        child: Row(
                                          children: const [
                                            Icon(Icons.color_lens),
                                            SizedBox(width: 10),
                                            Text('Cambiar Color'),
                                          ],
                                        ),
                                      )
                                    ];
                                  },
                                )
                              ],
                            ),
                            Text(
                              notesService.notes[index].date,
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.black45,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        const Divider(),
                        Expanded(
                          child: Text(notesService.notes[index].content),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
  }
}
