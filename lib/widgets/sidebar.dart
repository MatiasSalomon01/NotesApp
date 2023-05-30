import 'package:flutter/material.dart';
import 'package:notes_app/layouts/widgets/widgets.dart';
import 'package:notes_app/providers/main_layout_provider.dart';
import 'package:notes_app/views/views.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final mainLayoutProvider = Provider.of<MainLayoutProvider>(context);
    return Container(
      color: const Color(0xffE1E1E1),
      width: 200,
      child: ListView(
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 20, top: 10),
            child: const Center(
              child: Text(
                'Notes App',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          SidebarItem(
            title: 'Por Hacer',
            icon: Icons.today_outlined,
            onPressed: () => mainLayoutProvider.changeViewTo(const TodoView()),
          ),
          SidebarItem(
            title: 'Notas',
            icon: Icons.notes_outlined,
            onPressed: () => mainLayoutProvider.changeViewTo(const NotesView()),
          ),
          SidebarItem(
            title: 'Tareas',
            icon: Icons.home_work_outlined,
            onPressed: () =>
                mainLayoutProvider.changeViewTo(const HomeworkView()),
          ),
          SidebarItem(
            title: 'Recordar',
            icon: Icons.checklist_rtl_outlined,
            onPressed: () =>
                mainLayoutProvider.changeViewTo(const ToRememberView()),
          ),
        ],
      ),
    );
  }
}
