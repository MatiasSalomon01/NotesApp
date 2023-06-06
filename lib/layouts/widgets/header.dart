import 'package:flutter/material.dart';
import 'package:notes_app/constants/constants.dart';
import 'package:notes_app/layouts/widgets/widgets.dart';
import 'package:notes_app/modals/modals.dart';
import 'package:notes_app/providers/main_layout_provider.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final mainLayoutProvider = Provider.of<MainLayoutProvider>(context);
    final safeArea = MediaQuery.of(context).padding.top;
    final platform = Theme.of(context).platform;
    return Container(
      padding: Constants.setHeaderPlatformPadding(platform, safeArea, size),
      color: const Color(0xffE1E1E1),
      height: Constants.setHeaderPlatformHeight(platform),
      child: Container(
        margin: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (size.width < 638) ...[
              _SidebarMenuButton(mainLayoutProvider: mainLayoutProvider),
              const SizedBox(width: 5),
            ],
            if (size.width > 713.0) ...{
              const SearchBar(width: 400),
            } else ...{
              const Expanded(child: SearchBar())
            },
            if (size.width > 483) ...[
              const CustomTextButton(),
            ] else ...[
              CustomOutlinedButton(
                icon: Icons.add,
                onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const TodoCreationModal(),
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

class _SidebarMenuButton extends StatelessWidget {
  const _SidebarMenuButton({
    required this.mainLayoutProvider,
  });

  final MainLayoutProvider mainLayoutProvider;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      splashRadius: 20,
      onPressed: () {
        mainLayoutProvider.openSidebar = true;
      },
      icon: const Icon(Icons.menu),
    );
  }
}
