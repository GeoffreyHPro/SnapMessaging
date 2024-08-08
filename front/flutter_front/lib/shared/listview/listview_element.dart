import 'package:flutter/material.dart';
import 'package:flutter_front/shared/listview/listview_horizontal.dart';

class ElementListView extends StatelessWidget {
  final int index;

  const ElementListView({Key? key, required this.index}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      decoration: const BoxDecoration(
          color: Color.fromRGBO(200, 200, 200, 0.2),
          borderRadius: BorderRadius.all(Radius.circular(25))),
      height: 20,
      child: Column(
        children: [
          IconButton(
            icon: Image.asset("assets/joueur.png"),
            onPressed: () {},
          ),
          Text(entries[index]),
        ],
      ),
    );
  }
}
