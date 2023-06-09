import 'package:flutter/material.dart';

class SidebarItem extends StatefulWidget {
  final String title;
  final IconData icon;
  final Function onPressed;
  final bool isActive;
  const SidebarItem({
    super.key,
    required this.title,
    required this.icon,
    required this.onPressed,
    this.isActive = false,
  });

  @override
  State<SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<SidebarItem> {
  bool isHover = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: isHover
          ? Colors.black12
          : widget.isActive
              ? Colors.black12
              : Colors.transparent,
      child: MouseRegion(
        onEnter: (event) => setState(() => isHover = true),
        onExit: (event) => setState(() => isHover = false),
        child: ListTile(
          leading: Icon(widget.icon),
          title: Text(widget.title),
          horizontalTitleGap: 0,
          onTap: widget.isActive ? null : () => widget.onPressed(),
        ),
      ),
    );
  }
}
