import 'package:flutter/material.dart';
import 'package:notes_app/providers/main_layout_provider.dart';
import 'package:notes_app/widgets/title.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safeArea = MediaQuery.of(context).padding.top;
    final platform = Theme.of(context).platform;
    final mainLayoutProvider = Provider.of<MainLayoutProvider>(context);
    return Container(
      padding:
          (platform == TargetPlatform.android || platform == TargetPlatform.iOS)
              ? EdgeInsets.only(top: safeArea)
              : null,
      color: const Color(0xffE1E1E1),
      height:
          (platform == TargetPlatform.android || platform == TargetPlatform.iOS)
              ? null
              : 55,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            if (size.width < 600) ...[
              IconButton(
                onPressed: () {
                  mainLayoutProvider.openSidebar =
                      !mainLayoutProvider.openSidebar;
                },
                icon: const Icon(Icons.menu),
              ),
              const CustomTitle(),
            ],
            const Spacer(),
            TextButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
                overlayColor: MaterialStateProperty.all(Colors.grey[400]),
              ),
              onPressed: () {},
              child: Row(
                children: [
                  const Icon(
                    Icons.add,
                    color: Colors.black,
                  ),
                  Text(
                    mainLayoutProvider.addActionName,
                    style: const TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
