import 'package:flutter/material.dart';
import 'package:notes_app/models/models.dart';

class NotesContent extends StatelessWidget {
  final Notes note;
  const NotesContent({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      padding: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color(note.color),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Row(
              children: [
                Expanded(
                  child: TextFormField(
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                    initialValue: note.title,
                    cursorColor: Colors.black,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Expanded(
            flex: 10,
            child: Container(
              child: ListView(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                children: [
                  TextFormField(
                    maxLines: null,
                    initialValue: note.content,
                    textAlign: TextAlign.start,
                    cursorColor: Colors.black,
                    style: TextStyle(
                      fontWeight: null,
                      fontStyle: null,
                      fontSize: null,
                    ),
                    keyboardType: TextInputType.multiline,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () {
                print(width);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(Icons.format_bold_outlined),
                    Icon(Icons.format_italic),
                    Icon(Icons.format_underline_outlined),
                    if (width > 534) ...[
                      Icon(Icons.format_align_left_outlined),
                      Icon(Icons.format_align_center_outlined),
                      Icon(Icons.format_align_right_outlined),
                      Icon(Icons.format_align_justify_outlined),
                    ],
                    Icon(Icons.text_increase),
                    Icon(Icons.text_decrease),
                    Icon(Icons.format_list_bulleted_sharp),
                    Icon(Icons.copy_all),
                    Icon(Icons.share)
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
