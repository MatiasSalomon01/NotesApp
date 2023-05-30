import 'package:flutter/material.dart';
import 'package:notes_app/layouts/widgets/widgets.dart';
import 'package:notes_app/providers/main_layout_provider.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color(0xffF3F3F3),
      body: Row(
        children: [
          if (size.width > 600) const SideBar(),
          Expanded(
            child: Column(
              children: const [
                Header(),
                Body(),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class SideBar extends StatelessWidget {
  const SideBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
          const SidebarItem(title: 'Por Hacer', icon: Icons.today_outlined),
          const SidebarItem(title: 'Notas', icon: Icons.notes_outlined),
          const SidebarItem(title: 'Tareas', icon: Icons.home_work_outlined),
          const SidebarItem(
              title: 'Recordar', icon: Icons.checklist_rtl_outlined),
        ],
      ),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: 55,
      color: const Color(0xffE1E1E1),
      child: Row(
        children: [
          if (size.width < 600)
            IconButton(
              tooltip: 'Menu Lateral',
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
        ],
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          // color: Colors.red,
          ),
    );
  }
}
