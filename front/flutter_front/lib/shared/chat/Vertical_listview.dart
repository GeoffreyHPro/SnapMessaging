import 'package:flutter/material.dart';
import 'package:flutter_front/shared/chat/chat_listview_element.dart';

class VerticalListView extends StatelessWidget {
  List listMessages;

  VerticalListView({Key? key, required this.listMessages}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: listMessages.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatElementListView(message: listMessages[index]);
        },
        separatorBuilder: (BuildContext context, int index) => const SizedBox(
              height: 10,
            ));
  }
}
