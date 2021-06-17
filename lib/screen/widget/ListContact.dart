import 'package:bloc_example/model/Contact.dart';
import 'package:flutter/material.dart';

class ListContact extends StatelessWidget {
  List<Contact> list = [];

  ListContact(this.list);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.8,
      child: ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(list.elementAt(index).name!),
              subtitle: Text("${list.elementAt(index).phoneNumber}"),
            );
          }),
    );
  }
}
