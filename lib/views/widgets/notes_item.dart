import 'package:flutter/material.dart';
import 'package:notes_app/models/models.dart';
import 'package:notes_app/views/widgets/notes_content.dart';

class NotesItem extends StatefulWidget {
  final Notes note;
  const NotesItem({super.key, required this.note});

  @override
  State<NotesItem> createState() => _NotesItemState();
}

class _NotesItemState extends State<NotesItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => isHover = true),
      onExit: (event) => setState(() => isHover = false),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: const Dialog(
                  child: NotesContent(),
                ),
              );
            },
          );
        },
        child: Container(
          margin: const EdgeInsets.all(10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Color(widget.note.color),
            borderRadius: BorderRadius.circular(8),
            boxShadow: isHover == true
                ? const [
                    BoxShadow(
                      color: Colors.black38,
                      blurRadius: 5,
                      // offset: Offset(4, 4),
                    )
                  ]
                : null,
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
                          widget.note.title,
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
                    widget.note.date,
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
                child: Text(widget.note.content),
              ),
              // Row(
              //   children: [
              //     Icon(Icons.format_bold_outlined),
              //     Icon(Icons.format_italic),
              //     Icon(Icons.format_underline_outlined),
              //     Icon(Icons.format_align_left_outlined),
              //     Icon(Icons.format_align_center_outlined),
              //     Icon(Icons.format_align_right_outlined),
              //     Icon(Icons.format_align_justify_outlined),
              //     Icon(Icons.text_increase),
              //     Icon(Icons.text_decrease),
              //     Icon(Icons.format_list_bulleted_sharp),
              //     Icon(Icons.copy_all),
              //     Icon(Icons.share),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
