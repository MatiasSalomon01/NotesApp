import 'package:flutter/material.dart';

class NotesContent extends StatelessWidget {
  const NotesContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
            child: Row(
              children: const [
                Text(
                  'Titulo de la Nota',
                  style: TextStyle(fontSize: 22),
                ),
                // Divider(),
                // Icon(Icons.edit),
                // Icon(Icons.format_bold_outlined),
                // Icon(Icons.format_italic),
                // Icon(Icons.format_underline_outlined),
                // Icon(Icons.format_align_left_outlined),
                // Icon(Icons.format_align_center_outlined),
                // Icon(Icons.format_align_right_outlined),
                // Icon(Icons.format_align_justify_outlined),
                // Icon(Icons.text_decrease),
                // Icon(Icons.text_increase),
                // Icon(Icons.text_decrease),
                // Icon(Icons.format_list_bulleted_sharp),
                // Icon(Icons.copy_all),
                // Icon(Icons.share),
                // Icon(Icons.share),
              ],
            ),
          ),
          const Divider(
            thickness: 2,
          ),
          Expanded(
            child: ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              children: [
                TextFormField(
                  maxLines: null,
                  initialValue: 'Contenido',
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
