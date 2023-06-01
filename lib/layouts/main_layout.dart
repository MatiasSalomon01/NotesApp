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
      body: Stack(
        children: [
          Row(
            children: [
              if (size.width > 637) const SideBar(),
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
          if (size.width < 637) ...{
            // Container(
            //   color: Colors.amber,
            // ),
            Row(
              children: [
                const SideBar(),
                if (mainLayoutProvider.openSidebar)
                  Expanded(
                    child: GestureDetector(
                      onTap: () => mainLayoutProvider.openSidebar = false,
                      child: Container(
                        color: Colors.black45,
                      ),
                    ),
                  )
              ],
            )
          },
          if (size.width < 291)
            Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
                backgroundColor: Colors.grey,
                onPressed: () {},
              ),
            ),
        ],
      ),
    );
  }
}
