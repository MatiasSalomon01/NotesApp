import 'package:flutter/material.dart';
import 'package:notes_app/services/services.dart';
import 'package:provider/provider.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    final notesService = Provider.of<NotesService>(context);
    final width = MediaQuery.of(context).size.width;
    return Expanded(
      child: GridView.builder(
        shrinkWrap: true,
        itemCount: 20,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: width > 1024
              ? 4
              : width > 713
                  ? 3
                  : width > 483
                      ? 2
                      : 1,
        ),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(10),
            color: Colors.indigo,
            // width: 50,
            // height: 50,
          );
        },
      ),
    );
  }
}
