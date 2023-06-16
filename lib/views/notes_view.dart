import 'package:flutter/material.dart';
import 'package:notes_app/services/services.dart';
import 'package:notes_app/views/widgets/notes_item.dart';
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
                return NotesItem(note: notesService.notes[index]);
              },
            ),
          );
  }
}
