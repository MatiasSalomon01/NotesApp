import 'package:flutter/material.dart';
import 'package:notes_app/providers/main_layout_provider.dart';
import 'package:notes_app/widgets/header.dart';
import 'package:notes_app/widgets/sidebar.dart';
import 'package:provider/provider.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainLayoutProvider = Provider.of<MainLayoutProvider>(context);
    return Scaffold(
      // extendBodyBehindAppBar: true,
      backgroundColor: const Color(0xffF3F3F3),
      body: Row(
        children: [
          if (size.width > 600) const SideBar(),
          Expanded(
            child: Column(
              children: [
                const Header(),
                mainLayoutProvider.view,
              ],
            ),
          )
        ],
      ),
    );
  }
}
