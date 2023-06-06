import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final double? width;
  const SearchBar({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final platform = Theme.of(context).platform;
    return Container(
      width: width,
      height:
          (platform == TargetPlatform.android || platform == TargetPlatform.iOS)
              ? 40
              : 30,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextFormField(
        cursorColor: Colors.black,
        initialValue: null,
        scrollPadding: const EdgeInsets.all(0),
        decoration: const InputDecoration(
          border: InputBorder.none,
          hintText: 'Buscar',
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          labelStyle: TextStyle(
            color: Colors.grey,
          ),
          hintStyle: TextStyle(color: Colors.grey),
        ),
      ),
    );
  }
}
