import 'package:flutter/material.dart';
import 'package:flutter_front/shared/listview/listview_element.dart';

final List<String> entries = <String>[
  'Gardien',
  'Defenseur',
  'Milieu',
  'Attaquant'
];

class HorizontalListView extends StatelessWidget {
  const HorizontalListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: entries.length,
        itemBuilder: (BuildContext context, int index) {
          return ElementListView(
            index: index,
          );
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              width: 20,
            ));
  }
}
