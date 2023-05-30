import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/layouts/widgets/widgets.dart';
import 'package:notes_app/providers/main_layout_provider.dart';
import 'package:notes_app/views/views.dart';
import 'package:notes_app/widgets/title.dart';
import 'package:provider/provider.dart';

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  navigateTo(BuildContext context, Widget newView, String nameView) {
    final mainLayoutProvider =
        Provider.of<MainLayoutProvider>(context, listen: false);
    mainLayoutProvider.changeViewTo(newView);
    mainLayoutProvider.currentView = nameView;
  }

  @override
  Widget build(BuildContext context) {
    final mainLayoutProvider = Provider.of<MainLayoutProvider>(context);
    return Container(
      color: const Color(0xffE1E1E1),
      width: 200,
      child: ListView(
        children: [
          const CustomTitle(
            margin: EdgeInsets.only(bottom: 20, top: 10),
          ),
          SidebarItem(
            title: 'Por Hacer',
            icon: Icons.today_outlined,
            onPressed: () => navigateTo(context, const TodoView(), Routes.todo),
            isActive: mainLayoutProvider.currentView == Routes.todo,
          ),
          SidebarItem(
            title: 'Notas',
            icon: Icons.notes_outlined,
            onPressed: () =>
                navigateTo(context, const NotesView(), Routes.notes),
            isActive: mainLayoutProvider.currentView == Routes.notes,
          ),
          SidebarItem(
            title: 'Tareas',
            icon: Icons.home_work_outlined,
            onPressed: () =>
                navigateTo(context, const HomeworkView(), Routes.homework),
            isActive: mainLayoutProvider.currentView == Routes.homework,
          ),
          SidebarItem(
            title: 'Recordar',
            icon: Icons.checklist_rtl_outlined,
            onPressed: () =>
                navigateTo(context, const ToRememberView(), Routes.toRemember),
            isActive: mainLayoutProvider.currentView == Routes.toRemember,
          ),
        ],
      ),
    );
  }
}
