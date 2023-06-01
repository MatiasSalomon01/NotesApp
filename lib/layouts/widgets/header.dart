import 'package:flutter/material.dart';
import 'package:notes_app/providers/main_layout_provider.dart';
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
        margin: const EdgeInsets.only(left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            if (size.width < 638) ...[
              IconButton(
                splashRadius: 20,
                onPressed: () {
                  mainLayoutProvider.openSidebar = true;
                },
                icon: const Icon(Icons.menu),
              ),
              const SizedBox(width: 5),
            ],
            if (size.width > 713.0) ...{
              const SearchBar(width: 400),
            } else ...{
              const Expanded(child: SearchBar())
            },
            if (size.width > 483) ...[
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.grey[300]),
                    overlayColor: MaterialStateProperty.all(Colors.grey[400]),
                  ),
                  onPressed: () {
                    print(size);
                  },
                  child: Row(
                    children: const [
                      Icon(
                        Icons.add,
                        color: Colors.black,
                      ),
                      Text(
                        "Añadir",
                        style: TextStyle(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ] else ...[
              OutlinedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.grey[300]),
                  overlayColor: MaterialStateProperty.all(Colors.grey[400]),
                  side: MaterialStateProperty.all(BorderSide.none),
                  shape: MaterialStateProperty.all(const CircleBorder()),
                ),
                onPressed: () {
                  print(size);
                },
                child: const Icon(
                  Icons.add,
                  color: Colors.black,
                ),
              )
            ]
          ],
        ),
      ),
    );
  }
}

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
