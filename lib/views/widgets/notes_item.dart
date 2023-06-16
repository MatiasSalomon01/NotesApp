import 'package:flutter/material.dart';
import 'package:notes_app/models/models.dart';

class NotesItem extends StatelessWidget {
  final Notes note;
  const NotesItem({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 4,
              offset: Offset(4, 4),
            ),
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
                        note.title,
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
                  note.date,
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
              child: Text(note.content),
            ),
          ],
        ),
      ),
    );
  }
}
