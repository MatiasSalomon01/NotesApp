import 'package:flutter/material.dart';

class NotesView extends StatelessWidget {
  const NotesView({super.key});

  @override
  Widget build(BuildContext context) {
    // return Expanded(
    //   child: Container(
    //     margin: const EdgeInsets.only(top: 8, bottom: 15, left: 5),
    //     child: Row(
    //       children: [
    //         Expanded(
    //           child: Container(
    //             child: ListView.builder(
    //               itemCount: _Listas.dtoListas.length,
    //               itemBuilder: (context, index) {
    //                 return Container(
    //                   // color: Colors.red,
    //                   child: Row(
    //                     crossAxisAlignment: CrossAxisAlignment.start,
    //                     children: [
    //                       Container(
    //                         margin: const EdgeInsets.only(right: 5),
    //                         color: const Color(0xffF3F3F3),
    //                         child: const Icon(
    //                           Icons.commit_outlined,
    //                           size: 22,
    //                           color: Colors.black26,
    //                         ),
    //                       ),
    //                       Expanded(
    //                         child: Column(
    //                           crossAxisAlignment: CrossAxisAlignment.start,
    //                           children: [
    //                             Text(
    //                                 "Creado el: ${_Listas.dtoListas[index].fecha}",
    //                                 style: const TextStyle(
    //                                     fontSize: 15, color: Colors.grey)),
    //                             ListView.separated(
    //                               physics: const NeverScrollableScrollPhysics(),
    //                               shrinkWrap: true,
    //                               itemCount:
    //                                   _Listas.dtoListas[index].info.length,
    //                               itemBuilder: (context, index2) => TodoItem(
    //                                 description:
    //                                     "${_Listas.dtoListas[index].info[index2].descripcion}",
    //                                 isCompleted: _Listas.dtoListas[index]
    //                                     .info[index2].isCompleted!,
    //                               ),
    //                               separatorBuilder: (context, index) =>
    //                                   const Divider(),
    //                             )
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 );
    //               },
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
    return Container();
  }
}
