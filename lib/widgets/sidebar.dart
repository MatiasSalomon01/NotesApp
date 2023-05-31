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

  navigateTo(BuildContext context, Widget newView, String nameView,
      String addActionName) {
    final mainLayoutProvider =
        Provider.of<MainLayoutProvider>(context, listen: false);
    mainLayoutProvider.changeViewTo(newView);
    mainLayoutProvider.openSidebar = false;
    mainLayoutProvider.currentView = nameView;
    mainLayoutProvider.addActionName = addActionName;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainLayoutProvider = Provider.of<MainLayoutProvider>(context);
    return Container(
      color: const Color(0xffE1E1E1),
      width: size.width > 600
          ? 200
          : mainLayoutProvider.openSidebar
              ? mainLayoutProvider.platform == TargetPlatform.android
                  ? 300
                  : 200
              : 0,
      child: ListView(
        children: [
          const CustomTitle(
            margin: EdgeInsets.only(bottom: 20, top: 10),
          ),
          SidebarItem(
            title: 'Por Hacer',
            icon: Icons.today_outlined,
            onPressed: () => navigateTo(
                context, const TodoView(), Routes.todo, "Nueva Tarea"),
            isActive: mainLayoutProvider.currentView == Routes.todo,
          ),
          SidebarItem(
            title: 'Notas',
            icon: Icons.notes_outlined,
            onPressed: () => navigateTo(
                context, const NotesView(), Routes.notes, "Nueva Nota"),
            isActive: mainLayoutProvider.currentView == Routes.notes,
          ),
          SidebarItem(
            title: 'Tareas',
            icon: Icons.home_work_outlined,
            onPressed: () => navigateTo(
                context, const HomeworkView(), Routes.homework, "Nueva Tarea"),
            isActive: mainLayoutProvider.currentView == Routes.homework,
          ),
          SidebarItem(
            title: 'Recordar',
            icon: Icons.checklist_rtl_outlined,
            onPressed: () => navigateTo(context, const ToRememberView(),
                Routes.toRemember, "Nuevo Recordatorio"),
            isActive: mainLayoutProvider.currentView == Routes.toRemember,
          ),
        ],
      ),
    );
  }
}
