import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
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
      body: Stack(
        children: [
          const _DesktopBody(),
          if (size.width < 637) const _MobileBody(),
          if (size.width < 291)
            Positioned(
              bottom: 10,
              right: 10,
              child: FloatingActionButton(
                backgroundColor: const Color(0xffC8C8C8),
                onPressed: () {},
                child: const Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _DesktopBody extends StatelessWidget {
  const _DesktopBody();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainLayoutProvider = Provider.of<MainLayoutProvider>(context);
    return Row(
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
    );
  }
}

class _MobileBody extends StatefulWidget {
  const _MobileBody();

  @override
  State<_MobileBody> createState() => _MobileBodyState();
}

class _MobileBodyState extends State<_MobileBody> {
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback(
      (timeStamp) {
        Provider.of<MainLayoutProvider>(context, listen: false).openSidebar =
            false;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final mainLayoutProvider = Provider.of<MainLayoutProvider>(context);
    return Row(
      children: [
        if (mainLayoutProvider.openSidebar) ...[
          const SideBar(),
          Expanded(
            child: GestureDetector(
              onTap: () => mainLayoutProvider.openSidebar = false,
              child: Container(color: Colors.black45),
            ),
          )
        ]
      ],
    );
  }
}
