import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  final double? width;
  const SearchBar({
    super.key,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: size.width > 412 ? 300 : 200,
      width: width,
      height: 30,
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
