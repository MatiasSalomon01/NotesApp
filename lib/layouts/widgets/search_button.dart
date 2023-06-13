import 'package:flutter/material.dart';

class SearchButton extends StatefulWidget {
  const SearchButton({super.key});

  @override
  State<SearchButton> createState() => _SearchButtonState();
}

class _SearchButtonState extends State<SearchButton> {
  bool change = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () => setState(() => change = !change),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Colors.grey[500]!),
          ),
          child: !change
              ? Row(
                  children: const [
                    Icon(
                      Icons.search,
                      color: Colors.black54,
                    ),
                    SizedBox(width: 5),
                    Text(
                      'Buscar',
                      style: TextStyle(
                        color: Colors.black54,
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                      ),
                    ),
                  ],
                )
              : TextFormField(
                  cursorColor: Colors.black,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(5),
                    isCollapsed: true,
                  ),
                ),
        ),
      ),
    );
  }
}
