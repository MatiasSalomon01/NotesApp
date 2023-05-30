import 'package:flutter/material.dart';
import 'package:notes_app/providers/main_layout_provider.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(),
      // drawer: Drawer(),
      body: Row(
        children: [
          (size.width) > 600 ? const SideBar() : Container(),
          const Header(),
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
    return Expanded(
      child: Column(
        children: [
          Container(
            height: 60,
            color: Colors.amber,
            child: Row(
              children: [
                IconButton(
                  tooltip: 'Menu Lateral',
                  onPressed: () {},
                  icon: const Icon(Icons.menu),
                ),
              ],
            ),
          ),
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
    // final mainLayoutProvider = Provider.of<MainLayoutProvider>(context);
    return Container(
      color: Colors.grey,
      width: 210,
    );
  }
}
