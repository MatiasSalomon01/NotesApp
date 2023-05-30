import 'package:flutter/material.dart';
import 'package:notes_app/widgets/title.dart';

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
          if (size.width < 600) ...[
            IconButton(
              tooltip: 'Menu Lateral',
              onPressed: () {},
              icon: const Icon(Icons.menu),
            ),
            const CustomTitle(),
          ],
        ],
      ),
    );
  }
}
