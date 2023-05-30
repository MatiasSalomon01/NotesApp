import 'package:flutter/material.dart';
import 'package:notes_app/widgets/title.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final safeArea = MediaQuery.of(context).padding.top;
    final platform = Theme.of(context).platform;
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
      child: Row(
        children: [
          if (size.width < 600) ...[
            IconButton(
              tooltip: 'Menu Lateral',
              onPressed: () {
                print(Theme.of(context).platform);
              },
              icon: const Icon(Icons.menu),
            ),
            const CustomTitle(),
          ],
        ],
      ),
    );
  }
}
