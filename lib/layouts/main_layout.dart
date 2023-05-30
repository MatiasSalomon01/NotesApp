import 'package:flutter/material.dart';
import 'package:notes_app/providers/main_layout_provider.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
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
      color: Colors.grey,
      width: 200,
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
      color: Colors.amber,
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
        color: Colors.red,
      ),
    );
  }
}
